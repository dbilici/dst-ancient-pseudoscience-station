-- This information tells other players more about the mod
name = "Craftable Ancient Pseudoscience Station"
description = "Craft Ancient Pseudoscience Stations and Thulecite Fragments with separate Easy, Normal, Hard, or Disabled recipes. Includes optional diagnostic logging."
author = "k0za1ak"
version = "1.2.0-beta.1"

forumthread = ""

api_version = 10
icon_atlas = "modicon.xml"
icon = "modicon.tex"
dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

priority = 0.00398115041

--These tags allow the server running this mod to be found with filters from the server listing screen
server_filter_tags = {"craft", "altar", "ancient", "pseudoscience", "machine"}

configuration_options =
{
	{
		name = "AncientStation",
		label = "Ancient Pseudoscience Station",
		hover = "Select whether the Ancient Pseudoscience Station is craftable.",
		options =
	{
		{description = "Disabled", data = "disabled"},
		{description = "Easy", data = "easy"},
		{description = "Normal", data = "normal"},
		{description = "Hard", data = "hard"},
	},
		default = "normal",
	},
	{
		name = "ThuleciteFragments",
		label = "Thulecite Fragments",
		hover = "Select whether Thulecite Fragments are craftable.",
		options =
	{
		{description = "Disabled", data = "disabled"},
		{description = "Easy", data = "easy"},
		{description = "Normal", data = "normal"},
		{description = "Hard", data = "hard"},
	},
		default = "normal",
	},
	{
		name = "debug_logging",
		label = "Debug Mode",
		hover = "Recipe diagnostics: c_as() in the remote console.",
		options =
		{
			{description = "Off", data = "off"},
			{description = "Log only", data = "log"},
			{description = "Chat + log", data = "announce"},
		},
		default = "off",
	},
}
