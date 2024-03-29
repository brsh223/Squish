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
			if (FlxG.keys.justPressed("ESCAPE") || FlxG.keys.justPressed("P"))
			{
				this.setSubState(new PauseMenu(), onMenuClosed);
			}
			
			if (FlxG.keys.justPressed("I"))
			{
				this.setSubState(new Inventory());
			}
			super.update();		
		}
		
		protected function onMenuClosed(state:FlxSubState, result:String):void
		{
			if (result == PauseMenu.QUIT_GAME)
			{
				//Exit to main menu
				FlxG.fade(0xff000000, 1.5, quit);
			}
		}
		
		protected function quit():void
		{
			FlxG.switchState(new MainMenu());
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