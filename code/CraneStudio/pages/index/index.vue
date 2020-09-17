<template>
	<view class="content">
		<view class="app_list" v-for="item in app_list">
			<view class="app_info">
				<image class="app_icon" @click="onLinkClicked" v-bind:id="item.link" :src="item.icon"></image>
				<text class="app_name" @click="onLinkClicked" v-bind:id="item.link">{{item.name}}</text>

			</view>
		</view>

		<view class="contact">

		</view>

		<view class="bottom">
			<text class="item_link" @click="onLinkClicked" v-bind:id="links_bottom[0].url">{{links_bottom[0].title}}</text>
			<text class="item_link"> | </text>
			<text class="item_link" @click="onLinkClicked" v-bind:id="links_bottom[1].url">{{links_bottom[1].title}}</text>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title: 'Hello',
				links_bottom: [{
					'title': 'Privacy Policy',
					'url': 'https://cranedev123.github.io/release/privacy.html'
				}, {
					'title': 'Terms of Service',
					'url': 'https://cranedev123.github.io/release/tos.html'
				}, ],
				contact_list: [{
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
				}, ],
				app_list: [],
				platform:'other'

			}
		},
		onLoad() {
			var info = uni.getSystemInfoSync()
			console.log(info)
			var lan = info.language
			this.platform = info.platform

			// this.loadApps()

		},
		methods: {
			loadApps() {
				uni.request({
					url: '../../static/data/apps_ios.json',
					success: (res) => {
						console.log(res)
						this.app_list = res.data.appList
					}
				})
			},
			onLinkClicked(e) {
				var url = e.currentTarget.id
				window.location.href = url
			}
		}
	}
</script>

<style>
	.content {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
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
		color: #8f8f94;
	}

	.app_info {
		display: flex;
		flex-direction: row;
		justify-content: center;
		text-align: left;
	}

	.app_icon {
		width: 90upx;
		height: 90upx;
	}

	.bottom {
		display: flex;
		flex-direction: row;
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
		text-decoration: underline;

	}
</style>
