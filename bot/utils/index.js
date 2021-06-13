let players = [];

on('playerConnecting', (name, setKickReason, deferrals) => {
	deferrals.defer();

	const player = global.source;

	setTimeout(() => {
		//deferrals.update(`Hello ${name}. Your steam ID is being checked.`)

		let steamIdentifier = null;

		for (let i = 0; i < GetNumPlayerIdentifiers(player); i++) {
			const identifier = GetPlayerIdentifier(player, i);

			if (identifier.includes('steam:')) {
				steamIdentifier = identifier;
			}
		}

		// pretend to be a wait
		setTimeout(() => {
			if (steamIdentifier === null) {
				//deferrals.done("You are not connected to Steam.")
			} else {
				//console.log(name)
				players.push(name);
				deferrals.done();
			}
		}, 0);
	}, 0);
});

let queue = 0;

on('BotDiscord:setQueue', (size) => {
	queue = size;
});

on('playerDropped', (reason) => {
	let index = players.indexOf(GetPlayerName(global.source));
	players.splice(index, 1);
	//console.log(`Player ${GetPlayerName(global.source)} dropped (Reason: ${reason}).`)
});

module.exports = {
	/**
	 * updatePlayerCount
	 * Constantly updates the player count of the server at a steady rate
	 * @param {object} client The client of the bot object
	 * @param {number} seconds The integer amount for the derivate of # of times it refreshes the bot's activity
	 * ```js
	 * const {updatePlayerCount} = require("./utils/")
	 * const { Client } = require('discord.js');
	 * const client = new Client;
	 * updatePlayerCount(client, 10)
	 * // this will update the bot's activity every 10 seconds
	 * ````
	 */
	updatePlayerCount: (client, seconds) => {
		const interval = setInterval(
			(function setStatus() {
				status = `${GetNumPlayerIndices()} / 128 Player(s) | ${queue} Antrian : | ${require('ms')(
					client.uptime
				)} Uptime |  `;
				//console.log(status)
				client.user.setActivity(status, { type: 'Playing' });
				return setStatus;
			})(),
			seconds * 1000
		);
	},
};
