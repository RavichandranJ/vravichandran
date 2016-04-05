package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.SongDelegate;
	import com.vravichandran.cms.events.SongEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.ArtistVO;
	import com.vravichandran.cms.vo.SongVO;

	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;

	public class SongCommand extends AbstractCommand
	{

		[Inject]
		public var delegate:SongDelegate;

		[Inject]
		public var model:AppModuleLocator;

		[Inject]
		public var event:SongEvent;

		override public function execute():void
		{
			logger.debug('[SongCommand] execute()');

			switch (event.eventType)
			{
				case SongEvent.GET_ALL_SONG:
				{
					delegate.getAllSong().addResponder(this);
					break;
				}
				case SongEvent.ADD_SONG:
				{
					delegate.addSong(event.dataItem).addResponder(this);
					break;
				}
				case SongEvent.UPDATE_SONG:
				{
					delegate.updateSong(event.dataItem).addResponder(this);
					break;
				}
				case SongEvent.DELETE_SONG_BY_ID:
				{
					delegate.deleteSongById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[SongCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}

		override public function result(event:Object):void
		{
			//logger.debug('[SongCommand]  result recieved for service method {0} ', event.token.serviceMethod);
			logger.debug('[SongCommand]  result()');

			switch (event.token.serviceMethod)
			{
				case SongEvent.GET_ALL_SONG:
				{
					getAllSong(event);
					break;
				}
				case SongEvent.ADD_SONG:
				{
					addSong(event);
					break;
				}
				case SongEvent.UPDATE_SONG:
				{
					updateSong(event);
					break;
				}
				case SongEvent.DELETE_SONG_BY_ID:
				{
					deleteSongById(event);
					break;
				}
				default:
				{
					logger.debug('[SongCommand] result() not handled for {0}', event);
					break;
				}
			}

		}

		private function getAllSong(event:Object):void
		{
			var resultList:Array=[];

			for each (var item:Object in event.result)
			{
				var vo:SongVO=VOUtils.getConvertedDataItem(SongVO, item) as SongVO;
				vo.lyricsIndex=vo.lyrics > 0 ? getLyricsIndex(vo) : -1;
				vo.singer1Index=vo.singer1 > 0 ? getSinger1Index(vo) : -1;
				vo.singer2Index=vo.singer2 > 0 ? getSinger2Index(vo) : -1;
				vo.singer3Index=vo.singer3 > 0 ? getSinger3Index(vo) : -1;
				resultList.push(vo);
			}
			
			model.songList.source=resultList;
			//logger.debug('resultList = {0}', ObjectUtil.toString(resultList));
		}

		private function getLyricsIndex(vo:SongVO):int
		{
			var count:int=0;
			for each (var artistVO:ArtistVO in model.artistList)
			{
				if (artistVO.artist_id == vo.lyrics)
				{
					return count;
				}
				count++;

			}
			return -1;
		}

		private function getSinger1Index(vo:SongVO):int
		{
			var count:int=0;
			for each (var artistVO:ArtistVO in model.artistList)
			{
				if (artistVO.artist_id == vo.singer1)
				{
					return count;
				}
				count++;

			}
			return -1;
		}

		private function getSinger2Index(vo:SongVO):int
		{
			var count:int=0;
			for each (var artistVO:ArtistVO in model.artistList)
			{
				if (artistVO.artist_id == vo.singer2)
				{
					return count;
				}
				count++;

			}
			return -1;
		}

		private function getSinger3Index(vo:SongVO):int
		{
			var count:int=0;
			for each (var artistVO:ArtistVO in model.artistList)
			{
				if (artistVO.artist_id == vo.singer3)
				{
					return count;
				}
				count++;

			}
			return -1;
		}


		private function addSong(event:Object):void
		{
			var itemIndex:int=model.songList.getItemIndex(event.token.vo as SongVO);
			if (itemIndex && model.songList[itemIndex].song_id == 0)
			{
				model.songList[itemIndex].song_id=int(event.result);
				logger.debug('[SongCommand] addSong = {0}', ObjectUtil.toString(model.songList[itemIndex]));
			}
		}

		private function updateSong(event:Object):void
		{

		}

		private function deleteSongById(event:Object):void
		{
			var itemIndex:int=model.songList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				model.songList.removeItemAt(itemIndex);
			}
		}
	}
}
