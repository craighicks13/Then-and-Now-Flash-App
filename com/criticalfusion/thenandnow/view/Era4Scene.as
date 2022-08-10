package com.criticalfusion.thenandnow.view
{
	import flash.display.Sprite;

	public class Era4Scene extends EraScene
	{
		public var Era1_07p:Sprite;
		
		public var Era2_03p:Sprite;
		public var Era2_06p:Sprite;
		
		public var Era3_01p:Sprite;
		public var Era3_02p:Sprite;
		public var Era3_03p:Sprite;
		public var Era3_04p:Sprite;
		public var Era3_05p:Sprite;
		public var Era3_06p:Sprite;
		public var Era3_08p:Sprite;
		public var Era3_09p:Sprite;
		public var Era3_10p:Sprite;
		public var Era3_11p:Sprite;
		public var Era3_13p:Sprite;
		
		public var Era4_01p:Sprite;
		public var Era4_03p:Sprite;
		public var Era4_04p:Sprite;
		public var Era4_06p:Sprite;
		public var Era4_09p:Sprite;
		public var Era4_10p:Sprite;
		public var Era4_11p:Sprite;
		public var Era4_12p:Sprite;
		
		public function Era4Scene()
		{
			super();
			initialize();
		}
		
		final override public function showCompleted():void
		{
			Era4_01p.visible = true;
			Era4_03p.visible = true;
			Era4_04p.visible = true;
			Era4_06p.visible = true;
			Era4_09p.visible = true;
			Era4_10p.visible = true;
			Era4_11p.visible = true;
			Era4_12p.visible = true;
			
			Era3_01p.visible = false;
			Era3_03p.visible = false;
			Era3_04p.visible = false;
			Era3_05p.visible = false;
			Era2_06p.visible = false;
			Era3_06p.visible = false;
			Era1_07p.visible = false;
			Era3_09p.visible = false;
			Era3_10p.visible = false;
			Era3_11p.visible = false;
		}
		
		final override public function checklist(value:String):void
		{
			switch(value)
			{
				case "Era4_01p":
					hideItem("Era3_01p");
					break;
				case "Era4_03p":
					hideItem("Era3_03p");
					break;
				case "Era4_06p":
					hideItem("Era3_05p");
					hideItem("Era2_06p");
					hideItem("Era3_06p");
					hideItem("Era1_07p");
					break;
				case "Era4_09p":
					hideItem("Era3_09p");
					break;
				case "Era4_10p":
					hideItem("Era3_10p");
					break;
				case "Era4_11p":
					hideItem("Era3_11p");
					break;
			}
		}
		
		final protected function initialize():void
		{
			Era4_01p.visible = false;
			Era4_03p.visible = false;
			Era4_04p.visible = false;
			Era4_06p.visible = false;
			Era4_09p.visible = false;
			Era4_10p.visible = false;
			Era4_11p.visible = false;
			Era4_12p.visible = false;
		}
	}
}