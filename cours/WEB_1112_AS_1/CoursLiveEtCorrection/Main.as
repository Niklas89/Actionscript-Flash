﻿package  {		import flash.display.MovieClip;	import flash.display.Sprite;	import com.lionel.Poisson;	import com.lionel.Outils;	import flash.text.TextField;			public class Main extends MovieClip {				private var horloge 	:Sprite;		private var poisson		:Poisson;		private var outils		:Outils   	= new Outils();		private var monTexte	:TextField 	= new TextField();				public function Main() {			deposeHorloge();			deposeMonTexte();			deposePoisson();		}		private function deposeMonTexte():void		{			monTexte.autoSize 	= "left";			monTexte.selectable	= false;			monTexte.text 		= "7 x 7 = " + outils.mettreAuCarre(7);			monTexte.x			= stage.stageWidth / 2 - monTexte.width / 2;			monTexte.y			= stage.stageHeight / 2;			this.addChild(monTexte);		}				private function deposePoisson():void		{			poisson							= new Poisson();			poisson.x = horloge.x;			poisson.y = horloge.y;			this.addChild(poisson);		}		private function deposeHorloge():void		{			horloge							= new Sprite();			horloge.x						= stage.stageWidth / 2;			horloge.y						= stage.stageHeight / 2;			this.addChild(horloge);			horloge.graphics.lineStyle(2,0x000000);			horloge.graphics.drawCircle(0,0,150);		}	}	}