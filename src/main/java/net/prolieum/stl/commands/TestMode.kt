package net.prolieum.stl.commands

import net.prolieum.stl.GameManager
import net.prolieum.stl.STL
import org.bukkit.command.Command
import org.bukkit.command.CommandExecutor
import org.bukkit.command.CommandSender

object TestMode : CommandExecutor {
    override fun onCommand(sender: CommandSender, command: Command, label: String, args: Array<out String>?): Boolean {
        val gameManager: GameManager = STL.gameManager
        gameManager.testMode = !gameManager.testMode
        sender.sendMessage("Test mode is now ${gameManager.testMode}")
        return true
    }
}