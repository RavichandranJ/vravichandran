package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class ArtistEvent extends Event
	{
		
		// this group related events with commonds - artist
		public static const ARTIST_COMMAND:String = "artistCommand";
		
		
		public static const GET_ALL_ARTIST:String = "getAllArtist";		
		public static const ADD_ARTIST:String = "addArtist";
		public static const UPDATE_ARTIST:String = "updateArtist";		
		public static const DELETE_ARTIST_BY_ID:String = "deleteArtistById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function ArtistEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(ARTIST_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ArtistEvent(ARTIST_COMMAND, dataItem);
		}
	}
}