package parser;

import haxe.io.BytesData;
import nodejs.fs.File;

class HaxeParser
{
	
	public function new(fileUrl:String) 
	{
		var ast = new haxeparser.HaxeParser(File.readFileSync(fileUrl), "dave.hx").parse();
		for (decl in ast.decls)
		{
			trace(decl);
		}
		/*
        var eregVariables = ~/var +([a-z_0-9]+):?([^=;]+)?/gi;
			//~/var +([^:;\( ]*)/gi;
        
        eregVariables.map(file, function(ereg2:EReg)
        {							 
			var pos = ereg2.matchedPos();
			var index = pos.pos + pos.len;

			var name = ereg2.matched(1);
			var type = ereg2.matched(2);

			 if (type != null)
			 {
				 type = StringTools.trim(type);
			 }
			 
			 trace(name);
			 
			 return "";
		});
		*/
	}
	
}