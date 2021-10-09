package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class MonIntegration extends Sprite
	{
		
		private var _ball:Cercle;
		
		public function MonIntegration()
		{
			_ball  = new Cercle();
			
			_ball.addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			this.addChild(_ball);
			
		}
		
		private function onAdded(pEvt:Event):void
		{
			this._ball.x = stage.stageWidth / 2;
			this._ball.y = stage.stageHeight / 2;
		}
	}
}