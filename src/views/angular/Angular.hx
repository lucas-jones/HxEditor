package views.angular;

extern class AngularModule
{
	public function controller(name:String, stuff:Array<Dynamic>):Void;
}

@:native('angular')
extern class Angular
{
	public static function module(name:String, req:Array<String>):AngularModule;
}