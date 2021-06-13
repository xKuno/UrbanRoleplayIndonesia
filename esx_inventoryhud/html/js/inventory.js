var type = 'normal';
var disabled = false;
var disabledFunction = null;
var ownerHouse = null;
var locker = null;

$(document).ready(function () {
	window.addEventListener('message', function (event) {
		var data = event.data;
		$('.container-fluid').css('display', data.show ? 'none' : 'block');
		$('#inventorwy').html(data.inventory + '/' + '50' + 'kg');
	});
});

window.addEventListener('message', function (event) {
	if (event.data.action == 'display') {
		type = event.data.type;
		disabled = false;

		$('#search').bind('input', function () {
			searchFor = $('#search').val().toLowerCase();
			$('.slot').each(function (index, value) {
				label = $(this).text().toLowerCase();
				if (label.indexOf(searchFor) < 0) {
					$(this).hide();
				} else {
					$(this).show();
				}
			});
		});

		$('#UseBar').fadeOut(100);

		$(document).on('keydown', function (event) {
			// $("#search").focus();
		});

		if (type === 'normal') {
			$('.info-div').hide();
		} else if (type === 'trunk') {
			$('.info-div').show();
		} else if (type === 'property') {
			$('.info-div').show();
			ownerHouse = event.data.owner;
		} else if (type === 'biker') {
			$('.info-div').show();
		} else if (type === 'locker') {
			$('.info-div').show();
			locker = event.data.locker;
		} else if (type === 'cartel') {
			$('.info-div').show();
		} else if (type === 'gang') {
			$('.info-div').show();
		} else if (type === 'mafia') {
			$('.info-div').show();
		} else if (type === 'shop') {
			$('.info-div').show();
		} else if (type === 'police') {
			$('.info-div').show();
		} else if (type == 'vault') {
			$('.info.div').show();
		} else if (type === 'player') {
			$('.info-div').show();
		} else if (type === 'motels') {
			$('.info-div').hide();
		} else if (type === 'motelsbed') {
			$('.info-div').hide();
		}
		$('.ui').fadeIn();
	} else if (event.data.action == 'hide') {
		$('#dialog').dialog('close');
		$('.ui').fadeOut();
		$('.item').remove();
		$('#otherInventory').html('<div id="noSecondInventoryMessage"></div>');
		$('#noSecondInventoryMessage').html(invLocale.secondInventoryNotAvailable);
	} else if (event.data.action == 'setItems') {
		inventorySetup(event.data.itemList, event.data.fastItems);

		$('.item').draggable({
			helper: 'clone',
			appendTo: 'body',
			zIndex: 99999,
			revert: 'invalid',
			start: function (event, ui) {
				if (disabled) {
					return false;
				}

				$(this).css('background-image', 'none');
				itemData = $(this).data('item');
				itemInventory = $(this).data('inventory');

				if (itemInventory == 'second' || !itemData.canRemove) {
					$('#drop').addClass('disabled');
					$('#give').addClass('disabled');
				}

				if (itemInventory == 'second' || !itemData.usable) {
					$('#use').addClass('disabled');
				}
			},
			stop: function () {
				itemData = $(this).data('item');

				if (itemData !== undefined && itemData.name !== undefined) {
					$(this).css(
						'background-image',
						"url('img/items/" + itemData.name + ".png'"
					);
					$('#drop').removeClass('disabled');
					$('#use').removeClass('disabled');
					$('#give').removeClass('disabled');
				}
			},
		});
	} else if (event.data.action == 'setSecondInventoryItems') {
		secondInventorySetup(event.data.itemList);
	} else if (event.data.action == 'setShopInventoryItems') {
		shopInventorySetup(event.data.itemList, event.data.zone);
	} else if (event.data.action == 'setInfoText') {
		$('.info-div').html(event.data.text);
	} else if (event.data.action == 'itemUsed') {
		UseBar(event.data.alerts);
	} else if (event.data.action == 'notification') {
		sendNotification(
			event.data.itemname,
			event.data.itemlabel,
			event.data.itemcount,
			event.data.itemremove
		);
	} else if (event.data.action == 'showhotbar') {
		showHotbar(event.data.itemList, event.data.fastItems, event.data);
	} else if (event.data.action == 'nearPlayers') {
		$('#nearPlayers').html('');

		$.each(event.data.players, function (index, player) {
			$('#nearPlayers').append(
				'<button class="nearbyPlayerButton" data-player="' +
					player.player +
					'">' +
					player.player +
					'</button>'
			);
		});

		$('#dialog').dialog('open');

		$('.nearbyPlayerButton').click(function () {
			$('#dialog').dialog('close');
			player = $(this).data('player');
			$.post(
				'http://esx_inventoryhud/GiveItem',
				JSON.stringify({
					player: player,
					item: event.data.item,
					number: parseInt($('#count').val()),
				})
			);
		});
	} else if (event.data.action == 'itemUsed') {
		ItemUsed(event.data.alerts);
	}
});

