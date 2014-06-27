package views;

import views.angular.AngularViewController;

class ExampleViewController extends AngularViewController
{
	public function new() 
	{
		super(true);
	}
	
	override public function create(scope:Dynamic, element:Dynamic) 
	{
		super.create(scope, element);
		
		// Setup
		scope.parent = Reflect.field(scope, "$parent");
		
		scope.name = "Dave";
	}
}