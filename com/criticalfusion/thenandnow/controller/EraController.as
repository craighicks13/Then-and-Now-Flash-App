package com.criticalfusion.thenandnow.controller
{
	import com.criticalfusion.thenandnow.event.DisplayItemEvent;
	import com.criticalfusion.thenandnow.event.DisplayMessageEvent;
	import com.criticalfusion.thenandnow.model.EraModel;
	import com.criticalfusion.thenandnow.model.IconList;
	import com.criticalfusion.thenandnow.view.Icon;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	public class EraController extends EventDispatcher
	{
		protected static var _instance:EraController;
		protected var era:EraModel;
		protected var score:ScoreController;
		protected var iconlist:IconList;

		public function EraController(singletonEnforcer:SingletonEnforcer) { initialize(); }
		
		public static function getInstance():EraController 
		{
			if(EraController._instance == null) EraController._instance = new EraController(new SingletonEnforcer());
			return EraController._instance;
		}
		
		final public function setCurrentEra(value:String):Boolean
		{
			era.currentEra = value;
			if(era.isCompleted(value))
			{
				score.showCompleted(this.getEraMax());
				return true;
			}
			else
			{
				invalitadeEra();
				return false;
			}
		}
		
		final public function reset():void
		{
			era.reset();
			score.reset();
			invalitadeEra();
		}
		
		final public function getCurrentEra():String
		{
			return era.currentEra;
		}
		
		final public function addToLand(value:Icon):void
		{
			var name:String = getQualifiedClassName(value).split("::")[1];
			var icon_era:String = name.split("_")[0];
			
			if(icon_era == era.currentEra)
			{
				if(value.needParent)
				{
					if(!Icon(iconlist.getIcon(value.needParent)).selected)
					{
						dispatchEvent(new DisplayMessageEvent(DisplayMessageEvent.UPGRADE_BARN));
						return;
					}
				}
				
				if(!value.selected)
				{
					value.selected = true;
					score.correctChoice();
				}
				dispatchEvent(new DisplayItemEvent(DisplayItemEvent.DISPLAY_ITEM, name));
			}
			else
			{
				score.increaseIncorrect();
				dispatchEvent(new DisplayMessageEvent(DisplayMessageEvent.INCORRECT_ERA));
			}
		}		
		
		final public function checkEraCompletion():void
		{
			if(score.getRemaining() == 0)
			{
				var current:String = era.currentEra;
				for(var i:int = 0; i < 3; i++)
				{
					if(current == era.eraList[i])
					{
						era.currentEra = era.eraList[i + 1];
						break;
					}
				}
				era.eraCompleted(current);
				dispatchEvent(new DisplayMessageEvent(DisplayMessageEvent.ERA_COMPLETED, current));
			}
		}
		
		final public function invalitadeEra():void
		{
			score.initRemaining(this.getEraMax());
		}
		
		final protected function getEraMax():int
		{
			var max:int = 0;
			switch(era.currentEra)
			{
				case EraModel.LATE_1880:
					max = EraModel.ERA1_MAX_SCORE;
					break;
				case EraModel.EARLY_1900:
					max = EraModel.ERA2_MAX_SCORE;
					break;
				case EraModel.MID_1900:
					max = EraModel.ERA3_MAX_SCORE;
					break;
				case EraModel.PRESENT_DAY:
					max = EraModel.ERA4_MAX_SCORE;
					break;
			}
			return max;
		}
		
		final protected function initialize():void
		{
			era = EraModel.getInstance();
			score = ScoreController.getInstance();
			score.initRemaining(this.getEraMax());
			iconlist = IconList.getInstance();
		}
	}
}

class SingletonEnforcer{}