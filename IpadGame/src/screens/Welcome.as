package screens
{
	//import com.greensock.TweenLite;
	
	import events.NavigationEvent;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.extensions.ParticleDesignerPS;
	import starling.textures.Texture;

	
	public class Welcome extends Sprite
	{
		
		private var bg:Image;
	    private var logo:Button;
	    private var particleSplash:PDParticleSystem;
		private var splash:Image;
		private var startSplash:Image;
		
		
		public function Welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			//
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("Welcome screen Intialized!");
			  drawScreen();
			
		}
		
		private function drawScreen():void
		{
			bg = new  Image (Assests.getTexture("spacesplash"));//Welcome Screen
			bg.visible=false;
			bg.x = stage.stageWidth * 0.5 - bg.width * 0.5;
			bg.y = stage.stageHeight * 0.5 - bg.height * 0.5;
			
			startSplash = new  Image (Assests.getTexture("StartSplash"));//Welcome Screen
		    //startSplash.visible = false;
			this.addChild(startSplash);
			
		    this.addChild(bg);
			particleSplash = new ParticleDesignerPS(XML(new AssestsParticle.ParticleSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleSplashTexture));	
			Starling.juggler.add(particleSplash);
			
			this.addChild(particleSplash);
	        particleSplash.start();
	  
			logo = new Button(Assests.getAtlas().getTexture("newlogo"));
			logo.x = stage.stageWidth/2 - logo.width/2;
			logo.y = stage.stageHeight/2 - logo.height/2;
			this.addChild(logo);
			
			this.addEventListener(Event.TRIGGERED , onMenuClick);
			 
		}
		
		public function DisposeTemp():void
		{
			this.visible = false;
		  
		}
 
		private function onMenuClick(event:Event):void
		{
			// TODO Auto Generated method stub
			var  buttonClicked:Button  = event.target as Button;
			if((buttonClicked as Button) ==  logo)
			{
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id:"logo"} ,true))
			}
		}
		
		public function intialize():void
		{
			this.visible = true;
 
			
		}
		
	 
		}
		
		
	}
