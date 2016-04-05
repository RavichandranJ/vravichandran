package com.vravichandran.cms.commands
{
	import com.ravi.framework.robolegs2.AbstractCommand;
	import com.ravi.utils.VOUtils;
	import com.vravichandran.cms.delegate.MovieDelegate;
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.vo.MovieVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class MovieCommand extends AbstractCommand
	{
		
		[Inject]
		public var delegate:MovieDelegate;
		
		[Inject]
		public var model:AppModuleLocator;
		
		[Inject]
		public var event:MovieEvent;
		
		override public function execute():void
		{
			logger.debug('[MovieCommand] execute()');
			
			switch (event.eventType)
			{
				case MovieEvent.GET_ALL_MOVIE:
				{
					delegate.getAllMovie().addResponder(this);
					break;
				}
				case MovieEvent.ADD_MOVIE:
				{
					delegate.addMovie(event.dataItem).addResponder(this);
					break;
				}
				case MovieEvent.UPDATE_MOVIE:
				{
					delegate.updateMovie(event.dataItem).addResponder(this);
					break;
				}
				case MovieEvent.DELETE_MOVIE_BY_ID:
				{
					delegate.deleteMovieById(event.dataItem).addResponder(this);
					break;
				}
				default:
				{
					logger.debug('[MovieCommand] execute() not handled for {0}', event.eventType);
					break;
				}
			}
		}
		
		override public function result(event:Object):void
		{
			logger.debug('[MovieCommand]  result recieved for service method {0} ', event.token.serviceMethod);
			
			switch (event.token.serviceMethod)
			{
				case MovieEvent.GET_ALL_MOVIE:
				{
					getAllMovie(event);
					break;
				}
				case MovieEvent.ADD_MOVIE:
				{
					addMovie(event);
					break;
				}
				case MovieEvent.UPDATE_MOVIE:
				{
					updateMovie(event);
					break;
				}
				case MovieEvent.DELETE_MOVIE_BY_ID:
				{
					deleteMovieById(event);
					break;
				}
				default:
				{
					logger.debug('[MovieCommand] result() not handled for {0}', event);
					break;
				}
			}
			
		}
		
		private function getAllMovie(event:Object):void
		{
			var resultList:Array=VOUtils.getConvertedDataItemList(event.result.source, MovieVO);
			model.movieList.source=resultList;
		//	logger.debug('resultList = {0}', ObjectUtil.toString(resultList) );	
		}
		
		private function addMovie(event:Object):void
		{
			var itemIndex:int=model.movieList.getItemIndex(event.token.vo as MovieVO);
			if (model.movieList[itemIndex].movie_id == 0)
			{
				model.movieList[itemIndex].movie_id=int(event.result);
				logger.debug('[MovieCommand] addMovie = {0}', ObjectUtil.toString(model.movieList[itemIndex]));
			}
		}
		
		private function updateMovie(event:Object):void
		{
			
		}
		
		private function deleteMovieById(event:Object):void
		{
			var itemIndex:int=model.movieList.getItemIndex(event.token.vo);
			if (itemIndex != -1)
			{
				model.movieList.removeItemAt(itemIndex);
			}
		}
	}
}