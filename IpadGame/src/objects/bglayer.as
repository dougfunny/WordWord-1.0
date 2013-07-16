package objects
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class bglayer extends Sprite
	{
		
		private var Image1:Image;
	    private var Image2:Image;
		private var _layer:int;
		private var _parallax:Number;
		
		public function bglayer(layer:int)
		{
			super();
			this._layer = layer;
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);			
		}
		
		public function get parallax():Number
		{
			return _parallax;
		}

		public function set parallax(value:Number):void
		{
			_parallax = value;
		}

		private function onAddedToStage(event:Event):void
		{
			// TODO Auto Generated method stub
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	 
			if (_layer == 1)
			{
				Image1 = new Image(Assests.getTexture("LetterFieldnew"));
 
			}
			else
			{
				Image1 = new Image(Assests.getAtlas().getTexture("LetterFieldnew"));
 
			}
			
			Image1.x = 0;
			Image1.y = stage.stageHeight - Image1.height;
			
		 
			
			this.addChild(Image1);
 
		}
			
	}
}