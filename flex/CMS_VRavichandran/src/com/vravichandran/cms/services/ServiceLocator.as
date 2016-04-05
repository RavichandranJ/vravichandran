package com.vravichandran.cms.services
{
	import mx.rpc.remoting.RemoteObject;

	public class ServiceLocator
	{
		
		public var artistMovieService:RemoteObject;
		public var artistService:RemoteObject;
		public var artistTypeService:RemoteObject;
		public var familyService:RemoteObject;
		public var movieService:RemoteObject;
		public var relationTypeService:RemoteObject;
		public var songService:RemoteObject;
		
		private static const ARTIST_MOVIE_SERVICE:String = "com.vravichandran.cms.ArtistMovieService";
		private static const ARTIST_SERVICE:String = "com.vravichandran.cms.ArtistService";
		private static const ARTIST_TYPE_SERVICE:String = "com.vravichandran.cms.ArtistTypeService";
		private static const FAMILY_SERVICE:String = "com.vravichandran.cms.FamilyService";
		private static const MOVIE_SERVICE:String = "com.vravichandran.cms.MovieService";
		private static const RELATION_TYPE_SERVICE:String = "com.vravichandran.cms.RelationTypeService";
		private static const SONG_SERVICE:String = "com.vravichandran.cms.SongService";

		
		public function ServiceLocator()
		{
			artistMovieService = getRemoteObject(ARTIST_MOVIE_SERVICE);
			artistService = getRemoteObject(ARTIST_SERVICE);
			artistTypeService = getRemoteObject(ARTIST_TYPE_SERVICE);
			familyService = getRemoteObject(FAMILY_SERVICE);
			movieService = getRemoteObject(MOVIE_SERVICE);
			relationTypeService = getRemoteObject(RELATION_TYPE_SERVICE);
			songService = getRemoteObject(SONG_SERVICE);
			
			
		}
		
		private function getRemoteObject(souce:String):RemoteObject
		{
			var ro:RemoteObject = new RemoteObject("ColdFusion");
			ro.source = souce;
			ro.endpoint = "http://localhost:8500/flex2gateway/";
			return ro;
		}
	}
}