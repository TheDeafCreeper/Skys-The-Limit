package net.prolieum.stl.events

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.GameMode
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.block.BlockBreakEvent

class BlockBreak: Listener {
    @EventHandler
    fun onBlockBreak(event: BlockBreakEvent) {
        if (event.player.gameMode == GameMode.CREATIVE) return
        val game: Game? = STL.gameManager.getPlayerGame(event.player)
        if (game == null) event.isCancelled = true
        else {
            if (game.isBlockProtected(event.block.location)) event.isCancelled = true
            else event.isCancelled = game.shouldCancel()
        }
    }
}