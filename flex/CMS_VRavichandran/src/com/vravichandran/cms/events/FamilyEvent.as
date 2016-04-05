package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class FamilyEvent extends Event
	{
		
		// this group related events with commonds - family
		public static const FAMILY_COMMAND:String = "familyCommand";
		
		
		public static const GET_ALL_FAMILY:String = "getAllFamily";		
		public static const ADD_FAMILY:String = "addFamily";
		public static const UPDATE_FAMILY:String = "updateFamily";		
		public static const DELETE_FAMILY_BY_ID:String = "deleteFamilyById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function FamilyEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(FAMILY_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new FamilyEvent(FAMILY_COMMAND, dataItem);
		}
	}
}