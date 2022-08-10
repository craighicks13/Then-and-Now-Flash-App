package com.criticalfusion.thenandnow.view
{
	import flash.display.Sprite;
	
	public class Era1Scene extends EraScene
	{
		public var Era1_01p:Sprite;
		public var Era1_02p:Sprite;
		public var Era1_03p:Sprite;
		public var Era1_04p:Sprite;
		public var Era1_05p:Sprite;
		public var Era1_06p:Sprite;
		public var Era1_07p:Sprite;
		public var Era1_08p:Sprite;
		public var Era1_09p:Sprite;
		public var Era1_10p:Sprite;
		public var Era1_11p:Sprite;
		
		public function Era1Scene()
		{
			super();
			initialize();
		}
		
		override public function showCompleted():void
		{
			Era1_01p.visible = true;
			Era1_02p.visible = true;
			Era1_03p.visible = true;
			Era1_04p.visible = true;
			Era1_05p.visible = true;
			Era1_06p.visible = true;
			Era1_07p.visible = true;
			Era1_08p.visible = true;
			Era1_09p.visible = true;
			Era1_10p.visible = true;
			Era1_11p.visible = true;
		}
		
		final protected function initialize():void
		{
			Era1_01p.visible = false;
			Era1_02p.visible = false;
			Era1_03p.visible = false;
			Era1_04p.visible = false;
			Era1_05p.visible = false;
			Era1_06p.visible = false;
			Era1_07p.visible = false;
			Era1_08p.visible = false;
			Era1_09p.visible = false;
			Era1_10p.visible = false;
			Era1_11p.visible = false;
		}
	}
}