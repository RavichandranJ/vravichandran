package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class SongEvent extends Event
	{
		
		// this group related events with commonds - song
		public static const SONG_COMMAND:String = "songCommand";
		
		
		public static const GET_ALL_SONG:String = "getAllSong";		
		public static const ADD_SONG:String = "addSong";
		public static const UPDATE_SONG:String = "updateSong";		
		public static const DELETE_SONG_BY_ID:String = "deleteSongById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function SongEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(SONG_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new SongEvent(SONG_COMMAND, dataItem);
		}
	}
}