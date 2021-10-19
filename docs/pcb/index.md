# PCB Isolation Milling

I perform two types of calibrations for PCB isolation routing when using [copper-cam](/cam/#copper-cam) but same can be applied to whatever cam software is being used to mill the PCB.

1. [Width of Cut](#width-of-cut-calibration) 
2. [Sweet Spot](#sweet-spot-test-for-feed-and-speed)

This ensures that the values I have within my software are correct physically, as a v-bit width of cut is dependant on the depth of cut.  Additionally the best sweet spot of the cutting speed is determined.
## Width of Cut Calibration

To find the optimal cutting depth for a V-Bit I use the following [gerber file](https://github.com/madeinoz67/omiocnc-x6-2200epl/blob/57ab4b1096decab5c5dcaf52e2bb4344f321909a/gcode/pcb/IsolationRouterCalibration.gbr) in copper-cam that steps through track sizes 1-25 mil and track spacings of 1-25 mil.

![Placeholder](images/2021-10-19_11-32-21.png)

The object is calibrating the width of cut (WOC) for a given bit within the cam software (copper-cam in this case) and the actual cut on PCB, it also gives and indication of the smallest traces and track clearances achievable with the given bit.
### Example

These two images below are for the WOC or bit width calibration within the Copper-cam, i.e. bits are not normally the size they are suppose to be so the diameter is tweaked in the cutting software, when the upper traces = the lower gaps it means that the size in the software is correct.

Smallest track size on Left of screen is 1mil (1 thousand of inch) also I don't yet have my step-over dialled in and hence why I have some copper artefacts left because of the difference between the advertised cutter size VS calibrated cutter size.

So with the bit diameter calibrated it is showing me that minimum track width is 1mil and min track clearance is 12mil This was done with a 30Deg V-Bit The calibration test starts at traces 1mil up and increments by 1 up to 25 mil this is done on both Traces and Clearances.

![Placeholder](images/20160922-231707-986.png)

![Placeholder](images/20160922-231717-153.png)

Feeds, Speeds and Depth settings.

These are calibration cuts at different feeds and depth, ones showing is for 0.050mm depth of cut, again the ragged edge is VBit engraving bit. Measurement ruler is in 0.1mm increments.

So with my 20Deg Vbit I'm getting ~0.2mm width of cut

![Placeholder](images/20160922-230355-217.png)
## Sweet spot test for Feed and speed

To find the optimal or sweet spot for the feed and speed of a PCB cutter I use the following process:

<https://www.precisebits.com/tutorials/calibrating_feeds_n_speeds.htm>


The attached [gcode](#zigzag-g-code) runs through a range of feeds and spindle speeds using the zigzag pattern outlined on the above link

![Placeholder](images/zigzag.jpg)

### Example

Bits used are:

* 20 Deg Engraving VBit

* 0.6mm PCB Cutter

* 0.4 end mill

You can see the quality of cuts vary between the types of cutter, so is a trade of using the Vbit for the very fine work which give a ragged cut as opposed to very clean cuts for the end mill and PCB cutter. (the board is easily cleaned up with fine emery board or wet n dry so is not an issue)

![Placeholder](images/20160923-064932-32.png)
![Placeholder](images/20160923-064953-888.png)

Here you can see zoomed in that the fine tipped V-Bit does not like faster feed speeds as it starts to deflect and not cut properly, sort of bounces over the surface and not cutting deep enough.

![Placeholder](images/20160922-235540-558.png)
![Placeholder](images/20160922-235726-663.png)

### zigzag g-code

```gcode
(Created with Marlin post processor 2015/04/18 17:17)
G90 
(V60-50)
G0 Z15 F10000
G0 X0.023 Y0.149  
M3 S15000
G4 P3
G0 Z0.5  
G1 Z-0.051 F5 
G1 X4.984 Y4.986 F50 
G1 X0.023 Y9.95  
G1 X4.984 Y15.042  
G1 X-0.04 Y19.942  
G1 X5.047 Y25.097  
G1 X-0.04 Y29.998  
G1 X4.984 Y34.962  
G1 X0.023 Y39.862  
G0 Z2 F10000 
G90
(V60-100)
G0 X2.567 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X7.528 Y4.986 F100 
G1 X2.567 Y9.95  
G1 X7.528 Y15.042  
G1 X2.503 Y19.942  
G1 X7.591 Y25.097  
G1 X2.503 Y29.998  
G1 X7.528 Y34.962  
G1 X2.567 Y39.862  
G0 Z2 F10000 
G90
(V60-150)
G0 X5.111 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X10.072 Y4.986 F150 
G1 X5.111 Y9.95  
G1 X10.072 Y15.042  
G1 X5.047 Y19.942  
G1 X10.135 Y25.097  
G1 X5.047 Y29.998  
G1 X10.072 Y34.962  
G1 X5.111 Y39.862  
G0 Z2 F10000 
G90
(V60-200)
G0 X7.655 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X12.616 Y4.986 F200 
G1 X7.655 Y9.95  
G1 X12.616 Y15.042  
G1 X7.591 Y19.942  
G1 X12.679 Y25.097  
G1 X7.591 Y29.998  
G1 X12.616 Y34.962  
G1 X7.655 Y39.862  
G0 Z2 F10000 
G90
(V60-250)
G0 X10.072 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X15.033 Y4.986 F250 
G1 X10.072 Y9.95  
G1 X15.033 Y15.042  
G1 X10.008 Y19.942  
G1 X15.096 Y25.097  
G1 X10.008 Y29.998  
G1 X15.033 Y34.962  
G1 X10.072 Y39.862  
G0 Z2 F10000 
G90
(V60-300)
G0 X12.616 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X17.577 Y4.986 F300 
G1 X12.616 Y9.95  
G1 X17.577 Y15.042  
G1 X12.552 Y19.942  
G1 X17.64 Y25.097  
G1 X12.552 Y29.998  
G1 X17.577 Y34.962  
G1 X12.616 Y39.862  
G0 Z2 F10000 
G90
(V60-350)
G0 X17.704 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X22.665 Y4.986 F350 
G1 X17.704 Y9.95  
G1 X22.665 Y15.042  
G1 X17.64 Y19.942  
G1 X22.729 Y25.097  
G1 X17.64 Y29.998  
G1 X22.665 Y34.962  
G1 X17.704 Y39.862  
G0 Z2 F10000 
G90
(V60-400)
G0 X15.16 Y0.149  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.051 F5 
G1 X20.121 Y4.986 F400 
G1 X15.16 Y9.95  
G1 X20.121 Y15.042  
G1 X15.096 Y19.942  
G1 X20.184 Y25.097  
G1 X15.096 Y29.998  
G1 X20.121 Y34.962  
G1 X15.16 Y39.862  
G0 Z2 F10000 
G90
(V60-50-0.75)
G0 X19.866 Y0.213  
M3 S15000
G4 P1
G0 Z0.5 
G1 Z-0.075 F5 
G1 X24.827 Y5.05 F50 
G1 X19.866 Y10.014  
G1 X24.827 Y15.105  
G1 X19.803 Y20.006  
G1 X24.891 Y25.161  
G1 X19.803 Y30.061  
G1 X24.827 Y35.025  
G1 X19.866 Y39.926  
G0 Z2 F10000 
G90
(V60-100-0.75)
G0 X22.41 Y0.213  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.075 F5 
G1 X27.371 Y5.05 F100 
G1 X22.41 Y10.014  
G1 X27.371 Y15.105  
G1 X22.347 Y20.006  
G1 X27.435 Y25.161  
G1 X22.347 Y30.061  
G1 X27.371 Y35.025  
G1 X22.41 Y39.926  
G0 Z2 F10000 
G90
(V60-150-0.75)
G0 X27.499 Y0.213  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.075 F5 
G1 X32.46 Y5.05 F150 
G1 X27.499 Y10.014  
G1 X32.46 Y15.105  
G1 X27.435 Y20.006  
G1 X32.523 Y25.161  
G1 X27.435 Y30.061  
G1 X32.46 Y35.025  
G1 X27.499 Y39.926  
G0 Z2 F10000 
G90
(V60-200-0.75)
G0 X24.955 Y0.213  
M3 S15000
G4 P1
G0 Z0.5 
G1 Z-0.075 F5 
G1 X29.915 Y5.05 F200 
G1 X24.955 Y10.014  
G1 X29.915 Y15.105  
G1 X24.891 Y20.006  
G1 X29.979 Y25.161  
G1 X24.891 Y30.061  
G1 X29.915 Y35.025  
G1 X24.955 Y39.926  
G0 Z2 F10000 
G90
(V60-100-1)
G0 X32.46 Y0.213  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.1 F5 
G1 X37.42 Y5.05 F100 
G1 X32.46 Y10.014  
G1 X37.42 Y15.105  
G1 X32.396 Y20.006  
G1 X37.484 Y25.161  
G1 X32.396 Y30.061  
G1 X37.42 Y35.025  
G1 X32.46 Y39.926  
G0 Z2 F10000 
G90
(V60-200-1)
G0 X29.915 Y0.213  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.1 F5 
G1 X34.876 Y5.05 F200 
G1 X29.915 Y10.014  
G1 X34.876 Y15.105  
G1 X29.852 Y20.006  
G1 X34.94 Y25.161  
G1 X29.852 Y30.061  
G1 X34.876 Y35.025  
G1 X29.915 Y39.926  
G0 Z2 F10000 
G90
(V60-300-1)
G0 X35.004 Y0.213  
M3 S15000
G4 P1
G0 Z0.5  
G1 Z-0.1 F5 
G1 X39.965 Y5.05 F300 
G1 X35.004 Y10.014  
G1 X39.965 Y15.105  
G1 X34.94 Y20.006  
G1 X40.028 Y25.161  
G1 X34.94 Y30.061  
G1 X39.965 Y35.025  
G1 X35.004 Y39.926  
G0 Z15 F10000 
G4 P1
M05
```


