package ;

import ace.Editor;
import ace.EditSession;
import nodejs.fs.File;
import nodejs.ChildProcess;

class HaxeCompleter
{
	public function new() { }
	
	public function getCompletions(editor:Editor, session:EditSession, pos:Dynamic, prefix:Dynamic, callback:Dynamic):Void
	{
		var position = session.getDocument().positionToIndex(pos);
		/*
		File.writeFile("example/src/Main.hx", session.getValue(), function(e) 
		{
			var exec = ChildProcess.exec("haxe --cwd example build.hxml --display src/Main.hx@" + position, {}, function(a, b, c)
			{
				try
				{
					var result:Xml = Xml.parse(c.toString());
					
					var autoCompleteResults:Array<Dynamic> = [];
					
					for (i in result.firstChild().elementsNamed("i"))
					{
						var name = i.get("n");
						var t = i.elementsNamed("t");
						var t2 = t.next();
						var ingo = t2.firstChild().nodeValue;
						
						autoCompleteResults.push({
													name: name,
													value: name,
													score: 100,
													meta: ingo 
												});
					}
					
					callback(null, autoCompleteResults);
				}
				catch (e:String)
				{
					trace("Error " + e);
				}
			});
		});
		*/
	}
}