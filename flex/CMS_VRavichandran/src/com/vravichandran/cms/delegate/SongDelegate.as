package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.SongEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class SongDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
		
		public function getAllSong():AsyncToken
		{
			var token:AsyncToken = service.songService.getAllSong();
			token.serviceMethod = SongEvent.GET_ALL_SONG;
			return token;
		}
		
		
		public function addSong(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.songService.addSong(param);
			token.serviceMethod = SongEvent.ADD_SONG;
			token.vo = item;
			return token;
		}
		
		public function updateSong(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.songService.updateSong(param);
			token.serviceMethod = SongEvent.UPDATE_SONG;
			return token;
		}
		
		public function deleteSongById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.songService.deleteSongById(param);
			token.serviceMethod = SongEvent.DELETE_SONG_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}