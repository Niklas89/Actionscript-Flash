﻿package com.niklas {		import flash.events.Event;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.events.IOErrorEvent;		public class XmlImport {				private var xmldata				:XML;		private var pParentObject		:Object;		private var pCallBackFunction	:String;				public function XmlImport(aParentObject:Object, aXmlFile:String, aCallBackFunction:String) {						pParentObject 			= aParentObject;			pCallBackFunction		= aCallBackFunction;						xmldata 				= new XML();			var xmlLoader:URLLoader = new URLLoader(new URLRequest(aXmlFile));			xmlLoader.addEventListener(Event.COMPLETE, xmlLoaded);			xmlLoader.addEventListener(IOErrorEvent.IO_ERROR,xmlLoadError);		}				private function xmlLoaded(e:Event) {			xmldata  				= XML(e.target.data);			pParentObject[pCallBackFunction](xmldata);		}				private function xmlLoadError(e:IOErrorEvent) {			trace(e.text);		}	}}