var appList = {
	"appList": [{
			"name": "Railway Worker",
			"name_zh": "Railway Worker",
			"package": "cn.crane.flutter.plumber.lineworker",
			"icon": "https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/46/e6/18/46e618e4-e002-a48f-9458-aec0cd5a752a/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.png",
			"link": "https://apps.apple.com/cn/app/id1485420263",
			"link_google": "https://play.google.com/store/apps/details?id=cn.crane.flutter.plumber.lineworker",
		},
		{
			"name": "Jigsaw World",
			"name_zh": "多多数字拼图",
			"package": "cn.crane.flutter.puzzle.jigsaw",
			"icon": "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/57/e3/5f/57e35f71-9796-ebc6-e119-ce61e33fd07a/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/738x0w.jpg",
			"link": "https://apps.apple.com/cn/app/id1477751457",
			"link_google": "https://play.google.com/store/apps/details?id=cn.crane.flutter.puzzle.jigsaw"
		},
		{
			"name": "Crazy Sudoku",
			"name_zh": "一起来数独",
			"package": "cn.crane.myapp.flutterSudoku",
			"icon": "https://play-lh.googleusercontent.com/-s7cE6kXlZrJ-Rz3myYgMvXCWXRnt-hTV2LWXcdi3G6GVjmi-9WkCbawgWH8LlDi1ZUs=s360-rw",
			"link": "https://apps.apple.com/cn/app/id1477751457",
			"link_goole": "https://play.google.com/store/apps/details?id=cn.crane.myapp.flutter_sudoku"
		},
		{
			"name": "Touch Number",
			"name_zh": "按数字",
			"package": "cn.crane.game.flutter.findx",
			"icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/e4/58/0a/e4580aa1-6848-78bb-2f47-0f69bf69cbc5/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
			"link": "https://apps.apple.com/cn/app/id1481699832",
			"link_google": "https://play.google.com/store/apps/details?id=cn.crane.game.flutter.findx"
		},
		{
			"name": "Flappy UFO",
			"name_zh": "Flappy UFO",
			"package": "cn.crane.game.flappyufo",
			"icon": "https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/6d/6b/0c/6d6b0cb3-c4f3-5f3c-d1fd-0ac9dcda0748/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
			"link": "https://apps.apple.com/cn/app/id1482524329",
			"link_google": "https://apps.apple.com/cn/app/id1482524329"
		},
		{
			"name": "Conway's Game of Life",
			"name_zh": "Conway's Game of Life",
			"package": "cn.crane.game.flutter.lifegame",
			"icon": "https://play-lh.googleusercontent.com/tvoRwJ_hAQkYgIb0zYX-_fIOY16ej1QGdE1X2_fizVZqtBbzzLoZE9ZxHHbQ4r5HXA=s360-rw",
			"link": "https://apps.apple.com/cn/app/id1489188975",
			"link_google": "https://play.google.com/store/apps/details?id=cn.crane.game.flutter.lifegame"
		},
		{
			"name": "Langton's Ant - cell Games",
			"name_zh": "Langton's Ant - cell Games",
			"package": "cn.crane.flutter.langtons.ant",
			"icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/ca/ae/11/caae11ff-7c40-3b9c-5991-6349203a670d/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-85-220.png/230x0w.webp",
			"link": "https://apps.apple.com/cn/app/id1491344162",
			"link_google": "https://apps.apple.com/cn/app/id1491344162"
		},
		{
			"name": "The Next One",
			"name_zh": "The Next One",
			"package": "",
			"icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple123/v4/ca/ae/11/caae11ff-7c40-3b9c-5991-6349203a670d/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-85-220.png/230x0w.webp",
			"link": "",
			"link_google": ""
		}
	]
};

var contact_list = [{
	'title': 'Facebook',
	'icon': '../../static/imgs/facebook-one.svg',
	'url': 'https://cranedev123.github.io/release/tos.html'
}, {
	'title': 'Twitter',
	'icon': '../../static/imgs/twitter.svg',
	'url': 'https://cranedev123.github.io/release/tos.html'
}, {
	'title': 'Instagram',
	'icon': '../../static/imgs/instagram.svg',
	'url': 'https://cranedev123.github.io/release/tos.html'
}, {
	'title': 'Weibo',
	'icon': '../../static/imgs/weibo.svg',
	'url': 'https://cranedev123.github.io/release/privacy.html'
}, {
	'title': 'Email',
	'icon': '../../static/imgs/mail.svg',
	'url': 'https://cranedev123.github.io/release/privacy.html'
}, ];


var links_bottom = [{
	'title': 'Privacy Policy',
	'url': 'https://cranedev123.github.io/release/privacy.html'
}, {
	'title': 'Terms of Service',
	'url': 'https://cranedev123.github.io/release/tos.html'
}, ];
module.exports = {
	getAppList() {
		return appList
	},
	getContactList() {
		return contact_list
	},
	getLinks_bottom() {
		return links_bottom
	},
}
