package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.FamilyEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.FamilyView;
	import com.vravichandran.cms.vo.ArtistVO;
	import com.vravichandran.cms.vo.FamilyVO;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.events.IndexChangeEvent;

	public class FamilyViewMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:FamilyView;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[FamilyViewMediator] initialize()');
			view.dg1.dataProvider = model.familyList;
			view.cb.dataProvider = model.artistList;
			
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cbChangeHandler);
			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);
		}
		
		private function cbChangeHandler(event:IndexChangeEvent):void
		{			
			model.selectedArtist=event.target.dataProvider[event.newIndex] as ArtistVO;
			view.title=model.selectedArtist.artist_name;
			model.familyList.filterFunction=filterSelectedFamily;
			model.familyList.refresh();
		}
		
		private function addNewItem(event:MouseEvent):void
		{
			var vo:FamilyVO=new FamilyVO();
			vo.artist_id=model.selectedArtist.artist_id;
			vo.isDirty=true;
			model.familyList.addItem(vo);
		}
		
		private function saveAllItem(event:MouseEvent):void
		{
			logger.debug('[FamilyViewMediator] saveAllItem()');
			for each (var vo:FamilyVO in model.familyList)
			{
				if (vo.isDirty && vo.family_id > 0)
				{
					dispatch(new FamilyEvent(FamilyEvent.UPDATE_FAMILY, vo));
				}
				else if (vo.isDirty && vo.family_id == 0)
				{
					dispatch(new FamilyEvent(FamilyEvent.ADD_FAMILY, vo));
				}
			}
			
		}		
		
		private function filterSelectedFamily(vo:FamilyVO):Boolean
		{
			return (vo.artist_id == model.selectedArtist.artist_id) ? true : false;
		}
		
	}
}
