package objects
{ 
	 

public final class GameFont
	{
		private var _fontName:String;
		private var _fontSize:uint;
		private var _fontColor:uint;
		
		public function GameFont(fontName:String, fontSize:uint, fontColor:uint = 0xffffff)
		{
			this.fontName = fontName;
			this.fontSize = fontSize;
			this.fontColor = fontColor;
		}
		
		/**
		 * Font Color.
		 * @return 
		 * 
		 */
		public function get fontColor():uint
		{
			return _fontColor;
		}
		
		public function set fontColor(value:uint):void
		{
			_fontColor = value;
		}
		
		/**
		 * Font Size.
		 * @return 
		 * 
		 */
		public function get fontSize():uint
		{
			return _fontSize;
		}
		
		public function set fontSize(value:uint):void
		{
			_fontSize = value;
		}
		
		/**
		 * Font Name. 
		 * @return 
		 * 
		 */
		public function get fontName():String
		{
			return _fontName;
		}
		
		public function set fontName(value:String):void
		{
			_fontName = value;
		}
	


}}