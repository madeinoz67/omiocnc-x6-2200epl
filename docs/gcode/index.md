# G-CODE

## Library of handy routines


   - [Full warmup - XYZ Axis + spindle](#full-warmup-xyz-axis-spindle)
   - [Quick warmup - Spindle only](#quick-warmup-spindle-only)
   - [ZigZag PCB feedrate sweet spot](#zigzag-pcb-feedrate-sweet-spot)

### Full warmup - XYZ Axis + spindle

This warms all 3 axis up by moving through their full extends on each pass, as well as ramping up the spindle speed.

Can take about 20 minutes to complete.

!!! important

    macros need to be enabled on the controller. 
    <**TODO** - Controller Parameter to set goes here>

!!! warning

    Remove any bits from the spindle first

```gcode
--8<-- "./gcode/warmup-full.ncc"
```

### Quick warmup - Spindle only

Quick and dirty warmup routine for the spindle only.

!!! warning 

    Remove any bits from the spindle first

```gcode
--8<-- "./gcode/warmup-spindle.ncc"
```

### ZigZag PCB feedrate sweet spot

Zigzag PCB feed and speed sweetspot finder for [PCB isolation routing](pcb/#sweet-spot-test-for-feed-and-speed)

```gcode
--8<-- "./gcode/pcb/zigzag_feedrate.ncc"
```
