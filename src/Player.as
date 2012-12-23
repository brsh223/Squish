package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	import com.greensock.easing.Linear;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class Player extends FlxSprite 
	{
		[Embed(source = "../assets/SquishTileSet.png")] private var playerPNG:Class;
		
		private var start:FlxPoint;
		
		public function Player(x:Number, y:Number) 
		{
			super(x * 16, y * 16);
			
			start = new FlxPoint (x * 16, y * 16);
			
			loadGraphic(playerPNG, true, true, 16, 16, true);
			width = 16;
			height = 16;
			
			addAnimation("idle", [1], 1, false);
			addAnimation("walk", [1, 3], 6, true);
			addAnimation("jump", [2], 0, false);
			
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			FlxControl.player1.setCursorControl(false, false, true, true);
			
			FlxControl.player1.setJumpButton("SPACE", FlxControlHandler.KEYMODE_PRESSED, 200, FlxObject.FLOOR, 250, 200);
			
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			
			FlxControl.player1.setGravity(0, 400);
			
			facing = FlxObject.RIGHT;
		}
		
		
		public function restart():void
		{
			reset(start.x, start.y);
		}
		
		override public function update():void
		{
			super.update();
			
			if (x < 0)
			{
				x = 0;
			}
			
			if (touching == FlxObject.FLOOR)
			{
				if (velocity.x != 0)
				{
					play("walk");
				}
				else
				{
					play("idle");
				}
			}
			
			else if (velocity.y < 0)
			{
				play("jump");
			}
		}
	}

}