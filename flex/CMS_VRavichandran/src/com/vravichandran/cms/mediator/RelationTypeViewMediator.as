package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.RelationTypeEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.FamilyView;
	import com.vravichandran.cms.view.RelationTypeView;
	import com.vravichandran.cms.vo.RelationTypeVO;
	
	import flash.events.MouseEvent;

	public class RelationTypeViewMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:RelationTypeView;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[RelationTypeViewMediator] initialize()');
			view.dg1.dataProvider=model.relationTypeList;
			
			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);
		}
		
		private function addNewItem(event:MouseEvent):void
		{
			var vo:RelationTypeVO=new RelationTypeVO();
			vo.isDirty=true;
			model.relationTypeList.addItem(vo);
		}
		
		private function saveAllItem(event:MouseEvent):void
		{
			logger.debug('[RelationTypeViewMediator] saveAllItem()');
			for each (var vo:RelationTypeVO in model.relationTypeList)
			{
				if (vo.isDirty && vo.relation_type_id > 0)
				{
					dispatch(new RelationTypeEvent(RelationTypeEvent.UPDATE_RELATION_TYPE, vo));
				}
				else if (vo.isDirty && vo.relation_type_id == 0)
				{
					dispatch(new RelationTypeEvent(RelationTypeEvent.ADD_RELATION_TYPE, vo));
				}
			}
			
		}
		
	}
}
