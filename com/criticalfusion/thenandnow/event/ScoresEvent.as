package com.criticalfusion.thenandnow.event
{
	import flash.events.Event;
	
	public class ScoresEvent extends Event
	{
		public static const UPDATE_SCORES:String = "update scores";
		
		public var incorrect:int;
		public var made:int;
		public var remaining:int;
		
		public function ScoresEvent(type:String, incorrect:int, made:int, remaining:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.incorrect = incorrect;
			this.made = made;
			this.remaining = remaining;
		}
		
		public override function clone():Event
		{
			return new ScoresEvent(type, incorrect, made, remaining, bubbles, cancelable);
		}
	}
}