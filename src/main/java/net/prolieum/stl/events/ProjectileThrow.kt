package net.prolieum.stl.events

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.Material
import org.bukkit.entity.EnderPearl
import org.bukkit.entity.Player
import org.bukkit.event.EventHandler
import org.bukkit.event.Listener
import org.bukkit.event.entity.ProjectileLaunchEvent
import kotlin.math.cos
import kotlin.math.sin

class ProjectileThrow: Listener {
    @EventHandler
    fun onProjectileThrow(event: ProjectileLaunchEvent) {
        val entity = event.entity
        if (entity.shooter == null) return

        val player = entity.shooter as Player

        val game: Game? = STL.gameManager.getPlayerGame(player)

        if (game != null) {
            event.isCancelled = game.shouldCancel()
            game.projectiles.add(entity)
            if (player.inventory.itemInMainHand.type == Material.ENDER_PEARL) player.inventory.itemInMainHand.amount = 16
            if (player.inventory.itemInOffHand.type == Material.ENDER_PEARL) player.inventory.itemInOffHand.amount = 16

            if (entity is EnderPearl) {
                entity.velocity.x = (sin((degToRad(player.location.yaw))) * cos(degToRad(player.location.pitch)))
                entity.velocity.z = (sin(degToRad(player.location.yaw)) * sin(degToRad(player.location.pitch)))
                entity.velocity.y = (cos(degToRad(player.location.pitch)))
            }
        } else event.isCancelled = true
    }

    fun degToRad(deg: Float): Double {
        return deg * .01745
    }
}