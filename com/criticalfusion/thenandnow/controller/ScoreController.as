package com.criticalfusion.thenandnow.controller
{
	import com.criticalfusion.thenandnow.event.ScoresEvent;
	import com.criticalfusion.thenandnow.model.ScoreModel;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ScoreController extends EventDispatcher
	{
		public var scores:ScoreModel;
		protected static var _instance:ScoreController;
		public function ScoreController(singletonEnforcer:SingletonEnforcer) { initialize(); }
		
		public static function getInstance():ScoreController 
		{
			if(ScoreController._instance == null) ScoreController._instance = new ScoreController(new SingletonEnforcer());
			return ScoreController._instance;
		}
		
		final public function reset():void
		{
			scores.resetMade();
			scores.resetIncorrect();
			scores.resetRemaining();
			dispatchEvent(new ScoresEvent(ScoresEvent.UPDATE_SCORES, ScoreModel.INCORRECT, ScoreModel.MADE, ScoreModel.REMAINING));
		}
		
		final public function initRemaining(value:int):void
		{
			scores.setRemaining(value);
			scores.resetMade();
			dispatchEvent(new ScoresEvent(ScoresEvent.UPDATE_SCORES, ScoreModel.INCORRECT, ScoreModel.MADE, ScoreModel.REMAINING));
		}
		
		final public function showCompleted(value:int):void
		{
			scores.setMade(value);
			scores.resetRemaining();
			dispatchEvent(new ScoresEvent(ScoresEvent.UPDATE_SCORES, ScoreModel.INCORRECT, ScoreModel.MADE, ScoreModel.REMAINING));
		}
		
		final public function setRemaining(value:int):void
		{
			scores.setRemaining(value);
		}
		
		final public function getRemaining():int
		{
			return ScoreModel.REMAINING;
		}
		
		final public function getCurrentScore():int
		{
			return ScoreModel.MADE;
		}
		
		final public function getScores():void
		{
			dispatchEvent(new ScoresEvent(ScoresEvent.UPDATE_SCORES, ScoreModel.INCORRECT, ScoreModel.MADE, ScoreModel.REMAINING));
		}
		
		final public function correctChoice():void
		{
			scores.addCorrect();
			dispatchEvent(new ScoresEvent(ScoresEvent.UPDATE_SCORES, ScoreModel.INCORRECT, ScoreModel.MADE, ScoreModel.REMAINING));
		}
		
		final public function increaseIncorrect():void
		{
			scores.addIncorrect();
			dispatchEvent(new ScoresEvent(ScoresEvent.UPDATE_SCORES, ScoreModel.INCORRECT, ScoreModel.MADE, ScoreModel.REMAINING));
		}
		
		final protected function initialize():void
		{
			scores = new ScoreModel();
		}
	}
}
class SingletonEnforcer{}