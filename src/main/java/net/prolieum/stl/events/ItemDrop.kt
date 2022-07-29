package net.prolieum.stl.events

import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.player.PlayerDropItemEvent

class ItemDrop: Listener {
    @EventHandler
    fun onItemDrop(event: PlayerDropItemEvent) {
        event.isCancelled = true
    }
}