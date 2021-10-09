package 
{

	import flash.display.MovieClip;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;



	public class chargeXmlExterne extends MovieClip
	{

		private var loadXml:URLLoader;
		private var requete:URLRequest;
		private var monXml:XML;
		private var navigation:Sprite;




		public function chargeXmlExterne()
		{
			bouton.addEventListener(MouseEvent.CLICK, onCharge);

		}
		private function monXmlEstCharge(e:Event):void
		{
			monXml = new XML(e.target.data);
			mt.text = monXml;
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
				//bt.name = temp.url + temp.age;
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
			//trace(e.target.name);
			var temp:XML = new XML(e.target.name);
			mt.text = temp;
			navigateToURL(new URLRequest(temp.url));
			/*var t:Array = e.target.name.split("|");
			navigateToURL(new URLRequest(t[0]));*/
		}

		private function onCharge(e:Event):void
		{
			bouton.removeEventListener(MouseEvent.CLICK, onCharge);
			loadXml = new URLLoader();
			requete = new URLRequest("personnes.xml");
			loadXml.load(requete);
			loadXml.addEventListener(Event.COMPLETE, monXmlEstCharge);
		}


	}

}