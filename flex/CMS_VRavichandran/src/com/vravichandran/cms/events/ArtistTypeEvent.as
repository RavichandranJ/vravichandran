package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class ArtistTypeEvent extends Event
	{
		
		// this group related events with commonds - artistType
		public static const ARTIST_TYPE_COMMAND:String = "artistTypeCommand";
		
		
		public static const GET_ALL_ARTIST_TYPE:String = "getAllArtistType";		
		public static const ADD_ARTIST_TYPE:String = "addArtistType";
		public static const UPDATE_ARTIST_TYPE:String = "updateArtistType";		
		public static const DELETE_ARTIST_TYPE_BY_ID:String = "deleteArtistTypeById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function ArtistTypeEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(ARTIST_TYPE_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ArtistTypeEvent(ARTIST_TYPE_COMMAND, dataItem);
		}
	}
}