package com.criticalfusion.thenandnow.model
{
	public class EraModel
	{
		public static const LATE_1880:String = "Era1";
		public static const EARLY_1900:String = "Era2";
		public static const MID_1900:String = "Era3";
		public static const PRESENT_DAY:String = "Era4";
		public static const ERA1_MAX_SCORE:uint = 11;
		public static const ERA2_MAX_SCORE:uint = 6;
		public static const ERA3_MAX_SCORE:uint = 10;
		public static const ERA4_MAX_SCORE:uint = 8;
		public var completedList:Array;
		
		protected static var _instance:EraModel;
		
		protected var current_era:String = EraModel.LATE_1880;
		
		public function EraModel(singletonEnforcer:SingletonEnforcer) { initialize(); }
		
		public static function getInstance():EraModel 
		{
			if(EraModel._instance == null) EraModel._instance = new EraModel(new SingletonEnforcer());
			return EraModel._instance;
		}
		
		final public function set currentEra(value:String):void
		{
			this.current_era = value;
		}
		
		final public function get currentEra():String
		{
			return this.current_era;
		}
		
		final public function get eraList():Array
		{
			return [EraModel.LATE_1880, EraModel.EARLY_1900, EraModel.MID_1900, EraModel.PRESENT_DAY];
		}
		
		final public function eraCompleted(value:String):void
		{
			completedList.push(value);
		}
		
		final public function isCompleted(value:String):Boolean
		{
			var completed:Boolean = false;
			for each(var era:String in completedList)
			{
				if(era == value)
				{
					completed = true;
					break;
				}
			}
			return completed;
		}
		
		final public function reset():void
		{
			this.currentEra = EraModel.LATE_1880;
			completedList = [];
		}
		
		final protected function initialize():void
		{
			completedList = [];
		}
	}
}
class SingletonEnforcer{}