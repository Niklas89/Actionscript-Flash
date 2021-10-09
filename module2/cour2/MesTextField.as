package  {
	
	import flash.display.MovieClip;
	/*import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;*/
	import flash.text.*;
	
	
	public class MesTextField extends MovieClip {
		
		private var contenuTexte:String = "Bonjour à tous!";
		private var maFont:Font;
		
		public function MesTextField() {
			maFont = new MaCopGot();
			init();
		}
		
		private function init():void
		{
			//texte une ligne
			creationTexte(50,50,true,true,0,0,false,false,contenuTexte);
			//texte Largeur Fize
			creationTexte(50,100,true,true,100,0,true,false,contenuTexte);
			//texte dams une boite
			creationTexte(200,100,true,false,100,150,true,true,contenuTexte);
			//Ici le texte est positionné en fonction de sa taille
			/* var monTitre:TextField = creationTexte2(false,true,0,0,false,false,"Titre");
			monTitre.x = (stage.stageWidth - monTitre.width)/2;
			monTitre.y = 10;
			addChild(monTitre); */
			
		}
		private function creationTexte(px:uint,py:uint,multi:Boolean,autoS:Boolean,l:uint,h:uint,ww:Boolean,select:Boolean,s:String="Texte"):void
		{
			var monTexte:TextField = new TextField();
			autoS ? monTexte.autoSize = TextFieldAutoSize.LEFT  :null;
			monTexte.selectable = select;
			monTexte.multiline = multi;
			monTexte.background = true;
			monTexte.backgroundColor = 0x0000FF;
			monTexte.embedFonts = true;
			monTexte.alpha = 0.8;
			monTexte.antiAliasType = "advanced";
			monTexte.thickness = 0;
			l !=0 ? monTexte.width = l:null;
			h !=0 ? monTexte.height = h:null;
			monTexte.wordWrap = ww;
			monTexte.x = px;
			monTexte.y = py;
			var format:TextFormat = new TextFormat();
			format.font = maFont.fontName;
			format.color = 0xFFFFFF;
			format.size = 20;
			monTexte.defaultTextFormat = format;
			monTexte.htmlText = s;
			addChild(monTexte);
		}
		
	}
	
}
