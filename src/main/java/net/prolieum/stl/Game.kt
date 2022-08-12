package net.prolieum.stl

import com.github.shynixn.structureblocklib.api.bukkit.StructureBlockLib
import com.github.yannicklamprecht.worldborder.api.Position
import fr.mrmicky.fastboard.FastBoard
import net.kyori.adventure.text.Component
import org.bukkit.*
import org.bukkit.block.Block
import org.bukkit.boss.BarColor
import org.bukkit.boss.BarStyle
import org.bukkit.boss.KeyedBossBar
import org.bukkit.enchantments.Enchantment
import org.bukkit.entity.Player
import org.bukkit.entity.Projectile
import org.bukkit.inventory.ItemStack
import org.bukkit.inventory.meta.PotionMeta
import org.bukkit.potion.PotionEffect
import org.bukkit.potion.PotionEffectType
import java.util.*
import kotlin.math.abs
import kotlin.math.floor
import kotlin.math.max
import kotlin.math.min

class Game(
    val gameLocation: Location,
    private val targetHeight: Double,
    private val checkpoints: List<Double>,
    private val subPoints: List<Double>,
    private val players: MutableList<UUID>
) {
    private var tickCount: Int = 0
    private var startTime = 5
    private val bossBar: KeyedBossBar = Bukkit.getServer().createBossBar(NamespacedKey.minecraft(UUID.randomUUID().toString()), "Starting", BarColor.GREEN, BarStyle.SEGMENTED_10)
    private var nextCheckpoint: Double = 128.0
    private var prevCheckpoint: Double = 0.0
    private var nextSubPoint: Double = 128.0
    private var prevSubPoint: Double = 0.0
    private val tickTask = Bukkit.getScheduler().scheduleSyncRepeatingTask(STL.instance, this::tick, 1, 1)
    private val spawnLocation = gameLocation.clone().subtract(1.0, 0.0, 1.0)
    private val scoreboards: MutableList<FastBoard> = ArrayList()
    private val highestPoint: MutableMap<UUID, Double> = HashMap()
    private var globalHighestPoint: Double = 0.0
    private var placedDecorationLevel: Int = -1

    private val pieces = listOf(
        "firstLayer",
        "secondLayer",
        "thirdLayer",
        "fourthLayer",
        "fithLayer",
        "sixthLayer",
        "seventhLayer",
        "eigthLayer",
        "ninethLayer",
        "tenthLayer",
        "checkpointLayer",
        "path2"
    )

    private val blocks: List<Material> = listOf(
        Material.WHITE_CONCRETE,
        Material.ORANGE_CONCRETE,
        Material.MAGENTA_CONCRETE,
        Material.LIGHT_BLUE_CONCRETE,
        Material.YELLOW_CONCRETE,
        Material.LIME_CONCRETE,
        Material.PINK_CONCRETE,
        Material.GRAY_CONCRETE,
        Material.LIGHT_GRAY_CONCRETE,
        Material.CYAN_CONCRETE,
        Material.PURPLE_CONCRETE,
        Material.BLUE_CONCRETE,
        Material.BROWN_CONCRETE,
        Material.GREEN_CONCRETE,
        Material.RED_CONCRETE,
        Material.BLACK_CONCRETE
    )

    var state = GameState.STARTING

    val projectiles: MutableList<Projectile> = ArrayList()

    enum class GameState {
        STARTING,
        MAIN,
        ENDED
    }

    init {
        if (checkpoints.isNotEmpty()) nextCheckpoint = checkpoints[0]
        if (subPoints.isNotEmpty()) nextSubPoint = subPoints[0]

        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?: continue
            bossBar.addPlayer(player)
            player.setBedSpawnLocation(spawnLocation, true)
            player.fallDistance = 0f
            player.teleport(spawnLocation.clone().add(0.5, 0.0, 0.5))
            showWorldBorder(player)
            createBoard(player)
        }
        updateBoards()

        giveItems()
        bossBar.progress = 1.0

        placePlatform()
    }

    fun showWorldBorder(player: Player) {
        STL.worldBorderApi.setBorder(player,29.0, Position(spawnLocation.x + .5, spawnLocation.z + .5))
    }

    private fun getSortedHeights(): List<Player> {
        val realPlayers: MutableList<Player> = ArrayList()
        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?:continue
            realPlayers.add(player)
        }

        realPlayers.sortBy { p -> p.location.blockY }
        realPlayers.reverse()
        return realPlayers
    }

    private fun getLines(sortedPlayers: List<Player>): List<String> {
        var entries = 0
        val lines: MutableList<String> = ArrayList()

        for (player in sortedPlayers) {
            if (entries > 15) break

            lines.add(spaceEvenly("${player.name}:", "${player.location.blockY}"))

            entries++
        }

        return lines
    }

    private fun spaceEvenly(string1: String, string2: String): String {
        return "$string1 $string2"
    }
    private fun createBoard(player: Player) {
        scoreboards.add(FastBoard(player))
    }

    private fun updateBoards() {
        val lines = getLines(getSortedHeights())
        for (scoreboard in scoreboards) {
            scoreboard.updateTitle("Height")
            scoreboard.updateLines(lines)
        }
    }

    fun shouldCancel(): Boolean {
        return startTime > 0
    }

    private fun tick() {
        tickCount++
        if (tickCount % 20 == 0) {
            if (state == GameState.STARTING) startTick()
            else if (state == GameState.MAIN) mainTick()
        }

        if (state == GameState.MAIN) mainTickRapid()
    }

    private fun startTick() {
        startTime--
        var progress = startTime.toDouble() / 5.0
        if (progress < 0) progress = 0.0
        bossBar.progress = progress

        if (startTime <= 0) {
            state = GameState.MAIN
            for (uuid in players) {
                val player: Player = playerFromUUID(uuid)?:continue
                player.playSound(player.location, Sound.BLOCK_NOTE_BLOCK_PLING, 1f, 2f)
            }
            bossBar.removeAll()
        } else {
            for (uuid in players) {
                val player: Player = playerFromUUID(uuid)?:continue
                player.playSound(player.location, Sound.BLOCK_NOTE_BLOCK_PLING, 1f, 1f)
            }
        }
    }

    private fun mainTickRapid() {
        val victors: MutableList<Player> = ArrayList()

        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?:continue
            if (player.location.y >= targetHeight) victors.add(player)
            else if (player.location.y > nextCheckpoint) {
                placeCheckpoint(nextCheckpoint)
                setCheckpoint(player, nextCheckpoint)
                var changed = false
                for (checkpoint in checkpoints) {
                    if (checkpoint > nextCheckpoint) {
                        prevCheckpoint = nextCheckpoint
                        nextCheckpoint = checkpoint
                        changed = true
                        break
                    }
                }

                if (!changed) nextCheckpoint = 500.0
            } else if (player.location.y > prevCheckpoint) setCheckpoint(player, prevCheckpoint)
            else if (player.location.y > nextSubPoint) {
                var changed = false
                for (subpoint in subPoints) {
                    if (subpoint > nextSubPoint) {
                        prevSubPoint = nextSubPoint
                        nextSubPoint = subpoint
                        changed = true
                        break
                    }
                }

                if (!changed) nextSubPoint = 500.0
            } else if (player.location.y < prevSubPoint && prevSubPoint < 400) setCheckpoint(player, prevCheckpoint)
            else if (player.location.y > prevCheckpoint) setCheckpoint(player, prevCheckpoint)
            showWorldBorder(player)

            if (player.location.y > globalHighestPoint) globalHighestPoint = player.location.y

            if (highestPoint[player.uniqueId] == null || highestPoint[player.uniqueId]!! < player.location.y) {
                highestPoint[player.uniqueId] = player.location.y
                player.level = player.location.blockY
            }
            player.exp = max(min(player.location.y / targetHeight, 1.0), 0.0).toFloat()
        }

        updateBoards()

        for (projectile in projectiles) {
            if ((abs(projectile.location.x - gameLocation.x) > 21) || (abs(projectile.location.z - gameLocation.z) > 21)) {
                projectile.remove()
            }
        }

        if (placedDecorationLevel < globalHighestPoint) {
            placedDecorationLevel++
            if (checkpoints.contains(placedDecorationLevel.toDouble())) placeDecorationPiece(10, placedDecorationLevel)
            else if (checkpoints.contains(placedDecorationLevel.toDouble() + 1.0)) placeDecorationPiece(8, placedDecorationLevel)
            else if (checkpoints.contains(placedDecorationLevel.toDouble() - 1.0)) placeDecorationPiece(0, placedDecorationLevel)
            else if (placedDecorationLevel == 0) placeDecorationPiece(0, placedDecorationLevel)
            else placeDecorationPiece(placedDecorationLevel % 10, placedDecorationLevel)
        }

        if (victors.size > 0) endGame(victors)
    }

    private fun setCheckpoint(player: Player, height: Double) {
        if (height > 10 && (player.bedSpawnLocation == null || player.bedSpawnLocation!!.y < height)) {
            player.setBedSpawnLocation(spawnLocation.clone().add(0.0, (height + 1.0), -11.0), true)
            player.sendActionBar(Component.text("${ChatColor.DARK_GREEN}Checkpoint Reached! [Spawn Point: Y${height.toInt()}]"))
            player.playSound(player.location, Sound.ENTITY_EXPERIENCE_ORB_PICKUP, 1f, 1f)
        }
    }

    private fun mainTick() {
        var playerCount = 0
        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?:continue
            playerCount++
            player.foodLevel = 20
            player.saturation = 20f
            if (player.location.y < -8) {
                player.fallDistance = 0f
                player.teleport(player.bedSpawnLocation ?: spawnLocation)
            }

            if ((abs(player.location.x - gameLocation.x) > 21) || (abs(player.location.z - gameLocation.z) > 21)) {
                player.fallDistance = 0f
                player.teleport(player.bedSpawnLocation ?: spawnLocation)
            }
        }

        if (playerCount == 0) endGame(ArrayList<Player>())
    }

    fun isSpawnPoint(loc: Location): Boolean {
        if (loc.y < 5) {
            if (abs(loc.x - spawnLocation.x) < 2 && abs(loc.z - spawnLocation.z) < 2) return true
        }

        for (checkpoint in checkpoints) {
            if (loc.y <= checkpoint + 3 && loc.y >= checkpoint) {
                val spawnLoc = spawnLocation.clone().add(0.0, (checkpoint + 1.0), -11.0)
                if (abs(loc.x - spawnLoc.x) < 2 && abs(loc.z - spawnLoc.z) < 2) return true
            }
        }

        return false
    }

    private fun placeDecorationPiece(piece: Int, height: Int) {
        val location = gameLocation.clone().subtract(17.0, height.toDouble() * -1 ,17.0)

        StructureBlockLib.INSTANCE
            .loadStructure(STL.instance)
            .at(location)
            .loadFromPath(STL.instance.dataFolder.toPath().resolve("${pieces[piece]}.nbt"))
            .onException { STL.instance.logger.severe("Failed to place platform!") }
    }

    private fun clearArea() {
        val location = gameLocation.clone()
        var delay: Long = 1

        for (y in 0..320) {
            Bukkit.getScheduler().scheduleSyncDelayedTask(STL.instance, {
                val loc = location.clone()
                loc.y = y.toDouble()

                for (x in -23..21) {
                    for (z in -23..21) {
                        val loc2 = loc.clone().add(x.toDouble(), 0.0, z.toDouble())
                        loc2.world.setType(loc2, Material.AIR)
                    }
                }
            }, delay)
            delay += 1
        }
    }

    private fun placePlatform() {
        placeDecorationPiece(11, -1)
    }

    private fun placeCheckpoint(yLevel: Double): Boolean {
        return true
    }

    private fun giveItems() {
        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?:continue
            val sword = ItemStack(Material.STONE_SWORD)
            sword.addEnchantment(Enchantment.KNOCKBACK, 2)
            sword.itemMeta.isUnbreakable = true

            val pickaxe = ItemStack(Material.IRON_PICKAXE)
            pickaxe.addEnchantment(Enchantment.DIG_SPEED, 3)
            pickaxe.itemMeta.isUnbreakable = true

            val bow = ItemStack(Material.BOW)
            bow.addEnchantment(Enchantment.ARROW_KNOCKBACK, 2)
            bow.addEnchantment(Enchantment.ARROW_INFINITE, 1)
            bow.itemMeta.isUnbreakable = true

            val enderPearl = ItemStack(Material.ENDER_PEARL, 16)
            val ladders = ItemStack(Material.LADDER, 16)
            val blocks = getBlock()

            player.inventory.addItem(sword)
            player.inventory.addItem(pickaxe)
            player.inventory.addItem(bow)
            player.inventory.addItem(enderPearl)
            player.inventory.addItem(ladders)
            player.inventory.addItem(blocks)

            val explosiveArrows = ItemStack(Material.TIPPED_ARROW, 3)
            val meta = explosiveArrows.itemMeta as PotionMeta
            meta.addCustomEffect(PotionEffect(PotionEffectType.HARM, 1, 1), true)
            meta.color = Color.fromRGB(51, 0, 0)
            meta.displayName(Component.text("Explosive Arrow"))
            explosiveArrows.itemMeta = meta

            player.inventory.setItem(8, explosiveArrows)
            player.inventory.setItem(7, ItemStack(Material.ARROW, 1))
        }
    }

    fun isBlockProtected(block: Block): Boolean {
        val loc = block.location
        if (loc.y < 0) return true

        for (checkpoint in checkpoints) {
            if (loc.y == checkpoint
                && (abs(loc.x - gameLocation.x) < 14 || abs(loc.z - gameLocation.z) < 14)
                && (abs(loc.x - gameLocation.x) > 9 || abs(loc.z - gameLocation.z) > 9)
            ) return true
        }

        return block.type == Material.ANDESITE_SLAB
    }

    private fun getBlock(): ItemStack {
        return ItemStack(blocks.random(), 64)
    }

    private fun playerFromUUID(uuid: UUID): Player? {
        return Bukkit.getPlayer(uuid)
    }

    private fun endGame(victors: List<Player>) {
        state = GameState.ENDED

        for (projectile in projectiles) projectile.remove()

        for (uuid in players) {
            STL.gameManager.playerGames.remove(uuid)
            STL.gameManager.mapLocations[gameLocation] = null

            val player: Player = playerFromUUID(uuid)?:continue
            for (victor in victors) player.sendMessage("§6${victor.name} §fhas reached the top!")
            player.sendMessage("You got to Y${ChatColor.GOLD}${floor(min(highestPoint[player.uniqueId]?:0.0, targetHeight)*100)/100}${ChatColor.WHITE}!")
            player.inventory.clear()
            player.teleport(Location(Bukkit.getWorld("Void World"), 0.0, 1.0, 0.0))
            STL.worldBorderApi.resetWorldBorderToGlobal(player)
        }

        clearArea()
        bossBar.removeAll()
        Bukkit.getServer().removeBossBar(bossBar.key)
        for (board in scoreboards) board.delete()
    }

    fun terminate(error: Boolean) {
        state = GameState.ENDED
        Bukkit.getScheduler().cancelTask(tickTask)

        for (projectile in projectiles) projectile.remove()

        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?:continue
            bossBar.removePlayer(player)

            if (error) player.sendTitle("§4Game Terminated", "§cGame was terminated due to an error.", 10, 100, 20)
            else player.sendTitle("§4Game Terminated", "§cGame was terminated by an admin.", 10, 100, 20)
        }
        Bukkit.getServer().removeBossBar(bossBar.key)
        clearArea()
        for (board in scoreboards) board.delete()
    }
}