<template>

	<view class="content">
		<!-- <image class="logo" src="/static/logo.png"></image> -->

		<!-- <view class="bottom" v-for="item in links_bottom">
			<text class="item_link" @click="onLinkClicked" v-bind:id="item.url">{{item.title}}</text>
		</view> -->


		<view class="bg" />

		<view :class="bg_title">
			<text :class="title_style">{{title}}</text>
		</view>

		<uni-grid class="grid_style" :column="pro_colum" :showBorder="false" borderColor="grey">
			<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in productList" v-bind:id="index"
			 :key="index" @click="onClickItem">
				<uni-grid-item class="item_view1">
					<view class="item_view">
						<view class="item_icon">
							<image v-if="renderImage" class="item_icon" mode="aspectFit" :src="item.icon"></image>
						</view>

						<view class="item_title">{{item.name}}</view>

						<view class="down_load_style">
							<image v-bind:id="index" @click.stop="onClickItemApple" style="width: 250upx; height: 78upx;" class="down_type" src="../../static/imgs/App_store.png"
							 mode="aspectFit">
							</image>
							<text class="space_image"></text>
							<image v-bind:id="index" @click.stop="onClickItemGoogle" style="width: 250upx; height: 78upx;" class="down_type" src="../../static/imgs/googleplay.png"
							 mode="aspectFit">
							</image>
						</view>
					</view>


				</uni-grid-item>

			</view>
		</uni-grid>



		<view class="bottom">
			<view class="tos">
				<text class="item_link" @click="onLinkClicked" v-bind:id="links_bottom[0].url">{{links_bottom[0].title}}</text>
				<text class="item_link"> | </text>
				<text class="item_link" @click="onLinkClicked" v-bind:id="links_bottom[1].url">{{links_bottom[1].title}}</text>
			</view>
			<list class="contact" ref="list">
				<cell v-for="(item, index) in contact_list" v-bind:id="index" @click="onContactCLicked">
					<!-- <text>{{item.title}}</text> -->
					<image class="contact_img" :src="item.icon" mode="aspectFit"></image>
				</cell>
			</list>
			<view class="copyright">Copyright © 2018-2024 CraneStudio, Inc. All rights reserved.</view>
		</view>


	</view>
</template>

