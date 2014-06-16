package nodejs;

import nodejs.events.EventEmitter;

@:native("require('child_process')")
extern class ChildProcess extends EventEmitter
{
	static function spawn(cmd:String, ?args:Array<Dynamic>, ?options:Dynamic):ChildProcess;
	static function exec(cmd:String, options:Dynamic, callback:Error -> Buffer -> Buffer -> Void):ChildProcess;
	static function execFile(file:String, ?args:Array<Dynamic>, ?options:Dynamic, callback:Error -> Buffer -> Buffer -> Void):ChildProcess;
	//tatic function fork(cmd:String, options?:Dynamic):ChildProcess;
	
	var stdin:Dynamic;
	var stdout:Dynamic;
	var stderr:Dynamic;
	var pid:Int;
	var connected:Bool;
	
	function kill(signal:String):Void; 
	function send(message:String, ?sendHandle:Dynamic):Void;
}