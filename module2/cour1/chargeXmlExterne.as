package  {
	
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	
	public class chargeXmlExterne extends MovieClip {
		
		private var loadXml:URLLoader;
		private var requete:URLRequest;
		private var monXml:XML;
		
/*		private var mc:MovieClip;
		private var mt:TextField;
*/

		
		public function chargeXmlExterne() {
			bouton.addEventListener(MouseEvent.CLICK, onClick);
		
		}
		private function monXmlEstCharge(e:Event):void{
			monXml = new XML(e.target.data);
			mt.text = monXml;
		}
		private function onClick(e:Event):void{
			bouton.removeEventListener(MouseEvent.CLICK, onClick);
			loadXml = new URLLoader();
			requete = new URLRequest("personnes.xml");
			loadXml.load(requete);
			loadXml.addEventListener(Event.COMPLETE, monXmlEstCharge);
		}
		
	}
	
}/*
import flash.net.URLLoader;
import flash.events.Event;
import flash.display.SimpleButton;

public funciton ChargeXML(){
		monBouton.addEventListener(MouseEvent.CLICK, onURL);
		monTexte.text="ICI le contenu XML chargé: \n";
}

private function

public function chargeXML(u:String):void 
var chargeur: URLLOader= new URLLoader();
var format:String=URLLoaderDataFormat.TEXT;
chargeur.dataFormat=format;
chargeur.load(new >URLRequest(u));
chargeur.addEvent(event.COMPLETE, finChargement);
chargeur.addEv(ProgresssEvent.PROGRESS, onProgress);
chargeur.addEventListener(IOErrorEvent.IO_ERROR, onErreur);
}

private function finChargement(e:Event):void{
	monXML = new XML(e.target.data);
	monTexte.text = monXML.toString();
	initNavigation();
}

private function createBouton(monLabel:String="Mon Bouton"):SimpleButton {
	var simpleButton:SimpleButton=new SimpleButton();
	simpleButton.upState = new DessineRectangle(0xFF0000,monLabel);
	simpleButton.overState = new DessineRectangle(0x00FF00,monLabel);
	simpleButton.downState = new DessineRectangle(0x0000FF,monLabel);
	simpleButton.hitTestState = new DessineRectangle(0xFF0000,monLabel);
	simpleButton.useHandCursor=true;
	return simpleButton;
}

private funciton onProgress
*/