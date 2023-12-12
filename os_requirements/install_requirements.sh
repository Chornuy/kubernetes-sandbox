#! /bin/bash

WORK_DIR="$(dirname "$0")"

DISTRO_NAME=$(lsb_release -sc | tr '[:upper:]' '[:lower:]')

# shellcheck source=detect_os.sh
source ./"$WORK_DIR"/detect_os.sh

PACKAGE_MANAGER=$(detect_os_by_release)

function list_packages(){
    grep -v "#" "${OS_REQUIREMENTS_FILENAME}" | grep -v "^$";
}


function get_installer_name() {
    work_dir="$1"
    packaga_manager="$2"
    echo "${work_dir}/installers/${packaga_manager}_installer.sh"
}


echo "OS NAME VARIABLE"
echo "$PACKAGE_MANAGER"

echo 'WORK DIR IS'
echo $WORK_DIR
echo "DISTRO NAME"
echo $DISTRO_NAME

intaller_script=$(get_installer_name "$WORK_DIR" "$PACKAGE_MANAGER")


# shellcheck source=detect_os.sh
source "$intaller_script"

result=$(install_packages "$WORK_DIR" "$DISTRO_NAME")
echo $result