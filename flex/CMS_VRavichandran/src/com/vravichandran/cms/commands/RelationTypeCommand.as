package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.RelationTypeDelegate;
	import com.vravichandran.cms.events.RelationTypeEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.RelationTypeVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class RelationTypeCommand extends AbstractCommand
	{
		
		[Inject]
		public var delegate:RelationTypeDelegate;
		
		[Inject]
		public var model:AppModuleLocator;
		
		[Inject]
		public var event:RelationTypeEvent;
		
		override public function execute():void
		{
			logger.debug('[RelationTypeCommand] execute()');
			
			switch (event.eventType)
			{
				case RelationTypeEvent.GET_ALL_RELATION_TYPE:
				{
					delegate.getAllRelationType().addResponder(this);
					break;
				}
				case RelationTypeEvent.ADD_RELATION_TYPE:
				{
					delegate.addRelationType(event.dataItem).addResponder(this);
					break;
				}
				case RelationTypeEvent.UPDATE_RELATION_TYPE:
				{
					delegate.updateRelationType(event.dataItem).addResponder(this);
					break;
				}
				case RelationTypeEvent.DELETE_RELATION_TYPE_BY_ID:
				{
					delegate.deleteRelationTypeById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[RelationTypeCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}
		
		override public function result(event:Object):void
		{
			logger.debug('[RelationTypeCommand]  result recieved for service method {0} ', event.token.serviceMethod);
			
			switch (event.token.serviceMethod)
			{
				case RelationTypeEvent.GET_ALL_RELATION_TYPE:
				{
					getAllRelationType(event);
					break;
				}
				case RelationTypeEvent.ADD_RELATION_TYPE:
				{
					addRelationType(event);
					break;
				}
				case RelationTypeEvent.DELETE_RELATION_TYPE_BY_ID:
				{
					deleteRelationTypeById(event);
					break;
				}
				default:
				{
					logger.debug('[RelationTypeCommand] result() not handled for {0}', event);
					break;
				}
			}
			
		}
		
		private function getAllRelationType(event:Object):void
		{
			var resultList:Array=VOUtils.getConvertedDataItemList(event.result.source, RelationTypeVO);
			model.relationTypeList.source=resultList;
			logger.debug('resultList = {0}', ObjectUtil.toString(resultList) );	
		}
		
		private function addRelationType(event:Object):void
		{
			var itemIndex:int=model.relationTypeList.getItemIndex(event.token.vo as RelationTypeVO);
			if (itemIndex && model.relationTypeList[itemIndex].relation_type_id == 0)
			{
				model.relationTypeList[itemIndex].relation_type_id=int(event.result);
				logger.debug('[RelationTypeCommand] addRelationType = {0}', ObjectUtil.toString(model.relationTypeList[itemIndex]));
			}
		}
		
		private function updateRelationType(event:Object):void
		{
			
		}
		
		private function deleteRelationTypeById(event:Object):void
		{
			logger.debug('[RelationTypeCommand] deleteRelationTypeById()');
			var itemIndex:int=model.relationTypeList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				model.relationTypeList.removeItemAt(itemIndex);
			}
		}
	}
}
