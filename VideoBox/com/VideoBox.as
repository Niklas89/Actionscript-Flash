package com
{

	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Loader;
	
	import flash.text.TextField;
	
	import fl.video.FLVPlayback;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class VideoBox extends MovieClip
	{

		var img_largeur:Number;
		var img_hauteur:Number;
		var imgs_x:Number;
		var imgs_y:Number;
		var video_x:Number;
		var video_y:Number;
		var mes_videos:XMLList;
		var mon_total:Number;

		var main_conteneur:Sprite;
		var imgs:Sprite;
		var titres:Sprite;
		var mon_lecteur:FLVPlayback;

		public function VideoBox()
		{
			var monXMLLoader:URLLoader = new URLLoader();
			monXMLLoader.load(new URLRequest("ressource/playlist.xml"));
			monXMLLoader.addEventListener(Event.COMPLETE, chargeXML);
		}
		// charge le XML
		function chargeXML(e:Event):void
		{
			var monXML:XML = new XML(e.target.data);

			img_largeur = monXML. @ IMG_LARGEUR;
			img_hauteur = monXML. @ IMG_HAUTEUR;
			imgs_x = monXML. @ IMGS_X;
			imgs_y = monXML. @ IMGS_Y;
			video_x = monXML. @ VIDEO_X;
			video_y = monXML. @ VIDEO_Y;
			mes_videos = monXML.VIDEO;
			mon_total = mes_videos.length();

			creerConteneurs();
			appelImgs();
			creerLecteur();
		}

		// creer les conteneurs des images et des titres
		function creerConteneurs():void
		{
			main_conteneur = new Sprite();
			addChild(main_conteneur);

			imgs = new Sprite();
			imgs.addEventListener(MouseEvent.CLICK, lireVideo);
			imgs.addEventListener(MouseEvent.MOUSE_OVER, passerSourie);
			imgs.addEventListener(MouseEvent.MOUSE_OUT, enleverSourie);
			imgs.x = imgs_x;
			imgs.y = imgs_y;
			imgs.buttonMode = true;
			main_conteneur.addChild(imgs);

			titres = new Sprite();
			titres.x = imgs_x;
			titres.y = imgs_y;
			main_conteneur.addChild(titres);
		}
	
		// appel des images et des titres
		function appelImgs():void
		{
			for (var i:Number = 0; i < mon_total; i++)
			{

				var img_url = mes_videos[i]. @ IMG;
				var img_chargeur = new Loader();
				img_chargeur.name = i;
				img_chargeur.load(new URLRequest(img_url));
				img_chargeur.contentLoaderInfo.addEventListener(Event.COMPLETE, imgCharger);
				img_chargeur.y = (img_hauteur+10)*i;

				var img_titre = mes_videos[i]. @ TITRE;
				var titre_txt:TextField = new TextField();
				titre_txt.text = img_titre;
				titre_txt.y = img_chargeur.y;
				titre_txt.x = img_largeur + 10;
				titre_txt.width = img_largeur;
				titre_txt.height = img_hauteur;
				titre_txt.wordWrap = true;
				titres.addChild(titre_txt);


			}
		}

		// quand l'image est chargée on l'ajoute
		function imgCharger(e:Event):void
		{
			var mon_img:Loader = Loader(e.target.loader);
			imgs.addChild(mon_img);
		}

		// creer le lecteur
		function creerLecteur():void
		{
			mon_lecteur = new FLVPlayback();
			mon_lecteur.skin = "_skin/SkinOverPlaySeekMute.swf";
			mon_lecteur.skinBackgroundColor = 0xAEBEFB;
			mon_lecteur.skinBackgroundAlpha = 0.5;

			mon_lecteur.x = video_x;
			mon_lecteur.y = video_y;
			mon_lecteur.width = 480;
			mon_lecteur.height = 270;

			main_conteneur.addChild(mon_lecteur);
			mon_lecteur.source = mes_videos[0]. @ URL;
		}

		// lire la video
		function lireVideo(e:MouseEvent):void
		{
			var video_url = mes_videos[e.target.name]. @ URL;
			mon_lecteur.source = video_url;
		}

		// quand on passe la sourie sur l'image elle devient un peu transparente
		function passerSourie(e:MouseEvent):void
		{
			var mon_img:Loader = Loader(e.target);
			mon_img.alpha = 0.5;
		}
		
		// quand on enlève la sourie de l'image elle redevient normale
		function enleverSourie(e:MouseEvent):void
		{
			var mon_img:Loader = Loader(e.target);
			mon_img.alpha = 1;
		}
	}

}