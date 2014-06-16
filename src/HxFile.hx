package ;

class HxFile
{
	public var path(default, null):String;
	public var name(default, null):String;
	public var fileName(default, null):String;
	
	public function new(path:String)
	{
		this.path = path;
		this.fileName = node.Path.basename(path);
		this.name = node.Path.basename(path, ".hx");		
	}
}