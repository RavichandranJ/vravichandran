package com.vravichandran.cms.mediator.renderer.family
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.FamilyEvent;
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.family.TrashFamilyIRenderer;

	import flash.events.MouseEvent;

	import mx.controls.Alert;
	import mx.events.CloseEvent;


	public class TrashFamilyIRendererMediator extends AbstractMediator
	{

		[Inject]
		public var view:TrashFamilyIRenderer;

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
				dispatch(new FamilyEvent(FamilyEvent.DELETE_FAMILY_BY_ID, view.data));
			}
		}
	}
}
