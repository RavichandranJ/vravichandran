package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.HomeView;

	public class HomeViewMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:HomeView;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[HomeViewMediator] initialize()');
		}
	}
}