package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assests
	{
		 
		
		
		[Embed(source="/../media/loading.png")]
		public static const Background:Class;
		
		
		[Embed(source="../media/loading.png")]
		public static const Loading:Class;
		
		
		
		[Embed(source="../media/LetterFieldnew.png")]
		public static const  spacesplash:Class;
		
		[Embed(source = "../media/LevelTwo.jpg")]		
		public static const LevelTwo:Class;
		
		[Embed(source = "../media/LevelThree.jpg")]		
		public static const LevelThree:Class;
		
		[Embed(source = "../media/Level4.jpg")]		
		public static const LevelFour:Class;
		
		[Embed(source = "../media/StartSplash.jpg")]		
		public static const StartSplash:Class;
		
		[Embed(source="../media/LetterFieldnew.png")]
		public static const  LetterFieldnew:Class;
		
		
		[Embed(source="../media/yellowMenu.png")]
		public static const yellowMenu:Class;
		
		private static var gameTextures:Dictionary  = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		[Embed(source = "../media/LetterSpriteSheet.png")]		
		public static const AtlasTextureGame:Class;
		
		[Embed(source = "../media/LetterSpriteSheet.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		//Add level two wallpaper
		[Embed(source = "../media/LevelTwo.xml", mimeType = "application/octet-stream")]
		public static const AtlasXmlGameTwo:Class;
		

		
		
		public static function getAtlas():TextureAtlas
		{
			// TODO Auto Generated method stub
			if( gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML  = XML( new AtlasXmlGame ());
				gameTextureAtlas = new  TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlas;
			
			
		}
		
		
		
		public static  function getTexture(name:String):starling.textures.Texture
		{
			if(gameTextures[name] == undefined )
			{
				var bitmap:Bitmap = new Assests [name]();
				
				gameTextures[name] = starling.textures.Texture.fromBitmap(bitmap);
				
			}
			
			
			return gameTextures[name];
			
		}
		
		
		
		
		
	}
	
}