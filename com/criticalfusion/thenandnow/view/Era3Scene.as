package com.criticalfusion.thenandnow.view
{
	import flash.display.Sprite;

	public class Era3Scene extends EraScene
	{
		public var Era1_01p:Sprite;
		public var Era1_03p:Sprite;
		public var Era1_05p:Sprite;
		public var Era1_06p:Sprite;
		public var Era1_07p:Sprite;
		public var Era1_08p:Sprite;
		public var Era1_09p:Sprite;
		public var Era1_10p:Sprite;
		public var Era1_11p:Sprite;
		public var Era1_Road:Sprite;
		
		public var Era2_02p:Sprite;
		public var Era2_03p:Sprite;
		public var Era2_04p:Sprite;
		public var Era2_06p:Sprite;
		public var Era2_08p:Sprite;
		public var Era2_10p:Sprite;
		
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
		
		public function Era3Scene()
		{
			super();
			initialize();
		}
		
		final override public function showCompleted():void
		{
			Era3_01p.visible = true;
			Era3_02p.visible = true;
			Era3_03p.visible = true;
			Era3_04p.visible = true;
			Era3_05p.visible = true;
			Era3_06p.visible = true;
			Era3_08p.visible = true;
			Era3_09p.visible = true;
			Era3_10p.visible = true;
			Era3_11p.visible = true;
			Era3_13p.visible = true;
			
			Era1_Road.visible = false;
			Era1_01p.visible = false;
			Era2_02p.visible = false;
			Era1_03p.visible = false;
			Era1_05p.visible = false;
			Era1_06p.visible = false;
			Era1_08p.visible = false;
			Era1_07p.x = 126;
			Era1_07p.y = -217;
			Era2_04p.visible = false;
			Era2_08p.visible = false;
			Era1_09p.visible = false;
			Era1_10p.visible = false;
			Era2_10p.visible = false;
			Era1_11p.visible = false;
		}
		
		final override public function checklist(value:String):void
		{
			switch(value)
			{
				case "Era3_01p":
					hideItem("Era1_01p");
					hideItem("Era1_05p");
					break;
				case "Era3_02p":
					hideItem("Era2_02p");
					break;
				case "Era3_03p":
					hideItem("Era1_03p");
					break;
				case "Era3_06p":
					hideItem("Era1_06p");
					Era1_07p.x = 126;
					Era1_07p.y = -217;
					break;
				case "Era3_04p":
					hideItem("Era2_04p");
					break;
				case "Era3_08p":
					hideItem("Era1_08p");
					hideItem("Era2_08p");
					break;
				case "Era3_09p":
					hideItem("Era1_09p");
					break;
				case "Era3_10p":
					hideItem("Era1_10p");
					hideItem("Era2_10p");
					break;
				case "Era3_11p":
					hideItem("Era1_11p");
					break;
			}
		}
		
		final protected function initialize():void
		{
			Era3_01p.visible = false;
			Era3_02p.visible = false;
			Era3_03p.visible = false;
			Era3_04p.visible = false;
			Era3_05p.visible = false;
			Era3_06p.visible = false;
			Era3_08p.visible = false;
			Era3_09p.visible = false;
			Era3_10p.visible = false;
			Era3_11p.visible = false;
			Era3_13p.visible = false;
			
			showItem("Era3_13p");
			hideItem("Era1_Road");
		}
	}
}