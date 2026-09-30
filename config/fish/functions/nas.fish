function nas --description 'Monta o NAS (se preciso) e entra na pasta'
    set -l mount_point /mnt/nas

    if not mountpoint -q $mount_point
        echo "Montando NAS em $mount_point..."
        sudo mount $mount_point
        or begin
            echo "Falha ao montar."
            return 1
        end
    end

    if test (count $argv) -gt 0
        cd $mount_point/$argv[1]
    else
        cd $mount_point
    end
end

function nas-umount --description 'Desmonta o NAS'
    sudo umount /mnt/nas; and echo "NAS desmontado."
end
