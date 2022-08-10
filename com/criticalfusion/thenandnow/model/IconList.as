package com.criticalfusion.thenandnow.model
{
	import com.criticalfusion.thenandnow.view.Icon;
	import com.criticalfusion.thenandnow.view.icons.Era1_01;
	import com.criticalfusion.thenandnow.view.icons.Era1_02;
	import com.criticalfusion.thenandnow.view.icons.Era1_03;
	import com.criticalfusion.thenandnow.view.icons.Era1_04;
	import com.criticalfusion.thenandnow.view.icons.Era1_05;
	import com.criticalfusion.thenandnow.view.icons.Era1_06;
	import com.criticalfusion.thenandnow.view.icons.Era1_07;
	import com.criticalfusion.thenandnow.view.icons.Era1_08;
	import com.criticalfusion.thenandnow.view.icons.Era1_09;
	import com.criticalfusion.thenandnow.view.icons.Era1_10;
	import com.criticalfusion.thenandnow.view.icons.Era1_11;
	import com.criticalfusion.thenandnow.view.icons.Era2_02;
	import com.criticalfusion.thenandnow.view.icons.Era2_03;
	import com.criticalfusion.thenandnow.view.icons.Era2_04;
	import com.criticalfusion.thenandnow.view.icons.Era2_06;
	import com.criticalfusion.thenandnow.view.icons.Era2_08;
	import com.criticalfusion.thenandnow.view.icons.Era2_10;
	import com.criticalfusion.thenandnow.view.icons.Era3_01;
	import com.criticalfusion.thenandnow.view.icons.Era3_02;
	import com.criticalfusion.thenandnow.view.icons.Era3_03;
	import com.criticalfusion.thenandnow.view.icons.Era3_04;
	import com.criticalfusion.thenandnow.view.icons.Era3_05;
	import com.criticalfusion.thenandnow.view.icons.Era3_06;
	import com.criticalfusion.thenandnow.view.icons.Era3_08;
	import com.criticalfusion.thenandnow.view.icons.Era3_09;
	import com.criticalfusion.thenandnow.view.icons.Era3_10;
	import com.criticalfusion.thenandnow.view.icons.Era3_11;
	import com.criticalfusion.thenandnow.view.icons.Era4_01;
	import com.criticalfusion.thenandnow.view.icons.Era4_03;
	import com.criticalfusion.thenandnow.view.icons.Era4_04;
	import com.criticalfusion.thenandnow.view.icons.Era4_06;
	import com.criticalfusion.thenandnow.view.icons.Era4_09;
	import com.criticalfusion.thenandnow.view.icons.Era4_10;
	import com.criticalfusion.thenandnow.view.icons.Era4_11;
	import com.criticalfusion.thenandnow.view.icons.Era4_12;
	
	import flash.utils.getQualifiedClassName;

	public class IconList
	{
		public var list:Vector.<Icon> = new Vector.<Icon>();
		protected static var _instance:IconList;
		
		public function IconList(singletonEnforcer:SingletonEnforcer) { initialize(); }
		
		public static function getInstance():IconList 
		{
			if(IconList._instance == null) IconList._instance = new IconList(new SingletonEnforcer());
			return IconList._instance;
		}
		
		final public function invalidateIcons():void
		{
			var num:uint = list.length;
			while (num-- > 0)
			{
				list[num].selected = false;
			}
		}
		
		final public function getIcon(value:String):Icon
		{
			var num:uint = list.length;
			while (num-- > 0)
			{
				if(getQualifiedClassName(list[num]).split("::")[1] == value)
					return list[num];
			}
			return null;
		}
		
		final protected function shuffle( vect:Object ):void
		{
			var totalItems : uint = vect.length;
			for (var i : uint = 0; i < totalItems; i++)
				swap( vect, i, i + uint( Math.random() * (totalItems - i) ) );
		}
		
		final protected function swap( vect:Object, a:uint, b:uint ):void
		{
			var temp:Object = vect[a];
			vect[a] = vect[b];
			vect[b] = temp;
		}
		
		final protected function initialize():void
		{
			list.push(
				new Era1_01(),
				new Era1_02(),
				new Era1_03(),
				new Era1_04(),
				new Era1_05(),
				new Era1_06(),
				new Era1_07(),
				new Era1_08(),
				new Era1_09(),
				new Era1_10(),
				new Era1_11(),
				new Era2_02(),
				new Era2_03(),
				new Era2_04(),
				new Era2_06(),
				new Era2_08(),
				new Era2_10(),
				new Era3_01(),
				new Era3_02(),
				new Era3_03(),
				new Era3_04(),
				new Era3_05(),
				new Era3_06(),
				new Era3_08(),
				new Era3_09(),
				new Era3_10(),
				new Era3_11(),
				new Era4_01(),
				new Era4_03(),
				new Era4_04(),
				new Era4_06(),
				new Era4_09(),
				new Era4_10(),
				new Era4_11(),
				new Era4_12()
				);
			
			shuffle( list );
		}
	}
}
class SingletonEnforcer{}