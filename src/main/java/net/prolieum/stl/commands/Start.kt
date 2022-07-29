package net.prolieum.stl.commands

import net.prolieum.stl.GameManager
import net.prolieum.stl.STL
import org.bukkit.command.Command
import org.bukkit.command.CommandExecutor
import org.bukkit.command.CommandSender

object Start : CommandExecutor {
    override fun onCommand(sender: CommandSender, command: Command, label: String, args: Array<out String>?): Boolean {
        val gameManager: GameManager = STL.gameManager
        gameManager.createGame(gameManager.getPlayersNotInGame())
        return true
    }
}