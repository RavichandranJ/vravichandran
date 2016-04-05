package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.ArtistMovieDelegate;
	import com.vravichandran.cms.events.ArtistMovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.ArtistMovieVO;
	import com.vravichandran.cms.vo.ArtistTypeVO;
	import com.vravichandran.cms.vo.ArtistVO;

	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;

	public class ArtistMovieCommand extends AbstractCommand
	{

		[Inject]
		public var delegate:ArtistMovieDelegate;

		[Inject]
		public var model:AppModuleLocator;

		[Inject]
		public var event:ArtistMovieEvent;

		override public function execute():void
		{
			logger.debug('[ArtistMovieCommand] execute()');

			switch (event.eventType)
			{
				case ArtistMovieEvent.GET_ALL_ARTIST_MOVIE:
				{
					delegate.getAllArtistMovie().addResponder(this);
					break;
				}
				case ArtistMovieEvent.ADD_ARTIST_MOVIE:
				{
					delegate.addArtistMovie(event.dataItem).addResponder(this);
					break;
				}
				case ArtistMovieEvent.UPDATE_ARTIST_MOVIE:
				{
					delegate.updateArtistMovie(event.dataItem).addResponder(this);
					break;
				}
				case ArtistMovieEvent.DELETE_ARTIST_MOVIE_BY_ID:
				{
					delegate.deleteArtistMovieById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[ArtistMovieCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}

		override public function result(event:Object):void
		{
			logger.debug('[ArtistMovieCommand]  result recieved for service method {0} ', event.token.serviceMethod);

			switch (event.token.serviceMethod)
			{
				case ArtistMovieEvent.GET_ALL_ARTIST_MOVIE:
				{
					getAllArtistMovie(event);
					break;
				}
				case ArtistMovieEvent.ADD_ARTIST_MOVIE:
				{
					addArtistMovie(event);
					break;
				}
				case ArtistMovieEvent.UPDATE_ARTIST_MOVIE:
				{
					updateArtistMovie(event);
					break;
				}
				case ArtistMovieEvent.DELETE_ARTIST_MOVIE_BY_ID:
				{
					deleteArtistMovieById(event);
					break;
				}
				default:
				{
					logger.debug('[ArtistMovieCommand] result() not handled for {0}', event);
					break;
				}
			}

		}

		private function getAllArtistMovie(event:Object):void
		{
			var resultList:Array=[]; // VOUtils.getConvertedDataItemList(event.result.source, ArtistMovieVO);
			for each (var item:Object in event.result)
			{
				var vo:ArtistMovieVO=VOUtils.getConvertedDataItem(ArtistMovieVO, item) as ArtistMovieVO;
				vo.artistIndex=getArtistIndex(vo);
				vo.artistTypeIndex=getArtistTypeIndex(vo);
				resultList.push(vo);
			}

			model.artistMovieList.source=resultList;
			//	logger.debug('resultList = {0}', ObjectUtil.toString(resultList) );	
		}

		private function getArtistIndex(vo:ArtistMovieVO):int
		{
			var count:int=0;
			for each (var artistVO:ArtistVO in model.artistList)
			{
				if (artistVO.artist_id == vo.artist_id)
				{
					return count;
				}
				count++;

			}
			return -1;
		}

		private function getArtistTypeIndex(vo:ArtistMovieVO):int
		{
			var count:int=0;
			for each (var artistVO:ArtistTypeVO in model.artistTypeList)
			{
				if (artistVO.artist_type_id == vo.artist_type_id)
				{
					return count;
				}
				count++;

			}
			return -1;
		}



		private function addArtistMovie(event:Object):void
		{
			var itemIndex:int=model.artistMovieList.getItemIndex(event.token.vo as ArtistMovieVO);
			if (model.artistMovieList[itemIndex].artist_movie_id == 0)
			{
				model.artistMovieList[itemIndex].artist_movie_id=int(event.result);
				logger.debug('[ArtistMovieCommand] addArtistMovie = {0}', ObjectUtil.toString(model.artistMovieList[itemIndex]));
			}

		}

		private function updateArtistMovie(event:Object):void
		{

		}

		private function deleteArtistMovieById(event:Object):void
		{
			var itemIndex:int=model.artistMovieList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				model.artistMovieList.removeItemAt(itemIndex);
			}
		}
	}
}
