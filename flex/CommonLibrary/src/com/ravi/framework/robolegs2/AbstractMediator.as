package com.ravi.framework.robolegs2
{
	import com.ravi.logger.getLogger;	
	import mx.logging.ILogger;	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	
	public class AbstractMediator extends Mediator
	{
		
		public function get logger():ILogger
		{
			return getLogger(this);
		}
		
		// init
		override public function initialize():void
		{
			
		}
	}
}