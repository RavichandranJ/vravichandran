package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.ArtistTypeEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class ArtistTypeDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
		
		public function getAllArtistType():AsyncToken
		{
			var token:AsyncToken = service.artistTypeService.getAllArtistType();
			token.serviceMethod = ArtistTypeEvent.GET_ALL_ARTIST_TYPE;
			return token;
		}
		
		
		public function addArtistType(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistTypeService.addArtistType(param);
			token.serviceMethod = ArtistTypeEvent.ADD_ARTIST_TYPE;
			token.vo = item;
			return token;
		}
		
		public function updateArtistType(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistTypeService.updateArtistType(param);
			token.serviceMethod = ArtistTypeEvent.UPDATE_ARTIST_TYPE;
			return token;
		}
		
		public function deleteArtistTypeById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.artistTypeService.deleteArtistTypeById(param);
			token.serviceMethod = ArtistTypeEvent.DELETE_ARTIST_TYPE_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}