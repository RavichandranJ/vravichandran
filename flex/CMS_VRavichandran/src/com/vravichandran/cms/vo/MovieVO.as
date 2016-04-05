package com.vravichandran.cms.vo
{
	import com.ravi.utils.DateFormatingUtils;
	
	import mx.formatters.DateFormatter;

	[Bindable]
	public class MovieVO
	{
		public function MovieVO()
		{
		}
		
		public var movie_id:int;
		public var movie_name:String;
		public var poster:String;
		public var banner:String;
		public var releaseDate:Date;
		public var description:String;
		public var language:String = "Kannada";
		public var youtube_video_url:String;
		public var fb_page:String;
		public var duration:String;
		public var keywords:String;
		public var year:String='0';
		
		// 
		public var selectedIndex:int=-1;
		public var isDirty:Boolean=false;
		public var checked:Boolean = false;
	
	}
}
