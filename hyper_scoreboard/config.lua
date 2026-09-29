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
