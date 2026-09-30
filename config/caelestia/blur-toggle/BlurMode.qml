pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Caelestia
import qs.services
import qs.utils

Singleton {
    id: root

    // Diferente do GameMode, que corta animacoes, sombras, gaps e rounding de uma vez,
    // isto mexe so em decoration:blur:enabled.
    //
    // O estado mora num .conf sourceado pelo hyprland.conf do usuario, e nao em
    // memoria: assim o blur sobrevive a hyprctl reload, restart do shell e reboot.
    readonly property string confPath: `${Paths.config}/hypr-blur.conf`

    property bool enabled: true

    function set(on: bool): void {
        root.enabled = on;
        conf.setText(`# Gerado pelo Quick Toggle de blur do Caelestia - nao editar na mao
decoration {
    blur {
        enabled = ${on ? "true" : "false"}
    }
}
`);
        // O arquivo so vale no proximo reload, entao aplica ao vivo tambem
        Hypr.extras.applyOptions({
            "decoration:blur:enabled": on ? 1 : 0
        });

        if (on)
            Toaster.toast(qsTr("Blur enabled"), qsTr("Hyprland window blur is on"), "blur_on");
        else
            Toaster.toast(qsTr("Blur disabled"), qsTr("Hyprland window blur is off"), "blur_off");
    }

    function toggle(): void {
        set(!root.enabled);
    }

    FileView {
        id: conf

        path: root.confPath
        preload: true
        printErrors: false
        watchChanges: true

        onFileChanged: reload()
        onLoaded: root.enabled = /enabled\s*=\s*(true|1|yes|on)\b/i.test(text())
        // Sem arquivo = nunca foi mexido: herda o que o Hyprland ja tem
        onLoadFailed: root.enabled = Hypr.options["decoration:blur:enabled"] !== 0 // qmllint disable missing-property
    }

    IpcHandler {
        function isEnabled(): bool {
            return root.enabled;
        }

        function toggle(): void {
            root.toggle();
        }

        function enable(): void {
            root.set(true);
        }

        function disable(): void {
            root.set(false);
        }

        target: "blur"
    }
}
