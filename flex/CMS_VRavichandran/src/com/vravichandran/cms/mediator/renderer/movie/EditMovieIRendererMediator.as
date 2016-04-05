package com.vravichandran.cms.mediator.renderer.movie
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.movie.EditMovieIRenderer;
	import com.vravichandran.cms.renderer.movie.TrashMovieIRenderer;
	import com.vravichandran.cms.vo.MovieVO;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	
	public class EditMovieIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:EditMovieIRenderer;
		
		[Inject]
		public var model:AppModuleLocator
		
		override public function initialize():void
		{
			eventMap.mapListener(view.btnEdit, MouseEvent.CLICK, editClickHandler);
		}
		
		private function editClickHandler(event:MouseEvent):void
		{
			logger.debug('editClickHandler()');
			model.selectedMovieVO = view.data as MovieVO;
			dispatch(new CommonEvents(CommonEvents.EDIT_MOVIE_EVENT));	
		}
		
		
	}
}