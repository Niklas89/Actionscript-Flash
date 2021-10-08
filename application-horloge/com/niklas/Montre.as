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

	public class Montre extends Sprite
	{
		private var rayonMontre:uint;
		private var h:Shape;
		private var m:Shape;
		private var s:Shape;
		private var t:TextField;
		private var tf:TextFormat;
		private var mf:Font = new MaFont();
		
		
		public function Montre(rayon:uint)
		{
			
			rayonMontre = rayon;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);


		}

		private function onAddToStage(e:Event):void
		{
			tf = new TextFormat(mf.fontName,rayonMontre/5,Math.random()*0xffffff);
			
			// cadran
			this.graphics.lineStyle(2,Math.random()*0xffffff);
			this.graphics.drawCircle(0,0,rayonMontre);
			this.graphics.endFill();
			
			// aiguilles
			h = dessineAiguille(-Math.floor(rayonMontre*.5));
			m = dessineAiguille(-Math.floor(rayonMontre*.7));
			s = dessineAiguille(-Math.floor(rayonMontre*.8));
			
			// texte
			t = new TextField();
			t.y = rayonMontre+20;
			t.embedFonts = true;
			t.selectable = false;
			t.autoSize = TextFieldAutoSize.LEFT;
			t.defaultTextFormat = tf;
			
			// ajout
			this.addChild(t);
			this.addChild(h);
			this.addChild(m);
			this.addChild(s);
			
			this.addEventListener(Event.ENTER_FRAME, onMontre);
		}
		
		private function onMontre(e:Event):void{
			var _d:Date = new Date();
			var _vh :* = _d.hours;
			var _vm:* = _d.minutes;
			var _vs:* = _d.seconds;
			
			h.rotation = _vh*30 + _vm/2;
			m.rotation = _vm*6 + _vs/10;
			s.rotation = _vs*6 + _d.milliseconds/ 166;
			
			if (_vh < 10) _vh = "0" + _vh;
			if (_vm < 10) {_vm = "0" + _vm;}
			_vs = _vs < 10 ? "0" + _vs : _vs;
			
			t.text = _vh + " : " + _vm+" : " + _vs;
			t.x = -t.width / 2;
			
		}
		
		
		private function dessineAiguille(l:int):Shape {
			var _ligne:Shape = new Shape();
			_ligne.graphics.lineStyle(1,Math.random()*0xffffff);
			_ligne.graphics.moveTo(0,0);
			_ligne.graphics.lineTo(0,l);
			_ligne.graphics.endFill();
			return _ligne;
			
		}
		

		private function onRemoveFromStage(e:Event):void
		{
			this.addEventListener(Event.REMOVED_FROM_STAGE, onMontre);


		}


	}

}

