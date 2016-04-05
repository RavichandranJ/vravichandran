package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class ArtistMovieEvent extends Event
	{
		
		// this group related events with commonds - artistMovie
		public static const ARTIST_MOVIE_COMMAND:String = "artistMovieCommand";
		
		
		public static const GET_ALL_ARTIST_MOVIE:String = "getAllArtistMovie";		
		public static const ADD_ARTIST_MOVIE:String = "addArtistMovie";
		public static const UPDATE_ARTIST_MOVIE:String = "updateArtistMovie";		
		public static const DELETE_ARTIST_MOVIE_BY_ID:String = "deleteArtistMovieById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function ArtistMovieEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(ARTIST_MOVIE_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ArtistMovieEvent(ARTIST_MOVIE_COMMAND, dataItem);
		}
	}
}