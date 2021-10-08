package  {
	
	import flash.display.MovieClip;
	import com.niklas.Poisson;
	import com.niklas.Outils;
	
	
	public class Main extends MovieClip {
		
		private var poisson:Poisson;
		private var outils:Outils = new Outils();
		
		public function Main() {
			poisson = new Poisson(this,stage.stageWidth/2,stage.stageHeight/2);
			trace(outils.mettreAuCarre(7));
		}
	}
	
}
