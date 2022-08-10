package com.criticalfusion.thenandnow.view
{
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Application extends Sprite
	{
		public var main:Main;
		
		public function Application()
		{
			super();
			initialize();
		}
		
		final protected function onResizeStage(event:Event):void
		{
			TweenMax.to(main, .5, {x:stage.stageWidth * .5, y: stage.stageHeight * .5, ease:Sine.easeOut, overwrite:2, delay:.2});
		}
		
		final protected function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(Event.RESIZE, onResizeStage);
			
			main.x = stage.stageWidth * .5;
			main.y = stage.stageHeight * .5; 
			
			main.displayInstructions();
		}
		
		final protected function initialize():void
		{
			this.cacheAsBitmap = true;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
	}
}