package net.prolieum.stl.events

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.GameMode
import org.bukkit.Location
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.player.PlayerJoinEvent

class PlayerJoin: Listener {
    @EventHandler
    fun onPlayerJoin(event: PlayerJoinEvent) {
        val game: Game? = STL.gameManager.getPlayerGame(event.player)

        if (game == null) {
            event.player.inventory.clear()
            event.player.teleport(Location(STL.world, 0.0, 1.0, 0.0))
            event.player.isInvulnerable = true
            event.player.gameMode = GameMode.SURVIVAL
        } else game.showWorldBorder(event.player)
    }
}