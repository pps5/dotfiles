set $(acpi | sed -e 's/^.*\(Charging\|Discharging\|Unknown\), \(.*\)%.*$/\1 \2/')
echo ${0} ${1} ${2}
if [ "${1}" = "Discharging" -a ${2} -le 10 ]; then
    notify-send -u critical -t 6000 "Battery low: ${2}%"
fi