function showHotbar(items, fastItems, data) {
	$('#playerInventoryHotbar').html('');
	$.each(items, function (index, item) {
		count = setCount(item);
		$('#playerInventory').append(
			'<div class="slot"><div id="item-' +
				index +
				'" class="item" style = "background-image: url(\'img/items/' +
				item.name +
				'.png\')">' +
				'<div class="item-count">' +
				count +
				'</div> <div class="item-name">' +
				item.label +
				'</div> </div ><div class="item-name-bg"></div></div>'
		);
		$('#item-' + index).data('item', item);
		$('#item-' + index).data('inventory', 'main');
	});

	$('#playerInventoryHotbar').fadeIn();
	setTimeout(function () {
		$('#playerInventoryHotbar').fadeOut();
	}, 1500);
	setTimeout(function () {
		$('#playerInventoryHotbar').html('');
	}, 2000);

	var i;
	for (i = 1; i < 6; i++) {
		$('#playerInventoryHotbar').append(
			'<div class="slotFast"><div id="itemFast-' +
				i +
				'" class="item" >' +
				'<div class="keybind">' +
				i +
				'</div><div class="item-count"></div> <div class="item-name"></div> </div ><div class="item-name-bg"></div></div>'
		);
	}

	$.each(fastItems, function (index, item) {
		count = setCount(item);
		$('#itemFast-' + item.slot).css(
			'background-image',
			"url('img/items/" + item.name + ".png')"
		);
		$('#itemFast-' + item.slot).html(
			'<div class="keybind">' +
				item.slot +
				'</div><div class="item-count">' +
				count +
				'</div> <div class="item-name">' +
				item.label +
				'</div> <div class="item-name-bg"></div>'
		);
		$('#itemFast-' + item.slot).data('item', item);
		$('#itemFast-' + item.slot).data('inventory', 'fast');
	});
}

var alertTimer = null;

function ItemUsed(alerts) {
	clearTimeout(alertTimer);
	$('#use-alert').hide('fade', { direction: 'left' }, 500, function () {
		$('#use-alert .slot').remove();

		$.each(alerts, function (index, data) {
			$('#use-alert')
				.append(
					`<div class="slot alert-${index}""><div class="itemalert"><div class="item-namealert">${data.item.label}</div></div><div class="alert-text">${data.message}</div></div>`
				)
				.ready(function () {
					console.log(data.item.name);
					$(`.alert-${index}`)
						.find('.itemalert')
						.css(
							'background-image',
							"url('img/items/" + data.item.name + ".png')"
						);
				});
		});
	});

	$('#use-alert').show('fade', { direction: 'left' }, 500, function () {
		alertTimer = setTimeout(function () {
			$('#use-alert .slot').addClass('expired');
			$('#use-alert').hide('fade', { direction: 'left' }, 500, function () {
				$('#use-alert .slot.expired').remove();
			});
		}, 2500);
	});
}

function sendNotification(item, itemlabel, count, remove) {
	$('#notificacao').html('');
	$('#notificacao').fadeIn();
	if (remove) {
		$('#notificacao').append(
			'<div class="slot" style="background-color: rgba(255, 166, 0, 0)" id="noti"><div class="item2" style = "background-image: url(\'img/items/' +
				item +
				'.png\')">' +
				'<div class="item-count">-' +
				count +
				'</div> <div class="item-name">' +
				itemlabel +
				'</div> </div ><div class="item-name-bg"></div></div>'
		);
		//   $("#notificacao").stop(true,true).fadeIn(500).delay(1500).fadeOut(500);
		setTimeout(function () {
			$('#notificacao').fadeOut();
		}, 1500);
	} else {
		$('#notificacao').append(
			'<div class="slot" style="background-color: rgba(255, 166, 0, 0)" id="noti"><div class="item2" style = "background-image: url(\'img/items/' +
				item +
				'.png\')">' +
				'<div class="item-count">+' +
				count +
				'</div> <div class="item-name">' +
				itemlabel +
				'</div> </div ><div class="item-name-bg"></div></div>'
		);
		//    $("#notificacao").stop(true,true).fadeIn(500).delay(1500).fadeOut(500);
		setTimeout(function () {
			$('#notificacao').fadeOut();
		}, 1500);
	}
}
let usedBar = 0;
let image = '';
let name = '';
let htmlstring = '';

