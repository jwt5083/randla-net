@echo off
setlocal enabledelayedexpansion

REM 设置基础目录（默认使用第一个参数，若未提供则使用默认路径）
set "BASE_DIR=%~1"
if "%BASE_DIR%"=="" set "BASE_DIR=D:\randla-net-tf2-main\randla-net-tf2-main\data\semantic3d"

REM 创建目录（如果不存在）
if not exist "%BASE_DIR%" mkdir "%BASE_DIR%"

echo 正在下载训练数据...
call :download_file http://semantic3d.net/data/point-clouds/training1/bildstein_station1_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/bildstein_station3_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/bildstein_station5_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/domfountain_station1_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/domfountain_station2_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/domfountain_station3_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/neugasse_station1_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/sg27_station1_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/sg27_station2_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/sg27_station4_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/sg27_station5_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/sg27_station9_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/sg28_station4_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/untermaederbrunnen_station1_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/training1/untermaederbrunnen_station3_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/sem8_labels_training.7z

echo 正在下载测试数据...
call :download_file http://semantic3d.net/data/point-clouds/testing1/birdfountain_station1_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/castleblatten_station1_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/castleblatten_station5_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/marketplacefeldkirch_station1_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/marketplacefeldkirch_station4_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/marketplacefeldkirch_station7_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/sg27_station10_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/sg27_station3_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/sg27_station6_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/sg27_station8_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/sg28_station2_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/sg28_station5_xyz_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/stgallencathedral_station1_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/stgallencathedral_station3_intensity_rgb.7z
call :download_file http://semantic3d.net/data/point-clouds/testing1/stgallencathedral_station6_intensity_rgb.7z

echo 正在下载reduced-8数据...
call :download_file http://semantic3d.net/data/point-clouds/testing2/MarketplaceFeldkirch_Station4_rgb_intensity-reduced.txt.7z
call :download_file http://semantic3d.net/data/point-clouds/testing2/StGallenCathedral_station6_rgb_intensity-reduced.txt.7z
call :download_file http://semantic3d.net/data/point-clouds/testing2/sg27_station10_rgb_intensity-reduced.txt.7z
call :download_file http://semantic3d.net/data/point-clouds/testing2/sg28_Station2_rgb_intensity-reduced.txt.7z

echo 所有文件已下载到 %BASE_DIR%
pause
exit

:download_file
set "url=%~1"
set "filename=%BASE_DIR%\%~nx1"

echo 正在下载 %url%
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%filename%' -UseBasicParsing"
exit /b