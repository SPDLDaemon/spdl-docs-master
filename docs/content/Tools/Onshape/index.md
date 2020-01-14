---
title: "Onshape"
date: 2020-01-10T12:45:58-08:00
weight: 5
draft: true
---

## Why Onshape?
[Onshape](https://www.onshape.com/) is a full-cloud parametric CAD system that runs in your browser. This means that your document is stored in the cloud, and if you're working on a group project, everyone edits a single copy of the document, real-time. No more sending one person off to do all the CAD or dealing with whether "Version 1 Final Actual Final" or "Final Version 1" is the more recent copy.

Also, since a lot of CAD in the SPDL context is laser-cut assemblies, Onshape's scripting functionality allows for custom features that make CAD for laser-cut assemblies a snap.

Onshape currently offers all professional features except release management for free with a .edu email address.

## Getting Set Up
First, [sign up for an educational account](https://www.onshape.com/edu) using your Stanford .edu email address. Note that as of Fall 2019, the education subscription expires after 365 days, at which point all your Education-tagged documents become read-only. You can sign up again using the same form to add another year of the Education plan as long as you continue being a student.

If you're used to Solidworks, Inventor, or some other CAD software, you can change Onshape's input preferences to match what you're used to. Once logged in, go to your [account preferences page](https://cad.onshape.com/user/settings), and under "View manipulation" choose the option for the software you're most familiar with.

Onshape has an [Introduction to CAD](https://www.onshape.com/learn/learn-cad), [more in-depth courses](https://learn.onshape.com/) on CAD and data management, and further tutorials to help you get up to speed on using the software.

If you're going to be making a lot of laser-cut parts, you'll want to add the set of custom features I wrote to help do that:

[Laser Joint](https://cad.onshape.com/documents/578830e4e4b0e65410f9c34e/w/d04a088a0a8ab8361a2aa65c/e/7af109b2f1cead90850525ae)
: Computes and generates finger joints between intersecting plates.

[T-Slot Joint](https://cad.onshape.com/documents/5791a167e4b03c2aa6af3b35/w/8528f1c2d733302d4632f38e/e/acc455ae2adcf11a571ba510)
: Creates bolted edge connections between plates.

[Kerf Compensation](https://cad.onshape.com/documents/57df36a88f63301089e8ac78/w/d336a806a8a6f0460f7bd440/e/157268905828b0fc910e365b)
: Compensates geometry when cutting with software that does not compensate toolpaths for the laser kerf (all laser cutters on campus, at least).

[Auto Layout](https://cad.onshape.com/documents/576e01dbe4b0cc2e7f46a55d/w/b7cb6876d1121a6c249f59c7/e/b72c231628b5affea0873222)
: Automatically lays out parts for cutting using a rectangular bin-packing algorithm.

To add these features to your toolbar, open an Onshape document, and click the "+" icon at the right end of your toolbar. In the "Search documents or paste URL" field, paste each of the above URLs, and add the features to the toolbar. 

Each of the links above also points to a PDF containing documentation for each feature.

{{% notice note %}}
Unless you're very interested in writing your own custom code, don't "Make a copy" from the links above; that means you won't get updates to the features if and when I make them.
{{% /notice %}}

## Using Onshape to make a Laser-cut Thing
As an example, we'll go through the process of getting the basic shape of my ME218 project, [Big Game Hunting](https://biggamehunting218.weebly.com/mechanical.html), drawn up in Onshape and then exported to cut on a laser.

### CAD the Base Geometry
We'll start by creating the solid model of the parts we want, before setting up to cur them on a laser.

#### So What is a Part Studio Anyway?
If you totally skipped all the tutorials above (be honest, you did, didn't you?), here's the quick summary of what a "Part Studio" is.

Where most CAD programs have a single part being modeled in a single file, and use assemblies for the physical interfacing of parts and motion studies, this often means that multiple parts that are inherently related in geometry must be modeled separately, or with in-context assembly features, which can reduce robustness of the modeling.

Onshape uses Part Studios to model parts. Each Part Studio can (and often does) have several parts which are closely related in form or function. This allows, for example, modeling two flanges and a bolt circle using a single Hole feature, so that any updates automatically occur on both sides of the bolted joint. Note that parts cannot move in a Part Studio; motion studies should be done in Assemblies. This link is one-way: parts will maintain their positions in the Part Studio as modeled even if the assembly is moved.

Different groups of parts which do not need to be modeled together can be split into different part studios to speed up regeneration time, and then the subassemblies can be test-fit in an Assembly.

#### Variables
Especially when modeling geometry that has specified dimensions, like the board thicknesses for your laser cut parts, it is extremely helpful to first define variables that you can then reference later throughout the design. If you then need to go through and change dimensions because your board is 6mm instead of 1/4", this will make that fix much much easier for you later.

The Variable is on the toolbar as "(x)".
Define one constant for thick plates (e.g. 1/4"), and one for thin plates (e.g. 1/8").
This should look something like this.

#### Sketch and Extrude The Base
Click "Sketch" and start a sketch on the top plane. Alternatively, Shift-s is the shortcut for starting a sketch.
Drag a center-point rectangle (Shortcut: r) from the origin.
Dimension it to 18x18".
The result should look something like this.
Accept the sketch, and then click "Extrude" (Shortcut: Shift-e).
For "faces and sketch regions, simply choose the sketch itself from the feature tree.
For the depth, type in "#plate_thick" to reference the variable you created earlier.

#### Sketch the Sides
Start a sketch on the right face of the base you just extruded, and sketch and dimension the outline of the box.
Extrude, again selecting the sketch itself as the object. Make sure that the extrusion mode is set to "new" to create a new part, and not "add," which would merge the new extrusion with the base.
You should now have two parts that look like this.
Choose "mirror" from the toolbar, and mirror the side plate across the right face, again using the "new" option rather than "add."

#### Sketch and Extrude The Cross Members
You can extrude multiple disjoint regions as part of a single sketch, and they'll all become parts. So for the cross members, we can do everything as a single sketch to define geometry, and then extrude regions from the same sketch in multiple operations.

Make a new sketch on the outside face of one of the side plates.
Sketch the vertical and horizontal components using corner rectangles (Shortcut: r).
For the two pieces along the angled line, sketch a couple of corner rectangles, and select the bottom horizontal line. This should highlight the constraints for that line. Delete the horizontal constraint, and then add a concident constraint between the top line and the edge of the plate.
Add equality constraints to the thickness dimensions of all the rectangles, and then dimension one to be #plate_thick.
You should have a sketch that looks like this.
Extrude non-intersecting plates across the volume, using the "terminate at face" option to go to the outside face of the other side plate. I did the front, back, top spar, and one of the middle spars in one extrude, and the remaining parts in another to end up with this. You'll have to un-hide the sketch after the first extrude to be able to select different regions from it the second time.

#### Sketch and Extrude Facing Plates
These plates will end up covering the insides of the box. For each, sketch and extrude a plate of thickness #plate_thin.
Your box should now look something like this.

### Assemble and Create Connections
In this particular case, you could make all mirror copies of parts in the part studio.
Particularly if you know that the left and right sides will be different, for instance.
However, we're going to proceed as though the sides will be identical geometry just to demonstrate the principle.


#### Assemble the Parts

#### Create an In-Context Part Studio
This in-context part studio will allow us to make joints on the assembled components, as well as be the starting point for laying them out to cut.

#### Add T-Slot Connections for the Facing Plates
We want the facing plates to be removable so you can get at the insides. One way to do this, though by no means the only, is to use bolted edge connections through the facing plates into the edge plates.

Select T-Slot Joint from your custom feature toolbar. Select the edge face of the side plate, and set the joint parameters so you get connections where you want them. It may be helpful to hide the facing plates so you can easily select the edges to add the joints on.
Repeat for all four edges.

#### Laser Joint
Select the Laser Joint feature from your custom feature toolbar.
Select Automatic mode, then drag-select all of the non-facing parts. Enable adaptive pin sizing, and set the limits appropriately. I've found that for most work in ME218/Lab, the other options aren't necessary, but play around with them to get a feel for it. Leave Allowance disabled here to get a nice fit for your parts.

#### Kerf Compensation
The lasers on campus cut along the centerline. To get nominal-size parts, we'll offset the geometry a little so that everything lines up.

Add a Kerf Compensation feature, select the "By Thickness" mode, and enter one of the plate thicknesses you input earlier. I find that for 1/4"/6mm materials, using a kerf of 0.01" and an allowance of 0.001" works well; keep the same allowance and assume a 0.008" kerf for 1/8"/3mm parts. To be extra precise, cut a test square in your material on your laser and measure the kerf.


### Nest the Partss for Cutting
You now have an assembly with all joints computed, and you need to get them to a laser.  Our first approach will be the autolayout feature

#### Autolayout



#### Create Drawings and Export DXFs
Before exporting as DXF, measure your actual stock and if necessary update the thickness variables defined at the top of the document. If you've been using those variables everywhere, this should be a really easy way to compensate for odd material thicknesses and get the joints sized so they almost snap-fit (e.g. I find the 1/4" Duron from PRL is usually not quite 1/4" or 6mm).
To export a part, simply right-click a face and choose "Export as DXF/DWG..." and download. Since the laser joint is order dependent, symmetric parts will not necessarily have symmetric joints, so export each part individually.

{{% notice info %}}
Here's some text

And some more
{{% /notice %}}

You now have a bunch of DXFs for each individual part. Now we need to lay these out efficiently so that we can make the most of the material when we cut. This operation is called "nesting."

There's a couple solutions here. The easiest , and first thing to try is to use the Onshape Auto Layout feature, but this only gives good results if all of your parts are reasonably close to rectangular.

To use Auto Layout while avoiding CADing duplicates of parts (which is bad practice), do not apply laser joints in the part studios. Create an assembly, insert and pattern all of your parts, and then from the toolbar click "Create Part Studio in Context" (as of this writing, the right-most icon).

In this new part studio, first create a transform feature, choose "copy in place" as the operation type, and select all your parts. Now add any laser joint feature(s), kerf compensation feature(s), and then finally auto layout feature(s) to arrange the parts for cutting.

You will then need to create a 1:1 Drawing, with views cropped to each cut sheet, and export as PDF/DXF. These PDFs will need to be processed in your laser cutter software to reduce line width so the parts are cut and not rastered.

For more complex shapes, you'll need to use an actual nesting solution. SVGnest is a free, open-source solution, but only accepts SVG files. To use this, you'd need to use something to convert your DXF to SVG and then nest. Deepnest is downloadable, and takes DXF input, but costs $5 per saved output (you can mess around with it without exporting as much as you want). NestLeader has a free trial version and takes DXF input, so that's what I've been using.

Run the NestProfessor client.
Set up the material to have whatever dimensions your laser cutter can handle.
Add each DXF file to the parts list at top. If you're cutting multiple copies of identical geometry, you can also increase the quantity here.
Hit "Config" and adjust the spacing settings. Note that in the trial version, Part space will be automatically capped at 0.034.
Hit execute, and wait for the run to stop.
The resulting dialog will show the number of nested parts at top right; make sure everything worked.
Look through the sheets and make sure everything looks reasonable; sometimes there's a bug and a part is nested outside the allowed area. Usually this can be fixed by clicking "all results" and choosing a different solution which doesn't have the issue.
Highlight each sheet and then hit "Save Sheet" to save the cut file. Note that this includes the outline of the sheet in the file; you may need to use other software to remove this outline so it is not cut. You can then take this output DXF to the laser cutter.

---
Contributed by Arul Suresh, January 2020.