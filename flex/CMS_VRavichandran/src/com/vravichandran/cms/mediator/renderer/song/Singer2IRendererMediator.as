package com.vravichandran.cms.mediator.renderer.song
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.artist_movie.ArtistTypeIRenderer;
	import com.vravichandran.cms.renderer.song.LyricsIRenderer;
	import com.vravichandran.cms.renderer.song.Singer2IRenderer;
	import com.vravichandran.cms.vo.ArtistMovieVO;
	import com.vravichandran.cms.vo.SongVO;
	
	import flash.events.MouseEvent;
	
	import spark.events.IndexChangeEvent;
	
	public class Singer2IRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:Singer2IRenderer;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[ArtistTypeIRendererMediator] initialize()');
			view.cb.dataProvider = model.artistList;		
			view.cb.selectedIndex = view.data ? SongVO(view.data).singer2Index : -1;
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cb_changeHandler);
			eventMap.mapListener(view.btnClear, MouseEvent.CLICK, clearSelectedItem);
		}
		
		protected function cb_changeHandler(event:IndexChangeEvent):void
		{
			if(view.cb.selectedItem && view.data.singer2 != view.cb.selectedItem.artist_id)
			{
				view.data.singer2 = view.cb.selectedItem.artist_id;
				view.data.isDirty = true;
				view.data.singer2Index = event.newIndex;
			}				
		}		
		
		private function clearSelectedItem(event:MouseEvent):void
		{
			view.data.singer2 = 0;
			view.data.isDirty = true;
			view.data.singer2Index = -1;
		}
		
		
	}
}