package compiler;

import nodejs.ChildProcess;

class HxCompiler 
{
	public static function build():Void
	{
		var exec = ChildProcess.exec("haxe --cwd " + cwd + " build.hxml", {}, function(a, b, c)
		{
			File.readFile(cwd + "bin/main.js", cast "utf8", function(e, r):Void
			{
				VirtualMachine.runInThisContext(r);
			});
			
		});
	}
}