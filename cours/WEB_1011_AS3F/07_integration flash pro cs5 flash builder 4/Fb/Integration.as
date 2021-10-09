package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Integration extends Sprite
	{
		private var cmc:Tete;
		private var tempo:Timer;
		private var lstage,hstage:uint;
		private var plateau:Sprite;
		
		public function Integration()
		{	
			lstage 	= stage.stageWidth;
			hstage 	= stage.stageHeight;
			plateau	= new Sprite();
			tempo 	= new Timer(2000);
			tempo.addEventListener(TimerEvent.TIMER,creationTete);
			tempo.start();
			this.addChild(plateau);
			creationTete();
		}
		private function  creationTete(p:TimerEvent = null):void
		{
			var _mc:MovieClip 	= new MovieClip();
			var _numImage:uint	= Math.floor(Math.random()*5)+1;
			cmc 				= new Tete();
			_mc					= cmc;
			_mc.mouseChildren	= false;
			_mc.gotoAndStop(_numImage);
			_mc.x				= Math.floor(Math.random()*(lstage - _mc.width) + _mc.width/2);
			_mc.y				= Math.floor(Math.random()*(hstage - _mc.height) + _mc.height/2);
			_mc.addEventListener(MouseEvent.CLICK, effaceTete);
			plateau.addChild(_mc);
		}
		private function effaceTete(p:MouseEvent):void
		{
			var _refreshTeteTempo:uint 	= Math.floor(Math.random()*2);
			_refreshTeteTempo == 0 ? creationTete() : null;
			plateau.removeChild(p.target as MovieClip);
			
		}
	}
}