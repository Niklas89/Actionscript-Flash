﻿package com{	import flash.display.Sprite;	/*import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;	import flash.text.TextLineMetrics;	import flash.text.AntiAliasType;*/	import flash.text.*;	public class MesTextField extends Sprite	{		private var contenuTexte :String  = "Bonjour à tous<br/>comment allez vous, en cette belle journée d'hiver ?"				public function MesTextField()		{			init();		}				private function init():void		{			//texte Une Ligne;			creationTexte(50,50,false,true,0,0,false,false,contenuTexte);			// texte Largeur Fixe			creationTexte(50,90,true,true,100,0,true,false,contenuTexte);			//texte dans une Boite			creationTexte(200,90,true,false,100,150,true,true,contenuTexte);						var monTitre	:TextField  = creationTexte2(false,true,0,0,false,false,"Titre");			monTitre.x					= (stage.stageWidth - monTitre.width)/2 ;			monTitre.y					= 10;			addChild(monTitre);		}		private function creationTexte(px:uint,py:uint,multi:Boolean,autoS:Boolean,l:uint,h:uint,ww:Boolean,select:Boolean,s:String = "Mon texte"):void		{			var monTexte : TextField 	= new TextField();			autoS ? monTexte.autoSize 	= TextFieldAutoSize.LEFT : null;			monTexte.selectable			= select;			monTexte.multiline 			= multi;			monTexte.background 		= true;			monTexte.embedFonts 		= true;			monTexte.antiAliasType 		= AntiAliasType.ADVANCED;			monTexte.thickness 			= 200;			monTexte.backgroundColor 	= 0x0000FF;			monTexte.alpha 				= 0.6;			l != 0 ? monTexte.width		= l : null;			h != 0 ? monTexte.height	= h : null;			monTexte.wordWrap			= ww;			monTexte.x					= px;			monTexte.y					= py;			var format	:TextFormat 	= new TextFormat();			format.font 				= "Ayuthaya";			format.color 				= 0xFFFFFF;			format.size 				= 20;			monTexte.defaultTextFormat 	= format;			monTexte.htmlText 			= s;			addChild(monTexte);		}				private function creationTexte2(multi:Boolean,autoS:Boolean,l:uint,h:uint,ww:Boolean,select:Boolean,s:String = "Mon texte"):TextField		{			var monTexte : TextField 	= new TextField();			autoS ? monTexte.autoSize 	= TextFieldAutoSize.LEFT : null;			monTexte.selectable			= select;			monTexte.multiline 			= multi;			monTexte.background 		= true;			monTexte.embedFonts 		= true;			monTexte.antiAliasType 		= AntiAliasType.ADVANCED;			monTexte.thickness 			= 200;			monTexte.backgroundColor 	= 0x0000FF;			monTexte.alpha 				= 0.6;			l != 0 ? monTexte.width		= l : null;			h != 0 ? monTexte.height	= h : null;			monTexte.wordWrap			= ww;			var format	:TextFormat 	= new TextFormat();			format.font 				= "Ayuthaya";			format.color 				= 0xFFFFFF;			format.size 				= 20;			monTexte.defaultTextFormat 	= format;			monTexte.htmlText 			= s;			return monTexte;		}	}}