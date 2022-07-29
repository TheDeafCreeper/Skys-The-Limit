package net.prolieum.stl.events

import net.prolieum.stl.STL
import org.bukkit.entity.Player
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.entity.EntityDamageByEntityEvent

class EntityDamageEntity: Listener {
    @EventHandler
    fun onEntityDamageEntity(event: EntityDamageByEntityEvent) {
        if (event.damager is Player && event.entity is Player) {
            val damagerGame = STL.gameManager.getPlayerGame(event.damager as Player)
            val victimGame = STL.gameManager.getPlayerGame(event.entity as Player)
            if (damagerGame == null || victimGame == null) event.isCancelled = true
            if (damagerGame != victimGame) event.isCancelled = true
        }
    }
}