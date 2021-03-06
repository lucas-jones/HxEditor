package ;

import ace.Ace;
import ace.Document;
import ace.Editor;
import ace.LanguageTools;
import io.HaxeBuildFile;
import js.html.audio.DynamicsCompressorNode;
import js.html.svg.AnimatedBoolean;
import js.JQuery;
import node.Glob;
import node.Path;
import nodejs.fs.File;
import parser.HxParser;
import views.ExampleViewController;
import views.angular.AngularHelper;

class HxEditor
{
	public static var editor:Editor;
	public static var languageTools:LanguageTools;
	
	public static var document:Document;
	
	public static var hxProject:HxProject;
	public static var hxSettings:HxSettings;
	
	public static var buildFile:HaxeBuildFile;
	
	static function buildChildren(path:String):Dynamic
	{
		var isFolder:Bool = File.lstatSync(path).isDirectory();
		
		if (isFolder)
		{
			var folders = File.readdirSync(path).map(function(file:String):String
			{
				return path + "/" + file;
			});
			
			var name:String = Path.basename(path);
			var children:Array<Dynamic> = folders.map(buildChildren);
			
			children.sort(function(itemA, itemB):Int
			{
				return itemA.folder == true && itemB.folder == false ? 0 : 1;
			});
			
			return { title: name, children: children, folder: true};
		}
		else
		{
			var name:String = Path.basename(path);
			return { title: name, folder: false, path: path };
		}
		
	}
	
	static var angular:AngularHelper;
	
	static function main() 
	{
		angular = new AngularHelper("HxEditor");
		angular.addViewController("ExampleViewController", new ExampleViewController());
		
		hxSettings = new HxSettings("C:/Projects/phaser/Example.hxe");
		hxProject = new HxProject(hxSettings);
		
		//buildFile = new HaxeBuildFile(File.readFileSync(haxeSettings.buildFile, cast "utf8"));
		
		// Test
		//new HaxeParser("C:/HaxeToolkit/haxe/lib/createjs/git/createjs/easeljs/Sprite.hx");
		
		editor = Ace.edit("editor");
		
		var treeSource:Array<Dynamic> = [buildChildren(hxSettings.projectLocation + "/")];
		/*
		for (file in hxProject.projectFiles)
		{
			treeSource.push( { title: file.fileName } );
		}*/
		/*
		var treeSource = hxProject.projectFiles.map(function(file:HxFile):Dynamic
		{
			return { title: file.fileName };
		});
		*/
		untyped new JQuery("#tree").fancytree( { dblclick: function(event, data)
		{
			var path = data.node.data.path;
			
			if (path != null)
			{
				File.readFile(path, cast "utf8", function(e, r):Void
				{
					editor.setValue(r);
					document = editor.getSession().getDocument();
					
					new HxParser("Dave.hx", r);
				});
			}
		}, source: treeSource } );
		
		languageTools = Ace.require("ace/ext/language_tools");
		editor.getSession().setMode("ace/mode/haxe");
		
		editor.setTheme("ace/theme/monokai");		
		editor.setOptions({ enableBasicAutocompletion: true,  fontFamily: "Consolas", fontSize: "11pt" });
		
		languageTools.addCompleter(new HaxeCompleter());
	}
}