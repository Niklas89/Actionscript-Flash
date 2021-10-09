﻿package  {
    
    import flash.display.MovieClip;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.events.Event;
    import flash.text.StyleSheet;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    
    
    public class MonTexteStyle extends MovieClip {
        
        private var donneesXML :URLLoader;
        private var adresseXML :URLRequest;
        
        private var donneesCSS :URLLoader;
        private var adresseCSS :URLRequest;
        
        private var monStyle :StyleSheet;
        private var monXml :XML;
        
        private var monTexte :TextField;
        
        
        public function MonTexteStyle() {
            init();
        }
        
        private function init():void
        {
            donneesXML = new URLLoader();
            adresseXML = new URLRequest("ressources/texte.xml");
            donneesXML.load(adresseXML);
            donneesXML.addEventListener(Event.COMPLETE, informationsChargees);
            
            donneesCSS = new URLLoader();
            adresseCSS = new URLRequest("ressources/style.css");
            
            monTexte = new TextField();
            monTexte.x = monTexte.y = 100;
            monTexte.autoSize = TextFieldAutoSize.LEFT;
            this.addChild(monTexte);
        }
        
        private function informationsChargees(e:Event){
            monXml = new XML(e.target.data);
            donneesCSS.load(adresseCSS);
            donneesCSS.addEventListener(Event.COMPLETE, cssChargees);
        }
        
        private function cssChargees(e:Event){
            monStyle = new StyleSheet();
            monStyle.parseCSS(e.target.data);
            monTexte.styleSheet = monStyle;
            monTexte.htmlText = monXml;
        }
    }
    
}