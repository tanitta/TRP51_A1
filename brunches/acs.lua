namespace"trit"{
	namespace"model"{
		namespace"trp51_a1"{
			class"ACS"
			:description("Aerodynamic Control System"){
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
						self:SetGlobalValue("A_CANARD_L",_ANALOG(1)/1000*-10)
						self:SetGlobalValue("A_CANARD_R",_ANALOG(1)/1000*-10)
						
						self:SetGlobalValue("A_AILERON2_L",0)
						self:SetGlobalValue("A_AILERON2_R",0)
						
						self:SetGlobalValue("A_ELEVATOR_L",-self:GetGlobalValue("A_ENGINE_X_L")+180+_ANALOG(1)/1000*-10)
						self:SetGlobalValue("A_ELEVATOR_R",-self:GetGlobalValue("A_ENGINE_X_R")+180+_ANALOG(1)/1000*-10)
						

						self:SetGlobalValue("A_RUDDER_M",180)
						self:SetGlobalValue("A_RUDDER_L",0)
						self:SetGlobalValue("A_RUDDER_R",0)
						
						
						self:SetGlobalValue("A_SWEEPBACK",109)
						
			    	end);
			};
		}
	}
}