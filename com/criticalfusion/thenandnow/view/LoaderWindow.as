package com.criticalfusion.thenandnow.view
{
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	
	import flash.display.Sprite;
	import com.criticalfusion.thenandnow.view.nav.EnterButton;
	
	public class LoaderWindow extends Sprite
	{
		public var loading_graphics:Sprite;
		public var loading_bar:Sprite;
		public var enterButton:EnterButton;
		
		public var enterApplication:Function;
		
		public function LoaderWindow()
		{
			super();
			this.cacheAsBitmap = true;
			enterButton.alpha = 0;
			enterButton.visible = false;
		}
		
		public function updateLoading(value:Number):void
		{
			loading_bar.scaleX = value;
		}
		
		public function loadComplete():void
		{
			enterButton.onClick = onEnter;
			TweenMax.to(enterButton, .5, {autoAlpha:1, ease:Sine.easeOut});
			TweenMax.to(loading_bar, .5, {autoAlpha:0, ease:Sine.easeOut});
			TweenMax.to(loading_graphics, .5, {autoAlpha:0, ease:Sine.easeOut});
		}
		
		public function onEnter():void
		{
			enterApplication();
		}
	}
}