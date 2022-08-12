package net.prolieum.stl.events

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.GameMode
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.player.PlayerInteractEvent

class PlayerInteract: Listener {
    @EventHandler
    fun onPlayerInteract(event: PlayerInteractEvent) {
        val game: Game? = STL.gameManager.getPlayerGame(event.player)
        if (game == null && event.player.gameMode != GameMode.CREATIVE) event.isCancelled = true
    }
}