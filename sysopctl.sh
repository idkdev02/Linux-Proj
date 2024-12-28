#!/bin/bash

# Command version
VERSION="v0.1.0"

# Function to show help
show_help() {
    echo "Options:"
    echo "  service list                List all active services."
    echo "  service start <service>     Start a service."
    echo "  service stop <service>      Stop a service."
    echo "  system load                 View current system load."
    echo "  disk usage                  Check disk usage."
    echo "  process monitor             Monitor system processes."
    echo "  logs analyze                Analyze system logs."
    echo "  backup <path>               Backup system files."
    echo "  --help                      Show this help message."
    echo "  --version                   Show version information."
}

# Function to show version
show_version() {
    echo "sysopctl $VERSION"
}

# Function to list running services
list_services() {
    systemctl list-units --type=service --state=running
}

# Function to show system load
show_load() {
    uptime
}

# Function to start a service
start_service() {
    systemctl start "$1"
    echo "Service $1 started."
}

# Function to stop a service
stop_service() {
    systemctl stop "$1"
    echo "Service $1 stopped."
}

# Function to check disk usage
check_disk_usage() {
    df -h
}

# Function to monitor processes
monitor_processes() {
    top
}

# Function to analyze logs
analyze_logs() {
    journalctl -p 3 -b
}

# Function to backup files
backup_files() {
    rsync -av --progress "$1" /path/to/backup/
    echo "Backup of $1 initiated."
}

# Main script logic
case "$1" in
    service)
        case "$2" in
            list) list_services ;;
            start) start_service "$3" ;;
            stop) stop_service "$3" ;;
            *) echo "Invalid service command." ;;
        esac
        ;;
    system) show_load ;;
    disk) check_disk_usage ;;
    process) monitor_processes ;;
    logs) analyze_logs ;;
    backup) backup_files "$2" ;;
    --help) show_help ;;
    --version) show_version ;;
    *) echo "Invalid command. Use --help for usage." ;;
esac

