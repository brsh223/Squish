package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class Inventory extends FlxSubState 
	{
		public static const RESUME_GAME:String = "PauseMenu::resume_game";
		public static const QUIT_GAME:String = "PauseMenu::quit_game";
		
		public function Inventory() 
		{
			super(true, 0x88000000, true);
		}
		
		override public function create():void 
		{
			var text:FlxText = new FlxText(FlxG.width / 2 - (90), 150, FlxG.width, "INVENTORY");
			text.setFormat(null, 24, 0xFFFFFF00, null, 0xFFCCCCCC);
			this.add(text);
			
			var backBtn:FlxButton = new FlxButton(0, 200, "Back", resume);
			backBtn.x = (FlxG.width / 2) - (backBtn.width / 2);
			this.add(backBtn);
		}
		
		private function resume():void
		{
			this.close(RESUME_GAME);
		}
	}

}