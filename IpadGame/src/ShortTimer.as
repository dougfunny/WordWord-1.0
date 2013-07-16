package  
{ 
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.utils.Timer; 
	
	public class ShortTimer extends Sprite 
	{ 	private var TimeAmount:Number;
		private var _TimeAmount:Number;
		
		
		
		public function ShortTimer()  
		{ 
			
			// creates a new five-second Timer 
			var minuteTimer:Timer = new Timer(1000, 90); 
			
			// designates listeners for the interval and completion events 
			minuteTimer.addEventListener(TimerEvent.TIMER, onTick); 
			minuteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete); 
			
			// starts the timer ticking 
			minuteTimer.start(); 
		} 
		
		public function onTick(event:TimerEvent):void  
		{ 
			
			trace("tick " + event.target.currentCount); 
			
			
		} 
		
		
		
		public function onTimerComplete(event:TimerEvent):void 
		{ 
			trace("Time's Up!"); 
		} 
	} 
}