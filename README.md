# hyper_scoreboard

A modern, clean, and high-performance scoreboard script for FiveM with support for **ESX**, **QBCore**, and **Standalone**.

---

## 🚀 Features

- **Multi-framework support**: Compatible with ESX, QBCore, and standalone.
- **Job Counter**: Display of active personnel (e.g., police, EMS, mechanics) including `OnDuty` check (QBCore).
- **Client Caching**: Instant display upon opening, without flickering or loading delays.
- **Auto-Refresh**: Automatically updates player and job data in the background at the configured interval.
- **Customizable Keybindings**: Uses FiveM's native keymapping (`F10` by default), fully customizable in the GTA settings.
- **Rate-Limiting**: Spam protection for server events to prevent unnecessary performance overhead.

---

## ⚙️ Configuration (`config.lua`)

```lua
Config = {}

--// ESX || QBCore || Standalone \\--
Config.Framework = "ESX"

Config.OpenKey = "F10"

Config.OnlyOnDuty = true

Config.RefreshInterval = 5000

--// Order \\--
Config.BoxOrder = { "ExampleBox1", "ExampleBox2", "ExampleBox3" }

Config.UI = {
	ExampleBox1 = {
		Name = "POLICE",
		Color = "#0c1d53",
		Jobs = { "police", "sheriff" },
	},

	ExampleBox2 = {
		Name = "AMBULANCE",
		Color = "#530c0c",
		Jobs = { "ambulance" },
	},

	ExampleBox3 = {
		Name = "MECHANIC",
		Color = "#4f530c",
		Jobs = { "mechanic" },
	},

	Title1 = "SCOREBOARD",
	Title2 = "HYPER BLA BLA",
}
```

---

## 🎮 Controls & Commands

| Command / Key | Default | Description |
| :--- | :--- | :--- |
| `togglescoreboard` | `F10` | Opens / closes the scoreboard (Toggle) |
