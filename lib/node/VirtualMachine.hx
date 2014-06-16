package nodejs;

@:native("require('vm')")
extern class VirtualMachine
{
	static function runInNewContext(code:String, ?sandbox:Dynamic, ?fileName:String):Void;
	static function runInThisContext(code:String, ?fileName:String):Void;
}