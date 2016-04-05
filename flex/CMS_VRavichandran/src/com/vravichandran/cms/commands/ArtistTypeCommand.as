package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.ArtistTypeDelegate;
	import com.vravichandran.cms.events.ArtistTypeEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.ArtistTypeVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class ArtistTypeCommand extends AbstractCommand
	{
		
		[Inject]
		public var delegate:ArtistTypeDelegate;
		
		[Inject]
		public var model:AppModuleLocator;
		
		[Inject]
		public var event:ArtistTypeEvent;
		
		override public function execute():void
		{
			logger.debug('[ArtistTypeCommand] execute()');
			
			switch (event.eventType)
			{
				case ArtistTypeEvent.GET_ALL_ARTIST_TYPE:
				{
					delegate.getAllArtistType().addResponder(this);
					break;
				}
				case ArtistTypeEvent.ADD_ARTIST_TYPE:
				{
					delegate.addArtistType(event.dataItem).addResponder(this);
					break;
				}
				case ArtistTypeEvent.UPDATE_ARTIST_TYPE:
				{
					delegate.updateArtistType(event.dataItem).addResponder(this);
					break;
				}
				case ArtistTypeEvent.DELETE_ARTIST_TYPE_BY_ID:
				{
					delegate.deleteArtistTypeById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[ArtistTypeCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}
		
		override public function result(event:Object):void
		{
			logger.debug('[ArtistTypeCommand]  result recieved for service method {0} ', event.token.serviceMethod);
			
			switch (event.token.serviceMethod)
			{
				case ArtistTypeEvent.GET_ALL_ARTIST_TYPE:
				{
					getAllArtistType(event);
					break;
				}
				case ArtistTypeEvent.ADD_ARTIST_TYPE:
				{
					addArtistType(event);
					break;
				}
				case ArtistTypeEvent.DELETE_ARTIST_TYPE_BY_ID:
				{
					deleteArtistTypeById(event);
					break;
				}
				default:
				{
					logger.debug('[ArtistTypeCommand] result() not handled for {0}', event);
					break;
				}
			}
			
		}
		
		private function getAllArtistType(event:Object):void
		{
			var resultList:Array=VOUtils.getConvertedDataItemList(event.result.source, ArtistTypeVO);
			model.artistTypeList.source=resultList;
		//	logger.debug('resultList = {0}', ObjectUtil.toString(resultList) );	
		}
		
		private function addArtistType(event:Object):void
		{
			var itemIndex:int=model.artistTypeList.getItemIndex(event.token.vo as ArtistTypeVO);
			if (itemIndex && model.artistTypeList[itemIndex].artist_type_id == 0)
			{
				model.artistTypeList[itemIndex].artist_type_id=int(event.result);
				logger.debug('[ArtistTypeCommand] addArtistType = {0}', ObjectUtil.toString(model.artistTypeList[itemIndex]));
			}
		}
		
		private function updateArtistType(event:Object):void
		{
			
		}
		
		private function deleteArtistTypeById(event:Object):void
		{
			logger.debug('[ArtistTypeCommand] deleteArtistTypeById()');
			var itemIndex:int=model.artistTypeList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				model.artistTypeList.removeItemAt(itemIndex);
			}
		}
	}
}