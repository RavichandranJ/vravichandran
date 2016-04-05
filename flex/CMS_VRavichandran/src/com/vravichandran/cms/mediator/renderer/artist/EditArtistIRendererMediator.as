package com.vravichandran.cms.mediator.renderer.artist
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.artist.EditArtistIRenderer;
	import com.vravichandran.cms.vo.ArtistVO;
	
	import flash.events.MouseEvent;
	
	public class EditArtistIRendererMediator  extends AbstractMediator
	{
		
		[Inject]
		public var view:EditArtistIRenderer;
		
		[Inject]
		public var model:AppModuleLocator
		
		override public function initialize():void
		{
			eventMap.mapListener(view.btnEdit, MouseEvent.CLICK, editClickHandler);
		}
		
		private function editClickHandler(event:MouseEvent):void
		{
			logger.debug('editClickHandler()');
			model.selectedArtist = view.data as ArtistVO;
			dispatch(new CommonEvents(CommonEvents.EDIT_ARTIST_EVENT));	
		}
		
		
	}
}