function UseBar(alerts) {
	document.getElementById('UseBar').innerHTML = '';
	$.each(alerts, function (index, data) {
		image = data.item.name;
		name = data.item.label;

		htmlstring =
			"<div id='bind1'> " +
			data.message +
			" </div> <div class='item1' > <div class='itemname'> " +
			name +
			" </div> <img src='img/items/" +
			image +
			".png' class='itemimage'>  </div>";

		document.getElementById('UseBar').innerHTML = htmlstring;
		$('#UseBar').fadeIn(500);
		clearTimeout(usedBar);
		usedBar = setTimeout(() => {
			$('#UseBar').fadeOut(1500);
		}, 1500);
	});
}

function closeInventory() {
	$.post('http://esx_inventoryhud/NUIFocusOff', JSON.stringify({}));
}

function inventorySetup(items, fastItems) {
	$('#playerInventory').html('');
	var space = 0;
	var i;
	for (i = 1; i < 6; i++) {
		$('#playerInventory').append(
			'<div class="slotFast"><div id="itemFast-' +
				i +
				'" class="item" >' +
				'<div class="keybind">' +
				i +
				'</div> <div class="item-name"></div> </div ><div class="item-name-bg"></div></div>'
		);
	}

	$.each(fastItems, function (index, item) {
		count = setCount(item);
		$('#itemFast-' + item.slot).css(
			'background-image',
			"url('img/items/" + item.name + ".png')"
		);
		$('#itemFast-' + item.slot).html(
			'<div class="keybind">' +
				item.slot +
				'</div><div class="item-count">' +
				count +
				'</div> <div class="item-name">' +
				item.label +
				'</div> <div class="item-name-bg"></div>'
		);
		$('#itemFast-' + item.slot).data('item', item);
		$('#itemFast-' + item.slot).data('inventory', 'fast');
	});

	$.each(items, function (index, item) {
		count = setCount(item);

		$('#playerInventory').append(
			'<div class="slot"><div id="item-' +
				index +
				'" class="item" style = "background-image: url(\'img/items/' +
				item.name +
				'.png\')">' +
				'<div class="item-count"> ' +
				count +
				' </div> <div class="item-name">' +
				item.label +
				'</div> </div ><div class="item-name-bg"></div></div>'
		);
		$('#item-' + index).data('item', item);
		$('#item-' + index).data('inventory', 'main');

		space = space + 1;
	});

	for (var i = 0; i < 35 - space; i++) {
		$('#playerInventory').append(
			'<div class="slot">' + '<div class="item-name"> </div> </div>'
		);
	}

	makeDraggables();
}

