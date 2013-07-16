package 
{
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import objects.GameFont;
    import starling.text.BitmapFont;

	  public final class Fonts
	{	

		  
		  
		  [Embed(source="../media/Bitmap/NewFont_0.png")]
		  public static const Font_ScoreValue:Class;
		  
		  [Embed(source="../media/Bitmap/NewFont.fnt", mimeType="application/octet-stream")]
		  public static const XML_ScoreValue:Class;
		  
		  [Embed(source="../media/Bitmap/NewFont_0.png")]
		  public static const Font_Value:Class;
		  
		  [Embed(source="../media/Bitmap/NewFont.fnt", mimeType="application/octet-stream")]
		  public static const XML_Value:Class;
		  
		  
	
				/**
				 * Font objects.
				 */
				private static var Regular:BitmapFont;
				private static var ScoreValue:BitmapFont;
			    private static var Value:BitmapFont;
			 
				
				/**
				 * Returns the BitmapFont (texture + xml) instance's fontName property (there is only oneinstance per app).
				 * @return String 
				 */
				public static function getFont(_fontStyle:String):GameFont
				{
					if (Fonts[_fontStyle] == undefined)
					{
						var texture:Texture = Texture.fromBitmap(new Fonts["Font_" + _fontStyle]());
						var xml:XML = XML(new Fonts["XML_" + _fontStyle]());
						Fonts[_fontStyle] = new BitmapFont(texture, xml);
						TextField.registerBitmapFont(Fonts[_fontStyle]);
					}
					
					return new GameFont(Fonts[_fontStyle].name, Fonts[_fontStyle].size);
				}
	  }
	  
}