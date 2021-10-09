package com {
	
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import fl.controls.List;
	import fl.data.DataProvider;
	import fl.controls.TextArea;
	
	// metadonnées permettant de changer les parametres du document principal
	[SWF (frameRate="24", width="800", height="480", backgroundColor="#ffcc33")]
	
	public class AlloCine extends MovieClip {
		
		private var fluxData:XML;
		private var listeFilms:List;
		private var ta:TextArea;
		
		public function AlloCine() {
			initFlux("http://rss.allocine.fr/ac/cine/prochainement?format=xml");
		}
		
		private function initFlux(_urlFlux:String):void
		{
			var _l:URLLoader = new URLLoader(new URLRequest(_urlFlux));
			_l.addEventListener(Event.COMPLETE, onComplete);
		}
		
		private function onComplete(_e:Event):void
		{
			fluxData 					= new XML(_e.target.data);
			var nbrItems 				= fluxData..item.length();
			
			var _films	:XML 			= <films></films>;
			for (var _i:uint = 0; _i < nbrItems ; _i++){
				var _t		:String 	= fluxData..item[_i].title;
				var _item	:XML 		= <item/>;
				_item.@label 			= _t;
				_films.appendChild(_item);
			}
			var _dp		:DataProvider 	= new DataProvider(_films);
			listeFilms					= new List();
			listeFilms.dataProvider 	= _dp;
			listeFilms.move(10, 10);
			listeFilms.setSize(320, 240);
			listeFilms.addEventListener(Event.CHANGE, changeHandler);
			this.addChild(listeFilms);
			
			ta							= new TextArea();
			ta.move(360,10);
			ta.setSize(400,400);
			this.addChild(ta);
			
			ta.htmlText = fluxData..item[0].description;
		}
		
		private function changeHandler(_e:Event):void {
				var _lst:List = _e.target as List;
				ta.htmlText = fluxData..item[_lst.selectedIndex].description;
		}
		
	}
	
}
