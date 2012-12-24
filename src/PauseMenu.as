package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class PauseMenu extends FlxSubState 
	{
		public static const RESUME_GAME:String = "PauseMenu::resume_game";
		public static const QUIT_GAME:String = "PauseMenu::quit_game";
		
		public function PauseMenu() 
		{
			super(true, 0x88000000, true);
		}
		
		override public function create():void 
		{
			var currentY:Number = 50;
			
			var text:FlxText = new FlxText(0, currentY, FlxG.width, "PAUSED");
			text.setFormat(null, 24, 0xFFFFFF00, null, 0xFFCCCCCC);
			this.add(text);
			currentY += text.height + 20;
			
			
			var resumeBtn:FlxButton = new FlxButton(0, currentY + 70, "Resume game", resume);
			resumeBtn.x = (FlxG.width / 2) - (resumeBtn.width / 2);
			this.add(resumeBtn);
			currentY += resumeBtn.height + 5;
			
			var quitBtn:FlxButton = new FlxButton(0, currentY + 70, "Quit game", tryQuit);
			quitBtn.x = (FlxG.width / 2) - (quitBtn.width / 2);
			this.add(quitBtn);
			currentY += quitBtn.height + 5;
			
		}
		
		
		private function resume():void
		{
			this.close(RESUME_GAME);
		}
		
		private function tryQuit():void
		{
			this.close(QUIT_GAME);
		}
		

	}

}