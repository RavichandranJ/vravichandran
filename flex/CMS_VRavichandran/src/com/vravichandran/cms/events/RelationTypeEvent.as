package com.vravichandran.cms.events
{
	import flash.events.Event;
	
	public class RelationTypeEvent extends Event
	{
		
		// this group related events with commonds - relationType
		public static const RELATION_TYPE_COMMAND:String = "relationTypeCommand";
		
		
		public static const GET_ALL_RELATION_TYPE:String = "getAllRelationType";		
		public static const ADD_RELATION_TYPE:String = "addRelationType";
		public static const UPDATE_RELATION_TYPE:String = "updateRelationType";		
		public static const DELETE_RELATION_TYPE_BY_ID:String = "deleteRelationTypeById";
		
		public var eventType:String;
		public var dataItem:Object;
		
		public function RelationTypeEvent(eventType:String, param:Object = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.eventType = eventType;		
			this.dataItem = param;
			super(RELATION_TYPE_COMMAND, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new RelationTypeEvent(RELATION_TYPE_COMMAND, dataItem);
		}
	}
}