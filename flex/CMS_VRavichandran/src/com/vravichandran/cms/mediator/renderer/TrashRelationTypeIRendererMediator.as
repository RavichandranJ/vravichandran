package com.vravichandran.cms.mediator.renderer
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.RelationTypeEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.TrashRelationTypeIRenderer;
	import com.vravichandran.cms.renderer.TrashRelationTypeIRenderer;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	import spark.events.IndexChangeEvent;
	
	public class TrashRelationTypeIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:TrashRelationTypeIRenderer;
		
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
				dispatch(new RelationTypeEvent(RelationTypeEvent.DELETE_RELATION_TYPE_BY_ID, view.data));
			}
		}
	}
}