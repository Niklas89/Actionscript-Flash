﻿ package com {		import flash.display.MovieClip;	import fl.video.FLVPlayback;		public class VideoDynamique extends MovieClip {				private var ecran:FLVPlayback;				public function VideoDynamique() {			ecran = new FLVPlayback();			this.addChild(ecran);			// renseigne la source			ecran.source = "_flv/BLIS.flv";			// ajoute un skin			ecran.skin = "_skin/SkinOverAll.swf";			ecran.skinBackgroundColor = 0xAB99CB;			// **** modification des parametre du skin *****//			ecran.skinBackgroundAlpha = 0.8			ecran.skinAutoHide = true;			// taille du player et positions			ecran.setSize(384,216);			ecran.x = 8;			ecran.y = 8;		}	}}