package net.prolieum.stl

import com.github.yannicklamprecht.worldborder.api.WorldBorderApi
import net.prolieum.stl.commands.SaveThings
import net.prolieum.stl.commands.Start
import net.prolieum.stl.commands.TestMode
import net.prolieum.stl.events.*
import org.bukkit.Bukkit
import org.bukkit.plugin.java.JavaPlugin


class STL : JavaPlugin() {
    var worldBorderApiRegisteredServiceProvider = server.servicesManager.getRegistration(
        WorldBorderApi::class.java
    )

    companion object {
        lateinit var instance: STL
        lateinit var gameManager: GameManager
        lateinit var worldBorderApi: WorldBorderApi
        private set
    }

    override fun onEnable() {
        instance = this
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