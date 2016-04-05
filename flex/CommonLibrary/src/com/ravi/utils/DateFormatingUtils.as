package com.ravi.utils
{
	import mx.formatters.DateFormatter;

	public class DateFormatingUtils
	{
		private static var dateFormatter:DateFormatter=new DateFormatter();
		private static const DB_FORMAT:String='YYYY-MM-DD';
		private static const FORMAT1:String="DD-MM-YYYY";

		public static function formateString1(date:Date):String
		{
			if (date)
			{
				dateFormatter.formatString=FORMAT1;
				return dateFormatter.format(date);
			}

			return "";
		}

		public static function db_formateString1(date:Date):String
		{
			if (date)
			{
				dateFormatter.formatString=DB_FORMAT;
				trace('dateFormatter.format(date)');
				return dateFormatter.format(date);
			}

			return "";
		}
	}
}
