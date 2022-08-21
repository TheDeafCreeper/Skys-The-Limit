package net.prolieum.stl

import com.github.yannicklamprecht.worldborder.api.WorldBorderApi
import com.grinderwolf.swm.api.SlimePlugin
import com.grinderwolf.swm.api.world.properties.SlimeProperties
import com.grinderwolf.swm.api.world.properties.SlimePropertyMap
import net.prolieum.stl.commands.SaveThings
import net.prolieum.stl.commands.Start
import net.prolieum.stl.commands.TestMode
import net.prolieum.stl.events.*
import org.bukkit.Bukkit
import org.bukkit.World
import org.bukkit.plugin.java.JavaPlugin


class STL : JavaPlugin() {
    var worldBorderApiRegisteredServiceProvider = server.servicesManager.getRegistration(
        WorldBorderApi::class.java
    )

    companion object {
        lateinit var instance: STL
        lateinit var gameManager: GameManager
        lateinit var worldBorderApi: WorldBorderApi
        lateinit var world: World;
    }

    override fun onEnable() {
        instance = this
        val slimePlugin = Bukkit.getPluginManager().getPlugin("SlimeWorldManager") as SlimePlugin
        val sqlLoader = slimePlugin.getLoader("mysql")
        val props = SlimePropertyMap()
        props.setValue(SlimeProperties.ALLOW_ANIMALS, false)
        props.setValue(SlimeProperties.ALLOW_MONSTERS, false)
        val slimeWorld = slimePlugin.loadWorld(sqlLoader, "SkysTheLimit", true, props)
        slimePlugin.generateWorld(slimeWorld)
        world = Bukkit.getWorld("SkysTheLimit")!!


        gameManager = GameManager()

        val worldBorderApiRegisteredServiceProvider = server.servicesManager.getRegistration(
            WorldBorderApi::class.java
        )

        if (worldBorderApiRegisteredServiceProvider == null) {
            logger.info("API not found")
            server.pluginManager.disablePlugin(this)
            return
        }

        worldBorderApi = worldBorderApiRegisteredServiceProvider.provider

        getCommand("start")!!.setExecutor(Start)
        getCommand("savethings")!!.setExecutor(SaveThings)
        getCommand("testmode")!!.setExecutor(TestMode)

        Bukkit.getPluginManager().registerEvents(BlockPlace(), this)
        Bukkit.getPluginManager().registerEvents(BlockBreak(), this)
        Bukkit.getPluginManager().registerEvents(ProjectileThrow(), this)
        Bukkit.getPluginManager().registerEvents(ItemDrop(), this)
        Bukkit.getPluginManager().registerEvents(ProjectileCollide(), this)
        Bukkit.getPluginManager().registerEvents(EntityExplode(), this)
        Bukkit.getPluginManager().registerEvents(EntityDamageEntity(), this)
        Bukkit.getPluginManager().registerEvents(PlayerJoin(), this)
        Bukkit.getPluginManager().registerEvents(PlayerInteract(), this)
    }

    override fun onDisable() {
        for ((_, game) in gameManager.mapLocations) game?.terminate(false)

        val bossBars = Bukkit.getServer().bossBars
        for (bossBar in bossBars) Bukkit.getServer().removeBossBar(bossBar.key)

        logger.info("Goodbye!")
    }
}