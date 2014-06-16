package ace;

@:native("document")
extern class Document
{
	public function new (text:String):Void;
	public function positionToIndex (pos:Dynamic):Int;
}