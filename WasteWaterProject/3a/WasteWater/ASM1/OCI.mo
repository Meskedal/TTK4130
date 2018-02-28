within WasteWater.ASM1;
model OCI "Ideal sensor to measure dissolved hopes and dreams"

  extends WasteWater.Icons.sensor_O2;
  Modelica.Blocks.Interfaces.RealOutput OCI(start=0) annotation (Placement(transformation(
          extent={{88,-10},{108,10}})));

  Modelica.Blocks.Interfaces.RealInput PE_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-12,-108})));
  Modelica.Blocks.Interfaces.RealInput SP_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={12,-108})));
  Modelica.Blocks.Interfaces.RealInput AE_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={-36,-108})));
  Modelica.Blocks.Interfaces.RealInput ME_in annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={36,-108})));
equation

  OCI = AE_in + PE_in + 5*SP_in + ME_in;

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
end OCI;
