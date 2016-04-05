package com.vravichandran.cms.vo
{
	[Bindable]
	public class FamilyVO
	{
		public function FamilyVO()
		{
		}

		public var family_id:int = 0;
		public var artist_id:int;
		public var relative_id:int;
		public var relation_type_id:int;
		
		//cb selected Index
		public var relativeIndex:int = -1;
		public var relation_typeIndex:int = -1;
		
		// 
		public var selectedIndex:int=-1;
		public var isDirty:Boolean=false;
		public var checked:Boolean = false;
		
	}
}
