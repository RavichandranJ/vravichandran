package com.vravichandran.cms.vo
{
	[Bindable]
	public class ArtistTypeVO
	{
		public function ArtistTypeVO()
		{
		}
		
		public var artist_type_label:String;
		public var artist_type_id:int;
		
		// 
		public var selectedIndex:int=-1;
		public var isDirty:Boolean=false;
		public var checked:Boolean = false;
	}
}