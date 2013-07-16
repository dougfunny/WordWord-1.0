package objects  
{ 
	import events.NavigationEvent;
	
	import screens.InGame;
 
	import screens.Welcome;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
	 
		private var  screenWelcome:Welcome;
		private var  screenInGame:InGame;
		public function Game()
		{ 
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{  
			trace("Starling Framework Intialized!");
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
		 
			
	        screenInGame = new InGame();
			this.addChild(screenInGame);
			
			screenWelcome  = new Welcome();
			this.addChild(screenWelcome);
			screenWelcome.intialize();
			
		}
		
		private function onChangeScreen(event:NavigationEvent):void
		{
			// TODO Auto Generated method stub
			switch (event.params.id)
			{ 
				case "logo":			
			 
					screenWelcome.DisposeTemp();
				    screenInGame.initialize();
				break;
				
			}
			}
		}
		
	}
