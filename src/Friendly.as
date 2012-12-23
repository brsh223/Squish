package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class Friendly extends FlxSprite 
	{
		[Embed(source = "../assets/default_enemy.png")] private var friendlyPNG:Class;
		
		private var text:FlxText;
		
		public function Friendly(x:Number, y:Number) 
		{
			super(x * 16, y * 16);
			
			text = new FlxText(this.x, this.y - 16, 100, "This is the default text!");
			loadGraphic(friendlyPNG, false, false, 16, 16, false);
			width = 16;
			height = 16;
		}
		
	}

}