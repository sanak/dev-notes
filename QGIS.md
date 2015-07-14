# QGIS

## Build

NOTICE: This section mentions **only** about differences from git repository's
`INSTALL` file.
https://github.com/qgis/QGIS/blob/master/INSTALL

### Git flow (Private)

1. Clone QGIS original repository. (Only at the first time)
```
git clone https://github.com/qgis/QGIS QGIS-git
```

2. Reset the build environment.
```
cd /path/to/QGIS-git
git status
git reset --hard HEAD
```

3. Checkout the installed version tag on the environment.
```
git checkout master
git pull
git tag
git checkout -b final-2_10_0 refs/tags/final-2_10_0
```

### Common

* Create not only `build` directory, but also `app` directory
   for installation.
 ```
 cd /path/to/QGIS-git
 mkdir build
 mkdir app
 ```

### Windows 7 SP1 (x64)

#### Visual Studio 2010 SP1 and Windows SDK 7.1 installation

* Installation order should be as follows:
  1. Visual Studio 2010 (Express Edition)
  2. Windows SDK 7.1
  3. Visual Studio 2010 SP1
  4. Visual C++ 2010 SP1 Compiler Update for the Windows SDK 7.1

  [Download Microsoft Visual C++ 2010 Service Pack 1 Compiler Update
  for the Windows SDK 7.1 from Official Microsoft Download Center]<br>
  https://www.microsoft.com/en-us/download/details.aspx?id=4422

* Apply the following link's "3.1 Improve Debugger Support for Qt datatypes"
for Debug.

  [Human-Machine Teaming Lab]
  http://eecs.vanderbilt.edu/research/hmtl/wp/index.php/qt-vs/#toc4

#### OSGeo4W(64) installation
* In case of x64 build, select `python-devel` package.
* `grass` package is not necessary.

#### cmake-gui settings
* Preparation:
  * To test both of x86 and x64 build, create `x86` and `x64`
  directories in `app` and `build` directories.
  * If ArcGIS 10.1 is installed, rename the following files
  (to `python27_ArcGIS.dll` .etc).
    * x86: C:/Windows/System32/python27.dll
    * x64: C:/Windows/SysWOW64/python27.dll
  * Copy `recreate_working_dirs.bat` and `set_vs2010exp_env.bat` to "QGIS-git" directory.
* Configuration:
  * x86
    * CMAKE_INSTALL_PREFIX: "/path/to/QGIS-git/app/x86"
    * GEOS_LIBRARY: C:/OSGeo4W/lib/geos_c.lib
    * PROJ_LIBRARY: C:/OSGeo4W/lib/proj_i.lib
    * PYTHON_LIBRARY: C:/OSGeo4W/apps/Python27/libs/python27.lib
    * SETUPAPI_LIBRARY: "C:/Program Files/Microsoft SDKs/Windows/v7.1/Lib/SetupAPI.Lib"
    * SPATIALINDEX_LIBRARY: C:/OSGeo4W64/lib/spatialindex_i.lib
    * SPATIALITE_LIBRARY: C:/OSGeo4W64/lib/spatialite_i.lib
    * SQLITE3_LIBRARY: C:/OSGeo4W64/lib/sqlite3_i.lib
  * x64
    * CMAKE_INSTALL_PREFIX: "/path/to/QGIS-git/app/x64"
    * GEOS_LIBRARY: C:/OSGeo4W64/lib/geos_c.lib
    * PROJ_LIBRARY: C:/OSGeo4W64/lib/proj.lib
    * PYTHON_LIBRARY: C:/OSGeo4W64/apps/Python27/libs/python27.lib
    * SETUPAPI_LIBRARY: "C:/Program Files/Microsoft SDKs/Windows/v7.1/Lib/x64/
    SetupAPI.Lib"
    * SPATIALINDEX_LIBRARY: C:/OSGeo4W64/lib/spatialindex-64.lib
    * SPATIALITE_LIBRARY: C:/OSGeo4W64/lib/spatialite_i.lib
    * SQLITE3_LIBRARY: C:/OSGeo4W64/lib/sqlite3_i.lib
  * Common
    * WITH_GRASS: OFF
    * WITH_GRASS7: OFF
    * WITH_INTERNAL_QWTPOLAR: OFF
    * WITH_QWTPOLAR: OFF

#### Visual Studio 2010 SP1
* Build
  * If `qgis_regression1141` project can't be built with errors, try
  the followings.
    1. Double click a row in error list.
    2. Select [ファイル(File)] / [名前を付けて(Save) regression1141.cpp
    を保存(as)...] menu.
    3. Select [エンコード付きで保存(Save with encode)] menu from [上書き保存(Save)]
    drop down menu.
    4. Select "Unicode (UTF-8 シグネチャ付き) - コードページ 65001" from
    [エンコード(Encode)] combo box, then click [OK] button.
    5. Build the solution again.
  * If the following error occurs, rebuild the solution again.
  ```
  261>C:\Program Files (x86)\MSBuild\Microsoft.Cpp\v4.0\Microsoft.CppCommon.targets(151,5): error MSB6006: "cmd.exe" はコード 1 を伴って終了しました。
  ```
* Debug
  * Set `qgis` project as start up project.
  * Set `qgis` project property - [デバッグ(Debug)] section as follows:
    * コマンド(Command):
      * x86: "/path/to/QGIS-git/app/x86/bin/qgis.exe"
      * x64: "/path/to/QGIS-git/app/x64/bin/qgis.exe"

### Mac OSX 10.10 (Yosemite)

#### Homebrew
TBD

#### MacPorts
TBD
