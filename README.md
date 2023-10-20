Install WSL dan Vala
- Buka Windows PowerShell
- Jalanin wsl --install
- Tunggu Selesai
- Restart device
- Buka WSL
- - Jika error
- - - Buka powershell jalanin wsl --install sekali lagi
- - - Setelah selesai buka WSL (tidak perlu restart device)
- - Jika berhasil lanjut ke bawah
- sudo apt-get update
- sudo apt-get install valac
- sudo apt install libgtk-4-dev
- sudo apt-get install libgee-0.8-dev


Install meson
- Buka WSL
- sudo apt install python3-pip
- sudo pip3 install meson
- sudo apt install ninja-build


Setup meson 1
- Buat file meson.build
-   project('nama-project', 'vala', 'c')
- 
-   deps = [
-       dependency('glib-2.0'),
-       dependency('gobject-2.0'),
-       dependency('gee-0.8'),  
-   ]
- 
-   executable('nama-exe', 'source-code', dependencies: deps)
- meson setup bin
- ninja -C bin
- ./bin/nama-exe


Setup meson 2
- meson init --name nama-exe --build
- tambahin dependency di meson.build
-   deps = [
-       dependency('glib-2.0'),
-       dependency('gobject-2.0'),
-       dependency('gee-0.8'),  
-   ]
- ninja -C build
- ./build/nama-exe