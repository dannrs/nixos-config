{pkgs, ...}: {
  home.packages = with pkgs; [
    #emulationstation-de
    retroarch-full
    pcsx2
    # (retroarch.withCores (cores: with cores; [
    #   beetle-psx
    #   dolphin
    #   mesen
    #   mgba
    #   snes9x
    # ]))
  ];

  home.file = {
    "/home/dann/ES-DE/custom_systems/es_find_rules.xml" = {
      text = ''
        <?xml version="1.0"?>
        <!-- This is the ES-DE find rules configuration file for Linux -->
        <ruleList>
          <core name="RETROARCH">
            <rule type="corepath">
              <!-- NixOS -->
              <entry>/etc/profiles/per-user/dann/lib/retroarch/cores</entry>
              <!-- Snap package -->
              <entry>~/snap/retroarch/current/.config/retroarch/cores</entry>
              <!-- Flatpak package -->
              <entry>~/.var/app/org.libretro.RetroArch/config/retroarch/cores</entry>
              <!-- AppImage and compiled from source -->
              <entry>~/.config/retroarch/cores</entry>
              <!-- Ubuntu and Linux Mint repository -->
              <entry>/usr/lib/x86_64-linux-gnu/libretro</entry>
              <!-- Fedora repository -->
              <entry>/usr/lib64/libretro</entry>
              <!-- Manjaro repository -->
              <entry>/usr/lib/libretro</entry>
            </rule>
          </core>
        </ruleList>
      '';
    };
    # "/home/dann/ES-DE/custom_systems/es_systems.xml" = {
    #   text = ''
    #     <?xml version="1.0"?>
    #     <!-- This is a custom ES-DE game systems configuration file for Linux -->
    #     <systemList>
    #       <system>
    #         <name>nes</name>
    #         <fullname>Nintendo Entertainment System</fullname>
    #         <path>%ROMPATH%/nes</path>
    #         <extension>.nes .NES .zip .ZIP</extension>
    #         <command>%EMULATOR_RETROARCH% -L %CORE_RETROARCH%/mesen_libretro.so %ROM%</command>
    #         <platform>nes</platform>
    #         <theme>nes</theme>
    #       </system>
    #     </systemList>
    #   '';
    # };
  };
}
