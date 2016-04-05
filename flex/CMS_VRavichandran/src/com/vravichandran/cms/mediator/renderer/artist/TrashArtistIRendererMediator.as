package com.vravichandran.cms.mediator.renderer.artist
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.ArtistEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.artist.TrashArtistIRenderer;

	import flash.events.MouseEvent;

	import mx.controls.Alert;
	import mx.events.CloseEvent;

	public class TrashArtistIRendererMediator extends AbstractMediator
	{

		[Inject]
		public var view:TrashArtistIRenderer;

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
			if (event.detail == Alert.YES)
			{
				dispatch(new ArtistEvent(ArtistEvent.DELETE_ARTIST_BY_ID, view.data));
			}
		}
	}
}
