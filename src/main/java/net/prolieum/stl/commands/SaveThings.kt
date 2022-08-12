package net.prolieum.stl.commands

import com.github.shynixn.structureblocklib.api.bukkit.StructureBlockLibApi
import com.github.shynixn.structureblocklib.api.enumeration.StructureRestriction
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
        val firstLayer = STL.instance.dataFolder.toPath().resolve("firstLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 1.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(firstLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save first layer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure first layer."
                )
            }


        val secondLayer = STL.instance.dataFolder.toPath().resolve("secondLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 2.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(secondLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save second layer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure second layer."
                )
            }

        val thirdLayer = STL.instance.dataFolder.toPath().resolve("thirdLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 3.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(thirdLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save thirdLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure thirdLayer."
                )
            }

        val fourthLayer = STL.instance.dataFolder.toPath().resolve("fourthLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 4.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(fourthLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save fourthLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure fourthLayer."
                )
            }

        val fithLayer = STL.instance.dataFolder.toPath().resolve("fithLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 5.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(fithLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save fithLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure first layer."
                )
            }

        val sixthLayer = STL.instance.dataFolder.toPath().resolve("sixthLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 6.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(sixthLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save sixthLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure sixthLayer."
                )
            }

        val seventhLayer = STL.instance.dataFolder.toPath().resolve("seventhLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 7.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(seventhLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save seventhLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure seventhLayer."
                )
            }

        val eigthLayer = STL.instance.dataFolder.toPath().resolve("eigthLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 8.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(eigthLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save eigthLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure eigthLayer."
                )
            }

        val ninethLayer = STL.instance.dataFolder.toPath().resolve("ninethLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 9.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(ninethLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save ninethLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure ninethLayer."
                )
            }

        val tenthLayer = STL.instance.dataFolder.toPath().resolve("tenthLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 10.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(tenthLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save tenthLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure tenthLayer."
                )
            }


        val checkpointLayer = STL.instance.dataFolder.toPath().resolve("checkpointLayer.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 50.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(checkpointLayer)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save checkpointLayer.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure checkpointLayer."
                )
            }

        val path2 = STL.instance.dataFolder.toPath().resolve("path2.nbt")
        StructureBlockLibApi.INSTANCE
            .saveStructure(STL.instance)
            .at(Location(Bukkit.getWorld("Void World"), 997.0, 0.0, 997.0))
            .restriction(StructureRestriction.UNLIMITED)
            .sizeX(33)
            .sizeZ(33)
            .sizeY(1)
            .saveToPath(path2)
            .onException { e: Throwable? ->
                STL.instance.logger.log(Level.SEVERE, "Failed to save path2.", e)
            }
            .onResult {
                STL.instance.logger.log(
                    Level.INFO,
                    ChatColor.GREEN.toString() + "Saved structure path2."
                )
            }
    }
}