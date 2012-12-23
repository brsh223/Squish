package  
{
	import org.flixel.*;
	import Enemy;
	import Level1;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class PlayState1 extends SquishPlayState 
	{
		private var level:Level1;
		private var enemy:Enemy;
		private var friendly:Friendly;
		
		public function PlayState1() 
		{
			
		}
		
		override public function create():void 
		{
			
			level = new Level1;
			player = new Player(2, 16);
			enemy = new Enemy(4, 16);
			friendly = new Friendly(4, 16);
			
			
			add(level);
			add(player);
			add(friendly);
			//add(enemy);

			FlxG.worldBounds = new FlxRect(0, 0, level.width, level.height);
			FlxG.camera.setBounds(0, 0, level.width, level.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
		}
		
		override public function update():void 
		{
			super.update();			
			FlxG.collide(player, level);
			FlxG.collide(enemy, level);
			//FlxG.overlap(player, enemy, hitEnemy);
			FlxG.overlap(player, friendly, talk);
		}
		
		private function talk(player:FlxObject, friendly:FlxObject):void
		{
			if (FlxG.keys.justPressed("UP"))
			{
				add (new FlxText(friendly.x, friendly.y - 16, 100, "This is the default text!"));
			}
		}
	}

}