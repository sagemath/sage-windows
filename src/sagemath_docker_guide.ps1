##############################################################################
#       Copyright (C) 2024 Sebastian Oehms <seb.oehms@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#                  http://www.gnu.org/licenses/
##############################################################################


Using module .\proj_docker_guide.psm1

###############################################################################################
# Project spezific configuration 
###############################################################################################
$ipython = [DockerGuideApp]::new("Work in a Sage customized IPython terminal (default)", "S-", 0, "", 1)
$notebook = [DockerGuideApp]::new("Work in a Jupyter notebook", "N-", 8888, "sage-jupyter", 2)
$lab = [DockerGuideApp]::new("Work in Jupyter lab", "L-", 8888, "sage-jupyterlab", 3)
$bash = [DockerGuideApp]::new("Work in a bash terminal (advanced)", "B-", 0, "", 4)

$all_apps = @($ipython, $notebook, $lab, $bash)
$all_apps = @($ipython, $notebook) # lab and bash not functional, yet
$bash_app = @($bash)

$sagemath_repositories = @(
    [DockerGuideRepo]::new("sagemath", "sagemath", "Repository for users, ony stable releases (default)", [TagFilterValues]::stable, $all_apps)
    [DockerGuideRepo]::new("sagemath", "sagemath", "Repository for users, only pre-releases (advanced)", [TagFilterValues]::pre, $all_apps),
    [DockerGuideRepo]::new("sagemathinc", "cocalc-docker", "Repository for users, Cocalc version", [TagFilterValues]::all, $bash_app),
    [DockerGuideRepo]::new("computop", "sage", "Repository for users, featuring geometric topology", [TagFilterValues]::all, $bash_app),
    [DockerGuideRepo]::new("sagemath", "sagemath-dev", "Repository for development (advanced)", [TagFilterValues]::all, $bash_app)
)


$sagemath_docker_guide = [ProjectsDockerGuide]::new("SageMath", $sagemath_repositories)
$sagemath_docker_guide.run()
