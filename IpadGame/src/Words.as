package 
{
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import objects.Game;
	import objects.Letters;
	
	import starling.core.Starling;
 
	/**
	 * SWF meta data defined for iPad 1 & 2 in landscape mode. 
	 */	
	
	 
	[SWF(frameRate="30", width="1024", height="768",backgroundColor="0xCFECEC")]
	public class Words extends Sprite
	{
		 private var LetterBox:Letters;
		private  var myStarling:Starling;
	 
		public function Words()
		{  
			// set general properties
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			
			Starling.multitouchEnabled = true;  // useful on mobile devices
			Starling.handleLostContext = false; // not necessary on iOS. Saves a lot of memory!
			
			// Create a suitable viewport for the screen size.
			// 
			// On the iPhone, the viewPort will fill the complete screen; on the iPad, there
			// will be black bars at the left and right, because it has a different aspect ratio.
			// Since the game is scaled up a little, it won't be as perfectly sharp as on the 
			// iPhone. Alernatively, you can exchange this code with the one used in the Starling
			// demo: it does not scale the viewPort, but adds bars on all sides.
			
			var screenWidth:int  = stage.fullScreenWidth;
			var screenHeight:int = stage.fullScreenHeight;
			var viewPort:Rectangle = new Rectangle();
			
		 
				viewPort.height = screenHeight;
				viewPort.width  =screenWidth;
			 
			// While Stage3D is initializing, the screen will be blank. To avoid any flickering, 
			// we display a startup image for now, but will remove it when Starling is ready to go.
			//
			// (Note that we *cannot* embed the "Default*.png" images, because then they won't
			//  be copied into the package any longer once they are embedded.)
			
				
				
				
				
			var startupImage:MovieClip = createStartupImage(viewPort, screenWidth > 320);
			addChild(startupImage);
		 
			
			myStarling = new Starling(Game, stage);
			myStarling.antiAliasing = 1;
			
			
			myStarling.stage3D.addEventListener(Event.CONTEXT3D_CREATE, function(e:Event):void 
			{
				// Starling is ready! We remove the startup image and start the game.
				removeChild(startupImage);
				myStarling.start();
			});
		   
			// When the game becomes inactive, we pause Starling; otherwise, the enter frame event
			// would report a very long 'passedTime' when the app is reactivated. 
			
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, 
				function (e:Event):void { myStarling.start(); });
			
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, 
				function (e:Event):void { myStarling.stop(); });
		}
		private function createStartupImage(viewPort:Rectangle, isHD:Boolean):MovieClip
		{
			var sprite:MovieClip = new MovieClip();
			
			var background:Bitmap = isHD ?
				new Assests.Background() : new Assests.Background();
			
			
			background.smoothing = true;
			sprite.addChild(background);
		    sprite.x =300;
			sprite.y = 300;
	
			
			return sprite;
		}
		
		
	 
		
		
	
	 
	}
}