﻿package com {		import flash.display.MovieClip;	import flash.events.MouseEvent;	import fl.video.FLVPlayback;	import fl.video.MetadataEvent;		public class PauseViaCuePoint extends MovieClip {				private var ecran	:FLVPlayback;				public function PauseViaCuePoint() {			ecran = VideoUtils.chargeVideo("_flv/BLIS.flv",384,216,8,8);			addChild(ecran);			btLecture.mouseEnabled = false;			btLecture.alpha = 0.5;			ecran.addASCuePoint(9,"Mise en action du BLIS");			ecran.addASCuePoint(13,"Schema de fonctionnement");			ecran.addASCuePoint(20,"Ne rien faire !!!!");			ecran.addEventListener(MetadataEvent.CUE_POINT,repereAtteint);			btLecture.addEventListener(MouseEvent.MOUSE_DOWN,lireVideo);		}		private function repereAtteint(evt:MetadataEvent) {			if (evt.info.time != 20) {				messageVideo.text = evt.info.name;				btLecture.mouseEnabled = true;				btLecture.alpha = 1;				ecran.pause();				btLecture.buttonMode = true;			}		}		private function lireVideo(evt:MouseEvent) {			messageVideo.text="";			btLecture.mouseEnabled = false;			btLecture.alpha = 0.5;			ecran.play();		}	}	}