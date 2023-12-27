#!/bin/bash

KUBECONFIG_DEFAULT_PATH=".kube"
KUBERNETES_CONFIG_FILE_NAME="config"
KUBERNETES_BACKUP_FILE_NAME="config-backup.yaml"
KUBERNETES_CUSTOM_FILE_NAME="vagrant-config.yaml"


KUBECONFIG_PATH="${HOME}/${KUBECONFIG_DEFAULT_PATH}"
KUBECONFIG_PATH_FILE_NAME="${KUBECONFIG_PATH}/${KUBERNETES_CONFIG_FILE_NAME}"
BACKUP_FILE_PATH="${HOME}/${KUBECONFIG_DEFAULT_PATH}/${KUBERNETES_BACKUP_FILE_NAME}"
CUSTOM_KUBECONFIG_CONFIG_PATH="${KUBECONFIG_PATH}/${KUBERNETES_CUSTOM_FILE_NAME}"


ANSIBLE_CONFIG_FILE="./playbook/${KUBERNETES_CONFIG_FILE_NAME}"


if [ ! -f "$ANSIBLE_CONFIG_FILE" ]; then
    echo "Could find kuberntes config file for vagrant, Do you run ansible playbook for master cluster?"
    exit
else
    echo "Found vagrant config file"
fi


if test -f "$KUBECONFIG_PATH"; then
    echo "FOUND EXISTING KUBECONFIG. Set up conf file with name vagrant-conf.yml"
    cp "$ANSIBLE_CONFIG_FILE" "$CUSTOM_KUBECONFIG_CONFIG_PATH"
    echo "Succesfully copied kube config to user"
else
    cp "$ANSIBLE_CONFIG_FILE" "$KUBECONFIG_PATH_FILE_NAME"
    echo "Succesfully copied kube config to user"
fi


