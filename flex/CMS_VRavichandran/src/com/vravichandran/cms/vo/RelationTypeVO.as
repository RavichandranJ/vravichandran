package com.vravichandran.cms.vo
{
	[Bindable]
	public class RelationTypeVO
	{
		public function RelationTypeVO()
		{
		}
		
		public var relation_type:String;
		public var relation_type_id:int;
		
		// 
		public var selectedIndex:int=-1;
		public var isDirty:Boolean=false;
		public var checked:Boolean = false;
	}
}