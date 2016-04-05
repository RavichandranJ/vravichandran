package com.vravichandran.cms.mediator.renderer.artist_movie
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.ArtistMovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.artist_movie.TrashArtistMovieIRenderer;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;

	public class TrashArtistMovieIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:TrashArtistMovieIRenderer
		
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
				dispatch(new ArtistMovieEvent(ArtistMovieEvent.DELETE_ARTIST_MOVIE_BY_ID, view.data));
			}
		}
	}
}