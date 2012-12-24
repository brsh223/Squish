package  
{
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	 
	public class MainMenu extends FlxState
	{
		[Embed(source = "../assets/Necronbar 60.mp3")] private var BG_MUSIC:Class;
		[Embed(source = "../assets/Button.png")] private var button:Class;
		private var on:FlxSprite;
		[Embed(source = "../assets/Button.png")] private var button2:Class;
		private var off:FlxSprite;
		
		
		
		private var start_game_button:FlxButtonPlus;
		
		public function MainMenu() 
		{
			FlxG.mouse.show();						
		}
		
		override public function create():void
		{
			super.create();

			FlxG.bgColor = 0x66ffcc;
			
			start_game_button = new FlxButtonPlus(FlxG.width / 2 - 50, FlxG.height / 2 + 30, startGame, null, "");
			add(start_game_button);
			//FlxG.playMusic(BG_MUSIC, 1);
		}
		
		private function startGame():void
		{
			FlxG.switchState(new PlayState1);
		}
	}

}