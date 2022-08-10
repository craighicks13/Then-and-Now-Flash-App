package com.criticalfusion.thenandnow.event
{
	import flash.events.Event;
	
	public class DisplayItemEvent extends Event
	{
		public static const DISPLAY_ITEM:String = "display item";
		public var name:String;
		
		public function DisplayItemEvent(type:String, name:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.name = name;
		}
		
		public override function clone():Event
		{
			return new DisplayItemEvent(type, name, bubbles, cancelable);
		}
	}
}