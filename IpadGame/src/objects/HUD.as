package objects  
{
      
   import objects.GameFont;
   
   import starling.display.Sprite;
   import starling.events.Event;
   import starling.text.TextField;
 

	public  class HUD extends Sprite
	{
	 
		 
		private var _answerString:String;
		private var _ScoreString:String;
		private var _TimeString:String;
		private var _TimeStringAmount:String;
		private var _PointString:String;
		
		private var answerStringLabel:TextField;
		private var answerStringText:TextField;		
		private var ScoreStringText:TextField;
		private var TimeStringText:TextField;
		private var PointStringText:TextField;
		
		private var AnswerValue:objects.GameFont;		
		private var Score:objects.GameFont;
		private var Time:objects.GameFont;
		private var TimeAmount:objects.GameFont;
		private var Point:objects.GameFont;
	 
		
		private var ScoreText:TextField;
		private var TimeText:TextField;
		private var TimeTextAmount:TextField;
		private var PointText:TextField;
  
 
		public function HUD()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

	
		private function onAddedToStage(event:Event):void
		{ 
			AnswerValue = Fonts.getFont("ScoreValue");
			answerStringText = new TextField(250, 75, "", AnswerValue.fontName, AnswerValue.fontSize,0xFFFF00);
			answerStringText.x =stage.stageWidth /2 - answerStringText.width/2+10;
			answerStringText.y = stage.stageHeight/2 - answerStringText.height/2 +300;
			answerStringText.visible = true;
			
    		this.addChild(answerStringText);
			// answer label
			
		
			
			Time = Fonts.getFont("ScoreValue");
			TimeText = new TextField(120, 100, "", Time.fontName, 35,0xE8E8E8   );
			TimeText.x =820;
			TimeText.y =110;
			this.addChild(TimeText);
			// Time label
			
			
			
			TimeAmount = Fonts.getFont("ScoreValue");
			TimeTextAmount = new TextField(120, 100, "", TimeAmount.fontName, 35,0xE8E8E8   );
			TimeTextAmount.x =890;
			TimeTextAmount.y =110;
			this.addChild(TimeTextAmount);
			// Time label
			
			
			Score = Fonts.getFont("ScoreValue");
			ScoreText = new TextField(250, 100, "", Score.fontName, 35,0xE8E8E8   );
			ScoreText.x =740;
			ScoreText.y =140;
			this.addChild(ScoreText);
			// Score label
			
			Point = Fonts.getFont("ScoreValue");
			PointText = new TextField(120, 100, "", Point.fontName, 35,0xE8E8E8   );
			PointText.x =900;
			PointText.y =140;
			this.addChild(PointText);
			// point label
		
			 
		} 
		public function get answerString():String { return _answerString; }
		public function set answerString(value:String):void
		{
			_answerString = value;
			answerStringText.text = _answerString.toString();
		}
		
		
		

		public function get ScoreString():String { return _ScoreString; }
		public function set ScoreString(val:String):void
		{
			_ScoreString = val;
			ScoreText.text = _ScoreString.toString();
		}
		
		
		public function get TimeString():String { return _TimeString; }
		public function set TimeString(valueN:String):void
		{
			_TimeString = valueN;
			TimeText.text = _TimeString.toString();
		}
		
		
		public function get TimeStringAmount():String { return _TimeStringAmount; }
		public function set TimeStringAmount(valueN:String):void
		{
			_TimeStringAmount = valueN;
			TimeTextAmount.text = _TimeStringAmount.toString();
		}
		
		 
		
		
		public function get PointString():String { return _PointString; }
		public function set PointString(valueN:String):void
		{
			_PointString = valueN;
			PointText.text = _PointString.toString();
		}
		
		 
		
	}
 }
