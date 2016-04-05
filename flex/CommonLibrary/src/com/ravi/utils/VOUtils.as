package com.ravi.utils
{
	import mx.utils.ObjectUtil;

	public class VOUtils
	{
		public function VOUtils()
		{
		}

		public static function getConvertedDataItemList(resultList:Array, voClass:Class):Array
		{
			var result:Array=[];

			for each (var item:Object in resultList)
			{
				result.push(getConvertedDataItem(voClass, item));
			}
			return result;
		}

		public static function getConvertedDataItem(voClass:Class, item:Object):Object
		{
			var vo:*=new voClass();
			var classInfo:Object=ObjectUtil.getClassInfo(vo);

			for each (var name:QName in classInfo.properties)
			{
				if (item[name.localName] != null)
				{
					try
					{
						vo[name.localName]=item[name.localName];
					}
					catch (e:Error)
					{
						trace('[VOUtils] ' + ObjectUtil.toString(e));
					}
				}
			}
			return vo;
		}
	}
}
