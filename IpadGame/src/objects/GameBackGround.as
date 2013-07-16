package objects
{
	import starling.display.Sprite;
	import starling.events.Event;
	public class GameBackGround extends Sprite
	{
		
		private var bgLayer1:bglayer;
		private var bgLayer2:bglayer;
		private var _speed:Number = 0;		
				
		public function GameBackGround()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			// TODO Auto Generated method stub
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			bgLayer1 = new bglayer(1);
			bgLayer1.parallax = 0.2;
			this.addChild(bgLayer1);
			
			bgLayer2 = new bglayer(2);
			bgLayer2.parallax = 0.2;
			this.addChild(bgLayer2);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		 }
		
		
		private function onEnterFrame(event:Event):void
		{
			// TODO Auto Generated method stub
			bgLayer1.x -= Math.ceil(_speed * bgLayer1.parallax);
			if (bgLayer1.x < - stage.stageWidth) bgLayer1.x = 0;
			
			bgLayer2.x -= Math.ceil(_speed * bgLayer2.parallax);
			if (bgLayer2.x < - stage.stageWidth) bgLayer2.x = 0;
	 }
		
		public function get speed():Number
		{
			return _speed;
		}

		public function set speed(value:Number):void
		{
			_speed = value;
		}

	}
}