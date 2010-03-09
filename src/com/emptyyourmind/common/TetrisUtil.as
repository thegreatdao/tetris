package com.emptyyourmind.common
{
	import com.emptyyourmind.component.ITetris;
	import com.emptyyourmind.component.TetrisConst;
	import com.emptyyourmind.component.base.TetrisUnit;
	import com.emptyyourmind.component.baseshape.LStick;
	import com.emptyyourmind.component.baseshape.NStick;
	import com.emptyyourmind.component.baseshape.Rectangular;
	import com.emptyyourmind.component.baseshape.Stick;
	import com.emptyyourmind.component.baseshape.TStick;
	
	import mx.core.UIComponent;
	
	public class TetrisUtil
	{
		public static const LSTICK:int = 0;
		public static const NSTICK:int = 1;
		public static const RECTANGULAR:int = 2;
		public static const STICK:int = 3;
		public static const TSTICK:int = 4;
		
		public static function getElement():ITetris
		{
			var itetris:ITetris;
			var whichElement:int = Math.round(Math.random() * 10) % 5;
			if(whichElement == LSTICK)
			{
				itetris = new LStick;	
			}
			else if(whichElement == NSTICK)
			{
				itetris = new NStick();
			}
			else if(whichElement == RECTANGULAR)
			{
				itetris = new Rectangular();
			}
			else if(whichElement == STICK)
			{
				itetris = new Stick();
			}
			else
			{
				itetris = new TStick();
			}
			return itetris;
		}
		
		public static function verticalFill(uiComponent:UIComponent):void
		{
			for(var i:int=0; i<3; i++)
			{
				for(var j:int=0; j<2; j++)
				{
					var tetrisUnit:TetrisUnit = new TetrisUnit();
					tetrisUnit.x = TetrisConst.UNIT_OF_MOVEMENT * j;
					tetrisUnit.y = TetrisConst.UNIT_OF_MOVEMENT * i;						
					uiComponent.addChild(tetrisUnit);
				}	
			}				
		}
		
		public static function horizontalFill(uiComponent:UIComponent):void
		{
			for(var i:int=0; i<2; i++)
			{
				for(var j:int=0; j<3; j++)
				{
					var tetrisUnit:TetrisUnit = new TetrisUnit();
					tetrisUnit.x = TetrisConst.UNIT_OF_MOVEMENT * j;
					tetrisUnit.y = TetrisConst.UNIT_OF_MOVEMENT * i;
					uiComponent.addChild(tetrisUnit);
				}
			}
		}
		
		public static function swapDimension(uiComponent:UIComponent):void
		{
			var i:int = uiComponent.width;
			uiComponent.width = uiComponent.height;
			uiComponent.height = i;
		}
		
		public static function moveLeft(uiComponent:UIComponent):void
		{
			if(uiComponent.x != 0)
			{				
				uiComponent.x = uiComponent.x - 25;
			}
		}
		
		public static function moveRight(uiComponent:UIComponent):void
		{
			if(uiComponent.x < 250 - uiComponent.width)
			{
				uiComponent.x = uiComponent.x + 25;
			}
		}
		
		public static function moveDown(uiComponent:UIComponent):void
		{
			if(uiComponent.y < 500 - uiComponent.height)					
			{
				uiComponent.y = uiComponent.y + 25;
			}
		}

	}
}