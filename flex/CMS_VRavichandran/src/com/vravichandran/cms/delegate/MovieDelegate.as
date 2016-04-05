package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class MovieDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
		
		public function getAllMovie():AsyncToken
		{
			var token:AsyncToken = service.movieService.getAllMovie();
			token.serviceMethod = MovieEvent.GET_ALL_MOVIE;
			return token;
		}
		
		
		public function addMovie(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.movieService.addMovie(param);
			token.serviceMethod = MovieEvent.ADD_MOVIE;
			token.vo = item;
			return token;
		}
		
		public function updateMovie(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.movieService.updateMovie(param);
			token.serviceMethod = MovieEvent.UPDATE_MOVIE;
			return token;
		}
		
		public function deleteMovieById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.movieService.deleteMovieById(param);
			token.serviceMethod = MovieEvent.DELETE_MOVIE_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}