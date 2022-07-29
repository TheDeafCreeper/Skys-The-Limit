package net.prolieum.stl

import org.bukkit.*
import org.bukkit.boss.BarColor
import org.bukkit.boss.BarStyle
import org.bukkit.boss.KeyedBossBar
import org.bukkit.entity.Creeper
import org.bukkit.entity.Player
import java.util.*

class GameManager {
    private val world: World = Bukkit.getWorld("Void World")!!
    private val mapLocations: MutableMap<Location, Boolean> = mutableMapOf(
        Pair(Location(world, 50.0, 0.0, 0.0), true), // U
        Pair(Location(world, 50.0, 0.0, 50.0), true), // UR
        Pair(Location(world, 0.0, 0.0, 50.0), true), // R
        Pair(Location(world, -50.0, 0.0, 50.0), true), // DR
        Pair(Location(world, -50.0, 0.0, 0.0), true), // D
        Pair(Location(world, -50.0, 0.0, -50.0), true), // DL
        Pair(Location(world, 0.0, 0.0, -50.0), true), // L
        Pair(Location(world, 50.0, 0.0, -50.0), true), // UL
    )
    val games: MutableList<Game> = ArrayList()
    val playerGames: MutableMap<UUID, Game> = HashMap()
    val creeperGame: MutableMap<Creeper, Game> = HashMap()

    private var queueTime: Int = 30
    private val maxGameSize: Int = 20
    private val playerQueue: MutableList<Player> = ArrayList()
    private val queueBossbar: KeyedBossBar = Bukkit.getServer().createBossBar(NamespacedKey.minecraft(UUID.randomUUID().toString()), "Not Enough Players", BarColor.RED, BarStyle.SEGMENTED_10)

    init {
        Bukkit.getScheduler().scheduleSyncRepeatingTask(STL.instance, this::tick, 0, 5)
        Bukkit.getScheduler().scheduleSyncRepeatingTask(STL.instance, this::slowTick, 0, 20)
    }

    private fun tick() {
        val newGames: MutableList<Game> = games
        for (game in games) {
            if (game.state == Game.GameState.ENDED) {
                newGames.remove(game)
                mapLocations[game.gameLocation] = true
                for ((uuid, game2) in playerGames) {
                    if (game == game2) playerGames.remove(uuid)
                }
            }
        }
        games.clear()
        games.addAll(newGames)

        for (player in Bukkit.getOnlinePlayers()) {
            player.foodLevel = 20
            player.saturation = 20f
            if (player.location.y < -40) {
                player.teleport(Location(Bukkit.getWorld("Void World"), 0.0, 1.0, 0.0))
                player.fallDistance = 0f
            }
        }
    }

    private fun slowTick() {
        val players = getPlayersNotInGame()
        for (player in players) {
            var block = player.world.getType(player.location.clone().subtract(0.0, 1.0, 0.0))
            if (block == Material.AIR) block = player.world.getType(player.location.clone().subtract(0.0, 2.0, 0.0))
            if (block == Material.GREEN_CONCRETE && !playerQueue.contains(player)) {
                playerQueue.add(player)
            }
            else if (block != Material.GREEN_CONCRETE && playerQueue.contains(player)) playerQueue.remove(player)
        }

        for (player in players) {
            val posInQueue = if (playerQueue.contains(player)) playerQueue.indexOf(player) else -1

            if (posInQueue >= 0) {
                if (posInQueue < maxGameSize) player.sendActionBar("§a[${posInQueue + 1} / $maxGameSize] You're in the next game!")
                else player.sendActionBar("§c[${posInQueue + 1} / $maxGameSize] You wont get into the next game.")
                queueBossbar.addPlayer(player)
            } else queueBossbar.removePlayer(player)
        }

        if (playerQueue.size > 1) {
            if (playerQueue.size >= 5 && queueTime > 20) queueTime = 20
            else if (playerQueue.size >= 7 && queueTime > 10) queueTime = 10
            else if (playerQueue.size >= 10 && queueTime > 3) queueTime = 3
            else queueTime--

            queueBossbar.setTitle("Starting in $queueTime")
            queueBossbar.color = BarColor.GREEN
        } else {
            queueTime = 30
            queueBossbar.setTitle("Not Enough Players")
            queueBossbar.color = BarColor.RED
        }

        var progress = queueTime.toDouble() / 30.0

        if (progress < 0) progress = 0.0
        if (progress > 1) progress = 1.0

        queueBossbar.progress = progress

        if (queueTime <= 0) {
            val playersInGame = getFirstPlayers(playerQueue)
            createGame(playersInGame)
            playerQueue.removeAll(playersInGame)
        }
    }

    private fun getFirstPlayers(players: List<Player>): List<Player> {
        val newPlayers: MutableList<Player> = ArrayList()

        var i = 0
        while (newPlayers.size < maxGameSize && i < players.size) {
            newPlayers.add(players[i])
            i++
        }

        return newPlayers
    }

    fun createGame(players: List<Player>) {
        val location = getOpenLocation()
        if (location == null) {
            for (player in players) player.sendMessage("§cUnable to put you into a game, there are no available game slots.")
        } else {
            val game = Game(
                location,
                150.0,
                listOf(
                    50.0,
                    100.0
                ),
                players.map{ player -> player.uniqueId
                } as MutableList<UUID>
            )
            for (player in players) playerGames[player.uniqueId] = game
            games.add(game)
        }
    }

    fun getPlayersNotInGame(): List<Player> {
        val players: MutableList<Player> = ArrayList()
        for (player in Bukkit.getOnlinePlayers()) if (playerGames[player.uniqueId] == null) players.add(player)
        return players
    }

    fun getPlayerGame(player: Player): Game? {
        return getPlayerGame(player.uniqueId)
    }

    private fun getPlayerGame(uuid: UUID): Game? {
        return playerGames[uuid]
    }

    private fun getOpenLocation(): Location? {
        for ((loc, open) in mapLocations) {
            if (open) mapLocations[loc] = false
            return loc
        }
        return null
    }
}