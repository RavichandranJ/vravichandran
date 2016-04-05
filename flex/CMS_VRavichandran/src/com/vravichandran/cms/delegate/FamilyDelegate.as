package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.FamilyEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class FamilyDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
		
		public function getAllFamily():AsyncToken
		{
			var token:AsyncToken = service.familyService.getAllFamily();
			token.serviceMethod = FamilyEvent.GET_ALL_FAMILY;
			return token;
		}
		
		
		public function addFamily(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.familyService.addFamily(param);
			token.serviceMethod = FamilyEvent.ADD_FAMILY;
			token.vo = item;
			return token;
		}
		
		public function updateFamily(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.familyService.updateFamily(param);
			token.serviceMethod = FamilyEvent.UPDATE_FAMILY;
			return token;
		}
		
		public function deleteFamilyById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.familyService.deleteFamilyById(param);
			token.serviceMethod = FamilyEvent.DELETE_FAMILY_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}