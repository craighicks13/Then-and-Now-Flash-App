package com.criticalfusion.thenandnow.model
{
	public class ScoreModel
	{
		public static var INCORRECT:int = 0;
		public static var MADE:int = 0;
		public static var REMAINING:int = 0;
		
		public function ScoreModel() {	}
		
		final public function resetMade():void
		{
			ScoreModel.MADE = 0;
		}
		
		final public function resetRemaining():void
		{
			ScoreModel.REMAINING = 0;
		}
		
		final public function resetIncorrect():void
		{
			ScoreModel.INCORRECT = 0;
		}
		
		final public function addIncorrect():void
		{
			ScoreModel.INCORRECT++;
		}
		
		final public function addCorrect():void
		{
			ScoreModel.MADE++;
			ScoreModel.REMAINING--;
		}
		
		final public function setRemaining(value:int):void
		{
			ScoreModel.REMAINING = value;
		}
		
		final public function setMade(value:int):void
		{
			ScoreModel.MADE = value;
		}
	}
}