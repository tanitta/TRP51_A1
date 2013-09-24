namespace"trit"{
	namespace"model"{
		namespace"trp51_a1"{
			class"Gear"{
				field"booUp"
				:init(true);
				
				metamethod"_init"
				:body(function(self,id,fncGGV,fncSGV)
					self.id = id
					self.SetGlobalValue = fncSGV
					self.GetGlobalValue = fncGGV
					
					self.booUp = true
					self.numStep = 30
					
					self.angGear = {
						F = 180,
						R1 = 180,
						R2 = 180
					}
					self.counter = 0
				end);

				method"SetSwitch"
				:body(function(self,boo)
					self.booUp = boo
				end);
				
				metamethod"__call"
				:body(function(self)
					out(2,self.booUp)
					if self.booUp then
						self.angGear.F = ang(self.angGear.F,180,(180-55)/self.numStep)
						self.angGear.R1 = ang(self.angGear.R1,180,(180-30)/self.numStep)
						self.angGear.R2 = ang(self.angGear.R2,180,(180-60)/self.numStep)
						
						self.counter = ang(self.counter,0,math.pi/self.numStep)
						
					else
						
						self.angGear.F = ang(self.angGear.F,55,(180-55)/self.numStep)
						self.angGear.R1 = ang(self.angGear.R1,30,(180-30)/self.numStep)
						self.angGear.R2 = ang(self.angGear.R2,60,(180-60)/self.numStep)
						
						self.counter = ang(self.counter,math.pi,math.pi/self.numStep)
						
					end
						self.angGear.F = 180-(180-55)*(-math.cos(self.counter)+1)/2
						self.angGear.R1 = 180-(180-30)*(-math.cos(self.counter)+1)/2
						self.angGear.R2 = 180-(180-60)*(-math.cos(self.counter)+1)/2
						
						
	
						
					
				end);
				
				method"Value"
				:body(function(self)
					self:SetGlobalValue("A_GEAR_F",self.angGear.F)
					self:SetGlobalValue("A_GEAR_R_1",self.angGear.R1)
					self:SetGlobalValue("A_GEAR_R_2",self.angGear.R2)
					
					
				end);
			};
		};
	};
};