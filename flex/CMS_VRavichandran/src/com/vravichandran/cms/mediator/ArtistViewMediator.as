package com.vravichandran.cms.mediator
{
	
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.ArtistEvent;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.ArtistView;
	import com.vravichandran.cms.vo.ArtistVO;
	
	import flash.events.MouseEvent;
	
	import mx.utils.ObjectUtil;
	
	public class ArtistViewMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:ArtistView;
		
		[Inject]
		public var model:AppModuleLocator;
		
		private const STATE_DEFAULT:String = "defaultState";
		private const STATE_EDIT:String = "editState";		
	
		override public function initialize():void
		{
			logger.debug('[ArtistViewMediator] initialize()');
			view.dg1.dataProvider = model.artistList;eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			//view.msgLbl.text = model.message;
			
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);
			eventMap.mapListener(eventDispatcher, CommonEvents.EDIT_ARTIST_EVENT, editArtistHandler);
			
		}
		
		private function addNewItem(event:MouseEvent):void
		{
			var vo:ArtistVO=new ArtistVO();
			vo.isDirty=true;
			model.artistList.addItem(vo);			
		}
		
		private function saveAllItem(event:MouseEvent):void
		{
			logger.debug('[ArtistViewMediator] saveAll()');			
			for each (var vo:ArtistVO in model.artistList)
			{
				if (vo.isDirty && vo.artist_id > 0 && vo.artist_name.length>0)
				{
					dispatch(new ArtistEvent(ArtistEvent.UPDATE_ARTIST, vo));
				}
				else if (vo.isDirty && vo.artist_id == 0 && vo.artist_name.length>0)
				{
					dispatch(new ArtistEvent(ArtistEvent.ADD_ARTIST, vo));
				}
			}
			
		}
		
		private function editArtistHandler(event:CommonEvents):void
		{
			logger.debug('editArtistHandler()');	
			view.currentState = STATE_EDIT;
			view.editArtistFormView.vo = model.selectedArtist;
			view.editArtistFormView.cb.dataProvider = model.artistList;
			eventMap.mapListener(view.btnSave, MouseEvent.CLICK, saveItem);
			eventMap.mapListener(view.btnBack, MouseEvent.CLICK, gotoGridView);
		}
		
		private function saveItem(event:MouseEvent):void
		{
			logger.debug('[ArtistViewMediator] saveItem()');
			if (view.editArtistFormView.vo.artist_id > 0)
			{
				dispatch(new ArtistEvent(ArtistEvent.UPDATE_ARTIST, view.editArtistFormView.vo));				
			}
			else 
			{
				dispatch(new ArtistEvent(ArtistEvent.ADD_ARTIST, view.editArtistFormView.vo));
			}
			
		}
		
		private function gotoGridView(event:MouseEvent):void
		{
			view.currentState = STATE_DEFAULT;
		}
	}
}
