package  {
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.*;
	
	
	public class MonTextField extends MovieClip {
		
		private var monTexte:TextField;
		private var maFont:Font;
		
		public function MonTextField() {
			maFont = new MaCopGot();
			init();
		}
		
		private function init():void{
			
			monTexte = new TextField();
			monTexte.autoSize = TextFieldAutoSize.LEFT;
			monTexte.selectable = false;
			monTexte.multiline = true;
			monTexte.background = true;
			monTexte.backgroundColor = 0x0000FF;
			monTexte.embedFonts = true;
			monTexte.alpha = 0.6;
			monTexte.antiAliasType = AntiAliasType.ADVANCED;
			monTexte.thickness = 200;
			
			
			var format:TextFormat = new TextFormat();
			format.font = maFont.fontName;
			format.color = 0xFFFFFF;
			format.size = 20;
			monTexte.defaultTextFormat = format;
			monTexte.htmlText = "Bonjour a tous<br />Comment allez vous<br />en cette belle fin de journée ?";
			monTexte.x = monTexte.y = 100;
			addChild(monTexte);
			
			var happy :Happy = new Happy();
			// en argument le numero de la ligne
			var indexLigne :uint = 1;
			var metrics:TextLineMetrics = monTexte.getLineMetrics(indexLigne);
			var numLines:uint = monTexte.numLines;
			var hLigneRatio:Number = monTexte.height/numLines;
			happy.x = monTexte.x + metrics.width + 10;
			// happy.x = monTexte.x + monTexte.width + 10;
			happy.y = monTexte.y + (hLigneRatio*indexLigne);
			addChild(happy);
		}
	}
	
}
