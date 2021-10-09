package  {
	
	import flash.display.MovieClip;
	
	
	public class RecapXML extends MovieClip {
		
		private var employees:XML;
		
		public function RecapXML() {
			
			employees = 
				<xxxx>
					<employee ssn="123-123-1234">
						<name first="John" last="Doe" />
						<address>
							<street>11Main st.</street>
							<city>San Francisco</city>
							<state>CA</state>
							<zip>98765</zip>
						</address>
					</employee>
					<employee ssn="789-789-7890">
						<name first="Mary" last="Roe" />
						<address>
							<street>99 Broad St.</street>
							<city>Newton</city>
							<state>MA</state>
							<zip>01234</zip>
						</address>
					</employee>
				</xxxx>;
				
				XMLExemple();
		}
		private function XMLExemple():void {
			/*trace(employees.employee[0].address.zip);//98765
			trace(employees.employee[1].@ssn); //789-789-7890
			
			var monXml:XMLList = employees.employee.name;
			trace(monXml[0].@first);
			// <name first="John last="Doe" />
			// <name first="Mary" last=Roe" />
			
			trace(employees..zip[0]); //98765
			
			trace(employees..@ssn[1]); // 789-789-7890
			
			trace(employees..name);
			
			var monXml:XMLList = employees.employee[0].address.*;
				  trace(monXml[3]);
				  
			var node:String = "zip";
			trace(employees.employee[0].address[node]);
			
			var attribute:String = "ssn";
			trace(employees.employee[1].@[attribute]);
			
			for each (var num:XML in employees..@ssn) {
				trace(num);
			}*/
			
			
			var ssnToFind:String = "789-789-7890";
			trace(employees.employee.(@ssn == ssnToFind).toXMLString());
			
			
				
			
			
		}
	}
	
}
