package lib.gradiel.toolkit.abstracts
{
	import lib.gradiel.core.Engine;
	import lib.gradiel.toolkit.interfaces.IBehavior;
	import lib.gradiel.toolkit.components.Component;
	
	public class Behavior extends Component implements IBehavior
	{
		
		public function Behavior(engine:Engine)
		{
			super();
		}
		
		public function respond():void
		{
		}
		
		public function startup():void
		{
		}
		
		public function shutdown():void
		{
		}
	}
}