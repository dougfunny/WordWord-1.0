package 
{
	import flash.media.Sound;
	
 
	public class Sounds
	{
	 		
		[Embed(source="../media/popNew.mp3")]
		public static const SND_Pop_Letter:Class;
		
		
		
		[Embed(source="../media/pause.mp3")]
		public static const SND_Pause_Letter:Class;
		
		
		
		[Embed(source="../media/score.mp3")]
		public static const SND_Score_Letter:Class;
		
		
		
		[Embed(source="../media/score.mp3")]
		public static const SND_LevelSelect_Letter:Class;
		
		[Embed(source="../media/music.mp3")]
		public static const SND_LevelMusic_Letter:Class;
		
 
		public static var sndPopLetter:Sound = new Sounds.SND_Pop_Letter() as Sound;
		public static var sndPauseGame:Sound = new Sounds.SND_Pause_Letter() as Sound;
		public static var sndScoreGame:Sound = new Sounds.SND_Score_Letter() as Sound;
		public static var sndLevelSelect:Sound = new Sounds.SND_LevelSelect_Letter() as Sound;
		public static var sndLevelMusic:Sound = new Sounds.SND_LevelMusic_Letter() as Sound;
		
		public static var muted:Boolean = false;
	}
}