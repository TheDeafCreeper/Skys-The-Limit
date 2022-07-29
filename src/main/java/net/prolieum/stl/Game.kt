package net.prolieum.stl

import com.github.shynixn.structureblocklib.api.bukkit.StructureBlockLib
import net.kyori.adventure.text.Component
import org.bukkit.*
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

class Game(
    val gameLocation: Location,
    private val targetHeight: Double,
    private val checkpoints: List<Double>,
    private val players: MutableList<UUID>
) {
    private var tickCount: Int = 0
    private var startTime = 5
    private val bossBar: KeyedBossBar = Bukkit.getServer().createBossBar(NamespacedKey.minecraft(UUID.randomUUID().toString()), "Starting", BarColor.GREEN, BarStyle.SEGMENTED_10)
    private var nextCheckpoint: Double = 128.0
    private val tickTask = Bukkit.getScheduler().scheduleSyncRepeatingTask(STL.instance, this::tick, 1, 1)
    private val spawnLocation = gameLocation.clone().subtract(1.0, 0.0, 1.0)

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

        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?: continue
            bossBar.addPlayer(player)
            player.setBedSpawnLocation(spawnLocation, true)
            player.fallDistance = 0f
            player.teleport(spawnLocation.clone().add(0.5, 0.0, 0.5))
        }

        giveItems()
        bossBar.progress = 1.0

        val placed = placePlatform()
        if (!placed) terminate(true)
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
            else if (player.location.y >= nextCheckpoint) {
                placeCheckpoint(nextCheckpoint)
                var changed = false
                for (checkpoint in checkpoints) {
                    if (checkpoint > nextCheckpoint) {
                        nextCheckpoint = checkpoint
                        changed = true
                        break
                    }
                }

                if (!changed) nextCheckpoint = 500.0
            }
        }

        if (victors.size > 0) endGame(victors)
    }

    private fun mainTick() {
        for (uuid in players) {
            val player: Player = playerFromUUID(uuid)?:continue
            player.foodLevel = 20
            player.saturation = 20f
            if (player.location.y < -16) {
                player.fallDistance = 0f
                player.teleport(player.bedSpawnLocation ?: spawnLocation)
            }

            if ((abs(player.location.x - gameLocation.x) > 20) || (abs(player.location.z - gameLocation.z) > 20)) {
                player.fallDistance = 0f
                player.teleport(player.bedSpawnLocation ?: spawnLocation)
            }

            for (projectile in projectiles) {
                if ((abs(projectile.location.x - gameLocation.x) > 20) || (abs(projectile.location.z - gameLocation.z) > 20)) {
                    projectile.remove()
                }
            }

            for (checkpoint in checkpoints) {
                if ((player.bedSpawnLocation?:gameLocation).y > checkpoint) continue
                if (player.location.y > checkpoint) player.setBedSpawnLocation(spawnLocation.clone().add(0.0, (checkpoint + 1.0), -11.0), true)
            }
        }
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

    private fun clearArea() {
        val location = gameLocation.clone()
        var delay: Long = 1

        for (y in -64..320) {
            Bukkit.getScheduler().scheduleSyncDelayedTask(STL.instance, {
                val loc = location.clone()
                loc.y = y.toDouble()

                for (x in -24..24) {
                    for (z in -24..24) {
                        val loc2 = loc.clone().add(x.toDouble(), 0.0, z.toDouble())
                        loc2.world.setType(loc2, Material.AIR)
                    }
                }
            }, delay)
            delay += 1
        }
    }

    private fun placePlatform(): Boolean {
        val location = gameLocation.clone().subtract(9.0, 3.0 ,9.0)
        var placed = true

        StructureBlockLib.INSTANCE
            .loadStructure(STL.instance)
            .at(location)
            .loadFromPath(STL.instance.dataFolder.toPath().resolve("basePlatform.nbt"))
            .onException { STL.instance.logger.severe("Failed to place platform!") }
            .onResult {
                STL.instance.logger.info("Placed platform.")
                placed = true
            }

        return placed
    }

    private fun placeCheckpoint(yLevel: Double): Boolean {
        val location = gameLocation.clone().subtract(14.0, 2.0 ,14.0)
        location.y = yLevel
        var placed = false

        StructureBlockLib.INSTANCE
            .loadStructure(STL.instance)
            .at(location)
            .loadFromPath(STL.instance.dataFolder.toPath().resolve("checkpoint.nbt"))
            .onException { STL.instance.logger.severe("Failed to place checkpoint!") }
            .onResult {
                STL.instance.logger.info("Placed checkpoint.")
                placed = true
            }

        return placed
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

    fun isBlockProtected(loc: Location): Boolean {
        if (loc.y < 0) return true

        for (checkpoint in checkpoints) {
            if (loc.y == checkpoint
                && (abs(loc.x - gameLocation.x) < 14 || abs(loc.z - gameLocation.z) < 14)
                && (abs(loc.x - gameLocation.x) > 9 || abs(loc.z - gameLocation.z) > 9)
            ) return true
        }

        return false
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

            val player: Player = playerFromUUID(uuid)?:continue
            for (victor in victors) {
                player.sendMessage("§6${victor.name} §fhas reached the top!")
            }
            player.inventory.clear()
            player.teleport(Location(Bukkit.getWorld("Void World"), 0.0, 1.0, 0.0))
        }

        clearArea()
        bossBar.removeAll()
        Bukkit.getServer().removeBossBar(bossBar.key)
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
    }
}