﻿package com {		import flash.display.MovieClip;	import fl.video.FLVPlayback;	import fl.video.VideoEvent;		public class Jauge extends MovieClip {				private var ecran		:FLVPlayback;				public function Jauge() {			ecran = VideoUtils.chargeVideo("_flv/BLIS.flv",384,216,8,8);			addChild(ecran);						ecran.playheadUpdateInterval = 10;			ecran.addEventListener(VideoEvent.PLAYHEAD_UPDATE,miseAJourJauge);			ecran.addEventListener(VideoEvent.COMPLETE,lectureTerminee);		}				private function miseAJourJauge(evt:VideoEvent) {			jaugeLecture.scaleX = ecran.playheadTime/ecran.totalTime;		}								private function lectureTerminee(evt:VideoEvent) {			jaugeLecture.scaleX = 0;		}	}	}