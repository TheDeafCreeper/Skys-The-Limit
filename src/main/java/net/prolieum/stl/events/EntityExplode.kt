package net.prolieum.stl.events

import net.prolieum.stl.STL
import org.bukkit.Material
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.entity.EntityExplodeEvent

class EntityExplode: Listener {
    @EventHandler
    fun onEntityExplode(event: EntityExplodeEvent) {
        val game = STL.gameManager.creeperGame[event.entity] ?: return
        val blocks = event.blockList()
        for (block in blocks) {
            val protected = game.isBlockProtected(block.location)
            if (!protected) block.world.setType(block.location, Material.AIR)
        }

        event.blockList().clear()
        STL.gameManager.creeperGame.remove(event.entity)
    }
}