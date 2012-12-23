package  
{
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	
	import org.flixel.*;
	 
	public class MainMenu extends FlxState
	{
		[Embed(source = "../assets/Necronbar 60.mp3")] private var BG_MUSIC:Class;
		
		public function MainMenu() 
		{
			FlxG.mouse.show();
			
		}
		
		override public function create():void
		{
			//FlxG.playMusic(BG_MUSIC, 1);
			//FlxG.bgColor = 0x00FFFF;
			super.create();
		}
	}

}