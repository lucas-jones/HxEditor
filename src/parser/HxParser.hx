package parser;

//import haxeparser.Data.TypeDecl;
import haxe.ds.StringMap.StringMap;
import haxe.macro.Expr.Access;
import haxe.macro.Expr.Field;
import haxe.macro.Expr.Function;
import haxeparser.Data.TypeDef;

import haxeparser.HaxeParser;
import byte.ByteData;
import haxeparser.HaxeParser;

class HxParser
{

	
	public function new(fileName:String, document:String) 
	{		
		try
		{	
			var ast = new HaxeParser(ByteData.ofString(document), fileName).parse();
			
			for (decl in ast.decls)
			{
				if (Std.is(decl.decl, TypeDef.EClass))
				{
					trace(decl.decl);
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