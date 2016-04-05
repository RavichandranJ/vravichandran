package com.vravichandran.cms.mediator.renderer.artist_movie
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.artist_movie.ArtistNameIRenderer;
	import com.vravichandran.cms.vo.ArtistMovieVO;
	import com.vravichandran.cms.vo.ArtistVO;
	
	import mx.events.FlexEvent;
	
	import spark.events.IndexChangeEvent;

	public class ArtistNameIRendererMediator extends AbstractMediator
	{

		[Inject]
		public var view:ArtistNameIRenderer;

		[Inject]
		public var model:AppModuleLocator;


		override public function initialize():void
		{
			logger.debug('[ArtistNameIRendererMediator] initialize()');
			view.cb.dataProvider=model.artistList;
			view.cb.selectedIndex = view.data ? ArtistMovieVO(view.data).artistIndex : -1;
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cb_changeHandler);
		}
		
		protected function cb_changeHandler(event:IndexChangeEvent):void
		{
			if(view.data.artist_id != view.cb.selectedItem.artist_id)
			{
				view.data.artist_id = view.cb.selectedItem.artist_id;
				view.data.isDirty = true;
				view.data.artistIndex = event.newIndex;
			}				
		}

	}
}