function makeDraggables() {
	$('#itemFast-1').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (
				type === 'normal' &&
				(itemInventory === 'main' || itemInventory === 'fast') &&
				(itemData.type === 'item_standard' || itemData.type === 'item_weapon')
			) {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoFast',
					JSON.stringify({
						item: itemData,
						slot: 1,
					})
				);
			}
		},
	});
	$('#itemFast-2').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (
				type === 'normal' &&
				(itemInventory === 'main' || itemInventory === 'fast') &&
				(itemData.type === 'item_standard' || itemData.type === 'item_weapon')
			) {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoFast',
					JSON.stringify({
						item: itemData,
						slot: 2,
					})
				);
			}
		},
	});
	$('#itemFast-3').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (
				type === 'normal' &&
				(itemInventory === 'main' || itemInventory === 'fast') &&
				(itemData.type === 'item_standard' || itemData.type === 'item_weapon')
			) {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoFast',
					JSON.stringify({
						item: itemData,
						slot: 3,
					})
				);
			}
		},
	});
	$('#itemFast-4').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (
				type === 'normal' &&
				(itemInventory === 'main' || itemInventory === 'fast') &&
				(itemData.type === 'item_standard' || itemData.type === 'item_weapon')
			) {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoFast',
					JSON.stringify({
						item: itemData,
						slot: 4,
					})
				);
			}
		},
	});
	$('#itemFast-5').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (
				type === 'normal' &&
				(itemInventory === 'main' || itemInventory === 'fast') &&
				(itemData.type === 'item_standard' || itemData.type === 'item_weapon')
			) {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoFast',
					JSON.stringify({
						item: itemData,
						slot: 5,
					})
				);
			}
		},
	});
}
function secondInventorySetup(items) {
	$('#otherInventory').html('');
	var space = 0;
	$.each(items, function (index, item) {
		count = setCount(item);

		$('#otherInventory').append(
			'<div class="slot"><div id="itemOther-' +
				index +
				'" class="item" style = "background-image: url(\'img/items/' +
				item.name +
				'.png\')">' +
				'<div class="item-count">' +
				count +
				'</div> <div class="item-name">' +
				item.label +
				'</div> </div ><div class="item-name-bg"></div></div>'
		);
		$('#itemOther-' + index).data('item', item);
		$('#itemOther-' + index).data('inventory', 'second');
		space = space + 1;
	});

	for (var i = 0; i < 35 - space; i++) {
		$('#otherInventory').append(
			'<div class="slot">' + '<div class="item-name"> </div> </div>'
		);
	}
}

function shopInventorySetup(items, zone) {
	$('#otherInventory').html('');
	var space = 0;
	$.each(items, function (index, item) {
		//count = setCount(item)
		cost = setCost(item);

		$('#otherInventory').append(
			'<div class="slot"><div id="itemOther-' +
				index +
				'" class="item" style = "background-image: url(\'img/items/' +
				item.name +
				'.png\')">' +
				'<div class="item-count">' +
				cost +
				'</div> <div class="item-name">' +
				item.label +
				'</div> </div ><div class="item-name-bg"></div></div>'
		);
		$('#itemOther-' + index).data('item', item);
		$('#itemOther-' + index).data('inventory', 'second');
		$('#itemOther-' + index).data('zone', zone);
		space = space + 1;
	});

	for (var i = 0; i < 35 - space; i++) {
		$('#otherInventory').append(
			'<div class="slot">' + '<div class="item-name"> </div> </div>'
		);
	}
}

function Interval(time) {
	var timer = false;
	this.start = function () {
		if (this.isRunning()) {
			clearInterval(timer);
			timer = false;
		}

		timer = setInterval(function () {
			disabled = false;
		}, time);
	};
	this.stop = function () {
		clearInterval(timer);
		timer = false;
	};
	this.isRunning = function () {
		return timer !== false;
	};
}

function disableInventory(ms) {
	disabled = true;

	if (disabledFunction === null) {
		disabledFunction = new Interval(ms);
		disabledFunction.start();
	} else {
		if (disabledFunction.isRunning()) {
			disabledFunction.stop();
		}

		disabledFunction.start();
	}
}

function setCount(item) {
	count = item.count;

	if (item.limit > 0) {
		count = item.count + ' / ' + item.limit;
	}

	if (item.type === 'item_weapon') {
		if (count == 0) {
			count = '0';
		} else {
			count = '<img src="img/bullet.png" class="ammoIcon"> ' + item.count;
		}
	}

	if (item.type === 'item_account' || item.type === 'item_money') {
		count = formatMoney(item.count);
	}

	return count;
}

function setCost(item) {
	cost = item.price;

	if (item.price == 0) {
		cost = '$ID' + item.price;
	}
	if (item.price > 0) {
		cost = '$ID' + item.price;
	}
	return cost;
}

function formatMoney(n, c, d, t) {
	var c = isNaN((c = Math.abs(c))) ? 2 : c,
		d = d == undefined ? '.' : d,
		t = t == undefined ? ',' : t,
		s = n < 0 ? '-' : '',
		i = String(parseInt((n = Math.abs(Number(n) || 0).toFixed(c)))),
		j = (j = i.length) > 3 ? j % 3 : 0;

	return (
		s +
		(j ? i.substr(0, j) + t : '') +
		i.substr(j).replace(/(\d{3})(?=\d)/g, '$1' + t)
	);
}

