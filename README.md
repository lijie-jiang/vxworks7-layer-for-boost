### VxWorks&reg; 7 Recipe Layer for Boost

This repository will contain a VxWorks&reg;  7 Source Build (VSB) layer later this year. 
When complete, you will be able to add this layer to your VxWorks install and
to build and verify boost as part of of you board's VSB project.  

Currently this repository contains a collection of patches to adapt Boost to VxWorks.
Boost is many libraries and not all of them will work with VxWorks, some of them require
C++ support not available in VxWorks, or are dependent on other libraries not available 
for VxWorks. The **vxworks7-boost** project goal is to validate as many boost libraries
as possible and then push the required changes to boost.org. Until the patches are
incorporated into boost they will exist here.

This layer does not contain boost and only provides a recipe to adapt boost to VxWorks. 
Boost is not part of any VxWorks product, and is not covered by your Wind River support agreement.
If you need help, please use the resources available and boost.org, or contact your Wind River sales
representative to arrange for consulting services.

### Project License

The source code for this project is provided under the Boost Software License - Version 1.0 (BSL-1.0). Text for the BSL-1.0 and other applicable license notices can be found in the LICENSE_NOTICES.txt file in the project top level directory. Different files may be under different licenses. Each source file should include a license notice that designates the licensing terms for the respective file.

### Prerequisite(s)

Install the Wind River&reg; VxWorks&reg; 7 operating system

### Legal Notices

Disclaimer of Warranty / No Support: Wind River does not provide support and maintenance services for this software, under Wind River’s standard Software Support and Maintenance Agreement or otherwise. Unless required by applicable law, Wind River provides the software (and each contributor provides its contribution) on an “AS IS” BASIS, WITHOUT WARRANTIES OF ANY KIND, either express or implied, including, without limitation, any warranties of TITLE, NONINFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the software and assume ay risks associated with your exercise of permissions under the license.
