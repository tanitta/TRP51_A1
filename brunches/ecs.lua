namespace"trit"{
	namespace"model"{
		namespace"trp51_a1"{
			class"ECS"{
			    	metamethod"_init"
			    	:body(function(self, id, fncGGV, fncSGV)
			    		self.id = id
			    		self.GetGlobalValue = fncGGV
			    		self.SetGlobalValue = fncSGV			    		
			    	end);
			
			    	metamethod"__call"
			    	:body(function(self)
			    	end);
			    	
			    	method"Value"
			    	:body(function(self)
						self:SetGlobalValue("P_ENGINE_L",0)
	    				self:SetGlobalValue("P_ENGINE_R",0)
			    	end);
			};
		}
	}
}