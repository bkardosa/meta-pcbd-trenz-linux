FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-te_patches.patch"
SRC_URI += "file://0002-pdns100.patch"

XSCTH_APP_zynqmp = "Zynq MP FSBL (TE modified)"

YAML_SERIAL_CONSOLE_STDIN_zynqmp-generic_pn-fsbl = "psu_uart_1"
YAML_SERIAL_CONSOLE_STDOUT_zynqmp-generic_pn-fsbl = "psu_uart_1"

