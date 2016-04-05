package com.vravichandran.cms.mediator.renderer.movie
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.movie.TrashMovieIRenderer;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	public class TrashMovieIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:TrashMovieIRenderer
		
		[Inject]
		public var model:AppModuleLocator
		
		override public function initialize():void
		{
			eventMap.mapListener(view.btnTrash, MouseEvent.CLICK, trashClickHandler);
		}
		
		private function trashClickHandler(event:MouseEvent):void
		{
			Alert.show("Are you sure to delete this", "Confirmation Required", Alert.YES | Alert.NO, null, confirmHandler);			
		}
		
		private function confirmHandler(event:CloseEvent):void
		{
			if(event.detail == Alert.YES)
			{
				dispatch(new MovieEvent(MovieEvent.DELETE_MOVIE_BY_ID, view.data));
			}
		}
	}
}