package parser;

import byte.ByteData;
import haxe.io.BytesData;
import nodejs.fs.File;

class HxParser
{
	
	public function new(fileName:String, document:String) 
	{
		trace(fileName);
		
		try
		{
			var ast = new haxeparser.HaxeParser(ByteData.ofString(document), fileName).parse();
			for (decl in ast.decls)
			{
				if (decl.getName() == "EClass")
				{
					trace(" - " + untyped decl[2].name);
					
					
					for (test in Reflect.fields(untyped decl[2].data))
					{
						trace("   - " + untyped Reflect.field(decl[2].data, text).name);
					}					
				}
				
			}
		}
		catch (e:Dynamic)
		{
			trace("Error:" + fileName);
		}
		/*
		trace(fileName);
		
		
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