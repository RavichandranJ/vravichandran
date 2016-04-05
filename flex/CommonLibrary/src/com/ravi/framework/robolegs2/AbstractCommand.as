package com.ravi.framework.robolegs2
{
	import com.ravi.logger.getLogger;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.logging.ILogger;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.utils.ObjectUtil;
	
	import robotlegs.bender.extensions.commandCenter.api.ICommand;

	public class AbstractCommand extends AbstractClass implements ICommand, IResponder
	{

		public function execute():void
		{
			logger.debug('execute()');
		}	

		public function result(event:Object):void
		{
			logger.debug('result() = {0}', ObjectUtil.toString(event.result));
		}

		public function fault(event:Object):void
		{
			logger.error("fault() for {0} (), faultString = {1}, faultDetail = {2}",  event.token.serviceMethod, event.fault.faultString, event.fault.faultDetail);
		}



	}
}
