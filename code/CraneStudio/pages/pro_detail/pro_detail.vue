<template>
	<view>
		<image class="logo" src="../../static/logo.png"></image>

		<view class="down_load">
			<text class="app_store">App Store</text>
			<text class="google_play">Google Play</text>
		</view>


	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {

		}
	}
</script>

<style>
	.logo {
		aspect-ratio: '1:1';
	}

	.down_load {
		display: flex;
		flex-direction: row;
		text-align: center;
		justify-content: center;
	}
</style>
