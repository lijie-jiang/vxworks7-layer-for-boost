# VxWorks 7 recipe layer for boost

This repository will contain a VxWorks Source Build (VSB) layer later this year. 
When complete, you will be able to add this layer to your VxWorks install and
to build and verify boost as part of of you board's VSB project.  

Currently this repository contains a collection of patches to adapt boost to VxWorks.
Boost is many libraries and not all of them will work with VxWorks, some of them require
C++ support not available in VxWorks, or are dependent on other libraries not available 
for VxWorks. The **vxworks7-boost** project goal is to validate as many boost libraries
as possible and then push the required changes to boost.org. Until the patches are
incorporated into boost they will exist here.

 

 
 
 
 
 
This layer does not contain boost and only provides a recipe to adapt boost to VxWorks. 
Boost is not part of any VxWorks product, and is not covered by your Wind River support agreement.
If you need help, please use the resources available and boost.org, or contact your Wind River sales
representative to arrange for consulting services.

Boost is not included in the third party code review conducted for VxWorks. 
Boost licensing information is not included in the legal-notices directory in your Wind River installation.
