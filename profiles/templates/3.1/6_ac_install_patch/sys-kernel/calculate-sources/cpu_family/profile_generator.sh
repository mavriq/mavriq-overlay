# Calculate append=skip

# Генератор шаблонов для конфига ядра для настройки CPU Family

fam_template_gen() {
    local f ff ARCH=$1; shift
    local DEFAULT=$1 FAMILY=("$@")
    for f in ${FAMILY[@]}; do
    {
        echo -n "# Calculate format=openrc name=.config os_arch_machine==${ARCH}"
        if [[ "$f" != "$DEFAULT" ]]; then
            echo -e " ini(kernel.family)==$f\n\n# CONFIG_LOCALVERSION=\".${ARCH}.$f\""
        else
            for ff in ${FAMILY[@]}; do
                [[ "$ff" != "$DEFAULT" ]] && echo -n " ini(kernel.family)!=$ff"
            done
            echo -e "\n"
        fi
        for ff in ${FAMILY[@]}; do
            echo -n "CONFIG_$ff="; [[ "$f" == "$ff" ]] && echo y || echo n
        done
    } >${ARCH}.$f.config
    done 
}

fam_template_gen i686 M686 M486 M586 M586TSC M586MMX MPENTIUMII MPENTIUMIII MPENTIUMM MPENTIUM4 MK6 MK7 MK8 MCRUSOE MEFFICEON MWINCHIPC6 MWINCHIP3D MELAN MGEODEGX1 MGEODE_LX MCYRIXIII MVIAC3_2 MVIAC7 MCORE2 MATOM
fam_template_gen x86_64 GENERIC_CPU MK8 MPSC MCORE2 MATOM
