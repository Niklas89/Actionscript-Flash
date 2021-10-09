package  {
	
	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.events.TextEvent;

	
	public class ChargeRssNew extends MovieClip {
		
		private var loadXml:URLLoader;
		private var requete:URLRequest;
		private var monXml:XML;
		private var monFlux:XML;
		private var navigation:Sprite;
		
		public function ChargeRssNew() {
			loadXml = new URLLoader();
			requete = new URLRequest("personnes.xml");
			loadXml.load(requete);
			loadXml.addEventListener(Event.COMPLETE, monXmlEstCharge);
		}
		
		private function monXmlEstCharge(e:Event):void
		{
			monXml = new XML(e.target.data);
			//resume.text = monXml;
			initNavigation();
		}
		
		
		private function initNavigation():void
		{
			navigation = new Sprite();
			this.addChild(navigation);
			navigation.addEventListener(MouseEvent.CLICK, onClic);

			for each (var temp:XML in monXml.users..user)
			{
				var bt:Sprite = new Sprite();
				bt.name = temp;
				var t:TextField = new TextField();
				t.text = temp.@pseudo;
				t.autoSize = TextFieldAutoSize.LEFT;
				t.selectable = false;
				t.mouseEnabled = false;
				bt.graphics.beginFill(0xFF0000);
				bt.graphics.drawRoundRect(0,0,t.width+10, t.height+10,15,15);
				bt.graphics.endFill();
				t.x = t.y = 5;
				bt.addChild(t);
				bt.x = navigation.width == 0 ? 0:navigation.width + 10;
				navigation.addChild(bt);
				navigation.x = (stage.stageWidth - navigation.width)/2;
				navigation.y = stage.stageHeight - navigation.height - 10;
			}
		}

		private function onClic(e:MouseEvent):void
		{
			var temp:XML = new XML(e.target.name);
			//resume.text = temp;
			var l:URLLoader = new URLLoader();
			var r:URLRequest = new URLRequest(temp.url);
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
