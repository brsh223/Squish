package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class SquishPlayState extends FlxState 
	{
		protected var player:Player;
		
		public function SquishPlayState() 
		{
			
		}
		
		override public function create():void 
		{
			super.create();
		}
		
		override public function update():void 
		{
			super.update();		
		}
		
		protected function hitEnemy(player:FlxObject, enemy:FlxObject):void
		{
			if (Enemy(enemy).isDying)
			{
				return;
			}
			
			if (player.y < enemy.y)
			{
				enemy.kill();
			}
			else {
				Player(player).restart();
			}
		}
		
	}

}