﻿package com {		import flash.display.MovieClip;	import flash.display.Sprite;	import flash.display.Shape;		import flash.net.URLLoader;	import flash.net.URLRequest;		import flash.media.Sound;	import flash.media.SoundChannel;	import flash.media.SoundTransform;		import flash.events.Event;	import flash.events.MouseEvent;		import fl.controls.List;		import fl.data.DataProvider;			[SWF (frameRate="24", width="270", height="270", backgroundColor="#66CCFF")]		public class JukeBox extends MovieClip {				private var playList		:XML;		private var listMusics		:List;		private var soundPlayer		:Sprite;		private var btSon			:MovieClip;		private var pompe			:Sprite;		private var jauge			:Shape;		private var largeurPompe	:uint			= 250;				private var music			:Sound;		private var piste			:SoundChannel;		private var niveauSon		:SoundTransform = new SoundTransform(.5);		private var positionTete	:Number 		= 0;				public function JukeBox() {			initPlayList();		}		// recupere la playList		private function initPlayList():void		{			var _l:URLLoader = new URLLoader(new URLRequest("ressources/playList.xml"));			_l.addEventListener(Event.COMPLETE, onComplete);		}		// construit la liste selectionnable		private function onComplete(_e:Event):void		{			playList 					= new XML(_e.target.data);			var _nbrItems 				= playList..item.length();						var _musics	:XML 			= <musics></musics>;			for (var _i:uint = 0; _i < _nbrItems ; _i++){				var _t		:String 	= playList..item[_i].title;				var _item	:XML 		= <item/>;				_item.@label 			= _t;				_musics.appendChild(_item);			}			var _dp		:DataProvider 	= new DataProvider(_musics);			listMusics					= new List();			listMusics.dataProvider 	= _dp;			listMusics.move(10, 10);			listMusics.setSize(largeurPompe, 180);			listMusics.addEventListener(Event.CHANGE, changeHandler);			this.addChild(listMusics);			changeHandler();			initPlayer();		}		// detect clic liste		private function changeHandler(_e:Event = null):void		{			if (_e){				var _lst:List	= _e.target as List;				lanceNewSound(playList..item[_lst.selectedIndex].url);			}else{				lanceNewSound(playList..item[0].url);			}		}		// init le player		private function initPlayer():void		{			soundPlayer					= new Sprite();			soundPlayer.y				= 210;			soundPlayer.x				= 10;			btSon						= new SonPlayStop();			btSon.x						= 110;			btSon.addEventListener(MouseEvent.CLICK,lecturePauseSon);			soundPlayer.addChild(btSon);			initPompe();			this.addChild(soundPlayer);		}		// init la pompe du player		private function initPompe():void		{			pompe					= new Sprite();			pompe.graphics.beginFill(0x000000,.1);			pompe.graphics.drawRect(0,0,largeurPompe,10);			pompe.graphics.endFill();			pompe.y					= 30;			soundPlayer.addChild(pompe);			pompe.addEventListener(MouseEvent.CLICK, onClicPompe);			this.addEventListener(Event.ENTER_FRAME, pompeSon);		}		// gestion du clic sur la pompe		private function onClicPompe(e:MouseEvent):void		{			positionTete = music.length * (pompe.mouseX/largeurPompe);			if (btSon.currentFrame == 1) {				piste.stop();				piste = music.play(positionTete);			}else{				pompe.removeChild(jauge);				jauge	= null;				majJauge(positionTete);			}		}		// ecouteur EnterFrame		private function pompeSon(e:Event):void		{			if (jauge ){				pompe.removeChild(jauge);				jauge	= null;			}			majJauge();						// boucle du son			if (piste.position == music.length ){				positionTete = 0;				piste.stop();				piste = music.play(positionTete);			}		}		// mise à jour de la jauge		private function majJauge(_pt:Number = NaN):void		{			var _l:Number 		= _pt ? Math.floor(largeurPompe*(_pt/music.length)) : Math.floor(largeurPompe*(piste.position/music.length));			if (_l){				jauge				= new Shape();				jauge.graphics.beginFill(0xff0000);				jauge.graphics.drawRect(0,0,_l,10);				jauge.graphics.endFill();				pompe.addChild(jauge);			}		}				// lance un son		private function lanceNewSound(_url:String):void		{			if (music){				piste.stop();				music 				= null;				positionTete 		= 0;				btSon.gotoAndStop(1);			}			// si l'enterFrame est arreter le remet en marche lors du lancement d'un nouveau son			!this.hasEventListener(Event.ENTER_FRAME) ? this.addEventListener(Event.ENTER_FRAME, pompeSon) : null ;			music 					= new Sound();			music.load(new URLRequest(_url));			piste 					= music.play(positionTete);			piste.soundTransform 	= niveauSon;		}		// gestion Pause Play		private function lecturePauseSon(e:MouseEvent):void {			if (btSon.currentFrame == 1) {				this.removeEventListener(Event.ENTER_FRAME, pompeSon);				positionTete	    = piste.position;				piste.stop();				btSon.gotoAndStop(2);			} else {				this.addEventListener(Event.ENTER_FRAME, pompeSon);				piste 				= music.play(positionTete);				btSon.gotoAndStop(1);			}					}	}	}