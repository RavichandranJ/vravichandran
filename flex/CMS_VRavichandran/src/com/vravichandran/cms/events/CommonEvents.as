package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class CommonEvents extends Event
	{
		
		public static const MOVIE_CHANGED_EVENT:String = "movieChangedEvent";
		public static const EDIT_MOVIE_EVENT:String = "editMovieEvent";
		public static const EDIT_ARTIST_EVENT:String = "editArtistEvent";
		
		
		[Bindable]
		public var data:Object;
		
		public function CommonEvents(type:String, _data:Object=null)
		{
			super(type, bubbles, cancelable);
			this.data = _data;
		}
		
		override public function clone():Event
		{
			return new CommonEvents(type, data);
		}
		
	}
}