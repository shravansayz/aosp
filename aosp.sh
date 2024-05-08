rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/StatiXOS/android_manifest.git -b udc-qpr2

#Local manifests
git clone https://github.com/shravansayz/local_manifests -b test .repo/local_manifests
#repo sync
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

#build
/opt/crave/resync.sh
. build/envsetup.sh
brunch statix_RMX1901-ap1a-userdebug
