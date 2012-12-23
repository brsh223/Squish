package  
{
	import org.flixel.*;
	import org.flixel.system.FlxTile;
	
	/**
	 * ...
	 * @author Brandon Sharp
	 */
	public class Level1 extends FlxGroup 
	{
		[Embed(source = "../assets/CSV Files/mapCSV_LevelDemo_Map.csv", mimeType = "application/octet-stream")] public var mapCSV:Class;
		[Embed(source = "../assets/CSV Files/mapCSV_LevelDemo_Sky.csv", mimeType = "application/octet-stream")] public var skyCSV:Class;
		
		[Embed(source = "../assets/SkyTiles.png")] public var skyTilesPNG:Class;
		[Embed(source = "../assets/DirtTileSet.png")] public var mapTilesPNG:Class;
		
		public var map:FlxTilemap;
		public var sky:FlxTilemap;
		
		public var height:int;
		public var width:int;
		
		public function Level1() 
		{
			super();
			
			map = new FlxTilemap;
			map.loadMap(new mapCSV, mapTilesPNG, 16, 16, 0, 0, 1, 1);
			
			Registry.map = map;
			
			sky = new FlxTilemap;
			sky.loadMap(new skyCSV, skyTilesPNG, 16, 16, 0, 0, 1, 2);
			
			width = map.width;
			height = map.height;
			
			add(map);
			add(sky);
		}
		
	}

}