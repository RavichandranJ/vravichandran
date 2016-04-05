package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.events.SongEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.SongView;
	import com.vravichandran.cms.vo.MovieVO;
	import com.vravichandran.cms.vo.SongVO;

	import flash.events.Event;
	import flash.events.MouseEvent;

	import spark.events.IndexChangeEvent;

	public class SongViewMediator extends AbstractMediator
	{

		[Inject]
		public var view:SongView;

		[Inject]
		public var model:AppModuleLocator;

		override public function initialize():void
		{
			logger.debug('[SongViewMediator] initialize()');

			view.dg1.dataProvider=model.songList;
			view.cb.dataProvider=model.movieList;

			eventMap.mapListener(eventDispatcher, CommonEvents.MOVIE_CHANGED_EVENT, movieChangeHandler);
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cbChangeHandler);
			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);
		}

		private function cbChangeHandler(event:IndexChangeEvent):void
		{			
			model.selectedMovieVO=event.target.dataProvider[event.newIndex] as MovieVO;
			movieChangeHandler();
		}

		private function addNewItem(event:MouseEvent):void
		{
			var vo:SongVO=new SongVO();
			vo.movie_id=model.selectedMovieVO.movie_id;
			vo.isDirty=true;
			model.songList.addItem(vo);
		}

		private function saveAllItem(event:MouseEvent):void
		{
			logger.debug('[SongViewMediator] saveAllItem()');
			for each (var vo:SongVO in model.songList)
			{
				if (vo.isDirty && vo.song_id > 0)
				{
					dispatch(new SongEvent(SongEvent.UPDATE_SONG, vo));
				}
				else if (vo.isDirty && vo.song_id == 0)
				{
					dispatch(new SongEvent(SongEvent.ADD_SONG, vo));
				}
			}

		}

		private function movieChangeHandler(event:Event=null):void
		{
			logger.debug('[View2Mediator] movieChangeHandler()');
			view.title=model.selectedMovieVO.movie_name;
			model.songList.filterFunction=filterSelectedMovie;
			model.songList.refresh();
		}

		private function filterSelectedMovie(vo:SongVO):Boolean
		{
			return (vo.movie_id == model.selectedMovieVO.movie_id) ? true : false;
		}

	}
}
