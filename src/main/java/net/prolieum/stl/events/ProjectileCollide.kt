package net.prolieum.stl.events

import net.prolieum.stl.STL
import org.bukkit.entity.Arrow
import org.bukkit.entity.Creeper
import org.bukkit.entity.EntityType
import org.bukkit.entity.Player
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.entity.ProjectileHitEvent
import org.bukkit.potion.PotionEffectType
import kotlin.math.abs

class ProjectileCollide: Listener {
    @EventHandler
    fun onProjectileCollide(event: ProjectileHitEvent) {
        if (event.entity !is Arrow) return
        val arrow = event.entity as Arrow
        if (!arrow.hasCustomEffect(PotionEffectType.HARM)) return

        arrow.remove()
        event.isCancelled = true

        val game = STL.gameManager.getPlayerGame(arrow.shooter as Player)
        if (game != null) {
            if (abs(arrow.location.x - game.gameLocation.x) <= 20 && abs(arrow.location.z - game.gameLocation.z) <= 20) {
                val creeper = (arrow.world.spawnEntity(arrow.location, EntityType.CREEPER) as Creeper)
                creeper.isPowered = true
                STL.gameManager.creeperGame[creeper] = game
                creeper.explode()
            }
        }
    }
}