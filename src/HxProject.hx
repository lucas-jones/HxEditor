package ;
import node.Glob;
import nodejs.fs.File;
import nodejs.Path;
import node.Path;

class HxProject 
{
	public var hxSettings(default, null):HxSettings;
	
	public var projectFiles(default, null):Array<HxFile>;
	
	public var classes(default, null):Array<HxFile>;
	
	public function new(hxSettings:HxSettings)
	{
		this.hxSettings = hxSettings;
		
		var files:Array<String> = Glob.sync("**/*.hx", { cwd: hxSettings.projectLocation } );
		
		projectFiles = files.map(function(file:String)
		{
			return new HxFile(hxSettings.projectLocation + "/" + file);
		});
	}
}

