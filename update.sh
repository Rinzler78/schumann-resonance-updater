#!/bin/sh

function showTitle
{
    echo "******** Schumann resonance real time history updater ******"
}

showTitle

Date=$(date +"%m-%d-%Y")
Time=$(date +"%H-%M")

TargetDir="/history/$Date/$Time"

function UpdateFile
{
    newFile=$1.jpg
    oldFile=old.$1.jpg
    
    wget -O /history/$newFile http://sosrff.tsu.ru/new/$newFile
    
    if [ ! -f "/history/$oldFile" ] || [ "$(cmp /history/$oldFile /history/$newFile)" ]; then
        mkdir -p $TargetDir
        echo "Save new file => $TargetDir/$newFile"
        cp /history/$newFile $TargetDir/$newFile
    fi

    mv /history/$newFile /history/$oldFile

    echo 
}

UpdateFile srf
UpdateFile shm
UpdateFile sra
UpdateFile srq

showTitle
