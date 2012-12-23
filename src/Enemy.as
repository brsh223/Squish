package  
{
	import org.flixel.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.easing.Linear;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class Enemy extends FlxSprite 
	{
		[Embed(source = "../assets/default_enemy.png")] private var enemyPNG:Class;
		public var isDying:Boolean = false;
		
		private var prevPos:FlxPoint;
		private var currPos:FlxPoint;
		
		public function Enemy(x:int, y:int) 
		{
			super(x * 16, y * 16);
			currPos = new FlxPoint(x * 16, y * 16);
			
			loadGraphic(enemyPNG, false, true, 16, 16);
			
			facing = FlxObject.RIGHT; 
			
			acceleration.y = 70;
			velocity.x = 30;
		}
		
		override public function kill():void 
		{
			isDying = true;
			
			velocity.x = 0;
			velocity.y = 0;
			
			angle = 180;
			
			TweenMax.to(this, 1.5, { bezier: [ { x:"64", y:"-64" }, { x:"80", y:"200" } ], onComplete: removeSprite } );
		}
		
		private function removeSprite():void
		{
			exists = false;
		}
		
		override public function update():void 
		{
			super.update();
			
			
			var tx:int = int(x / 16);
			var ty:int = int(y / 16);
			
			if (Registry.map.getTile(tx - 1, ty) >= 1)
			{
				turnAround();
				return;
			}
			if (Registry.map.getTile(tx + 2, ty) >= 1)
			{
				turnAround();
				return;
			}
			
			if (isTouching(FlxObject.FLOOR) == false && isDying == false)
			{
				turnAround();
			}
			
			
		}
		
		private function turnAround():void
		{
			if (facing == FlxObject.RIGHT)
			{
				facing = FlxObject.LEFT;
				
				velocity.x = -30;
			}
			else if (facing == FlxObject.LEFT)
			{
				facing = FlxObject.RIGHT;
				
				velocity.x = 30;
			}
		}
	}

}