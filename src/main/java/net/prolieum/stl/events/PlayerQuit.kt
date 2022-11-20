package net.prolieum.stl.events

import net.prolieum.stl.STL
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.player.PlayerQuitEvent

class PlayerQuit: Listener {
    @EventHandler
    fun onPlayerQuit(event: PlayerQuitEvent) {
        val game = STL.gameManager.getPlayerGame(event.player)

        if (game != null && game.spectators.contains(event.player)) game.removeSpectator(event.player)
    }
}