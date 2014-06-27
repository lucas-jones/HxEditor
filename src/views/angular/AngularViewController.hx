package views.angular;

import js.JQuery;

class AngularViewController
{
	public var scope(default, null):Dynamic;
	
	public var isOpen(default, null):Bool;
	
	public function new(isOpen:Bool = false)
	{
		this.isOpen = isOpen;
	}	
	
	public function create(scope:Dynamic, element:JQuery)
	{
		this.scope = scope;
		this.scope.isOpen = isOpen;
	}
	
	public function open()
	{
		scope.isOpen = true;
	}
	
	public function close()
	{
		scope.isOpen = false;
	}
}