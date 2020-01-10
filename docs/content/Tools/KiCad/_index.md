---
title: "KiCad"
date: 2020-01-09T22:02:37-08:00
draft: true
---


KiCad is an open-source software tool for the creation of electronic schematic diagrams and PCB artwork. 
Beneath its singular surface, KiCad incorporates an elegant ensemble of the following stand-alone software tools:

| Program name | Description | File extension |
| ------------ | ----------- | -------------- |
| KiCad | Project manager | *.pro |
| Eeschema | Schematic and component editor | *.sch, *.lib, *.net |
| Pcbnew | Circuit board and footprint editor | *.kicad_pcb, *.kicad_mod |
| GerbView | Gerber and drill file viewer | \*.g\*, *.drl, etc. |
| Bitmap2Component | Convert bitmap images to components or footprints | *.lib, *.kicad_mod, *.kicad_wks |
| PCB Calculator | Calculator for components, track width, electrical spacing, color codes, and more... | None |
| Pl Editor | Page layout editor | *.kicad_wks |


{{< figure src="/docs/images/KiCad-home.png" caption="KiCad basic window.  The icon row from left to right corresponds to Eeschema (schematic and component editors), Pcbnew ( board and footprint editors), GerbView, Bitmap2Component, PCB Calculator, and Pl Editor." >}}


The file extension list is not complete and only contains a subset of the files that KiCad supports. It is useful for the basic understanding of which files are used for each KiCad application.
KiCad can be considered mature enough to be used for the successful development and maintenance of complex electronic boards.

KiCad does not present any board-size limitation and it can easily handle up to 32 copper layers, up to 14 technical layers and up to 4 auxiliary layers. KiCad can create all the files necessary for building printed boards, Gerber files for photo-plotters, drilling files, component location files and a lot more.

Being open source (GPL licensed), KiCad represents the ideal tool for projects oriented towards the creation of electronic hardware with an open-source flavour.

On the Internet, the homepage of KiCad is: http://www.kicad-pcb.org/

## Downloading and installing KiCad
KiCad runs on GNU/Linux, Apple macOS and Windows. You can find the most up to date instructions and download links at:

http://www.kicad-pcb.org/download/

### Under Apple macOS
Stable builds of KiCad for macOS can be found at: http://downloads.kicad-pcb.org/osx/stable/

### Under Windows
Stable builds of KiCad for Windows can be found at: http://downloads.kicad-pcb.org/windows/stable/

### Under GNU/Linux
{{% expand "Show Unix Installation Details" %}} 
Stable releases of KiCad can be found in most distribution’s package managers as kicad and kicad-doc. If your distribution does not provide latest stable version, please follow the instruction for unstable builds and select and install the latest stable version.

Under Ubuntu, the easiest way to install an unstable nightly build of KiCad is via _PPA_ and _Aptitude_. Type the following into your Terminal:

```bash
sudo add-apt-repository ppa:js-reynaud/ppa-kicad
sudo aptitude update && sudo aptitude safe-upgrade
sudo aptitude install kicad kicad-doc-en
```

Under Debian, the easiest way to install backports build of KiCad is:

```sh
# Set up Debian Backports
echo -e "
# stretch-backports
deb http://ftp.us.debian.org/debian/ stretch-backports main contrib non-free
deb-src http://ftp.us.debian.org/debian/ stretch-backports main contrib non-free
" | sudo tee -a /etc/apt/sources.list > /dev/null

# Run an Update & Install KiCad
sudo apt-get update
sudo apt-get install -t stretch-backports kicad
```

Under Fedora the easiest way to install an unstable nightly build is via _copr_. To install KiCad via copr type the following in to copr:

```sh
sudo dnf copr enable @kicad/kicad
sudo dnf install kicad
```

Alternatively, you can download and install a pre-compiled version of KiCad, or directly download the source code, compile and install KiCad.
{{% /expand %}}


## KiCad Workflow
Despite its similarities with other PCB design software, KiCad is characterised by a unique workflow in which schematic components and footprints are separate. Only after creating a schematic are footprints assigned to the components.

### Overview
The KiCad workflow is comprised of two main tasks: drawing the schematic and laying out the board. Both a schematic component library and a PCB footprint library are necessary for these two tasks. KiCad includes many components and footprints, and also has the tools to create new ones.

Initially, the process begins with schematic capture, as in any other tool.  After the schematic has been defined, footprints are attached to each symbol on the schematic, and the information is then used to lay out the board.

{{% notice note %}}
The [KiCad Tutorial](https://docs.kicad-pcb.org/5.1.5/en/getting_started_in_kicad/getting_started_in_kicad.html#kicad-work-flow-overview) has a detailed flowchart of the full board design process.
{{% /notice %}}

### Some Notes on Fabrication
Both [Oshpark](https://oshpark.com/) (PCB only) and [MacroFab](https://macrofab.com/)(PCB + assembly) directly accept KiCad formats for fabrication. Naturally neither is the cheapest possible service, but for small projects the convenience can be an advantage.


---
Adapted in part from the [KiCad Getting Started Tutorial](https://docs.kicad-pcb.org/5.1.5/en/getting_started_in_kicad/getting_started_in_kicad.html), CC-BY-3.0 {{< ccby >}}.