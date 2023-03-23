# MagicQuartz Technology Demonstration

![MagicQuartz TechDemo Front Rendering](images/Rendering-Front.png)

## Introduction

This repository contains an open source hardware design of a turntable speedbox that is capable of running the [MagicQuartz](https://www.mate-labs.de/magicquartz) firmware. The hardware design consists of two parts:

* An [OpenSCAD](https://openscad.org) model that can be used for generating a 3D-printable enclosure.
* A [KiCad](https://www.kicad.org) design for the mainboard, comprising schematic and PCB.

## Licensing

The information and files in this repository are provided under the [CERN-OHL-S v2](cern_ohl_s_v2.txt) open source license (please click [here](https://ohwr.org/project/cernohl/wikis/Documents/CERN-OHL-version-2) for details).

## Disclaimer

The only purpose of this repository is to provide an easy-to-reproduce hardware design for showcasing the capabilities of the MagicQuartz firmware. To date, the design has not been evaluated with respect to electrical safety, electromagnetic compliance (EMC), and fire safety. **Devices manufactured based on this design are not suitable for end users.**

There are several serious dangers associated with building and operating this device. If you do not have sufficient knowledge, please do not attempt to build or operate the device. Note that the information in this repository intentionally does not constitute assembly instructions. Also pay close attention to section 6 of the [CERN-OHL-S v2](cern_ohl_s_v2.txt) license and the safety considerations below.

## Hardware Design

### Safety Considerations

* The device is capable of generating high voltage and may cause fire and/or serious injury, including death.
* The device switches high currents using pulse width modulation (PWM), which may cause interference with other electronic devices or radio equipment.
* The device creates an [IT network (isolé-terre)](https://en.wikipedia.org/wiki/Earthing_system#IT_network). This has implications on the number of appliances (i.e. motors or turntables) and their insulation type to be safely connected to the device.
* Be very careful when performing measurements! Do not attempt to measure the high-voltage side of the transformer using an oscilloscope! There is no need to do this as the signal can be fully verified on the low-voltage side. In this regard, also note that the digital amplifier's negative outputs are not connected to ground. There is a serious risk of damaging the oscilloscope and other equipment when performing measurements while the circuit is grounded, e.g. over the Arduino's USB port and a PC. Use galvanic isolators where applicable.
* There is a serious risk that the device damages connected components. Examples are strobe lamps, which may be damaged easily by voltage spikes or excessive voltage, or fixed-frequency AC motors that rely on phase shift capacitors. There is also a risk that the PWM carrier signal passes through the audio path of a stereo system and damages the speakers.
* Note that the mechanical, electrical, and chemical properties of 3D-printed components may change or deteriorate over time.

### OpenSCAD 3D Model

The OpenSCAD file can be used to virtually explore the device and to 3D-print a physical enclosure.

*Note:* If the symbols on the front are not displayed correctly, the "Symbola" font has to be installed (Ubuntu package name: `fonts-symbola`).

#### Parts Overview and Printing Notes

The table below provides an overview of all 3D-printable parts in the 3D model along with some notes. Be aware that the printing time in total is around 22 hours (on an Ultimaker 2).

While the STL files are available in the `release` folder for your convenience, they can be generated easily in OpenSCAD. Set the variable `render_components` to `false` and change the value of the variable `generate` to the respective part number. Then press F5 to preview the part, F6 to render the part, and F7 to export the STL file. Note that the rendering process may take a considerable amount of time, even on fast computers. Also note that the generated objects are already properly oriented for printing.

I had some problems printing with Cura versions 5.1.1 to 5.3.0, especially with the "Back" part. The slicer created some signifcant artifacts and did not handle the text as expected (the last layer under the text was not printed as expected). I went back to 4.13.1.

In addition to the table below:

* Print all parts using "tree" support.
* Print all parts using the "grid" infill pattern (except part 3, see notes).
* Print all parts with with 0.2 mm layer height (except part 8, see notes).
* Print all parts with with adhesion type "brim" (except part 8, see notes).


| Part Nr. | Name                   | Suggested Color | Notes / Exceptions                                                                                                       |
|----------|------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------|
| 1        | Bottom Plate           | Black           | May be printed without "tree" support.                                                                                   |
| 2        | Front Lower Part       | White           | Set "Support X/Y Distance" to 1.6 mm to prevent the slicer from creating support in the air inlet.                       |
| 3        | Front Center Part      | Transparent     | Use the "lightning" infill pattern to create a nice quartz-like :wink: appearance.                                       |
| 4        | Front Upper Part       | White           |                                                                                                                          |
| 5        | Cover                  | Brown           | Print this variant if you do not plan to apply decorative foil.                                                          |
| 5        | Cover (Material Saver) | (Any)           | If decorative foil does not adhere properly to the edges, slightly sand down the surfaces at the edges.                  |
| 6        | Foot (Print 4x)        | Silver          | May be printed without "brim".                                                                                           |
| 7        | Voltmeter Cover        | As Front        |                                                                                                                          |
| 8        | Button Assembly        | Silver          | Print with 0.1 mm or less to improve strength, do not use adhesion support (brim). Enable ironing on top layer.          |
| 9        | Back                   | White           |                                                                                                                          |
| 10       | Dummy sockets          | As Back         | Print without "brim".                                                                                                    |
| 11       | Optical Sensor Case    | Black           |                                                                                                                          |

#### Components
The components to be used should be easily identifiable from the OpenSCAD and KiCad projects. For components where this is not immediately obvious, here are some details:

* **Screws:** All parts can be held together with self-tapping screws type "DIN 7981 C H", 2.9x9.5 mm, except for the LCD and voltmeter cover, where 2.2x9.5 mm should be used. The DIN screws can of course also be substituted with similar compatible screws.
* **Cable Ties:** The enclosure has been designed to mount various components with cable ties, such as the transformer, the internal fan (only used for amplifier type 2), the high-voltage screw terminal, and to secure the AC out cable. The bar in the center of the enclosure can be used to attach wires with cable ties.
* **Amplifiers:** The OpenSCAD design currently supports the accommodation of two types of digital power amplifier boards based on the TDA7498 and TPA3116D2 chips, respectively (see renderings below). The first type seems to be very fragile and requires about 28V. The second type is more robust and works well at 24V, but has more noise and definitely needs a better heatsink. However, it is possible to modify the design to accommodate other types. There is also a third "placeholder" type that can be used for custom developments.
* **Toroidal Transformer:** Type "RKT 5012" (50VA, 220V to 2x12V). To distribute the load across both amplifier channels, the two 12V transformer windings can be driven in parallel via the two output channels of the amplifier. It is then important to ensure that the two windings are actually driven in parallel and not in reverse. Given a connection sequence of "R+, R-, L+, L-" at the amplifier, a working wiring sequence is "red, yellow, blue, green" for the RKT 5012. Caution! During operation, the 220V tappings are live.
* **AC Voltmeter:** Type "YB27A", 60-300V AC, removed from its original housing. Note that the voltmeter is live and there is a risk of electric shock. If the wires need to be extended or replaced, make sure they have the proper voltage rating.
* **Power Switch:** Type "KCDI-101".

![Amplifier Types](images/Amplifier-Types.png)

### KiCad Schematic and PCB

This repository also contains an electronic circuit for a motherboard. The PCB was designed for rapid prototyping and can be produced single-sided, e.g. with a small CNC or by etching. However, an optional top copper layer can be used to improve shielding. Of course, the PCB can also be manufactured by any PCB manufacturer.

The mainboard is build around the "MEGA 2560 PRO" board (denoted U1 in the schematic). To the author's knowledge, this board was originally developed by RobotDyn. Unfortunately, it seems to be no longer available, but re-makes by other companies are widely available. Click [here](https://robotdyn.com/mega-2560-pro-embed-ch340g-atmega2560-16au.html) for an archived version of RobotDyn's webpage.

![MagicQuartz TechDemo Schematic](images/Schematic.png)
![MagicQuartz TechDemo Schematic](images/PCB.png)

The electronic circuit is very simple and should be self-explanatory. However, the following points explain some special aspects:

* **Power Supply:** Connector J2 ("Power") is used to power the mainboard from an external power source via pins 2 and 3 (typically 24-32V, depending on the voltage requirements of the amplifier, denoted "+28V" in the schematic). Connector J2 is also used to power the amplifier board via pins 1 and 4. Notice that pin 1 of J2 is connected to a second ground (GND1), which is used to measure the amplifier current (see below).
* **DC/DC Converter Boards:** As described above, the mainboard is supplied with 24-32V (labeled "+28V"). The U1 board, however, requires a voltage between 7-12V (labeled "+12V"). Because it is not practical to overcome the large voltage difference with a linear regulator, connector J3 ("DC/DC") can be used to connect an external DC/DC step-down converter board (see OpenSCAD design). U1 then uses its on-board linear voltage regulator to create the 5V. The enclosure can accommodate a second DC/DC converter board specifically to power the fans; however, if the fans run well with the voltage from the first board, they can also be connected to this first converter board.
* **Jumper "Enable APM":** Digital pin D27 of U1 can be pulled to GND (jumper J1 "Enable APM" is closed) to tell the firmware that the current sensing circuit is available, which allows the firmware to detect whether the turntable motor is currently powered or not.
* **Current Measurement:** The current measurement works as follows: The current of the power section (the digital amplifier board) is measured via the voltage drop across resistor R4 (0.15 Ohm, 5 Watt). The measured voltage is low-pass filtered via C7 and R5 and brought via U2A to a voltage level that can be easily measured by the microcontoller's ADC.
* **Low-Pass Filter:** The PWM low-pass filter section converts the PWM signals from the microcontroller into one or two analog sine waves using simple RC filters. The filters are designed to have a cutoff frequency of about 200 Hz, which is high enough to pass any of the possible AC frequencies but block the PWM carrier signal. The filter is implemented twice in case a dual-phase inverter is to be implemented (which requires an additional transformer and a different enclosure). For single-phase configurations, it is recommended to equip only one filter section and bridge the two channels at the input of the amplifier. This eliminates the risk of damaging the amplifier if the user accidentally changes the phase shift in the firmware.

### Block Diagram

Finally, here is a block diagram that provides an overview of all internal connections:

![MagicQuartz TechDemo Block Diagram](images/Block-Diagram.png)

## Initialization Procedure

The following steps describe how to initially setup the device:

* Before turning on the power for the first time, turn the amplifier board volume control all the way down.
* Follow the instructions in Section 4, "Getting Started", of the MagicQuartz documentation for flashing the firmware and executing the motor setup.
* When the "Motor Setup" routine asks you about the wave form (parameter `WaveForm`), set this to 2.
* When it comes to setting the voltage (parameter `VoltageMtOn`), the documentation says that the steps depend on whether the inverter installed in the speedbox has a level control or not. It has: it's the volume control of the amplifier. Proceed as described in the documentation: Set `VoltageMtOn` to 1, then slowly and carefully turn up the volume control of the amplifier until the desired voltage (e.g., 220 V) is reached. If the amplifier switches into the protection state, try again.


