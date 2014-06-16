package io;

class HaxeBuildFile
{
	public var mainClass(default, null):String;
	public var sourceDirectories(default, null):Array<String>;
	public var binFile(default, null):String;
	
	private var argumentHandler(default, null):Map<String, String -> Void>;
	
	public function new(projectFile:String) 
	{
		sourceDirectories = [];
		argumentHandler = new Map < String, String -> Void > ();
		
		argumentHandler.set("cp", function(value:String)
		{
			sourceDirectories.push(value);
		});
		
		argumentHandler.set("main", function(value:String)
		{
			mainClass = value;
		});
		
		argumentHandler.set("js", function(value:String)
		{
			binFile = value;
		});
		
		parse(projectFile);
	}
	
	private function parse(projectFile:String):Void
	{
		var lines = projectFile.split('\n');
		
		for (line in lines)
		{
			var argument = line.split(' ')[0].substr(1);
			var value = line.split(' ')[1];
			
			trace(argument + " -> " + value);
		}
	}
	
	private function callHandler(argument:String, value:String):Void
	{
		if (argumentHandler.exists(argument))
		{
			argumentHandler.get(argument)(value);
		}
		else
		{
			trace("No handler for " + argument);
		}
	}
}