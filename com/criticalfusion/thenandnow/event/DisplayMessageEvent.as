package com.criticalfusion.thenandnow.event
{
	import flash.events.Event;
	
	public class DisplayMessageEvent extends Event
	{
		public static const INCORRECT_ERA:String = "incorrect era";
		public static const UPGRADE_BARN:String = "upgrade barn";
		public static const ERA_COMPLETED:String = "era completed";
		
		public var era:String;
		
		public function DisplayMessageEvent(type:String, era:String=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.era = era;
		}
		
		public override function clone():Event
		{
			return new DisplayMessageEvent(type, era, bubbles, cancelable);
		}
	}
}