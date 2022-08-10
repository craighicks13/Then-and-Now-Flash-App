package com.criticalfusion.thenandnow.view
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Icon extends Sprite
	{
		public var onClick:Function;
		public var selected:Boolean = false;
		public var needParent:String;
		public var description:String;
		
		public function Icon()
		{
			super();
			this.cacheAsBitmap = true;
			initialize();
		}
		
		final protected function onIconClicked(event:MouseEvent):void
		{
			if(onClick != null) onClick(this);
		}
		
		final protected function initialize():void
		{
			this.buttonMode = true;
			this.addEventListener(MouseEvent.CLICK, onIconClicked, false, 0, true);
		}
	}
}