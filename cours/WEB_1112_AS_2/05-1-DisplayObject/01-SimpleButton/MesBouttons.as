﻿package {	import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.display.SimpleButton;		import com.lionelUtils.DessineRectangle;	//import flash.events.Event;		public class MesBouttons extends Sprite {				private var navigation			:Sprite;				public function MesBouttons() {			init();		}		private function init():void {			// instance du sprite ou se trouveront les boutons			navigation 								= new Sprite();			// ecoute le clic sur ce sprite			navigation.addEventListener(MouseEvent.CLICK, onClick);			// j'ajoute le sprite à la liste d'affichage			this.addChild(navigation);			// boucle qui créer la barre de navigation			for (var i:uint = 0 ; i < 4 ; i++ ){				var monBoutton	:SimpleButton 		= createBouton("Chapitre " + (i+1).toString());				monBoutton.name 					= "b_" + i;				monBoutton.x 						= navigation.width > 0 ? navigation.width + 10 : 0;				navigation.addChild(monBoutton);			}						function onClick(e:MouseEvent):void{				trace("Je viens de cliquer sur le nouton # : " + (Number(e.target.name.split("_")[1]) + 1));			}						navigation.x 							= (stage.stageWidth - navigation.width) /2;			navigation.y 							= stage.stageHeight - navigation.height - 10;		}				private function createBouton(monLabel:String = "Mon Bouton"):SimpleButton {			var simpleButton	:SimpleButton 		= new SimpleButton();			simpleButton.upState					= new DessineRectangle(0xFF0000,monLabel);			simpleButton.overState					= new DessineRectangle(0x00FF00,monLabel);			simpleButton.downState					= new DessineRectangle(0x0000FF,monLabel);			simpleButton.hitTestState				= new DessineRectangle(0xFF0000,monLabel);			simpleButton.useHandCursor				= true;			return simpleButton;		}	}}