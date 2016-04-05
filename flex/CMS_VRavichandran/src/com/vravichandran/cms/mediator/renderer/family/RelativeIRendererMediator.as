package com.vravichandran.cms.mediator.renderer.family
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.family.RelativeIRenderer;
	import com.vravichandran.cms.vo.FamilyVO;
	
	import spark.events.IndexChangeEvent;
	
	public class RelativeIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:RelativeIRenderer;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[RelativeIRendererMediator] initialize()');
			view.cb.dataProvider = model.artistList;		
			view.cb.selectedIndex = view.data ? FamilyVO(view.data).relativeIndex : -1;
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cb_changeHandler);
		}
		
		protected function cb_changeHandler(event:IndexChangeEvent):void
		{
			if(view.data.relative_id != view.cb.selectedItem.artist_id)
			{
				view.data.relative_id = view.cb.selectedItem.artist_id;
				view.data.isDirty = true;
				view.data.relativeIndex = event.newIndex;
			}				
		}	
		
	}
}