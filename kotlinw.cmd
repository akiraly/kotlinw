@echo off
rem   Copyright 2022 akiraly
rem
rem   Licensed under the Apache License, Version 2.0 (the "License");
rem   you may not use this file except in compliance with the License.
rem   You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem   Unless required by applicable law or agreed to in writing, software
rem   distributed under the License is distributed on an "AS IS" BASIS,
rem   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem   See the License for the specific language governing permissions and
rem   limitations under the License.

set kotlin_release_version=kotlin-compiler-1.6.10
set kotlin_release_distribution_filename=%kotlin_release_version%.zip
set kotlin_release_url=https://github.com/JetBrains/kotlin/releases/download/v1.6.10/%kotlin_release_distribution_filename%
set kotlin_releases_dir=.\.kotlin\releases
set current_dir=%CD%

if not exist %kotlin_releases_dir%\%kotlin_release_version% (
if not exist %kotlin_releases_dir% mkdir %kotlin_releases_dir%
cd %kotlin_releases_dir%
if not exist %kotlin_release_distribution_filename% curl -L %kotlin_release_url% -O
if not exist %kotlin_release_version% (
mkdir %kotlin_release_version%
cd %kotlin_release_version%
tar -xpf ..\%kotlin_release_distribution_filename%
cd ..
)
del %kotlin_release_distribution_filename%
cd %current_dir%
)

set PATH=%kotlin_releases_dir%\%kotlin_release_version%\kotlinc\bin;%PATH%

%*
