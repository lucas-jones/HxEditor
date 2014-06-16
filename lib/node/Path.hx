package node;

@:native("require('path')")
extern class Path
{
	public static function basename(path:String, ?options:Dynamic):String;
}