var appList = {
	"appList": [{
			"name": "Railway Worker",
			"name_zh": "Railway Worker",
			"package": "cn.crane.flutter.plumber.lineworker",
			"icon": "https://is2-ssl.mzstatic.com/image/thumb/Purple113/v4/46/e6/18/46e618e4-e002-a48f-9458-aec0cd5a752a/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.png",
			"link": "https://itunes.apple.com/app/1485420263"
		},
		{
			"name": "Jigsaw World",
			"name_zh": "多多数字拼图",
			"package": "cn.crane.flutter.puzzle.jigsaw",
			"icon": "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/57/e3/5f/57e35f71-9796-ebc6-e119-ce61e33fd07a/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/738x0w.jpg",
			"link": "https://itunes.apple.com/app/id1477751457"
		},
		{
			"name": "Dance Up",
			"name_zh": "一起来跳舞",
			"package": "cn.crane.flutter.danceup",
			"icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/e8/1a/1a/e81a1a2d-a106-1892-6091-3d54d30b8619/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
			"link": "https://itunes.apple.com/app/id1475789889"
		},
		{
			"name": "Crazy Sudoku",
			"name_zh": "一起来数独",
			"package": "cn.crane.myapp.flutterSudoku",
			"icon": "https://is5-ssl.mzstatic.com/image/thumb/Purple113/v4/4e/c6/fe/4ec6fe35-0343-3cce-b6bf-ab3f6710d663/AppIcon-0-1x_U007emarketing-0-0-85-220-10.png/230x0w.jpg",
			"link": "https://itunes.apple.com/app/id1465370843"
		},
		{
			"name": "Touch Number",
			"name_zh": "按数字",
			"package": "cn.crane.game.flutter.findx",
			"icon": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/e4/58/0a/e4580aa1-6848-78bb-2f47-0f69bf69cbc5/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
			"link": "https://itunes.apple.com/app/id1481699832"
		},
		{
			"name": "Flappy UFO",
			"name_zh": "Flappy UFO",
			"package": "cn.crane.game.flappyufo",
			"icon": "https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/6d/6b/0c/6d6b0cb3-c4f3-5f3c-d1fd-0ac9dcda0748/AppIcon-0-1x_U007emarketing-0-0-85-220-7.png/230x0w.jpg",
			"link": "https://itunes.apple.com/app/id1482524329"
		}
	]
};

var contact_list = [{
	'title': 'Weibo',
	'icon': 'Weibo',
	'url': 'https://cranedev123.github.io/release/privacy.html'
}, {
	'title': 'Facebook',
	'icon': 'Facebook',
	'url': 'https://cranedev123.github.io/release/tos.html'
}, {
	'title': 'Twitter',
	'icon': 'Twitter',
	'url': 'https://cranedev123.github.io/release/tos.html'
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
