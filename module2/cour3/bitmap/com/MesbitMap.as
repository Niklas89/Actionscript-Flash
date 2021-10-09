package com {
	
/*	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import flash.display.BitmapData;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;*/
	
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	import flash.filters.*;
	import flash.geom.Point;
	
	
	public class MesbitMap extends MovieClip {
		
		private var bitmapSrc:Bitmap;
		private var imageGris:BitmapData;
		private var loader:Loader;
		private var logo:MovieClip;
		private var znTexte:MovieClip;
		private var maFont:Font;
		private var monTexte:TextField;
		private var monFormat:TextFormat;
		
		private var texteTS:String = "Institut de l'Internet \net du Multimédia";
		
		public function MesbitMap() {
			//chargement et affichage du teeShirt
			var loader: Loader = new Loader();
			loader.load(new URLRequest("img/T-Shirt.png"));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event){addChild(e.target.content);
													  initContenu();
													  });
		}
		
		
		private function initContenu():void 
		{
			loader = new Loader();
			loader.load(new URLRequest("img/logo.png"));
			//loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onProgress);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, addLogo);
		}
		private function addLogo(e:Event):void
		{
			logo = new MovieClip();
			logo.x = 225;
			logo.y = 110;
			logo.addChild(e.target.content);
			this.addChild(logo);
			
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, addLogo);
			
			loader.load(new URLRequest("img/echelleDeGris.jpg"));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, addFiltreEtTexte);
			
		}
		
		private function addFiltreEtTexte(e:Event):void
		{
			maFont = new MonArialBlack();
			monFormat = new TextFormat(maFont.fontName,26,0xFF0000,null,null,null,null,null,"left");
			monTexte = new TextField();
			monTexte.type = "input";
			monTexte.width = 200;
			monTexte.height = 250;
			monTexte.multiline = true;
			monTexte.wordWrap = true;
			monTexte.selectable = false;
			monTexte.embedFonts = true;
			monTexte.defaultTextFormat = monFormat;
			monTexte.text = texteTS.toLocaleUpperCase();
			
			//un movie clip qui contiendra le texte
			znTexte = new MovieClip();
			znTexte.addChild(monTexte);
			znTexte.x = 135;
			znTexte.y = 225;
			this.addChild(znTexte);
			
			//creation du filtre
			bitmapSrc = e.target.content;
			imageGris = bitmapSrc.bitmapData;
			
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, addFiltreEtTexte);
			loader = null;
			
			var filtreDeplacement:DisplacementMapFilter = new DisplacementMapFilter(imageGris, new Point(0,0),2,2,15,10,DisplacementMapFilterMode.COLOR)
																					 
																			
			// application du filtre de déplacement
			logo.filters = [filtreDeplacement];
			znTexte.filters = [filtreDeplacement];
			
		}
		
		
		
		
	}
	
}
