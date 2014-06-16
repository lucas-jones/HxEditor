package node;

@:native("require('glob')")
extern class Glob
{
	static function sync(pattern:Dynamic, ?options:Dynamic):Array<String>;
}