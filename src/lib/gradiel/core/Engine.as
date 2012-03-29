package lib.gradiel.core
{
	import lib.gradiel.core.activation.ActivationSpace;
	import lib.gradiel.core.activation.Constructor;
	import lib.gradiel.core.activation.Destructor;
	import lib.gradiel.core.scheduler.Scheduler;

	public class Engine
	{
		private var _constructor:Constructor;
		private var _destructor:Destructor;
		private var _activation:ActivationSpace;
		private var _scheduler:Scheduler;
		
		public function Engine()
		{
		}
	}
}