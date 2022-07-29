package net.prolieum.stl

import net.prolieum.stl.commands.SaveThings
import net.prolieum.stl.commands.Start
import net.prolieum.stl.events.*
import org.bukkit.Bukkit
import org.bukkit.plugin.java.JavaPlugin

class STL : JavaPlugin() {
    companion object {
        lateinit var instance: STL
        lateinit var gameManager: GameManager
        private set
    }

    override fun onEnable() {
        instance = this
        gameManager = GameManager()
        logger.info("Hello, World!")

        getCommand("start")!!.setExecutor(Start)
        getCommand("savethings")!!.setExecutor(SaveThings)

        Bukkit.getPluginManager().registerEvents(BlockPlace(), this)
        Bukkit.getPluginManager().registerEvents(BlockBreak(), this)
        Bukkit.getPluginManager().registerEvents(ProjectileThrow(), this)
        Bukkit.getPluginManager().registerEvents(ItemDrop(), this)
        Bukkit.getPluginManager().registerEvents(ProjectileCollide(), this)
        Bukkit.getPluginManager().registerEvents(EntityExplode(), this)
        Bukkit.getPluginManager().registerEvents(EntityDamageEntity(), this)
    }

    override fun onDisable() {
        for (game in gameManager.games) game.terminate(false)

        val bossBars = Bukkit.getServer().bossBars
        for (bossBar in bossBars) Bukkit.getServer().removeBossBar(bossBar.key)

        logger.info("Goodbye!")
    }
}