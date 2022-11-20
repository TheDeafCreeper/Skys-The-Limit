package net.prolieum.stl.commands

import net.prolieum.stl.Game
import net.prolieum.stl.STL
import org.bukkit.Bukkit
import org.bukkit.GameMode
import org.bukkit.command.Command
import org.bukkit.command.CommandExecutor
import org.bukkit.command.CommandSender
import org.bukkit.entity.Player

object Spectate : CommandExecutor {
    override fun onCommand(sender: CommandSender, command: Command, label: String, args: Array<out String>?): Boolean {
        if (sender !is Player) {
            sender.sendMessage("Only players can run this!")
            return true
        }

        if (args != null) {
            if (args.isEmpty()) {
                sender.sendMessage("§cYou need to specify a player!")
                return true
            }
        }

        val player = Bukkit.getPlayer(args!![0])
        if (player == null) {
            sender.sendMessage("§cCannot find that player!")
            return true
        }

        val gameManager = STL.gameManager
        val game1: Game? = gameManager.getPlayerGame(sender)
        if (game1 != null) {
            sender.sendMessage("§cYou cant run this command while in a game!")
            return true
        }

        val game: Game? = gameManager.getPlayerGame(player)
        if (game == null) {
            sender.sendMessage("§cThat player's not in a game!")
            return true
        }

        sender.teleport(player)
        sender.gameMode = GameMode.SPECTATOR
        game.addSpectator(sender)

        sender.sendMessage("§aYou can run /leave at any time to stop spectating!")

        return true
    }
}