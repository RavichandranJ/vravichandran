package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.ArtistMovieEvent;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.ArtistMovieView;
	import com.vravichandran.cms.vo.ArtistMovieVO;
	import com.vravichandran.cms.vo.MovieVO;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.events.IndexChangeEvent;

	public class ArtistMovieViewMediator extends AbstractMediator
	{

		[Inject]
		public var view:ArtistMovieView;

		[Inject]
		public var model:AppModuleLocator;

		override public function initialize():void
		{
			logger.debug('[View2Mediator] initialize()');
			view.cb.dataProvider = model.movieList;

			view.dg1.dataProvider=model.artistMovieList;
			eventMap.mapListener(eventDispatcher, CommonEvents.MOVIE_CHANGED_EVENT, movieChangeHandler);
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cbChangeHandler);
			
			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);
			dispatch(new ArtistMovieEvent(ArtistMovieEvent.GET_ALL_ARTIST_MOVIE));
		}
		
		private function cbChangeHandler(event:IndexChangeEvent):void
		{
			//var data:Object = event.target.dataProvider[event.newIndex];
			model.selectedMovieVO = event.target.dataProvider[event.newIndex] as MovieVO;
			movieChangeHandler();
			//dispatch(new CommonEvents(CommonEvents.MOVIE_CHANGED_EVENT));			
			
		}

		private function addNewItem(event:MouseEvent):void
		{
			var vo:ArtistMovieVO=new ArtistMovieVO();
			vo.movie_id=model.selectedMovieVO.movie_id;
			vo.movie_name = model.selectedMovieVO.movie_name;
			vo.isDirty=true;
			model.artistMovieList.addItem(vo);

		}

		private function saveAllItem(event:MouseEvent):void
		{
			for each (var vo:ArtistMovieVO in model.artistMovieList)
			{
				if (vo.isDirty && vo.artist_movie_id > 0)
				{
					dispatch(new ArtistMovieEvent(ArtistMovieEvent.UPDATE_ARTIST_MOVIE, vo));
				}
				else if (vo.isDirty && vo.artist_movie_id == 0)
				{
					dispatch(new ArtistMovieEvent(ArtistMovieEvent.ADD_ARTIST_MOVIE, vo));
				}
			}

		}

		private function movieChangeHandler(event:Event=null):void
		{
			logger.debug('[View2Mediator] movieChangeHandler()');
			view.title=model.selectedMovieVO.movie_name;
			model.artistMovieList.filterFunction=filterSelectedMovie;
			model.artistMovieList.refresh();
		}

		private function filterSelectedMovie(vo:ArtistMovieVO):Boolean
		{
			return (vo.movie_id == model.selectedMovieVO.movie_id) ? true : false;
		}

	}
}
