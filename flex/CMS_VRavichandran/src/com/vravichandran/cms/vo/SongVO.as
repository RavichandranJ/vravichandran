package com.vravichandran.cms.vo
{

	[Bindable]
	public class SongVO
	{
		public function SongVO()
		{
		}

		public var song_id:int = 0;
		public var song_name:String;
		public var lyrics:int=0;
		public var singer1:int=0;
		public var singer2:int=0;
		public var singer3:int=0;
		public var length:String;
		public var movie_id:int;

		// Selected Index for CB
		public var lyricsIndex:int=-1;
		public var singer1Index:int=-1;
		public var singer2Index:int=-1;
		public var singer3Index:int=-1;

		// 
		public var selectedIndex:int=-1;
		public var isDirty:Boolean=false;
		public var checked:Boolean=false;
	}
}
