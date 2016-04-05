package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.ArtistTypeEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.view.ArtistTypeView;
	import com.vravichandran.cms.view.FamilyView;
	import com.vravichandran.cms.view.RelationTypeView;
	import com.vravichandran.cms.vo.ArtistTypeVO;

	import flash.events.MouseEvent;

	public class ArtistTypeViewMediator extends AbstractMediator
	{

		[Inject]
		public var view:ArtistTypeView;

		[Inject]
		public var model:AppModuleLocator;

		override public function initialize():void
		{
			logger.debug('[ArtistTypeViewMediator] initialize()');
			view.dg1.dataProvider=model.artistTypeList;

			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, addNewItem);
			eventMap.mapListener(view.btnSaveAll, MouseEvent.CLICK, saveAllItem);
		}

		private function addNewItem(event:MouseEvent):void
		{
			var vo:ArtistTypeVO=new ArtistTypeVO();
			vo.isDirty=true;
			model.artistTypeList.addItem(vo);
		}

		private function saveAllItem(event:MouseEvent):void
		{
			logger.debug('[ArtistTypeViewMediator] saveAllItem()');
			for each (var vo:ArtistTypeVO in model.artistTypeList)
			{
				if (vo.isDirty && vo.artist_type_id > 0)
				{
					dispatch(new ArtistTypeEvent(ArtistTypeEvent.UPDATE_ARTIST_TYPE, vo));
				}
				else if (vo.isDirty && vo.artist_type_id == 0)
				{
					dispatch(new ArtistTypeEvent(ArtistTypeEvent.ADD_ARTIST_TYPE, vo));
				}
			}

		}

	}
}
