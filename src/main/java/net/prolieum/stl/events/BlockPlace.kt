package net.prolieum.stl.events

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.GameMode
import org.bukkit.Material
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.block.BlockPlaceEvent

class BlockPlace: Listener {
    @EventHandler
    fun onBlockPlace(event: BlockPlaceEvent) {
        val type = event.blockPlaced.type
        val player = event.player

        if (player.gameMode == GameMode.CREATIVE) return

        val game: Game? = STL.gameManager.getPlayerGame(player)
        if (game == null || event.blockPlaced.location.blockY < 0) {
            event.isCancelled = true
            return
        } else event.isCancelled = game.shouldCancel() || game.isSpawnPoint(event.block.location)
        if (type == Material.LADDER) return

        if (player.inventory.itemInMainHand.type == type) player.inventory.itemInMainHand.amount = 64
        if (player.inventory.itemInOffHand.type == type) player.inventory.itemInOffHand.amount = 64
    }
}