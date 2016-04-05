package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.ArtistDelegate;
	import com.vravichandran.cms.events.ArtistEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.ArtistVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class ArtistCommand extends AbstractCommand
	{
		
		[Inject]
		public var delegate:ArtistDelegate;
		
		[Inject]
		public var model:AppModuleLocator;
		
		[Inject]
		public var event:ArtistEvent;
		
		override public function execute():void
		{
			logger.debug('[ArtistCommand] execute()');
			
			switch (event.eventType)
			{
				case ArtistEvent.GET_ALL_ARTIST:
				{
					delegate.getAllArtist().addResponder(this);
					break;
				}
				case ArtistEvent.ADD_ARTIST:
				{
					delegate.addArtist(event.dataItem).addResponder(this);
					break;
				}
				case ArtistEvent.UPDATE_ARTIST:
				{
					delegate.updateArtist(event.dataItem).addResponder(this);
					break;
				}
				case ArtistEvent.DELETE_ARTIST_BY_ID:
				{
					delegate.deleteArtistById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[ArtistCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}
		
		override public function result(event:Object):void
		{
			logger.debug('[ArtistCommand]  result recieved for service method {0} ', event.token.serviceMethod);
			
			switch (event.token.serviceMethod)
			{
				case ArtistEvent.GET_ALL_ARTIST:
				{
					getAllArtist(event);
					break;
				}
				case ArtistEvent.ADD_ARTIST:
				{
					addArtist(event);
					break;
				}
				case ArtistEvent.UPDATE_ARTIST:
				{
					updateArtist(event);
					break;
				}
				case ArtistEvent.DELETE_ARTIST_BY_ID:
				{
					deleteArtistById(event);
					break;
				}
				default:
				{
					logger.debug('[ArtistCommand] result() not handled for {0}', event);
					break;
				}
			}
			
		}
		
		private function getAllArtist(event:Object):void
		{
			var resultList:Array=VOUtils.getConvertedDataItemList(event.result.source, ArtistVO);
			model.artistList.source=resultList;
		//	logger.debug('resultList = {0}', ObjectUtil.toString(resultList) );	
		}
		
		private function addArtist(event:Object):void
		{
			var itemIndex:int=model.artistList.getItemIndex(event.token.vo as ArtistVO);
			if (itemIndex && model.artistList[itemIndex].artist_id == 0)
			{
				model.artistList[itemIndex].artist_id=int(event.result);
				logger.debug('[ArtistCommand] addArtist = {0}', ObjectUtil.toString(model.artistList[itemIndex]));
			}
		}
		
		private function updateArtist(event:Object):void
		{
			
		}
		
		private function deleteArtistById(event:Object):void
		{
			var itemIndex:int=model.artistList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				logger.debug('[ArtistCommand] deleteArtistById = {0}', ObjectUtil.toString(model.artistList[itemIndex]));
				model.artistList.removeItemAt(itemIndex);
				model.artistList.refresh();
			}
		}
	}
}
