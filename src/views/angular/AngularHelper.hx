package views.angular;

import views.angular.Angular.AngularModule;

class AngularHelper
{
	var module:AngularModule;
	
	var viewControllers:Map<String, AngularViewController>;
	
	public function new(name:String) 
	{
		module = Angular.module(name, []);
		viewControllers = new Map();
	}
	
	public function addViewController(name:String, viewController:AngularViewController)
	{
		module.controller(name, [ "$scope" , "$element", viewController.create ]);
		
		viewControllers.set(name, viewController);
		
		trace("Added view " + name);
	}
	
	public function getViewControllerByName(name:String):AngularViewController
	{
		return viewControllers.get(name);
	}
}