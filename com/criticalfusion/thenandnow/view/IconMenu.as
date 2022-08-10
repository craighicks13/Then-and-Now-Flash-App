package com.criticalfusion.thenandnow.view
{
	import com.criticalfusion.thenandnow.controller.EraController;
	import com.criticalfusion.thenandnow.event.DisplayMessageEvent;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import flash.display.Sprite;
	
	public class IconMenu extends Sprite
	{
		protected var nav_mask:Sprite;
		protected var icon_container:Sprite;
		protected var era_controller:EraController;
		
		public var info_box:IconInfoBox;
		
		protected var destination:int;
		protected var min_distance:int;
		
		public function IconMenu()
		{
			super();
			this.cacheAsBitmap = true;
			initialize();
		}
		
		final public function buildMenu(list:Vector.<Icon>):void
		{
			var num:int = list.length;
			var icon:Icon;
			for(var i:int = 0; i < num; i++)
			{
				icon = list[i];
				icon.x = 35 + (74 * i);
				icon.y = 30;
				icon.onClick = showInfoBox;
				icon_container.addChild(icon);
				
				if(i < 7)
				{
					icon.alpha = 0;
					TweenMax.to(icon, .5, {y:30, alpha:1, startAt:{y:100, alpha:0}, delay:.1*i});
				}
			}
			
			icon_container.mask = nav_mask;
			min_distance = nav_mask.width - icon_container.width - 5;
		}
		
		final public function moveForward():void
		{
			removeInfoBox();
			destination -= 74;
			if(destination < min_distance)
				destination = min_distance;
			TweenMax.to(icon_container, .3, {x:destination, ease:Sine.easeOut});
		}
		
		final public function moveBackward():void
		{
			removeInfoBox();
			destination += 74;
			if(destination > 0)
				destination = 0;
			TweenMax.to(icon_container, .3, {x:destination, ease:Sine.easeOut});
		}
		
		final public function lock():void
		{
			removeInfoBox();
			this.mouseEnabled = this.mouseChildren = false;
		}
		
		final public function unlock():void
		{
			this.mouseEnabled = this.mouseChildren = true;
		}
		
		final public function removeInfoBox():void
		{
			if(!info_box) return;
			removeChild(info_box);
			info_box = null;
		}
		
		final public function addToLand(value:Icon):void
		{
			era_controller.addToLand(value);
		}
		
		final protected function showInfoBox(value:Icon):void
		{
			removeInfoBox();
			info_box = new IconInfoBox();
			info_box.icon = value;
			info_box.x = destination + value.x;
			info_box.alpha = 0;
			info_box.onClose = removeInfoBox;
			info_box.onAddToLand = addToLand;
			addChild(info_box);
			
			TweenMax.to(info_box, .2, {y:10, alpha:1});
		}
		
		final protected function onUpgradeBarn(event:DisplayMessageEvent):void
		{
			info_box.showUpgrade();
		}
		
		final protected function onIncorrectEra(event:DisplayMessageEvent):void
		{
			info_box.showIncorrect();
		}
		
		final protected function initialize():void 
		{
			nav_mask = new Sprite();
			nav_mask.graphics.beginFill(0xFF0000, 0);
			nav_mask.graphics.drawRect(0, 0, 515, 60);
			addChild(nav_mask);
			
			icon_container = new Sprite();
			addChild(icon_container);
			
			era_controller = EraController.getInstance();
			era_controller.addEventListener(DisplayMessageEvent.INCORRECT_ERA, onIncorrectEra, false, 0, true);
			era_controller.addEventListener(DisplayMessageEvent.UPGRADE_BARN, onUpgradeBarn, false, 0, true);
		}
	}
}