package com.vravichandran.cms.vo
{
	import com.ravi.utils.DateFormatingUtils;

	[Bindable]
	public class ArtistVO
	{
		public function ArtistVO()
		{
		}

		public var artist_id:int;
		public var artist_name:String;
		public var dob:Date;
		public var designation:String;
		public var profile_pic:String;
		public var banner:String;
		public var youtube_video_url:String;
		public var fb_page:String;
		public var description:String;

		// 
		public var selectedIndex:int=-1;
		public var isDirty:Boolean=false;
		public var checked:Boolean = false;

	//	public var dobString:String = DateFormatingUtils.db_formateString1(dob);

		
	}
}
