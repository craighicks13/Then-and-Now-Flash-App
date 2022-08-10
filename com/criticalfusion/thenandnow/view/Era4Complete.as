package com.criticalfusion.thenandnow.view
{
	import com.criticalfusion.thenandnow.view.nav.ReplayButton;
	
	import flash.display.Sprite;
	
	public class Era4Complete extends Sprite
	{
		public var replay_button:ReplayButton;
		public var replayClick:Function;
		public function Era4Complete()
		{
			super();
			replay_button.onClick = onReplayClick;
		}
		
		final protected function onReplayClick():void
		{
			if(replayClick != null) replayClick();
		}
	}
}