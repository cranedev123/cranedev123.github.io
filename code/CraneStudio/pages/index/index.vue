<template>

	<view class="content">
		<!-- <image class="logo" src="/static/logo.png"></image> -->
		<!-- <view class="text-area">
			<text class="title">{{title}}</text>
		</view> -->
		<!-- <view class="bottom" v-for="item in links_bottom">
			<text class="item_link" @click="onLinkClicked" v-bind:id="item.url">{{item.title}}</text>
		</view> -->


		<view class="bg" />


		<uni-grid class="grid" :column="pro_colum" :showBorder="false">
			<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in productList" v-bind:id="index"
			 :key="index" @click="onClickItem">
				<uni-grid-item class="item_view1" :style="'width: '+itemW+'px; height: '+itemW+'px;'">
					<view class="item_view">
						<view class="item_icon">
							<image v-if="renderImage" class="item_icon" mode="aspectFit" src="https://p.moimg.net/project/project_20201026_1603690116_3710.jpg?imageMogr2/auto-orient/strip"></image>
<!-- 							<image v-if="renderImage" class="item_icon" mode="aspectFit" :src="item.icon"></image> -->
						</view>
						<view class="item_title">{{item.name}}</view>
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
			<view class="contact">
			</view>
			<view class="copyright">Copyright © 2018-2020 CraneStudio, Inc. All rights reserved.</view>
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
				pro_colum: 4,
				title: 'Hello111',
				platform: 'other',
				isZh:false,
				links_bottom: [],
				contact_list: [],
				itemW: 50
			}
		},
		onLoad() {
			var info = uni.getSystemInfoSync()
			this.platform = info.platform
			this.isZh = info.language && info.language.indexOf('zh') >= 0
			
			if(this.platform == 'android' || this.platform == 'ios')
			{
				this.pro_colum = 2
				this.itemW = info.screenWidth / 2
			}else{
				this.pro_colum = 5
				this.itemW = info.screenWidth / 6
			}
			console.log(info)
			
			this.getProductList()
		},
		methods: {
			onLinkClicked(e) {
				var url = e.currentTarget.id
				window.location.href = url
			},
			getProductList() {
				this.productList = Datas.getAppList().appList
				this.contact_list = Datas.getContactList()
				this.links_bottom = Datas.getLinks_bottom()
			},
			onClickItem(e) {
				var index = e.currentTarget.id
				var url = this.productList[index].link
				window.location.href = url
			},
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

	.bg {
		position: fixed;
		width: 100%;
		height: 100%;
		background-color: #2C405A;
	}

	.grid {

		margin-top: 0%;
		margin-left: 5%;
		margin-right: 5%;
		margin-bottom: 100upx;
		padding-bottom: 100upx;
		background-color: #FFA72B;
	}

	.text_select {
		color: #FFFFFF;
		background-color: #ffa72b;
	}

	.item_view {
		display: flex;
		width: 100%;
		height: 100%;
		flex-direction: column;
		align-items: center;
	}

	.item_icon {
		width: 100%;
		height: 100%;
	}

	.item_title {
		color: #FFFFFF;
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
