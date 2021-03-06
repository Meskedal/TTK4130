within WasteWater.ASM1;
model ME "Ideal sensor to measure dissolved hopes and dreams"

  extends WasteWater.Icons.sensor_O2;
  Modelica.Blocks.Interfaces.RealOutput ME(start=0) annotation (Placement(transformation(
          extent={{88,-10},{108,10}})));

  Real T(start=1e-3);

  Modelica.Blocks.Interfaces.RealInput Kla4 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={24,-108})));
  Modelica.Blocks.Interfaces.RealInput Kla5 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={48,-108})));
  Modelica.Blocks.Interfaces.RealInput Kla3 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-108})));
  Modelica.Blocks.Interfaces.RealInput Kla2 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-22,-108})));
  Modelica.Blocks.Interfaces.RealInput Kla1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-46,-108})));

  Real var1;
  Real var2;
  Real var3;
  Real var4;
  Real var5;
equation

  var1 = if Kla1 < 20 then 5 else 0;
  var2 = if Kla2 < 20 then 5 else 0;
  var3 = if Kla3 < 20 then 0.005*1333 else 0;
  var4 = if Kla4 < 20 then 0.005*1333 else 0;
  var5 = if Kla5 < 20 then 0.005*1333 else 0;

  der(T) = 1.0;
  der(ME*T) = 24*(var1 + var2 + var3 + var4 + var5);

  annotation (
    Documentation(info="This component measures the dissolved oxygen concentration [g/m3]
of ASM1 wastewater and provides the result as output signal (to be
further processed with blocks of the Modelica.Blocks library).
"), Diagram(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
        Ellipse(
          extent={{-50,50},{50,-50}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={223,223,159},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,50},{0,38}},
          thickness=0.5),
        Line(
          points={{-50,0},{38,0}},
          thickness=0.5),
        Line(
          points={{50,0},{38,0}},
          thickness=0.5),
        Line(
          points={{-36,34},{-28,26}},
          thickness=0.5),
        Line(
          points={{34,36},{26,28}},
          thickness=0.5),
        Line(
          points={{0,0},{26,28}},
          thickness=0.5),
        Polygon(
          points={{30,32},{10,24},{24,12},{30,32}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(extent={{-36,-10},{36,-32}}, textString=
                                              "O2"),
        Line(
          points={{0,-50},{0,-90}},
          thickness=0.5),
        Line(points={{50,0},{88,0}}),
        Text(extent={{-80,100},{80,60}}, textString=
                                             "%name")}));
end ME;
