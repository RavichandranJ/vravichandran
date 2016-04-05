package com.vravichandran.cms.mediator
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.events.ArtistMovieEvent;
	import com.vravichandran.cms.events.CommonEvents;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.MovieVO;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	import mx.utils.ObjectUtil;
	
	import spark.events.IndexChangeEvent;
	import com.vravichandran.cms.view.View1;

	public class View1Mediator extends AbstractMediator
	{
		
		[Inject]
		public var model:AppModuleLocator;

		[Inject]
		public var view:View1;

		override public function initialize():void
		{
			logger.debug('[View1Mediator] initialize()');		
			//view.list1.dataProvider = model.movieList;
			
			// addListeners
			eventMap.mapListener(view.btnAdd, MouseEvent.CLICK, btnAdd_clickHandler);
			eventMap.mapListener(view.btnDelete, MouseEvent.CLICK, btnDelete_clickHandler);
			eventMap.mapListener(view.list1, IndexChangeEvent.CHANGE, list1ChangeHandler);
		}
		
		private function list1ChangeHandler(event:IndexChangeEvent):void
		{
						
		}
		
		protected function btnAdd_clickHandler(event:MouseEvent):void
		{
			//	dispatch(new OrdersEvent(OrdersEvent.UPDAT_EORDER));
		}
		
		protected function btnDelete_clickHandler(event:MouseEvent):void
		{
			Alert.show("Are you sure to delete item ?. Item will not be available after deleted", "Confirmation Required", Alert.YES|Alert.NO, null, delete_confirmHandler);
		}
		
		private function delete_confirmHandler(event:CloseEvent):void
		{
			if(event.detail==Alert.YES)
			{				
				//dispatch(new ArtistMovieEvent(ArtistMovieEvent.DELETE_ORDER, view.list1.selectedItem.ORDERID));			
			}
		}
	}
}
