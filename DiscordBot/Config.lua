DiscordWebhookSystemInfos = 'https://discord.com/api/webhooks/805378088652898324/VPYzqRWfkux_nMZDLBuY6U3YAN84wxUqTZAjrASI7kWVUmeF57TxqJOb6_eirD1CUfP3'
DiscordWebhookKillinglogs = 'https://discord.com/api/webhooks/846844761142329415/eugBEppIRhWH1o0k3k_-owJAZ4pMESAAU-TIl4NsX-56ON4DmaZCPlwA3l7g_naTZxDS'
DiscordWebhookChat = 'https://discord.com/api/webhooks/833580923320533042/BjkSFo-3bD-xYGCR0F6_WEs9ck40Nq5b9mnCyHtUdmqC83T3wudYwLCWtRy-eOEW4dvp'

SystemAvatar = 'https://cdn.discordapp.com/attachments/803590785584201809/804630457836634132/Urban_Roleplay-011.png'

UserAvatar = 'https://cdn.discordapp.com/attachments/803590785584201809/804630457836634132/Urban_Roleplay-011.png'

SystemName = '#URBANROLEPLAY'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/transfervehicle', 'https://discord.com/api/webhooks/805378657333018645/OUEyl2I-DEGH3Yl6auNXU8eljkN_H6xRDM0yHeiTCyn4qn9ljbHg_Vl_UHakmfFINeml'},
					  {'/VPN', 'https://discord.com/api/webhooks/805378657333018645/OUEyl2I-DEGH3Yl6auNXU8eljkN_H6xRDM0yHeiTCyn4qn9ljbHg_Vl_UHakmfFINeml'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

