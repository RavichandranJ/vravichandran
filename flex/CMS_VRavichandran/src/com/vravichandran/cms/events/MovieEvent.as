package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class MovieEvent extends Event
	{
		
		// this group related events with commonds - movie
		public static const MOVIE_COMMAND:String = "movieCommand";
		
		
		public static const GET_ALL_MOVIE:String = "getAllMovie";		
		public static const ADD_MOVIE:String = "addMovie";
		public static const UPDATE_MOVIE:String = "updateMovie";		
		public static const DELETE_MOVIE_BY_ID:String = "deleteMovieById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function MovieEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(MOVIE_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MovieEvent(MOVIE_COMMAND, dataItem);
		}
	}
}