package net.prolieum.stl.commands

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.GameMode
import org.bukkit.Location
import org.bukkit.command.Command
import org.bukkit.command.CommandExecutor
import org.bukkit.command.CommandSender
import org.bukkit.entity.Player

object Leave : CommandExecutor {
    override fun onCommand(sender: CommandSender, command: Command, label: String, args: Array<out String>?): Boolean {
        if (sender !is Player) {
            sender.sendMessage("Only players can run this!")
            return true
        }

        val gameManager = STL.gameManager
        val game: Game? = gameManager.getPlayerGame(sender)
        if (game == null) {
            sender.sendMessage("§cYou need to be in spectating to run this!")
            return true
        }

        if (!game.spectators.contains(sender)) {
            sender.sendMessage("§cYou need to be in spectating to run this!")
            return true
        }

        sender.teleport(Location(STL.world, 0.0, 1.0, 0.0))
        sender.isInvulnerable = true
        sender.gameMode = GameMode.SURVIVAL
        game.removeSpectator(sender)

        return true
    }
}