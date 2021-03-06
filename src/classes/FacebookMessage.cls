//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class FacebookMessage {
	public String id {get;set;}
	public From_Z from_z {get;set;}
	public String message {get;set;}
	public String created_time {get;set;}

	public FacebookMessage(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'id') {
						id = parser.getText();
					} else if (text == 'from') {
						from_z = new From_Z(parser);
					} else if (text == 'message') {
						message = parser.getText();
					} else if (text == 'created_time') {
						created_time = parser.getText();
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						FacebookUtil.consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class From_Z {
		public String name {get;set;}
		public String id {get;set;}

		public From_Z(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'name') {
							name = parser.getText();
						} else if (text == 'id') {
							id = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'From_Z consuming unrecognized property: '+text);
							FacebookUtil.consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static FacebookMessage parse(String json) {
		return new FacebookMessage(System.JSON.createParser(json));
	}
	
	// This test method should give 100% coverage
	static testMethod void testParse() {
		String json = '{'+
		'            \"id\": \"123123123123123_254\", '+
		'            \"from\": {'+
		'              \"name\": \"Pat Patterson\", '+
		'              \"id\": \"667905711\"'+
		'            }, '+
		'            \"message\": \"Message text goes here\", '+
		'            \"created_time\": \"2012-05-01T17:43:39+0000\"'+
		'          }';
		FacebookMessage r = parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		FacebookMessage objRoot = new FacebookMessage(System.JSON.createParser(json));
		System.assert(objRoot != null);
		System.assert(objRoot.id == null);
		System.assert(objRoot.from_z == null);
		System.assert(objRoot.message == null);
		System.assert(objRoot.created_time == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		From_Z objFrom_Z = new From_Z(System.JSON.createParser(json));
		System.assert(objFrom_Z != null);
		System.assert(objFrom_Z.name == null);
		System.assert(objFrom_Z.id == null);
	}
}