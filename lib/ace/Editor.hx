package ace;

@:native("editor")
extern class Editor
{
	public function setOptions(options:Dynamic):Void;
	public function setTheme(theme:String):Void;	
	public function setValue(theme:String):Void;
	public function blur():Void;
	public function getSession():EditSession;
}