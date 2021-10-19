# PCB Isolation Milling

## Sweet spot test for Feed and speed

To find the optimal or sweet spot for the feed and speed of a PCB cutter I use the following process:

<https://www.precisebits.com/tutorials/calibrating_feeds_n_speeds.htm>

## V-Bit Calibration

To find the optimal cutting depth for a V-Bit I use the following [gerber file]() in copper cam that steps through track sizes 1-25 mil and track spacings of 1-25 mil.

![Placeholder](images/2021-10-19_11-32-21.png)

The object of calibrating the depth of cut (DOC) is to ensure that specified Width of cuts (WOC) tolerances are maintained between copper-cam and the actual PCB, it also gives and indication of the smallest traces and track clearances achievable with the given bit.

### Example

These two images below are for the WOC or ßbit width calibration within the Copper-cam, i.e. bits are not normally the size they are suppose to be so the diameter is tweaked in the cutting software, when the upper traces = the lower gaps it means that the size in the software is correct.

Smallest track size on Left of screen is 1mil (1 thousand of inch) also I don't yet have my step-over dialled in and hence why I have some copper artefacts left because of the difference between the advertised cutter size VS calibrated cutter size.

So with the bit diameter calibrated it is showing me that minimum trace is 1mil and min clearance is 12mil This was done with a 30Deg V-Bit The calibration test starts at traces 1mil up and increments by 1 up to 25 mil this is done on both Traces and Clearances.

![Placeholder](images/20160922-231707-986.png)

![Placeholder](images/20160922-231717-153.png)
