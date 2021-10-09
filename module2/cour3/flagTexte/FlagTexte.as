package  {
	
		import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	import flash.filters.*;
	
	public class FlagTexte extends MovieClip {
		
		private var conteneurStar:MovieClip = new MovieClip();
		private var conteneurTexte:MovieClip = new MovieClip();
		private var titre:TextField;
		private var imageGris:BitmapData;
		private var filtreDeplaccement:DisplacementMapFilter;
		
		
		public function FlagTexte() {
			initFond();
			initStars(12,180);
			initTexte();
			initFiltre();
		}
		
		private funciton initFond():void
		{
			var loader:Loader = new Loader();
			loader.load(newURLRequest("img/fondBleu.jpg"));
			this.addChild(loader);
		}
		
		private function initStars(nbrStar:uint,diamCercle:uint):void
		{
			for (var i:uint = 0 ; i<360 ; i += (360/nbrStar)){
				var _s:MovieClip = new Star();
				_s.x = Math.sin(Math.PI*i/180) * diamCercle;
				_s.y = Math.cos(Math.PI*i/180) * diamCercle;
				conteneurStar.addChild(_s);
				
			}
			conteneurStar.x = stage.stageWidth/2;
			conteneurStar.y = stage.stageHeight/2;
			this.addChild(conteneurStar);
			
		}
		
	}
	
}
