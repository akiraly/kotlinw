%echo off
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
)
del %kotlin_release_distribution_filename%
cd %current_dir%
)

set PATH=%kotlin_releases_dir%\%kotlin_release_version%\kotlinc\bin;%PATH%

%*
