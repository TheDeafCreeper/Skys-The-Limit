package net.prolieum.stl.commands

import com.github.shynixn.structureblocklib.api.bukkit.StructureBlockLibApi
import net.prolieum.stl.STL
import org.bukkit.Bukkit
import org.bukkit.ChatColor
import org.bukkit.Location
import org.bukkit.command.Command
import org.bukkit.command.CommandExecutor
import org.bukkit.command.CommandSender
import java.util.logging.Level

object SaveThings : CommandExecutor {
    override fun onCommand(sender: CommandSender, command: Command, label: String, args: Array<out String>?): Boolean {
        sender.sendMessage("Components have been saved.")
        saveComponents()
        return true
    }

    private fun saveComponents() {
        val path1 = STL.instance.dataFolder.toPath().resolve("checkpoint.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 1000.0, 1.0, 1000.0))
            .sizeX(27)
            .sizeZ(27)
            .sizeY(1)
            .saveToPath(path1)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save checkpoint.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure checkpoint."
                )
            }

        val path2 = STL.instance.dataFolder.toPath().resolve("basePlatform.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 1035.0, -1.0, 1000.0))
            .sizeX(17)
            .sizeZ(17)
            .sizeY(3)
            .saveToPath(path2)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save basePlatform.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure basePlatform."
                )
            }
    }
}