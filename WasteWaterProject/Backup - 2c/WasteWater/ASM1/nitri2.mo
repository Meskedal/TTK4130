within WasteWater.ASM1;
model nitri2 "ASM1 nitrification tank 2"
  // nitrification (aerated) tank, based on the ASM1 model

  extends WasteWater.Icons.nitri;
  extends Interfaces.ASM1base;

  // tank specific parameters
  parameter Modelica.SIunits.Volume V=1333 "Volume of nitrification tank";

  // aeration system dependent parameters
  parameter Real alpha=240 "Oxygen transfer factor";
  parameter Modelica.SIunits.Length de=4.5 "depth of aeration";
  parameter Real R_air=23.5 "specific oxygen feed factor [gO2/(m^3*m)]";
  WWU.MassConcentration So_sat "Dissolved oxygen saturation";
  Real Kla_var;

  Interfaces.WWFlowAsm1in In annotation (Placement(transformation(extent={{-110,
            -10},{-90,10}})));
  Interfaces.WWFlowAsm1out Out annotation (Placement(transformation(extent={{90,
            -10},{110,10}})));
  Interfaces.WWFlowAsm1out MeasurePort annotation (Placement(transformation(
          extent={{50,40},{60,50}})));
equation

  // Temperature dependent oxygen saturation by Simba
  So_sat =8;

  //Kla_var = (2*Out.Q - In.Q*In.So - R_air*V)/(6*V);
  // extends the Oxygen differential equation by an aeration term
  // aeration [mgO2/l]; AirIn.Q_air needs to be in
  // Simulationtimeunit [m3*day^-1]
  // aeration = (alpha*(So_sat - So)/So_sat*AirIn.Q_air*R_air*de)/V;
  aeration = Kla_var * (So_sat - So);
  // volume dependent dilution term of each concentration

  inputSi = (In.Si - Si)*In.Q/V;
  inputSs = (In.Ss - Ss)*In.Q/V;
  inputXi = (In.Xi - Xi)*In.Q/V;
  inputXs = (In.Xs - Xs)*In.Q/V;
  inputXbh = (In.Xbh - Xbh)*In.Q/V;
  inputXba = (In.Xba - Xba)*In.Q/V;
  inputXp = (In.Xp - Xp)*In.Q/V;
  inputSo = (In.So - So)*In.Q/V;
  inputSno = (In.Sno - Sno)*In.Q/V;
  inputSnh = (In.Snh - Snh)*In.Q/V;
  inputSnd = (In.Snd - Snd)*In.Q/V;
  inputXnd = (In.Xnd - Xnd)*In.Q/V;
  inputSalk = (In.Salk - Salk)*In.Q/V;
  So = 2;

  annotation (
    Documentation(info="This component models the ASM1 processes and reactions taking place in an aerated (nitrification) tank
of a wastewater treatment plant.

The InPort signal gives the tank temperature to the model.

Parameters:

        - all soichiometric and kinetic parameters of the activated sludge model No.1 (ASM1)
  V     - volume of the tank [m3]
  alpha - oxygen transfer factor
  de    - depth of the aeration system [m]
  R_air - specific oxygen feed factor [g O2/(m3*m)]
"), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}), graphics));
end nitri2;
