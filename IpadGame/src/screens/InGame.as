package screens
{ 
	import flash.display.Loader;
	import flash.events.AsyncErrorEvent;
	import flash.events.ErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.media.SoundMixer;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import events.NavigationEvent;
	
	import objects.GameBackGround;
	import objects.GameWords;
	import objects.HUD;
	import objects.Letters;
	
	import screens.Welcome;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.PDParticleSystem;
	import starling.extensions.ParticleDesignerPS;
	import starling.textures.Texture;
 
	public class InGame extends Sprite
	{   private var unHide:Array = new Array();
		private var age:int = 0;
		/** Tween object for game over container. */
		
		private var screenWelcome:Welcome;
		public var cacheDir:File = null;
		public var tempDir:File = null;
		private var  WinterLevel:Number;
		private var tween_gameOverContainer:Tween;
		private var x:int = 0;
		private var BoolRun:Boolean;
		private var loadScreen:MovieClip;
		private var myLoader:URLLoader = new URLLoader();
		private var myLoaderTwo:URLLoader = new URLLoader();
		private var myLoaderThree:URLLoader = new URLLoader();
		private var myLoaderFour:URLLoader = new URLLoader();
        private var levelOne:Button;
        private var levelTwo:Button;
	    private var levelThree:Button;
	    private var levelFour:Button;
	    private var homeButton:Button;
		private var Submit:Button;
		private var BackSpace:Button;
		private var words:Button;
		private var words2:Button;
		private var words3:Button;
		private var words4:Button;
		private var words5:Button;
		private var words6:Button;
		private var words7:Button;
		private var words8:Button;
		private var words9:Button;
		private var words10:Button;
		private var words11:Button;
		private var words12:Button;
		private var fallSpeed:Number;
		private var LevelBG:Image;
		private var LevelBGThree:Image;
		private var LevelBGFour:Image;
		private var paused:Image;
		private var str:String="";
		private var str2:String="";
		private var str3:String="";
		private var str4:String = "";//update HUD answer
		private var str5:String = "";
		private var str6:String = "";
		private var str7:String = "";
		private var str8:String = "";
		private var str9:String = "";
		private var str10:String = "";
		private var str11:String = "";
		private var str12:String = "";
		private var bg:GameBackGround;
		private var LetterBox:Letters;
		private var timePrevious:Number;
		private var timeCurrent:Number;
		private var elasped:Number;
		private var gameState:int;
		private var playerSpeed:Number;
		private var speed:Number;
        private var hud:HUD;
		private var particleSplash:PDParticleSystem;
		private var particlePop:PDParticleSystem;

		private var gameArea:Rectangle;
		private var levelBoolOne:Boolean =false;
		private var levelBoolTwo:Boolean =false;
		private var levelBoolThree:Boolean =false;
		private var levelBoolFour:Boolean =false;
		private var wordBool:Boolean =false;
		private var word2Bool:Boolean=false;
		private var word3Bool:Boolean=false;
		private var word4Bool:Boolean=false;
		private var word5Bool:Boolean=false;
		private var word6Bool:Boolean=false;
		
		
		private var word7Bool:Boolean =false;
		private var word8Bool:Boolean=false;
		private var word9Bool:Boolean=false;
		private var word10Bool:Boolean=false;
		private var word11Bool:Boolean=false;
		private var word12Bool:Boolean=false;
		
		private var wordNum:Array = new Array;
		private var MoreLetters:Array = new Array;
		private var LetterRate:int;
		private var tree:node;
		private var test:GameWords = new GameWords();
		private var slangContent:String
		private var slangSplit:String;
		private var bgImg:Image;
		private var LetterObstacle:Image;
		
		private var HundredPoints:Image;
		private var twoHundredPoints:Image;
		private var fiveHundredPoints:Image;
		private var sevenFiftyPoints:Image;
		private var slangArray:Array = new Array();
		private var slangArrayTwo:Array = new Array();
		private var slangArrayThree:Array = new Array();
		private var slangArrayFour:Array = new Array();
		private var slangContentTwo:String
		private var slangSplitTwo:String;
		private var slangContentThree:String
		private var slangSplitThree:String;
		private var slangContentFour:String
		private var slangSplitFour:String;
    	private var randSpot:Number;
		private var points:int =0;
		private var currentX:int;
		private var gamePaused:Boolean;
		private var pauseButton:Button;
		private var menuButton:Button;
	    private var GameTime:Number;
        private var PointTime:Number;
	    private var RoundTime:Number = 90;
		private var minuteTimer:Timer;
		private var PointTimer:Timer;
        private var words_Delete:Button;
		private var deleteLetter:Boolean;
		private var hide:Number;
		private var soundButton:SoundButton;
 		private var gameOverContainer:GameOverContainer;
		private var sourceFile:File = File.documentsDirectory.resolvePath("assets/words3.txt");
		private var stream:FileStream = new FileStream();
	
		
        public function InGame()
			
		{	
		    super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		 

		private function onSoundButtonClick(event:Event = null):void
		{
			if (Sounds.muted)
			{
				Sounds.muted = false;
			 	
				soundButton.showUnmuteState();
			}
			else
			{
				Sounds.muted = true;
				SoundMixer.stopAll();
				soundButton.showMuteState();
			}
		}
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			
			 
			drawGame();
			drawGameOverScreen();
			
			
		} 
 
		
		private function slangLoaded(event:Object):void {
			slangContent = event.target.data;
			slangArray = slangContent.split("\n");
		}
		private function slangLoadedTwo(event:Object):void {
			slangContentTwo = event.target.data;
			slangArrayTwo = slangContentTwo.split("\n");	
			 
		}
		
		private function slangLoadedThree(event:Object):void {
			
			slangContentThree = event.target.data;
			slangArrayThree= slangContentThree.split("\n");
			
		}
		
		private function slangLoadedFour(event:Object):void {
			
			slangContentFour = event.target.data;
			slangArrayFour= slangContentFour.split("\n");
			
		}
		 
	    private function drawHUD():void
		{hud = new HUD();
			this.addChild(hud);
			
			
		//	particleSplash = new ParticleDesignerPS(XML(new AssestsParticle.ParticleSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleSplashTexture));	
		//	Starling.juggler.add(particleSplash);
			//this.addChild(particleSplash);
			
			
		//	particleSplash.start();
		}
	 
		private function drawGame():void
		{   
		
			GameTime = 5;
			hide=-1;
			gameState =1;
			speed = 20;//how fast the letters fall
			bg = new GameBackGround();
			bg.visible = true;
			this.addChild(bg);
		 
	 
		//	LetterRate = 50;
			
			Submit = new  Button(Assests.getAtlas().getTexture("submit"));
			Submit.x =80;
			Submit.y =400;
			Submit.visible = false;
			Submit.addEventListener(Event.TRIGGERED, onSubmitButtonClick);
			this.addChild(Submit);
			
			BackSpace = new  Button(Assests.getAtlas().getTexture("backSpace"));
			BackSpace.x =850;
			BackSpace.y =400;
			BackSpace.visible = false;
			BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
				this.addChild(BackSpace);
			
				LevelBG = new  Image (Assests.getTexture("LevelTwo"));//Welcome Screen
				LevelBG.visible = false;
				this.addChild(LevelBG);
				
				LevelBGThree = new  Image (Assests.getTexture("LevelThree"));//Welcome Screen
				LevelBGThree.visible = false;
				this.addChild(LevelBGThree);
				
				LevelBGFour = new  Image (Assests.getTexture("LevelFour"));//Welcome Screen
				LevelBGFour.visible = false;
				this.addChild(LevelBGFour);
				
				
				paused = new  Image (Assests.getAtlas().getTexture("paused"));
				paused.alpha = .7;
				paused.x  = stage.stageWidth /2 - paused.width/2;
				paused.y =  stage.stageHeight/2 - paused.height/2;
				paused.visible = false;
				this.addChild(paused);
		


			levelOne = new  Button(Assests.getAtlas().getTexture("level_1"));
			levelOne.x = stage.stageWidth /2 - levelOne.width/2;
			levelOne.y = stage.stageHeight/2 - levelOne.height/2 - 100;
			this.addChild(levelOne);
			
			levelTwo = new  Button(Assests.getAtlas().getTexture("level_2"));
			levelTwo.x = stage.stageWidth /2 - levelTwo.width/2 ;
			levelTwo.y = stage.stageHeight/2 - levelTwo.height/2;
			this.addChild(levelTwo);
			
			levelThree = new  Button(Assests.getAtlas().getTexture("level_3"));
			levelThree.x = stage.stageWidth /2 - levelThree.width/2 +15;
			levelThree.y = stage.stageHeight/2 - levelThree.height/2 + 100;
			this.addChild(levelThree);
			
			levelFour = new  Button(Assests.getAtlas().getTexture("level_4"));
			levelFour.x = stage.stageWidth /2 - levelFour.width/2+10;
			levelFour.y = stage.stageHeight/2 - levelFour.height/2 +200;
			this.addChild(levelFour);
			 
			HundredPoints = new Image(Assests.getAtlas().getTexture("100points") );
			HundredPoints.visible = false;
			HundredPoints.alpha = .7;
			HundredPoints.x =  stage.stageWidth /2 - levelThree.width/2  +100;
			HundredPoints.y =  stage.stageHeight/2 - levelFour.height/2 ;
			this.addChild(HundredPoints);
			
			sevenFiftyPoints = new Image(Assests.getAtlas().getTexture("sevenFifty") );
			sevenFiftyPoints.visible = false;
			sevenFiftyPoints.alpha = .7;
			sevenFiftyPoints.x =  stage.stageWidth /2 - levelThree.width/2 +100;
			sevenFiftyPoints.y =  stage.stageHeight/2 - levelFour.height/2 ;
			this.addChild(sevenFiftyPoints);
			
			fiveHundredPoints = new Image(Assests.getAtlas().getTexture("fiveHundred") );
			fiveHundredPoints.visible = false;
			fiveHundredPoints.alpha = .7;
			fiveHundredPoints.x =  stage.stageWidth /2 - levelThree.width/2 +100;
			fiveHundredPoints.y =  stage.stageHeight/2 - levelFour.height/2 ;
			this.addChild(fiveHundredPoints);
			
			twoHundredPoints = new Image(Assests.getAtlas().getTexture("twoHundred") );
			twoHundredPoints.visible = false;
			twoHundredPoints.alpha = .7;
			twoHundredPoints.x =  stage.stageWidth /2 - levelThree.width/2 +100;;
			twoHundredPoints.y =  stage.stageHeight/2 - levelFour.height/2 ;
			this.addChild(twoHundredPoints);
			particleSplash = new ParticleDesignerPS(XML(new AssestsParticle.ParticleScoreSplashXML),  Texture.fromBitmap(new AssestsParticle.ParticleScoreSplashTexture));	
			Starling.juggler.add(particleSplash);
			this.addChild(particleSplash);
			 
			function errorHandlerErrorEvent( e:ErrorEvent ):void{
				trace( 'errorHandlerErrorEvent ' + e.toString() );
			}
			function infoIOErrorEvent( e:IOErrorEvent ):void{
				trace( 'infoIOErrorEvent ' + e.toString() );
			}
			function errorHandlerIOErrorEvent( e:IOErrorEvent ):void{
				trace( 'errorHandlerIOErrorEvent ' + e.toString() );
			}
			function errorHandlerAsyncErrorEvent( e:AsyncErrorEvent ) :void{
				trace( 'errorHandlerAsyncErrorEvent ' + e.toString() );
			}
			function errorHandlerSecurityErrorEvent( e:SecurityErrorEvent ):void{
				trace( 'errorHandlerSecurityErrorEvent? ' + e.toString(
				) );
			}	 
			
			
		 
				
			
		slangArray = test.getNextWord(1);
		
		slangArrayTwo =  test.getNextWord(2);
		
		slangArrayThree= test.getNextWord(3);
		
		slangArrayFour = test.getNextWord(4);
	 
		
		// Pause button.
		pauseButton = new Button(Assests.getAtlas().getTexture("pauseMenu"));
		pauseButton.x = 850;
		pauseButton.y = 680;
		pauseButton.visible = false;
		pauseButton.addEventListener(Event.TRIGGERED, onPauseButtonClick);
		this.addChild(pauseButton);
		
		// Main button.
		menuButton = new Button(Assests.getAtlas().getTexture("MainMenu"));
		menuButton.x = 920;
		menuButton.y = 680;
		menuButton.visible = false;
		menuButton.addEventListener(Event.TRIGGERED, onMenuButtonClick);
		this.addChild(menuButton);
	 	//gameArea = new Rectangle(0, 75, stage.stageWidth, stage.stageHeight -50);
			
			

		}
		
		private function onMenuButtonClick():void
		{		this.removeChild(words);
			this.removeChild(words2);
			this.removeChild(words3);
			this.removeChild(words4);
			this.removeChild(words5);
			this.removeChild(words6);
			this.removeChild(words7);
			this.removeChild(words8);
			this.removeChild(words9);
			this.removeChild(words10);
			this.removeChild(words11);
			
			
			
			
			minuteTimer.stop();
			gameState = 3;
			
		}		
  
		private function onBackSpaceButtonClick():void
		{
		// trace(unHide.length-1);
			if(unHide[unHide.length-1]==6){
				trace(unHide[unHide.length-1]);
				trace("words6");
				words6.visible = true;}
			
			if(unHide[unHide.length-1]==5){
				trace(unHide[unHide.length-1]);
				trace("words5");
				words5.visible = true;}
			
			if(unHide[unHide.length-1]==4){
				trace(unHide[unHide.length-1]);
				trace("words4");
				words4.visible = true;}
			
		  if(unHide[unHide.length-1]==3){
			  trace(unHide[unHide.length-1]);
			  trace("words3");
			  words3.visible = true;}
		  
		  if(unHide[unHide.length-1]==2){
			  trace(unHide[unHide.length-1]);
			  trace("words2");
			  words2.visible = true;}
		  
		  if(unHide[unHide.length-1]==1){
			  trace(unHide[unHide.length-1]);
			  trace("words");
			  words.visible = true;}
	 
		 
		  unHide = unHide.slice(0,-1);
		  
	    
		str4 = 	str4.slice( 0, -1 );
		//trace(str4);
	 
		hud.answerString = hud.answerString.slice(0,-1);
	
		}
		
		private function onSubmitButtonClick():void
		{
			 //  points +=checkWord(str4);
		  		trace(str4);
		     	if(checkWord(str4)==100){
				points +=checkWord(str4)
				pointTime();
				HundredPoints.visible = true;
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.x = 500;
				particleSplash.start();
		
			    var test:String = points.toString();
				hud.PointString = test;
			}
				
     			if(checkWord(str4)==200){
				points +=checkWord(str4)
				twoHundredPoints.visible = true;	
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.x = 500;
				particleSplash.start();
				pointTime();
				 
				var test:String = points.toString();
				hud.PointString = test;
				}
				
				if(checkWord(str4)==500){
				points +=checkWord(str4)
				fiveHundredPoints.visible = true;	
				particleSplash.x = 500;
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.start();
				pointTime();
		 
				var test:String = points.toString();
				hud.PointString = test;
				}
				
				if(checkWord(str4)==750){	
				points +=checkWord(str4)
				sevenFiftyPoints.visible = true;	
				particleSplash.x = 500;
				if (!Sounds.muted) Sounds. sndScoreGame.play();
				particleSplash.start();
				pointTime(); 
				var test:String = points.toString();
				hud.PointString = test;
				}
				
			  
			if(levelBoolOne) {
				hud.answerString = " ";
				this.removeChild(words);
				this.removeChild(words2);
				this.removeChild(words3);
				this.removeChild(words4);
				this.removeChild(words5);
				this.removeChild(words6);
				this.removeChild(words7);
				this.removeChild(words8);
				this.removeChild(words9);
				this.removeChild(words10);
				this.removeChild(words11);
                createWords();
			 
			 
			}
			
			if(levelBoolTwo) {
				hud.answerString = " ";
				this.removeChild(words);
				this.removeChild(words2);
				this.removeChild(words3);
				this.removeChild(words4);
				this.removeChild(words5);
				this.removeChild(words6);
				this.removeChild(words7);
				this.removeChild(words8);
				this.removeChild(words9);
				this.removeChild(words10);
				this.removeChild(words11);
				createWords();
				 
			 	
			}
			
			if(levelBoolThree) {
				hud.answerString = " ";
				this.removeChild(words);
				this.removeChild(words2);
				this.removeChild(words3);
				this.removeChild(words4);
				this.removeChild(words5);
				this.removeChild(words6);
				this.removeChild(words7);
				this.removeChild(words8);
				this.removeChild(words9);
				this.removeChild(words10);
				this.removeChild(words11);
				createWords();
			 
				 
			}
			if(levelBoolFour)  {
				hud.answerString = " ";
				this.removeChild(words);
				this.removeChild(words2);
				this.removeChild(words3);
				this.removeChild(words4);
				this.removeChild(words5);
				this.removeChild(words6);
				this.removeChild(words7);
				this.removeChild(words8);
				this.removeChild(words9);
				this.removeChild(words10);
				this.removeChild(words11);
				createWords();
			 
			}
		
		 
		
			
	}
		
		private function onHomeButtonClick():void
		{
     	gameState =3;		
		}
		
		private function getWords():String
			{
			if(levelBoolOne){
				tree = new node(7544);
				var arrayWordFour:Number = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			
			if(levelBoolTwo){ 
				
				tree = new node(7544);
				var arrayWordFour:Number = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			
			if(levelBoolThree){ 
				
				tree = new node(7544);
				var arrayWordFour:Number = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}
			
			
			if(levelBoolFour){ 
				
				tree = new node(7544);
				var arrayWordFour:Number = Math.round(Math.random()  *15787);
				
				if(tree.contains(arrayWordFour) == false){
					tree.add(arrayWordFour);
					slangArrayFour[arrayWordFour];
					//trace(slangArrayThree[arrayWordThree]);
				}
				
				return slangArrayFour[arrayWordFour]
			}

			 
			return ""; 
			 
			 
			}
 
		private function pointTime():void{
			
			//	HundredPoints.visible = true;
			// creates a new five-second Timer 
			PointTimer = new Timer(1000, 2);
			// designates listeners for the interval and completion events 
			PointTimer.addEventListener(TimerEvent.TIMER, onTickPoint); 
			//minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete); 
			// starts the timer ticking 
			PointTimer.start(); 
			//trace(PointTime);
			 
	
		}
		   
		private function onTickPoint(event:TimerEvent):void  
		{  
			PointTime = 2- event.target.currentCount;
						trace(PointTime);	
			}
		 
		private function createWords():void
		{ 
			
			hud.answerString ="";
			var SlotArray:Array = new Array;
			
			var MoreSlots:Array = new Array;
			
			
			for(var A:int = 1;A<27;A++){
				MoreSlots[A] = A;
				
				MoreLetters[A] =A;
				trace(MoreLetters[A]);
			}
			for(var x:int = 1;x<27;)
			{  randSpot = ( Math.round(Math.random() *26));
				if(MoreSlots[randSpot] != null){
					trace(MoreLetters[x]);
					MoreLetters[x]    =  MoreSlots[randSpot];
					x++;
					MoreSlots[randSpot] = null;
				}
				
			}
			 
			
			
		 	// str4 = "";
		   	 speed =.02;
			 var wordNumber:Number;
			 var gameWord:String = getWords();
		trace(gameWord);
		//trace("-1");
		 hide=0;
		 unHide.length=0;
		 str4="";
			 if(gameWord!=null){
			 var my_array:Array =gameWord.split("");
			 for (var i:int = 0; i<my_array.length; i++) {
			 
			 } //end for loop
			 
			 }//end if
		
			
			 
			 
		   if(levelBoolOne){
			 
			   for(var A:int = 0;A<6;A++){
				   SlotArray[A] = A;				   
			   }
			   for(var x:int = 0;x<6;)
			   {  randSpot = ( Math.round(Math.random() *6));
				   if(SlotArray[randSpot] != null){
					   trace(wordNum[x]);
					   wordNum[x]    =  gameWord.charCodeAt(SlotArray[randSpot]) -64;
					   x++;
					   SlotArray[randSpot] = null;
				   }
				   
			   }
		   } 
		   
		   if(levelBoolTwo){
			  
			   for(var A:int = 0;A<6;A++){
				   SlotArray[A] = A;				   
			   }
			   for(var x:int = 0;x<6;)
			   {  randSpot = ( Math.round(Math.random() *6));
				   if(SlotArray[randSpot] != null){
					   trace(wordNum[x]);
					   wordNum[x]    =  gameWord.charCodeAt(SlotArray[randSpot]) -64;
					   x++;
					   SlotArray[randSpot] = null;
				   }
				   
			   }
			   
		   }
		   
		   if(levelBoolThree)
		   {     for(var A:int = 0;A<6;A++){
			   SlotArray[A] = A;				   
		   }
			   for(var x:int = 0;x<6;)
			   {  randSpot = ( Math.round(Math.random() *6));
				   if(SlotArray[randSpot] != null){
					   trace(wordNum[x]);
					   wordNum[x]    =  gameWord.charCodeAt(SlotArray[randSpot]) -64;
					   x++;
					   SlotArray[randSpot] = null;
				   }
				   
			   }
			   
		   }
		   if(levelBoolFour){
			   
			   
			   for(var A:int = 0;A<6;A++){
				   SlotArray[A] = A;				   
			   }
			   for(var x:int = 0;x<6;)
			   {  randSpot = ( Math.round(Math.random() *6));
				   if(SlotArray[randSpot] != null){
					   trace(wordNum[x]);
					   wordNum[x]    =  gameWord.charCodeAt(SlotArray[randSpot]) -64;
					   x++;
					   SlotArray[randSpot] = null;
				   }
				   
			   }
			    
			   
		   }
		   if(levelBoolFour){
			   WinterLevel = 100;}
		   else
		   {
			   WinterLevel = 0;
		   
		   }
		   
		    trace(wordNum[9]);
			
	  	    words= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel +  wordNum[0] )));
			words.x =  350;
			words.y = -words.height;
			//words.visible = false;
			
		    
			wordBool = false ;
			this.addChild(words);

			
			words2= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel + wordNum[1] )));
			words2.x =  450;
            //words2.visible = false;
			word2Bool=false;
			this.addChild(words2);
			
	
			words3= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[2]) ));
			words3.x =  550;
			//words3.visible = false;
			word3Bool = false;
			this.addChild(words3);
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			words7= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel +MoreLetters[10] )));
			words7.x =  350;			
			words7.visible = false;
			wordBool = false ;
			//this.addChild(words7);
			
			
			words8= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + MoreLetters[1])));
			words8.x =  450;
			
			words8.visible = false;
			word8Bool=false;
		//	this.addChild(words8);
			
			
			words9= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel +MoreLetters[2] )));
			words9.x =  550;
			
			words9.visible = false;
			word9Bool = false;
		//	this.addChild(words9);
			
			words10= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel +MoreLetters[3])));
			words10.x =  200;
			
			words10.visible = false;
			word10Bool=false;
		//	this.addChild(words10);
			
			
			words11= new Button(Assests.getAtlas().getTexture("Letter_"  +( WinterLevel + MoreLetters[4] )));
			words11.x =  700;
			
			words11.visible = false;
			word11Bool = false;
		//	this.addChild(words11);
			this.addChild(words7);
			this.addChild(words8);
			this.addChild(words9);
			this.addChild(words10);
			this.addChild(words11);
			
			words7.y =100;
			words8.y =150;
			words9.y =150;
			words10.y=100;
			words11.y=100;
		
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			/////////////////////////////////////////////////////////////////////////////////////////////
			
			
			
			
			
			if(levelBoolOne){
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
			
			words4= new Button(Assests.getAtlas().getTexture("Letter_"  +( WinterLevel + wordNum[3] )));
			words4.x =  220;//300
			
			word4Bool = false;
			this.addChild(words4);
			
			words5= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[4] )));
			words5.x =  330;///400
			
			word5Bool = false;
			this.addChild(words5);
			
			words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[5] )));
			words6.x = 430;//500
			
			word6Bool = false;
			this.addChild(words6);
			words2.y = -words2.height;
			words3.y = -words3.height;
			words4.y = -words4.height;
			words5.y = -words5.height;
			words6.y = -words6.height;
		   }
			
			if(levelBoolTwo){
			 
				words.visible = true;
				words2.visible = true;
				words3.visible = true;
				 
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  +( WinterLevel + wordNum[3] )));
				words4.x =  220;//300
				
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[4] )));
				words5.x =  330;///400
				
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[5] )));
				words6.x = 430;//500
				
				word6Bool = false;
				this.addChild(words6);
				  
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
			}
			
			if(levelBoolThree){
				
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[3] )));
				words4.x =  220;//300
				
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_" + (WinterLevel +wordNum[4] )));
				words5.x =  330;///400
				
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[5]) ));
				words6.x = 430;//500
				
				word6Bool = false;
				this.addChild(words6);
				
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
			}
			if(levelBoolFour){
				words.x+=370;;//700
				words2.x+=70;//600
				words3.x+=70;//700
				words4= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[3]) ));
				words4.x =  220;//300
				 
				word4Bool = false;
				this.addChild(words4);
				
				words5= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel + wordNum[4] )));
				words5.x =  330;///400
			 
				word5Bool = false;
				this.addChild(words5);
				
				words6= new Button(Assests.getAtlas().getTexture("Letter_"  + (WinterLevel +wordNum[5] )));
				words6.x = 430;//500
				 
				word6Bool = false;
				this.addChild(words6);
				words2.y = -words2.height;
				words3.y = -words3.height;
				words4.y = -words4.height;
				words5.y = -words5.height;
				words6.y = -words6.height;
				
			}
		  		
    }		
				
		public function DisposeTemp():void
		{
			this.visible = false;
		}
		
		public  function initialize():void
		{		 
			this.visible = true;
			gameState = 1;
			bg.speed = 0;
			gamePaused = false;
			levelOne.addEventListener(Event.TRIGGERED, onlevelOneClick);	
			levelTwo.addEventListener(Event.TRIGGERED, onlevelTwoClick);
			levelThree.addEventListener(Event.TRIGGERED, onlevelThreeClick);
			levelFour.addEventListener(Event.TRIGGERED, onlevelFourClick);
		}
		
		private function onlevelFourClick():void
		{
			fallSpeed = .4;
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			//if (!Sounds.muted) Sounds. sndLevelMusic.play(0, 999);
			
			LevelBGFour.visible = true;
			hud.answerString = " ";
			
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
				
			pauseButton.x = soundButton.x + 50;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
			
			menuButton.x = soundButton.x + 100;
			menuButton.y = soundButton.y;
			
				
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			Submit = new  Button(Assests.getAtlas().getTexture("submit"));
			Submit.x =80;
			Submit.y =400;
			
			Submit.addEventListener(Event.TRIGGERED, onSubmitButtonClick);
			this.addChild(Submit);
			
			BackSpace = new  Button(Assests.getAtlas().getTexture("backSpace"));
			BackSpace.x =850;
			BackSpace.y =400;
			
			BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			this.addChild(BackSpace);
			gameState =1;
			ShortTimer();
			levelBoolFour = true;	
			levelOne.visible = false;
			levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			LetterBox.alpha =.7;
			pauseButton.visible = true;
			menuButton.visible = true;
			createWords();
			words.visible   = true; Submit.visible = true; BackSpace.visible = true;
			words2.visible = true;
			words3.visible = true;
			words4.visible = true;
			words5.visible = true;
			words6.visible = true;
			levelFour.removeEventListener(Event.TRIGGERED, onlevelFourClick);
			launchLetter();
			drawHUD();
		}
		
		private function onlevelThreeClick(event:Event):void
		{ 		
			fallSpeed =.4;
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
			pauseButton.x = soundButton.x + 50;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
			
			menuButton.x = soundButton.x + 100;
			menuButton.y = soundButton.y;
			
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			//if (!Sounds.muted) Sounds. sndLevelMusic.play(0, 999);
			hud.answerString = " ";
			
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			Submit = new  Button(Assests.getAtlas().getTexture("submit"));
			Submit.x =80;
			Submit.y =400;
			
			Submit.addEventListener(Event.TRIGGERED, onSubmitButtonClick);
			this.addChild(Submit);
			
			BackSpace = new  Button(Assests.getAtlas().getTexture("backSpace"));
			BackSpace.x =850;
			BackSpace.y =400;
			
			BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			this.addChild(BackSpace);
			 
			gameState =1;
			ShortTimer();
		    levelBoolThree = true;	
	     	levelOne.visible = false;
	 		levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			pauseButton.visible = true;
			menuButton.visible = true;
			createWords();
			words.visible   = true; Submit.visible = true; BackSpace.visible = true;
			words2.visible = true;
			words3.visible = true;
			words4.visible = true;
			words5.visible = true;
			words6.visible = true;
			levelThree.removeEventListener(Event.TRIGGERED, onlevelThreeClick);
			launchLetter();
			LevelBGThree.visible= true;
			drawHUD();
        }				
		 
		private function onlevelTwoClick():void
		{ 	
			fallSpeed = .4;
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
			pauseButton.x = soundButton.x + 50;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
			
			menuButton.x = soundButton.x + 100;
			menuButton.y = soundButton.y;
			
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
	 
			//if (!Sounds.muted) Sounds. sndLevelMusic.play(0, 999);
			hud.answerString = " ";
			
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			Submit = new  Button(Assests.getAtlas().getTexture("submit"));
			Submit.x =80;
			Submit.y =400;
		 
			Submit.addEventListener(Event.TRIGGERED, onSubmitButtonClick);
			this.addChild(Submit);
			
			BackSpace = new  Button(Assests.getAtlas().getTexture("backSpace"));
			BackSpace.x =850;
			BackSpace.y =400;
		 
			BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			this.addChild(BackSpace);
			gameState =1;
			ShortTimer();
			levelBoolTwo = true;
			createWords();
			levelOne.visible = false;
			levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			pauseButton.visible = true;
			menuButton.visible = true;
			words.visible   = true; Submit.visible = true; BackSpace.visible = true;
			words2.visible = true;
			words3.visible = true;
			words4.visible = true;
			levelTwo.removeEventListener(Event.TRIGGERED, onlevelTwoClick);
			launchLetter();
			LevelBG.visible= true;
			drawHUD();
			
		}
  
		private function onlevelOneClick(event:Event):void
		 
		{ 
		 fallSpeed = .4;
			soundButton = new SoundButton();
			soundButton.visible = true;soundButton.alpha = .5;
			
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
				
			pauseButton.x = soundButton.x + 50;
			pauseButton.y = soundButton.y; pauseButton.alpha = .6;
			
			menuButton.x = soundButton.x + 100;
			menuButton.y = soundButton.y;
				
			if (!Sounds.muted) Sounds. sndLevelSelect.play();
			//if (!Sounds.muted) Sounds. sndLevelMusic.play(0, 999);
			hud.answerString = " ";
			
			LetterBox = new Letters();
			this.addChild(LetterBox);
			LetterBox.alpha =.7;
			
			gameState =1;
			ShortTimer();
			levelBoolOne = true;
			createWords();
			levelOne.visible = false;
			levelTwo.visible = false;
			levelThree.visible = false;
			levelFour.visible = false;
			LetterBox.visible = true;
			LetterBox.alpha =.7;
			pauseButton.visible = true;
			menuButton.visible = true;
		   words.visible   = true; Submit.visible = true; BackSpace.visible = true;
		   words2.visible = true;
		   words3.visible = true;
		   words4.visible = true;
		   words5.visible = true;
		   words6.visible = true;
			levelOne.removeEventListener(Event.TRIGGERED, onlevelOneClick);
			launchLetter();
			drawHUD();
		}
    
		private function launchLetter():void
		{
			this.addEventListener(Event.ENTER_FRAME, onGameTick);
 
		}
		 
 	
		private function onPauseButtonClick(event:Event):void
		{
		
			
			if(paused.visible == false)
			{	if (!Sounds.muted) Sounds. sndPauseGame.play();
		 
				paused.visible = true;
		 
			}
			else{	
				if (!Sounds.muted)
					Sounds. sndPauseGame.play();				
				paused.visible = false;
	 
			}
			//event.stopImmediatePropagation();	
			// Pause or unpause the game.
			if (gamePaused){
			gamePaused= false; 	minuteTimer.start();}
			else {gamePaused = true;;}
	 
						
		}
	 
		private function gameOver():void
		{	SoundMixer.stopAll();
			
		 
			this.removeChild(particleSplash)
			this.removeChild(hud);
			this.levelBoolTwo =false;
			this.levelBoolOne =false;
			this.levelBoolThree =false;
			this.levelBoolFour =false;
			this.removeChild(LetterBox);
			this.removeChild(Submit);
			this.removeChild(BackSpace);
			this.removeChild(words);
			this.removeChild(words2);
			this.removeChild(words3);
			this.removeChild(words4);
			this.removeChild(words5);
			this.removeChild(words6);
			this.removeChild(words7);
			this.removeChild(words8);
			this.removeChild(words9);
			this.removeChild(words10);
			this.removeChild(words11);
			this.setChildIndex(gameOverContainer, this.numChildren-1);
			gameOverContainer.initialize(points, Math.round(points));
			tween_gameOverContainer = new Tween(gameOverContainer, 1);
			tween_gameOverContainer.fadeTo(1);
			Starling.juggler.add(tween_gameOverContainer);
			
			this.removeEventListener(Event.TRIGGERED, onWord2Click);	
			this.removeEventListener(Event.TRIGGERED, onWord3Click);
			this.removeEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
			
			this.removeEventListener(Event.TRIGGERED, onWord4Click);
			this.removeEventListener(Event.TRIGGERED, onWord5Click);
			this.removeEventListener(Event.TRIGGERED, onWord6Click);
			 
			this.removeEventListener(Event.TRIGGERED, onWord7Click);
			this.removeEventListener(Event.TRIGGERED, onWord8Click);
			this.removeEventListener(Event.TRIGGERED, onWord9Click);
			 
			this.removeEventListener(Event.TRIGGERED, onWord10Click);
			this.removeEventListener(Event.TRIGGERED, onWord11Click);
		}
		private function onGameTick(event:Event):void
		{	
			 
			switch(gameState)
			{
			    case 1:
					createWords();
					trace("CreateWords");
					hud.ScoreString="SCORE";
					hud.TimeString="TIME";
					 
					//start the game
                  gameState = 2;
				 case 2:
			
				
					 if(PointTime==0){
						 
						 
						 particleSplash.stop();
						 HundredPoints.visible = false;
						 twoHundredPoints.visible = false;
						 fiveHundredPoints.visible = false;
						 sevenFiftyPoints.visible = false;
						 this.removeChild(particlePop);
					 }
					 PointTime=2;
					// trace(hide);
					 if(!gamePaused &&GameTime >0){
					 
					 initLetters();	
					
			         words.addEventListener(Event.TRIGGERED, onWordClick);	
					 words2.addEventListener(Event.TRIGGERED, onWord2Click);	
					 words3.addEventListener(Event.TRIGGERED, onWord3Click);
					 BackSpace.addEventListener(Event.TRIGGERED, onBackSpaceButtonClick);
					  
					 words4.addEventListener(Event.TRIGGERED, onWord4Click);
					 words5.addEventListener(Event.TRIGGERED, onWord5Click);
					 words6.addEventListener(Event.TRIGGERED, onWord6Click);
					 
					 
					 words7.addEventListener(Event.TRIGGERED, onWord7Click);
					 words8.addEventListener(Event.TRIGGERED, onWord8Click);
					 words9.addEventListener(Event.TRIGGERED, onWord9Click);
					 
					 
					 words10.addEventListener(Event.TRIGGERED, onWord10Click);
					 words11.addEventListener(Event.TRIGGERED, onWord11Click);
			 
					 
			}
					 if(GameTime ==0){gameState =3;}
				
				    break;
			    case 3:
	 
	gameState = 1;
	levelBoolOne = false;
	levelBoolTwo = false;
	levelBoolThree = false;
	levelBoolFour= false;
	this.removeEventListener(Event.ENTER_FRAME, onGameTick);
gameOver();
  
	
	 break;
				
				case 4:
			 
					break;
			}
			
		}
		
		
		private function onWord7Click():void
		{		if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			words7.visible= false;
			
			
			str8 = String.fromCharCode(MoreLetters[10]+64);
			
			word7Bool = true;
			str4 = str4.concat(str8);
			hud.answerString =  str4;
	
			
			//	unHide[hide] = 6;
			//	hide++;
			
			//this.removeChild(words6)
		}		
		
		 
		private function onWord8Click():void
		{		if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			words8.visible= false;
			str9 = String.fromCharCode(MoreLetters[1]+64);
			
			word8Bool = true;
			str4 = str4.concat(str9);
			hud.answerString =  str4;
			
			
			//	unHide[hide] = 6;
			//	hide++;
			
			//this.removeChild(words6)
		}	
		
		 
		private function onWord9Click():void
		{		if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			words9.visible= false;
			str10 = String.fromCharCode(MoreLetters[2]+64);
			
			word9Bool = true;
			str4 = str4.concat(str10);
			hud.answerString =  str4;
			
			
			//	unHide[hide] = 6;
			//	hide++;
			
			//this.removeChild(words6)
		}	
		 
		private function onWord10Click():void
		{		if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			words10.visible= false;
			str11 = String.fromCharCode(MoreLetters[3]+64);
			
			word10Bool = true;
			str4 = str4.concat(str11);
			hud.answerString =  str4;
			
			
			//	unHide[hide] = 6;
			//	hide++;
			
			//this.removeChild(words6)
		}	
		
		 
		private function onWord11Click():void
		{		if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			words11.visible= false;
			str12 = String.fromCharCode(MoreLetters[4]+64);
			
			word11Bool = true;
			str4 = str4.concat(str12);
			hud.answerString =  str4;
			
			
			//	unHide[hide] = 6;
			//	hide++;
			
			//this.removeChild(words6)
		}	
		
		
		private function onWord6Click():void
		{		if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			
			words6.visible= false;
			str7 = String.fromCharCode(wordNum[5]+64);
			
			word6Bool = true;
			str4 = str4.concat(str7);
			hud.answerString =  str4;
			unHide[hide] = 6;
			hide++;
			
			//this.removeChild(words6)
		}		
 
		 
		private function drawGameOverScreen():void
		{
			gameOverContainer = new GameOverContainer();
			gameOverContainer.addEventListener(NavigationEvent.CHANGE_SCREEN, playAgain);
			this.addChild(gameOverContainer);
			 
			
		}
		
		 
		private function playAgain(event:NavigationEvent):void
		{
			if (event.params.id == "playAgain") 
			{
				tween_gameOverContainer = new Tween(gameOverContainer, 1);
				tween_gameOverContainer.fadeTo(0);
				tween_gameOverContainer.onComplete = gameOverFadedOut;
				Starling.juggler.add(tween_gameOverContainer);
				initialize();
				drawGame();
				drawHUD();
			}
		}
		
		private function onInGameNavigation(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "mainMenu":
					screenWelcome.intialize()
					break;
				 
			}
		}
		
		 
		private function gameOverFadedOut():void
		{
			gameOverContainer.visible = false;
			initialize();
		}
		
		
		private function onWord5Click(event:Event):void
		{
			
			particlePop = new ParticleDesignerPS(XML(new AssestsParticle.ParticlepopXML),  Texture.fromBitmap(new AssestsParticle.ParticlepopTexture));	
			
			Starling.juggler.add(particlePop);
			this.addChild(particlePop);
			particlePop.emitterX = words5.x  + words5.width * .5;
			particlePop.emitterY = words5.y;
			particlePop.start();
			pointTime();
			
			 
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			 
			words5.visible= false;
			str6 = String.fromCharCode(wordNum[4]+64);
			
			word6Bool = true;
			str4 = str4.concat(str6);
			hud.answerString =  str4;
			
			
			unHide[hide] = 5;
			hide++;

			//this.removeChild(words5)
		}
		
		private function checkWord(string:String):int
		{var addPoint:int = 0;
			
			if(str4.length ==6){
				for(var x:int = 0;x<15787;x++){
					if(slangArrayFour[x] == string)
						addPoint =750;
				}
			}
			if(str4.length ==5){
				for(var x:int = 0;x<8938;x++){
					if(slangArrayThree[x] == string)
						addPoint =500;
				}
			}
			if(str4.length ==4){
				for(var x:int = 0;x<5252;x++){
					if(slangArrayTwo[x] == string)
						addPoint =200;
				}
			}
			if(str4.length ==3){
				for(var x:int = 0;x<593;x++){
					if(slangArray[x] == string)
						addPoint =100;
				}
			} 
			
		 			return addPoint;
		}
		
		 
		private function ShortTimer() :void 
		{ 
			
			// creates a new five-second Timer 
			minuteTimer = new Timer(1000, 90); 
			// designates listeners for the interval and completion events 
			minuteTimer.addEventListener(TimerEvent.TIMER, onTick); 
			//minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete); 
			// starts the timer ticking 
			minuteTimer.start(); 
	 
		} 
		
		private function onTick(event:TimerEvent):void  
		{ 
						
			if(!gamePaused){
			
			GameTime = RoundTime - event.target.currentCount;
			////trace("tick " + event.target.currentCount); 
			var test:String =  GameTime.toString();
						
			hud.TimeStringAmount = test;
			}
			else{
		 
			minuteTimer.stop();
			 			
			}
						 
		}  
		 
		private function onWord4Click(event:Event):void
		{	
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			str5 = String.fromCharCode(wordNum[3]+64);
            //word4Bool = true;
			str4 = str4.concat(str5);
			hud.answerString =  str4;
			 
			
			words4.visible = false;
			
			trace(hide);
			unHide[hide] = 4;
			hide++;
		}
		
		private function onWord3Click(event:Event):void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			str3 = String.fromCharCode(wordNum[2]+64);
			//word3Bool = true;
			str4 = str4.concat(str3);
			hud.answerString =  str4;
			
			words3.visible = false;	 
			
			trace("words3");
			trace(hide);
			
			unHide[hide] = 3;
			hide++;
		}
		
		private function onWord2Click(event:Event):void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			str2 =  String.fromCharCode(wordNum[1]+64);
			//word2Bool = true;
		   str4 = str4.concat(str2);
		   hud.answerString =  str4;
		   
			words2.visible = false;
			
			trace("words2");
			trace(hide);
		    unHide[hide] = 2;
			hide++;
		   //this.removeChild(words2);
	    }
		 
	  	private function onWordClick(event:Event):void
		{
			if (!Sounds.muted) Sounds. sndPopLetter.play();
			
			
			 str = String.fromCharCode(wordNum[0]+64)
			// wordBool = true;	
			 str4 = str4.concat(str); 
			 hud.answerString=  str4;
		     words.visible = false;
		
			 trace("words");
			 trace(hide);
			 unHide[hide] = 1;
			 hide++;	
			 
			// this.removeChild(words);
		} 
		private function initLetters():void
		{trace("inside of initLetters()");
	
			
			var count:Number;
			var count2:Number;
			count = words.y +=fallSpeed;
			//words.y +=fallSpeed;
			words2.y +=fallSpeed;
			words3.y +=fallSpeed;
			//trace(words.y);
			
			words6.y +=fallSpeed;
			words4.y +=fallSpeed;
			words5.y +=fallSpeed;
			count2 = words7.y +=fallSpeed;
			words8.y +=fallSpeed;
			words9.y +=fallSpeed;
			
			words10.y +=fallSpeed;
			words11.y +=fallSpeed;
			if(count > 200){
			   
				
				
				words7.visible = true;
				words8.visible = true;
				words9.visible = true;
			 
				
				
			}
			if(count2 > 250)
			{
			
				words10.visible = true;
				words11.visible = true;
			 
				
	 
				 
			}
		var switchIt:Boolean = false;
     	  if (words.y >700 )
		  {
    	  this.removeChild(words);
		  this.removeChild(words2);
		  this.removeChild(words3);
          this.removeChild(words4);
		  this.removeChild(words5);
		  this.removeChild(words6);
		  if (words7.y >700 )
		  {
		  this.removeChild(words7);
		  this.removeChild(words8);
		  this.removeChild(words9);
		  }
		  if (words10.y >700 )
		  {
		  this.removeChild(words10);
		  this.removeChild(words11);
		  switchIt = true;
		  }
		  if(switchIt){
		  createWords();	
		  
		  }
		  
		  

	
	    }
		 
		 
	   }
		
			
	  	} 
		 
	}
	

	 