package ace;

@:native("editsession")
extern class EditSession 
{
	public function setTheme(theme:String):Void;
	public function setMode(mode:String):Void;
	public function setDocument(document:Document):Void;
	public function getDocument():Document;
	public function getValue():String;
	
}