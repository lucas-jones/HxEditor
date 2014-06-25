package ;

import byte.ByteData;
import haxeparser.HaxeParser;
import nodejs.fs.File;
import parser.HxParser;

class HxFile
{
	public var path(default, null):String;
	public var name(default, null):String;
	public var fileName(default, null):String;
	
	public var fileContent(default, null):String;
	
	public var parser(default, null):HxParser;
	
	public function new(path:String)
	{
		this.path = path;
		this.fileName = node.Path.basename(path);
		this.name = node.Path.basename(path, ".hx");
		
		this.fileContent = File.readFileSync(path, cast "utf8");
		this.parser = new HxParser(name + ".hx", fileContent);
	}
}