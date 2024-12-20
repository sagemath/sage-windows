# Welcome to the SageMath Windows installation 

This repository is a work in progress. It is intended to provide [SageMath](https://www.sagemath.org/) installers for Windows. The previous repository of the same name, which provided such installers up to Sage version 9.3, has been moved to [sage-windows-cygwin](https://github.com/sagemath/sage-windows-cygwin). It has been discontinued because the technique used was increasingly maintenance intensive.

Here we plan a new start. We follow four approaches:

* A is developed in connection with the [sage-flatsurf](https://github.com/flatsurf/sage-flatsurf) project. Currently, it installs a flatsurf release as a custom WSL distribution which includes Sage along with functionality of this downstream package. This approach will also provide pure Sage installers in future. To figure out how it works, follow  [these instructions](https://github.com/flatsurf/sage-flatsurf#installation).
* B is developed in connection with the [sage-binder](https://github.com/sagemath/sage-binder-env/) project. It installs a Sage release as a custom WSL distribution. To figure out how it works, follow [these instructions](https://github.com/sagemath/sage-binder-env/releases/tag/v10.5).
* C is developed as an example for a [projects docker guide](https://github.com/soehms/projects_docker_guide/). It installs Sage via Docker in a custom WSL distribution which is independent of the Sage release. To figure out how it works, follow [these instructions](https://github.com/soehms/projects_docker_guide/#1.).
* D) is developed as a native Windows build of Sage using meson (see sagemath/sage#38872). There is no installer for testing yet.

Any help with our project is welcome. Feel free to open issues in this repo to document your testing experiences or post your suggestions and criticism.
