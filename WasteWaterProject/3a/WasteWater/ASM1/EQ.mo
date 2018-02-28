within WasteWater.ASM1;
model EQ "Ideal sensor to measure the flow rate of an ASM1 wastewater stream"
  //extends stoichiometry;
  extends WasteWater.Icons.sensor_Q;
  Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent={{-100,-10},
            {-80,10}})));
  Interfaces.WWFlowAsm1out Out annotation (Placement(transformation(extent={{90,
            -10},{110,10}})));
  Modelica.Blocks.Interfaces.RealOutput EQ(start=0) annotation (Placement(transformation(
        origin={0,-98},
        extent={{-10,-10},{10,10}},
        rotation=270)));

  parameter Real B_SS =   2;
  parameter Real B_COD =  1;
  parameter Real B_NKj =  30;
  parameter Real B_NO =   10;
  parameter Real B_BOD5 = 2;
  parameter Real f_p=0.08 "Fraction of biomass to particulate products [-]";
  parameter Real i_xb=0.08 "Fraction nitrogen in biomass [g N/(g COD)]";
  parameter Real i_xp=0.06;

  Real T(start=1e-3);
  Real S_Nkj_e;
  Real SS_e;
  Real BOD_e;
  Real COD_e;

equation
  In.Q + Out.Q = 0;

  S_Nkj_e = In.Snh + In.Snd + In.Xnd + i_xb*(In.Xbh + In.Xba) + i_xp*(In.Xp + In.Xi);
  SS_e  = 0.75*(In.Xs + In.Xi + In.Xbh + In.Xba + In.Xp);
  BOD_e = 0.25*(In.Ss + In.Xs + (1-f_p)*(In.Xbh + In.Xba));
  COD_e = In.Ss + In.Si + In.Xi + In.Xbh + In.Xba + In.Xp;

  der(T) = 1.0;
  der(EQ*T) = (B_SS*SS_e + B_COD*COD_e + B_NKj*S_Nkj_e + B_NO*In.Sno + B_BOD5*BOD_e)/(1000);
  In.Si = Out.Si;
  In.Ss = Out.Ss;
  In.Xi = Out.Xi;
  In.Xs = Out.Xs;
  In.Xbh = Out.Xbh;
  In.Xba = Out.Xba;
  In.Xp = Out.Xp;
  In.So = Out.So;
  In.Sno = Out.Sno;
  In.Snh = Out.Snh;
  In.Snd = Out.Snd;
  In.Xnd = Out.Xnd;
  In.Salk = Out.Salk;

    annotation (
    Documentation(info="This component measures the flow of an ASM1 wastewater stream and provides
the result as output signal (to be further processed with blocks of
the Modelica.Blocks library).
"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics));
end EQ;
