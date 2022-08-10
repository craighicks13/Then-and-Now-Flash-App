package com.criticalfusion.thenandnow.view
{
	import flash.display.Sprite;
	import com.criticalfusion.thenandnow.view.nav.StartButton;
	
	public class InstructionWindow extends Sprite
	{
		public var start_button:StartButton;
		public var startClicked:Function;
		
		public function InstructionWindow()
		{
			super();
			this.cacheAsBitmap = true;
			initialize();
		}
		
		final protected function onStartClicked():void
		{
			if(startClicked != null) startClicked();
		}
		
		final protected function initialize():void
		{
			start_button.onClick = onStartClicked;
		}
	}
}