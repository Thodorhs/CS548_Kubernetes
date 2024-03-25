#!/bin/bash
kubectl delete jobs --all && kubectl delete pods --all && kubectl delete pvc --all && kubectl delete pv --all
