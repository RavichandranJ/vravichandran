package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.FamilyDelegate;
	import com.vravichandran.cms.events.FamilyEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.ArtistVO;
	import com.vravichandran.cms.vo.FamilyVO;
	import com.vravichandran.cms.vo.RelationTypeVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class FamilyCommand extends AbstractCommand
	{
		
		[Inject]
		public var delegate:FamilyDelegate;
		
		[Inject]
		public var model:AppModuleLocator;
		
		[Inject]
		public var event:FamilyEvent;
		
		override public function execute():void
		{
			logger.debug('[FamilyCommand] execute()');
			
			switch (event.eventType)
			{
				case FamilyEvent.GET_ALL_FAMILY:
				{
					delegate.getAllFamily().addResponder(this);
					break;
				}
				case FamilyEvent.ADD_FAMILY:
				{
					delegate.addFamily(event.dataItem).addResponder(this);
					break;
				}
				case FamilyEvent.UPDATE_FAMILY:
				{
					delegate.updateFamily(event.dataItem).addResponder(this);
					break;
				}
				case FamilyEvent.DELETE_FAMILY_BY_ID:
				{
					delegate.deleteFamilyById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[FamilyCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}
		
		override public function result(event:Object):void
		{
			//logger.debug('[FamilyCommand]  result recieved for service method {0} ', event.token.serviceMethod);
			logger.debug('[FamilyCommand]  result');
			
			switch (event.token.serviceMethod)
			{
				case FamilyEvent.GET_ALL_FAMILY:
				{
					getAllFamily(event);
					break;
				}
				case FamilyEvent.ADD_FAMILY:
				{
					addFamily(event);
					break;
				}
				case FamilyEvent.UPDATE_FAMILY:
				{
					updateFamily(event);
					break;
				}
				case FamilyEvent.DELETE_FAMILY_BY_ID:
				{
					deleteFamilyById(event);
					break;
				}
				default:
				{
					logger.debug('[FamilyCommand] result() not handled for {0}', event);
					break;
				}
			}
			
		}
		
		private function getAllFamily(event:Object):void
		{
			var resultList:Array=[];
			
			for each (var item:Object in event.result) 
			{
				var vo:FamilyVO = VOUtils.getConvertedDataItem(FamilyVO, item) as FamilyVO;
				vo.relation_typeIndex = getRelativeTypeIndex(vo);
				vo.relativeIndex = getRelativeIndex(vo);
				resultList.push(vo);
			}
			
			model.familyList.source=resultList;
		//	logger.debug('getAllFamily = {0}', ObjectUtil.toString(resultList) );	
		}
		
		private function getRelativeIndex(vo:FamilyVO):int
		{
			var count:int = 0;
			for each (var item:ArtistVO in model.artistList) 
			{				
				if(vo.relative_id == item.artist_id)
				{									
					return count;
				}
				count++;
			}
			
			return -1;
		}
		
		private function getRelativeTypeIndex(vo:FamilyVO):int
		{
			var count:int = 0;
			for each (var item:RelationTypeVO in model.relationTypeList) 
			{				
				if(vo.relation_type_id == item.relation_type_id)
				{										
					return count;
				}
				count++;
			}
			
			return -1;
		}
		
		
		
		private function addFamily(event:Object):void
		{
			var itemIndex:int=model.familyList.getItemIndex(event.token.vo as FamilyVO);
			if (itemIndex && model.familyList[itemIndex].family_id == 0)
			{
				model.familyList[itemIndex].family_id=int(event.result);
				logger.debug('[FamilyCommand] addFamily = {0}', ObjectUtil.toString(model.familyList[itemIndex]));
			}
		}
		
		private function updateFamily(event:Object):void
		{
			
		}
		
		private function deleteFamilyById(event:Object):void
		{
			var itemIndex:int=model.familyList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				model.familyList.removeItemAt(itemIndex);
			}
		}
	}
}
