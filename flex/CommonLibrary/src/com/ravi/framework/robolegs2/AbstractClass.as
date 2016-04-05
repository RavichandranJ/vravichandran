package com.ravi.framework.robolegs2
{
	import com.ravi.logger.getLogger;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import mx.logging.ILogger;
	import mx.utils.ObjectUtil;
	
	
	public class AbstractClass
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;
		
		public function get logger():ILogger
		{
			return getLogger(this);
		}
		
		protected function dispatch(event:Event):void
		{
			if (eventDispatcher.hasEventListener(event.type))
			{
				logger.debug('dispatch {0}', ObjectUtil.toString(event));
				eventDispatcher.dispatchEvent(event);
			}
				
		}
	}
}