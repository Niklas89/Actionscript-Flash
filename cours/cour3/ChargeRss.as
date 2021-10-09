﻿package  {
	
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.events.MouseEvent;
	
	
	public class ChargeRss extends MovieClip {
		
		private var monFlux:XML;
		
		public function ChargeRss() {
			var l:URLLoader = new URLLoader();
			var r:URLRequest = new URLRequest("http://feeds.feedburner.com/frandroid");
			l.load(r);
			l.addEventListener(Event.COMPLETE, onComplete);
			
		}
		
		
		private function onComplete(e:Event):void {
			
			var i:uint = 0;
			monFlux = new XML(e.target.data);
			titreFlux.text = monFlux..title[0];
			trace("*****************");
			
			for each(var tp:XML in monFlux..item) {
			lesTitres.htmlText += "<a href='event:" + i +"'>" + tp..title + "</a><br />";
			i++;
			}
			
			lesTitres.addEventListener(TextEvent.LINK, detectLien);
			detectLien();
			/*lesTitres.addEventListener(MouseEvent.CLICK, detectLigne);
			detectLigne();*/
		
		}
		
		private function detectLien(e:TextEvent = null):void
		{
			var num :int = e ? Number(e.text):0;
				afficheArticle(num);
		}
		
		private function afficheArticle(n:int):void
		{
			var monXml:XML = monFlux..item[n];
			var link:String = monXml.toString().split("<feedburner:origLink>")[1].split("</feedburner:origLink>")[0];
			resume.htmlText = monXml.description+"<br /><br /><a href='"+link+"'>Aller à l'article original</a>";
			titreEnCours.text = monXml.title;
			article.htmlText = monXml.toString().split("<![CDATA[")[1].split("]]>")[0];
		}
		
	}
	
}