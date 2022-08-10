package com.criticalfusion.thenandnow.view
{
	import com.greensock.TweenMax;
	
	import flash.display.Sprite;
	
	public class EraScene extends Sprite
	{
		public function EraScene()
		{
			super();
			this.cacheAsBitmap = true;
		}
		
		public function checklist(value:String):void { }
		
		final public function hideItem(value:String):void
		{
			var item:Sprite = this[value];
			TweenMax.to(item, .5, {autoAlpha:0});
		}
		
		final public function showItem(value:String):void
		{
			checklist(value);
			var item:Sprite = this[value];
			item.alpha = 0;
			TweenMax.to(item, .5, {autoAlpha:1});
		}
		
		public function showCompleted():void {	}
	}
}