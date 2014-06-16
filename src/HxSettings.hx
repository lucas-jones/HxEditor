package ;

import haxe.Json;
import nodejs.fs.File;

interface HxSettingsFile
{
	var haxeLocation:String;
	var buildFile:String;
	var projectLocation:String;	
}

class HxSettings
{
	public var haxeLocation(default, null):String;
	public var buildFile(default, null):String;
	public var projectLocation(default, null):String;
	
	public function new(settingsUrl:String)
	{
		var jsonFile:String = File.readFileSync(settingsUrl, cast "utf8");
		var settingsFile:HxSettingsFile = Json.parse(jsonFile);
		
		haxeLocation = settingsFile.haxeLocation;
		buildFile = settingsFile.buildFile;
		projectLocation = settingsFile.projectLocation;
	}
}