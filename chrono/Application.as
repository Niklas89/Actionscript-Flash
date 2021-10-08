package 
{

	import flash.display.MovieClip;
	import com.niklas.Montre;
	import flash.events.TimerEvent;
	import flash.utils.Timer;


	public class Application extends MovieClip
	{
		private var m:Montre;
		private var t:Timer;
		private var i:uint;

		public function Application()
		{
			t = new Timer(5000);
			t.start();
			t.addEventListener(TimerEvent.TIMER, onTime);
			onTime();
		}

		private function onTime(e:TimerEvent = null ):void
		{
			if (++i >= 6) this.removeChildAt(0);
			var r:uint = Math.floor(Math.random() * 50 + 50);
			m = new Montre(r);
			m.x = Math.floor(Math.random()*(stage.stageWidth-(r*2))+r);
			m.y = Math.floor(Math.random()*(stage.stageHeight-(r*2))+r);
			this.addChild(m);
		}
	}

}