<script>
	var Datas = require('../../common/datas.js')
	export default {
		data() {
			return {
				productList: [{}],
				renderImage: true,
				pro_colum: 2,
				title: 'Crane Studio',
				platform: 'other',
				isZh: false,
				links_bottom: [],
				contact_list: [],
				itemW: 50,
				bg_title: 'bg_title',
				title_style: 'title_style',
			}
		},
		onLoad() {
			var info = uni.getSystemInfoSync()
			this.platform = info.platform
			this.isZh = info.language && info.language.indexOf('zh') >= 0

			// if (this.platform == 'android' || this.platform == 'ios') {
			// 	this.pro_colum = 2
			// 	this.itemW = info.screenWidth / 2
			// } else {
			// 	this.pro_colum = 5
			// 	this.itemW = info.screenWidth / 6
			// }

			var isMobile = this.platform == 'android' || this.platform == 'ios'

			if (isMobile) {
				this.bg_title = 'bg_title_small'
				this.title_style = 'title_style_small'

				this.pro_colum = 1
				this.itemW = (info.screenWidth * 3 / 5 - 20) / 3
			} else {
				this.bg_title = 'bg_title'
				this.title_style = 'title_style'

				this.pro_colum = 6
				this.itemW = (info.screenWidth * 0.7 - 20) / 6

			}


			// this.pro_colum = 4
			// this.itemW = (info.screenWidth * 3 / 5 - 20) / 6

			// this.itemW = 100
			console.log(info)

			this.getProductList()
		},
		methods: {
			onLinkClicked(e) {
				var url = e.currentTarget.id
				this.jumpUrl(url)
			},
			getProductList() {
				this.productList = Datas.getAppList().appList
				// this.contact_list = Datas.getContactList()
				this.links_bottom = Datas.getLinks_bottom()
			},
			onClickItem(e) {
				var index = e.currentTarget.id
				var url = this.productList[index].link
				this.jumpUrl(url)
			},
			onClickItemApple(e) {
				var index = e.currentTarget.id
				var url = this.productList[index].link
				this.jumpUrl(url)
			},
			onClickItemGoogle(e) {
				console.log(e)
				var index = e.currentTarget.id
				var url = this.productList[index].link_google
				this.jumpUrl(url)
			},
			onContactCLicked(e) {
				console.log(e)
				var index = e.currentTarget.id
				var url = this.contact_list[index].url
				this.jumpUrl(url)
			},

			jumpUrl(url) {
				if (url && url.length > 0) {
					window.open(url)
				}
			}
		}
	}
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		align-content: center;
		background-color: #2C405A;
	}

	.bg_title {
		display: flex;
		flex-direction: row;
		align-items: center;
		align-content: center;
		justify-content: center;
		position: fixed;
		top: 100upx;
		background-color: #2C405A;
		z-index: 1;
	}

	.bg_title_small {
		display: flex;
		flex-direction: row;
		align-items: center;
		align-content: center;
		justify-content: center;
		background-color: #2C405A;
		position: fixed;
		top: 60upx;
		z-index: 1;
	}

	.title_style {
		color: #FFFFFF;
		font-size: 120upx;
		font-style: normal;
	}

	.title_style_small {
		color: #FFFFFF;
		font-size: 40upx;
		font-style: normal;
	}

	.bg {
		position: fixed;
		width: 100%;
		height: 100%;
		background-color: #2C405A;
	}

	.grid_style {

		width: 70%;
		margin-top: 300upx;
		margin-left: 20%;
		margin-right: 20%;
		background-color: #FFA72B;
	}

	.text_select {
		color: #FFFFFF;
		background-color: #ffa72b;
	}
	
	.item_view {
		display: flex;
		margin-left: 15%;
		margin-right: 15%;
		margin-top: 15%;
		margin-bottom: 15%;
		width: 70%;
		height: 100%;
		flex-direction: column;
		align-items: center;
		align-content: center;
		justify-content: center;
	}

	.item_icon {
		
		  width: 200upx;
		  height: 200upx; 
		  border-radius: 17%; 
	}

	.item_title {
		color: #FFFFFF;
		margin-top: 20upx;
		  white-space: nowrap;
		   text-overflow: ellipsis;
	}

	.down_load_style {
		width: 100%;
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		margin-top: 30upx;
	}

	.down_type {
		/* width: 90%;
		margin-left: 5%;
		margin-right: 5%; */
	}

	.space_image {
		width: 30upx;
	}

	.logo {
		height: 200rpx;
		width: 200rpx;
		margin-top: 200rpx;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50rpx;
	}

	.text-area {
		display: flex;
		justify-content: center;
	}

	.title {
		font-size: 36rpx;
		color: #FFFFFF;
	}

	.bottom {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		position: fixed;
		bottom: 50upx;
		left: 0;
		right: 0;
		background-color: #2C405A;
		z-index: 1;
	}

	.contact {
		display: flex;
		flex-direction: row;
	}
	
	.contact_img{
		width: 50upx;
		height: 50upx;
		margin-left: 10upx;
		margin-right: 10upx;
		margin-top: 20upx;
	}

	.item_link {
		text-underline: initial;
		text-size-adjust: inherit;
		font-size: 20upx;
		padding-left: 5upx;
		padding-right: 5upx;
		color: #FFFFFF;
		text-decoration: underline;

	}

	.copyright {
		text-underline: initial;
		text-size-adjust: inherit;
		font-size: 20upx;
		margin-top: 30upx;
		padding-left: 5upx;
		padding-right: 5upx;
		color: #999999;
		text-decoration: underline;

	}
</style>
