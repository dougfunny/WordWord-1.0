package objects
{
 	import starling.display.Image;
 	import starling.display.Sprite;
 	import starling.events.Event;
 
	
	public class Letters extends Sprite
	{
		
		private var Letter:Image;
 
 
		public function Letters()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			 
		}
		
		private function onAddedToStage():void
		{
			// TODO Auto Generated method stub
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		 
			createLetters();
	 	}
		
		private function createLetters():void
		{
			// TODO Auto Generated method stub
			
			
			Letter = new Image(Assests.getAtlas().getTexture("LetterB") );
			Letter.x = stage.stageWidth /2 - Letter.width/2+10;
			Letter.y = stage.stageHeight/2 - Letter.height/2 +300;
	 		this.addChild(Letter);
 
			
		}
		
	 
	}
}