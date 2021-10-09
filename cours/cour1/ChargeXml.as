package  {
	
	import flash.display.MovieClip;
	
	
	public class ChargeXml extends MovieClip {
		
		
		public function ChargeXml() {
			// la classe XML creer un objet natif
			// pas utilie de mettre des ""
			
			/*var monXML1:XML = <document>
			<noeud nom="Pierre" />
			<noeud nom="Jacques" />
			<utilisateurs>
				<utilisateur>"Valeria"</utilisateur>
				<utilisateur>"Patricia"</utilisateur>
			</utilisateurs>
			</document>
			trace(monXML1);*/
			
			/*var monXML2:XML = new XML(<document><noeud> Pierre</noeud></document>);
			trace(monXML2)*/
			
			/*var xml1:XML = <utilisateurs><personne nom="pierre" age="25" /></utilisateurs>;
			trace(xml1.personne.@nom);
			trace(xml1.personne.@age);*/
			
			/*var xml2:XML = <personnes>
					<personne nom="Lionel" />
					<toto>
						<personne nom="Pierre" />
						<personne nom="Hervé" />
						<personne nom="Michel" />
					</toto>
				</personnes>
				
			for(var i:String in xml2..personne){
				// i est un itérateur de type String "0", "1", "2"
				trace(i,xml2..personne[i].@nom);
			}*/
			
			/*var xml3:XML = <xxx>
				<utlisateurs>
					<personnes>
						<personne nom="Pierre" />
						<personne nom="Hervé" />
						<personne nom="Michel" />
					</personnes>
					</utlisateurs>
					<clients>
						<personnes>
							<personne nom="Jean" />
							<personne nom="Luc" />
							<personne nom="Paul" />
						</personnes>
				</clients>
				</xxx>;
				
			for each(var pers:XML in xml3..clients..personne){
				// i est un itérateur de type String "0", "1", "2"
				trace(pers.@nom);
			}*/
			
			var xml4:XML = <utilisateurs>
				<utilisateur>
					<personne nom="Pierre" age="25" />
				</utilisateur>
				</utilisateurs>;
				
			var nom:String = "Michel";
			var nouvelUtilisateur:XML = <personne nom={nom} age="50" />;
			xml4.utilisateur.appendChild(nouvelUtilisateur);
			
			trace(xml4);
			
			
		}
	}
	
}
