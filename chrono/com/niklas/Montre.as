package com.niklas
{

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.Font;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;

	public class Montre extends Sprite
	{
		private var rayonMontre:uint;
		private var h:Shape;
		private var m:Shape;
		private var s:Shape;
		private var ms:Shape;
		private var t:TextField;
		private var tf:TextFormat;
		private var mf:Font = new MaFont  ;
		private var stt:Sprite = new Sprite  ;
		private var reset:Sprite = new Sprite  ;
		private var timer:Timer;
		private var launchChrono:Boolean;
		private var launchAiguille:Boolean;
		private var aiguilleChrono:Shape;
		private var _d:Date;
		private var to:uint;




		public function Montre(rayon:uint)
		{

			rayonMontre = rayon;
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);


		}

		private function onAddToStage(e:Event):void
		{
			tf = new TextFormat(mf.fontName,rayonMontre / 5,Math.random() * 0xffffff);

			// cadran
			this.graphics.lineStyle(2,Math.random() * 0xffffff);
			this.graphics.drawCircle(0,0,rayonMontre);
			this.graphics.endFill();

			// aiguilles;
			h = dessineAiguille( -  Math.floor(rayonMontre * .5));
			m = dessineAiguille( -  Math.floor(rayonMontre * .7));
			s = dessineAiguille( -  Math.floor(rayonMontre * .8));
			ms = dessineAiguille( -  Math.floor(rayonMontre * .9));
			aiguilleChrono = dessineAiguille( -  Math.floor(rayonMontre * 1));

			// texte
			t = new TextField  ;
			t.y = rayonMontre + 20;
			t.embedFonts = true;
			t.selectable = false;
			t.autoSize = TextFieldAutoSize.LEFT;
			t.defaultTextFormat = tf;

			// bouton start
			stt.graphics.beginFill(0xff0000);
			stt.graphics.lineStyle(1,0x000000);
			stt.graphics.drawRect(-80,-80,20,20);
			stt.buttonMode = true;



			// bouton stop
			reset.graphics.beginFill(0xff0000);
			reset.graphics.lineStyle(1,0x000000);
			reset.graphics.drawRect(80,-80,20,20);
			reset.buttonMode = true;


			// ajout;
			this.addChild(t);
			this.addChild(h);
			this.addChild(m);
			this.addChild(s);
			this.addChild(stt);
			this.addChild(reset);
			this.addChild(aiguilleChrono);
			this.addChild(ms);

			this.addEventListener(Event.ENTER_FRAME,onMontre);
			stt.addEventListener(MouseEvent.CLICK,startStop);
			reset.addEventListener(MouseEvent.CLICK,resetAiguille);
		}


	

		//start et stop aiguille chrono
		private function startStop(pEvt:MouseEvent):void
		{
			if (!launchChrono)
			{
				launchChrono = true;
				launchAiguille = true;
				to = _d.getSeconds();
			}
			else
			{
				launchAiguille = ! launchAiguille;
			}
		}
		//reset aiguille chrono
		private function resetAiguille(pEvt:MouseEvent):void
		{
			//reset aiguille
			aiguilleChrono.rotation = 0;
			launchAiguille = false;
			launchChrono = false;
		}



		private function onMontre(e:Event):void
		{
			_d = new Date  ;
			var _vh:* = _d.hours;
			var _vm:* = _d.minutes;
			var _vs:* = _d.seconds;
			var _milliSecondes = _d.milliseconds;

			h.rotation = _vh * 30 + _vm / 2;
			m.rotation = _vm * 6 + _vs / 10;
			s.rotation = _vs * 6 + _d.milliseconds / 166;

			if (_vh < 10)
			{
				_vh = "0" + _vh;
			}
			if (_vm < 10)
			{
				_vm = "0" + _vm;
			}
			_vs = _vs < 10 ? "0" + _vs:_vs;
			


			t.text = _vh + " : " + _vm + " : " + _vs;
			t.x =  -  t.width / 2;
			
			if (launchAiguille == true)
		{
			aiguilleChrono.rotation = (_d.getSeconds() - to ) *6;

		}

		}





		private function dessineAiguille(l:int):Shape
		{
			var _ligne:Shape = new Shape  ;
			_ligne.graphics.lineStyle(1,Math.random() * 0xffffff);
			_ligne.graphics.moveTo(0,0);
			_ligne.graphics.lineTo(0,l);
			_ligne.graphics.endFill();
			return _ligne;

		}


		private function onRemoveFromStage(e:Event):void
		{
			this.addEventListener(Event.REMOVED_FROM_STAGE,onMontre);


		}


	}

}