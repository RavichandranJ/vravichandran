package com.vravichandran.cms.mediator.renderer.family
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.family.RelationTypeIRenderer;
	import com.vravichandran.cms.renderer.family.RelativeIRenderer;
	import com.vravichandran.cms.vo.FamilyVO;
	
	import spark.events.IndexChangeEvent;
	
	public class RelationTypeIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:RelationTypeIRenderer;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[RelativeIRendererMediator] initialize()');
			view.cb.dataProvider = model.relationTypeList;		
			view.cb.selectedIndex = view.data ? FamilyVO(view.data).relation_typeIndex : -1;
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cb_changeHandler);
		}
		
		protected function cb_changeHandler(event:IndexChangeEvent):void
		{
			if(view.data.relation_type_id != view.cb.selectedItem.relation_type_id)
			{
				view.data.relation_type_id = view.cb.selectedItem.relation_type_id;
				view.data.isDirty = true;
				view.data.relation_typeIndex = event.newIndex;
			}				
		}	
		
	}
}