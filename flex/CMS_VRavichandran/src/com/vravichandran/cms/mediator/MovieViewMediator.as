package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.MovieView;
	import com.vravichandran.cms.vo.MovieVO;
	
	import flash.events.MouseEvent;
	
	import mx.graphics.shaderClasses.SaturationShader;

	public class MovieViewMediator extends AbstractMediator
	{

		[Inject]
		public var view:MovieView;

		[Inject]
		public var model:AppModuleLocator;
		
		private const STATE_DEFAULT:String = "defaultState";
		private const STATE_EDIT:String = "editState";
		
		
		override public function initialize():void
		{
			logger.debug('[MovieViewMediator] initialize()');
			view.dg1.dataProvider = model.movieList;
			
			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);			
			eventMap.mapListener(eventDispatcher, CommonEvents.EDIT_MOVIE_EVENT, editMovieHandler);
		}
		
		private function addNewItem(event:MouseEvent):void
		{
			var vo:MovieVO=new MovieVO();
			vo.isDirty=true;
			model.movieList.addItem(vo);
		}
		
		private function saveAllItem(event:MouseEvent):void
		{
			logger.debug('[MovieViewMediator] saveAll()');
			for each (var vo:MovieVO in model.movieList)
			{
				if (vo.isDirty && vo.movie_id > 0 && vo.movie_name.length>0)
				{
					dispatch(new MovieEvent(MovieEvent.UPDATE_MOVIE, vo));
				}
				else if (vo.isDirty && vo.movie_id == 0 && vo.movie_name.length>0)
				{
					dispatch(new MovieEvent(MovieEvent.ADD_MOVIE, vo));
				}
			}
			
		}
		
		private function editMovieHandler(event:CommonEvents):void
		{
			logger.debug('editMovieHandler()');	
			view.currentState = STATE_EDIT;
			view.movieFormView.vo = model.selectedMovieVO;
			view.movieFormView.cb.dataProvider = model.movieList;
			eventMap.mapListener(view.btnSave, MouseEvent.CLICK, saveItem);
			eventMap.mapListener(view.btnBack, MouseEvent.CLICK, gotoGridView);
		}
		
		private function saveItem(event:MouseEvent):void
		{
			logger.debug('[MovieViewMediator] save()');
			if (view.movieFormView.vo.movie_id > 0)
			{
				dispatch(new MovieEvent(MovieEvent.UPDATE_MOVIE, view.movieFormView.vo));
			}
			else 
			{
				dispatch(new MovieEvent(MovieEvent.ADD_MOVIE, view.movieFormView.vo));
			}
			
		}
		
		private function gotoGridView(event:MouseEvent):void
		{
			view.currentState = STATE_DEFAULT;
		}
	}
}
