package ace;

@:native("ace")
extern class Ace 
{
	public static function edit(documentId:String):Editor;
	public static function require(moduleName:String):Dynamic;
}