# 8-bit-ALU
RTL to GDS of 8-bit ALU, using Cadence tool

command: xrun <top_module> <testbench> -gui

<img width="1015" height="347" alt="image" src="https://github.com/user-attachments/assets/7abf27fe-56f0-47f0-a315-ea5d6baf88b2" />

Fig 1: Simulation results

**Logic Synthesis**

After RTL verification, performed synthesis using Cadence Genus: Generated the gate-level netlist (GLN) mapped to the SCL180 standard cell library. 
Conducted post-synthesis checks, including: 
  Logical Equivalence Check (LEC) to ensure RTL and GLN equivalence. 
  Gate-Level Simulation (GLS) to validate timing and logical correctness. 
Both LEC and GLS passed successfully.     
command: genus -gui source <path to .tcl file>

<img width="878" height="476" alt="image" src="https://github.com/user-attachments/assets/42ed9773-aa42-4e56-bc2e-828e26dc783e" />

Fig 2: Synthesised schematic

command: lec -xl rtl2intermediate.lec.do 

<img width="695" height="461" alt="image" src="https://github.com/user-attachments/assets/1ad71d64-c478-4f0b-9882-b99cf22bfa86" />

Fig 3: Post route LEC pass

**Floor planning**

Using Cadence Innovus, proceeded with the physical design of the ALU. Created an optimized floorplan with a chip dimension of 2 × 2 mm. Placed 51 I/O pins, including 20 power pads, according to design constraints. Inserted filler cells to maintain well continuity and meet physical design rules.

<img width="737" height="427" alt="image" src="https://github.com/user-attachments/assets/6eb83850-0a02-455b-a2b5-3cc9b5db5c03" />

Fig 4: Floorplan of ALU with 51 pins and filler cells

**Power Planning**

Implemented a structured power distribution network to ensure IR-drop and electromigration reliability: Added power rings, stripes, and rails according to the SCL180 PDK guidelines. 
Verified proper connectivity of VDD and VSS across the core and I/O regions.

<img width="650" height="381" alt="image" src="https://github.com/user-attachments/assets/ba4c6946-cec5-4400-837e-fe64ed89fe6b" />

(a)
                                                                                     <img width="654" height="381" alt="image" src="https://github.com/user-attachments/assets/6dab2f14-e5a8-424e-8e40-fa272b49a701" />
        
(b)

Fig 5: (a) Powerplan ring; (b) Powerplan strip

**Placement and CTS**

Performed placement of all standard cells and logical cells within the floorplan. Ensured minimal cell overlap, proper legalization, and congestion optimization for better routing efficiency.
In clock tree synthesis we designed and implemented the clock distribution network. Optimized the clock tree to meet skew, latency, and insertion delay constraints. Ensured balanced clock paths across endpoints.

command: source <path to cts.tcl file>

<img width="704" height="450" alt="image" src="https://github.com/user-attachments/assets/5266164a-cea4-46d8-99c6-0a7766c136db" />

Fig 6: Clock tree of ALU

**Routing**

Completed global and detailed routing of all signal and clock nets. Ensured DRC-clean routing with minimal violations. Conducted post-route optimization to meet timing and design rules.

<img width="868" height="505" alt="image" src="https://github.com/user-attachments/assets/0b84a3d5-4b93-4f9b-83bb-78033e5d5ca3" />

Fig 7: Routing of ALU design

**Post-Route Verification**

After routing, performed: 
  Post-route LEC to confirm equivalence with synthesized netlist. 
  Post-route GLS to validate timing and functional behavior under realistic delays.
Both checks passed successfully.

<img width="706" height="307" alt="image" src="https://github.com/user-attachments/assets/40424b85-ae4e-4f20-a39f-00964fe221e8" />

Fig 8: Post route LEC check pass

command: xrun -f <sdf_simulation_postroute.f file>

<img width="961" height="316" alt="image" src="https://github.com/user-attachments/assets/33aeb96e-69e1-4d3c-a6b8-190ccd4d2a66" />

Fig 9: Post route gate level simulation check

**Physical Design Signoff**
Conducted full timing signoff, ensuring the design met all setup and hold constraints. Verified physical integrity and final checks before mask preparation.

<img width="961" height="508" alt="image" src="https://github.com/user-attachments/assets/2a80a2ad-d23e-4158-9ffd-0cb956b754a7" />

Fig 10: Physical design signoff


**GDS Export and Final Layout Processing**

The final digital GDS file generated from Innovus was imported into Cadence Virtuoso for final layout finishing

<img width="896" height="527" alt="image" src="https://github.com/user-attachments/assets/dba7c106-b068-4cbd-8593-62a82991d33a" />

Fig 11: Physical Design Layout in virtuoso

<img width="786" height="500" alt="image" src="https://github.com/user-attachments/assets/a787b981-567f-401d-8662-55fdf8ecc7f5" />

Fig 12: Final LVS check pass

Added seal ring, silicon numbering, and dummy filler cells for manufacturing robustness.

<img width="816" height="479" alt="image" src="https://github.com/user-attachments/assets/275df906-0d94-44ad-b55b-18ce07405b7a" />

Fig 13: Dummy cells in physical design

<img width="961" height="609" alt="image" src="https://github.com/user-attachments/assets/cf6933b7-d4bb-40b0-89e7-5b5c8e59e12c" />

Fig 14: Final Physical Design with seal ring, dummy cell and serial number.

Performed:
o	DRC (Design Rule Check)
o	ARC (Antenna Rule Check)
Fig 16: Final DRC checks pass
