package  com.niklas{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Poisson extends MovieClip {
		
		private var parentObject:Object;
		
		public function Poisson(p:Object, px:uint, py:uint) {
			parentObject = p;
			
			this.x = px;
			this.y = py;
			p.addChild(this);
			this.addEventListener(Event.ENTER_FRAME, loop);
			
		}
		
		private function loop(e:Event):void {
			this.x += this.mouseX / 16;
			this.y += this.mouseY /5;
		}
		
	}
	
}