$(document).ready(function () {
	$('#count')
		.focus(function () {
			$(this).val('');
		})
		.blur(function () {
			if ($(this).val() == '') {
				$(this).val('1');
			}
		});

	$('body').on('keyup', function (key) {
		if (Config.closeKeys.includes(key.which)) {
			closeInventory();
		}
	});

	$('#use').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');

			if (itemData == undefined || itemData.usable == undefined) {
				return;
			}

			itemInventory = ui.draggable.data('inventory');

			if (itemInventory == undefined || itemInventory == 'second') {
				return;
			}

			if (itemData.usable) {
				disableInventory(300);
				$.post(
					'http://esx_inventoryhud/UseItem',
					JSON.stringify({
						item: itemData,
					})
				);
			}
		},
	});

	$('#give').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');

			if (itemData == undefined || itemData.canRemove == undefined) {
				return;
			}

			itemInventory = ui.draggable.data('inventory');

			if (itemInventory == undefined || itemInventory == 'second') {
				return;
			}

			if (itemData.canRemove) {
				disableInventory(300);
				$.post(
					'http://esx_inventoryhud/GetNearPlayers',
					JSON.stringify({
						item: itemData,
					})
				);
			}
		},
	});

	$('#drop').droppable({
		hoverClass: 'hoverControl',
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');

			if (itemData == undefined || itemData.canRemove == undefined) {
				return;
			}

			itemInventory = ui.draggable.data('inventory');

			if (itemInventory == undefined || itemInventory == 'second') {
				return;
			}

			if (itemData.canRemove) {
				disableInventory(300);
				$.post(
					'http://esx_inventoryhud/DropItem',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			}
		},
	});

	$('#playerInventory').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (type === 'trunk' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromTrunk',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'property' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromProperty',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						owner: ownerHouse,
					})
				);
			} else if (type === 'locker' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromLocker',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						locker: locker,
					})
				);
			} else if (type === 'biker' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromBiker',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'cartel' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromCartel',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'gang' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromGang',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'mafia' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromMafia',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'police' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromPolice',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'vault' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromVault',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'glovebox' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromGlovebox',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'vault' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromVault',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'player' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromPlayer',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'normal' && itemInventory === 'fast') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromFast',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'shop' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromShop',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'motels' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromMotel',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'motelsbed' && itemInventory === 'second') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/TakeFromMotelBed',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			}
		},
	});

	$('#otherInventory').droppable({
		drop: function (event, ui) {
			itemData = ui.draggable.data('item');
			itemInventory = ui.draggable.data('inventory');

			if (type === 'trunk' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoTrunk',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'property' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoProperty',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						owner: ownerHouse,
					})
				);
			} else if (type === 'biker' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoBiker',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'locker' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoLocker',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
						locker: locker,
					})
				);
			} else if (type === 'cartel' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoCartel',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'gang' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoGang',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'mafia' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoMafia',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'police' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoPolice',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'vault' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoVault',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'glovebox' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoGlovebox',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'vault' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoVault',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'player' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoPlayer',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'motels' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoMotel',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			} else if (type === 'motelsbed' && itemInventory === 'main') {
				disableInventory(500);
				$.post(
					'http://esx_inventoryhud/PutIntoMotelBed',
					JSON.stringify({
						item: itemData,
						number: parseInt($('#count').val()),
					})
				);
			}
		},
	});

	$('#count').on('keypress keyup blur', function (event) {
		$(this).val(
			$(this)
				.val()
				.replace(/[^\d].+/, '')
		);
		if (event.which < 48 || event.which > 57) {
			event.preventDefault();
		}
	});
});

$.widget('ui.dialog', $.ui.dialog, {
	options: {
		// Determine if clicking outside the dialog shall close it
		clickOutside: false,
		// Element (id or class) that triggers the dialog opening
		clickOutsideTrigger: '',
	},
	open: function () {
		var clickOutsideTriggerEl = $(this.options.clickOutsideTrigger),
			that = this;
		if (this.options.clickOutside) {
			// Add document wide click handler for the current dialog namespace
			$(document).on(
				'click.ui.dialogClickOutside' + that.eventNamespace,
				function (event) {
					var $target = $(event.target);
					if (
						$target.closest($(clickOutsideTriggerEl)).length === 0 &&
						$target.closest($(that.uiDialog)).length === 0
					) {
						that.close();
					}
				}
			);
		}
		// Invoke parent open method
		this._super();
	},
	close: function () {
		// Remove document wide click handler for the current dialog
		$(document).off('click.ui.dialogClickOutside' + this.eventNamespace);
		// Invoke parent close method
		this._super();
	},
});
