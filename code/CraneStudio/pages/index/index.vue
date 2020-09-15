<template>
	<view class="content">
		<!-- <image class="logo" src="/static/logo.png"></image> -->
		<view class="text-area">
			<text class="title">{{title}}</text>
		</view>
		<!-- <view class="bottom" v-for="item in links_bottom">
			<text class="item_link" @click="onLinkClicked" v-bind:id="item.url">{{item.title}}</text>
		</view> -->

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
				bottom: 'Privacy Policy | Terms of Service | Support',
				links_bottom: [{
					'title': 'Privacy Policy',
					'url': 'https://cranedev123.github.io/release/privacy.html'
				}, {
					'title': 'Terms of Service',
					'url': 'https://cranedev123.github.io/release/privacy.html'
				}, ]
			}
		},
		onLoad() {

		},
		methods: {
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
