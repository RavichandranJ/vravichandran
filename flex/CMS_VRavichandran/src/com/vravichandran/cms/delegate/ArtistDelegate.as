package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.ArtistEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class ArtistDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
		
		public function getAllArtist():AsyncToken
		{
			var token:AsyncToken = service.artistService.getAllArtist();
			token.serviceMethod = ArtistEvent.GET_ALL_ARTIST;
			return token;
		}
		
		
		public function addArtist(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistService.addArtist(param);
			token.serviceMethod = ArtistEvent.ADD_ARTIST;
			token.vo = item;
			return token;
		}
		
		public function updateArtist(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistService.updateArtist(param);
			token.serviceMethod = ArtistEvent.UPDATE_ARTIST;
			return token;
		}
		
		public function deleteArtistById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistService.deleteArtistById(param);
			token.serviceMethod = ArtistEvent.DELETE_ARTIST_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}