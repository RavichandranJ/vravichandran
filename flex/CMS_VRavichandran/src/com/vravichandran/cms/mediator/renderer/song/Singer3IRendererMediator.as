package com.vravichandran.cms.mediator.renderer.song
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.song.Singer3IRenderer;
	import com.vravichandran.cms.vo.SongVO;
	
	import flash.events.MouseEvent;
	
	import spark.events.IndexChangeEvent;

	public class Singer3IRendererMediator extends AbstractMediator
	{

		[Inject]
		public var view:Singer3IRenderer;

		[Inject]
		public var model:AppModuleLocator;

		override public function initialize():void
		{
			logger.debug('[ArtistTypeIRendererMediator] initialize()');
			view.cb.dataProvider=model.artistList;
			view.cb.selectedIndex=view.data ? SongVO(view.data).singer3Index : -1;
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cb_changeHandler);
			eventMap.mapListener(view.btnClear, MouseEvent.CLICK, clearSelectedItem);
		}

		protected function cb_changeHandler(event:IndexChangeEvent):void
		{
			if(view.data.singer3 != view.cb.selectedItem.artist_id)
			{
				view.data.singer3 = view.cb.selectedItem.artist_id;
				view.data.isDirty = true;
				view.data.singer3Index = event.newIndex;
			}				
		}
		
		private function clearSelectedItem(event:MouseEvent):void
		{
			view.data.singer3 = 0;
			view.data.isDirty = true;
			view.data.singer3Index = -1;
		}

	}
}
