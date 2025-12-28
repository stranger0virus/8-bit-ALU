# 8-bit-ALU
RTL to GDS of 8-bit ALU, using Cadence tool


command: xrun <top_module> <testbench> -gui

<img width="1015" height="347" alt="image" src="https://github.com/user-attachments/assets/7abf27fe-56f0-47f0-a315-ea5d6baf88b2" />

Simulation results

3.1.2	Logic Synthesis
After RTL verification, I performed synthesis using Cadence Genus: Generated the gate-level netlist (GLN) mapped to the SCL180 standard cell library. Conducted post-synthesis checks, including: Logical Equivalence Check (LEC) to ensure RTL and GLN equivalence. Gate-Level Simulation (GLS) to validate timing and logical correctness. Both LEC and GLS passed successfully.     command: genus -gui source <path to .tcl file>
Fig 2: Synthesised schematic

command: lec -xl rtl2intermediate.lec.do 
Fig 3: Post route LEC pass
3.1.3	Floor planning
Using Cadence Innovus, I proceeded with the physical design of the ALU. Created an optimized floorplan with a chip dimension of 2 × 2 mm. Placed 51 I/O pins, including 20 power pads, according to design constraints. Inserted filler cells to maintain well continuity and meet physical design rules.
Fig 4: Floorplan of ALU with 51 pins and filler cells

3.1.4	Power Planning
I implemented a structured power distribution network to ensure IR-drop and electromigration reliability: Added power rings, stripes, and rails according to the SCL180 PDK guidelines. Verified proper connectivity of VDD and VSS across the core and I/O regions.









Fig 5 (a)







                                                                                             
        Fig 5 (b)

Fig 5: (a) Powerplan ring; (b) Powerplan strip

3.1.5	Placement and CTS
Performed placement of all standard cells and logical cells within the floorplan. Ensured minimal cell overlap, proper legalization, and congestion optimization for better routing efficiency.
In clock tree synthesis we designed and implemented the clock distribution network. Optimized the clock tree to meet skew, latency, and insertion delay constraints. Ensured balanced clock paths across endpoints.
command: source <path to cts.tcl file>
Fig 6: Clock tree of ALU

3.1.6	Routing
Completed global and detailed routing of all signal and clock nets. Ensured DRC-clean routing with minimal violations. Conducted post-route optimization to meet timing and design rules.
Fig 7: Routing of ALU design

3.1.7	Post-Route Verification
After routing, I performed: Post-route LEC to confirm equivalence with synthesized netlist. Post-route GLS to validate timing and functional behavior under realistic delays.
Both checks passed successfully.
Fig 8: Post route LEC check pass
command: xrun -f <sdf_simulation_postroute.f file>
Fig 9: Post route gate level simulation check

3.1.8	Physical Design Signoff
Conducted full timing signoff, ensuring the design met all setup and hold constraints. Verified physical integrity and final checks before mask preparation.
Fig 10: Physical design signoff





Fig 11: Physical design timing signoff

3.1.9	GDS Export and Final Layout Processing
The final digital GDS file generated from Innovus was imported into Cadence Virtuoso for final layout finishing
Fig 12: Physical Design Layout in virtuoso

Fig 13: Final LVS check pass

Added seal ring, silicon numbering, and dummy filler cells for manufacturing robustness.

Fig 14: Dummy cells in physical design






Fig 15: Final Physical Design with seal ring, dummy cell and serial number.

Performed:
o	DRC (Design Rule Check)
o	ARC (Antenna Rule Check)
Fig 16: Final DRC checks pass
