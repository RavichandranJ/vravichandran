package com.vravichandran.cms.mediator.renderer.artist_movie
{
	import com.ravi.framework.robolegs2.AbstractMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.artist_movie.ArtistTypeIRenderer;
	import com.vravichandran.cms.vo.ArtistMovieVO;
	
	import spark.events.IndexChangeEvent;

	public class ArtistTypeIRendererMediator extends AbstractMediator
	{
		
		[Inject]
		public var view:ArtistTypeIRenderer;
		
		[Inject]
		public var model:AppModuleLocator;
		
		override public function initialize():void
		{
			logger.debug('[ArtistTypeIRendererMediator] initialize()');
			view.cb.dataProvider = model.artistTypeList;		
			view.cb.selectedIndex = view.data ? ArtistMovieVO(view.data).artistTypeIndex : -1;
			eventMap.mapListener(view.cb, IndexChangeEvent.CHANGE, cb_changeHandler);
		}
		
		protected function cb_changeHandler(event:IndexChangeEvent):void
		{
			if(view.data.artist_type_id != view.cb.selectedItem.artist_type_id)
			{
				view.data.artist_type_id = view.cb.selectedItem.artist_type_id;
				view.data.isDirty = true;
				view.data.artistTypeIndex = event.newIndex;
			}				
		}	
		
	}
}