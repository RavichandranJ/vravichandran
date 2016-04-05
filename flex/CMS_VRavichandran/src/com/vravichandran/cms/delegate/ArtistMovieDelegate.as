package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.ArtistMovieEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class ArtistMovieDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
				
		public function getAllArtistMovie():AsyncToken
		{
			var token:AsyncToken = service.artistMovieService.getAllArtistMovie();
			token.serviceMethod = ArtistMovieEvent.GET_ALL_ARTIST_MOVIE;
			return token;
		}
		
		
		public function addArtistMovie(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistMovieService.addArtistMovie(param);
			token.serviceMethod = ArtistMovieEvent.ADD_ARTIST_MOVIE;
			token.vo = item;
			return token;
		}
		
		public function updateArtistMovie(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistMovieService.updateArtistMovie(param);
			token.serviceMethod = ArtistMovieEvent.UPDATE_ARTIST_MOVIE;
			return token;
		}
		
		public function deleteArtistMovieById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistMovieService.deleteArtistMovieById(param);
			token.serviceMethod = ArtistMovieEvent.DELETE_ARTIST_MOVIE_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}