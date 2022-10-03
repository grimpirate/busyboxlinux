# busyboxlinux
Minimal Linux system compiled from source using Busy Box defconfig and Linux kernel allnoconfig with tailoring, respectively. Produces an ~15MB image.

# Build environment
Ubuntu 22.04.1 LTS

## Busy Box options (menuconfig)
Settings --->  
&nbsp;&nbsp;&nbsp;&nbsp;Build static binary (no shared libs)  
**Exit & Save configuration**

## Bare Minimum Linux kernel options
General setup --->  
&nbsp;&nbsp;&nbsp;&nbsp;Default hostname  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bblinux  
&nbsp;&nbsp;&nbsp;&nbsp;Initial RAM filesystem and RAM disk (initramfs/initrd) support  
&nbsp;&nbsp;&nbsp;&nbsp;De-select all compression modes  
64-bit kernel // not selecting it causes a conflict if busybox isn't compiled for 32-bit architecture  
Executable file formats --->  
&nbsp;&nbsp;&nbsp;&nbsp;Kernel support for ELF binaries  
&nbsp;&nbsp;&nbsp;&nbsp;Kernel support for scripts starting with #!  
Device drivers --->  
&nbsp;&nbsp;&nbsp;&nbsp;Input device support --->  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Keyboards ----  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AT Keyboard
**Exit & Save configuration**

## Linux kernel options
General setup --->  
&nbsp;&nbsp;&nbsp;&nbsp;Default hostname  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bblinux  
&nbsp;&nbsp;&nbsp;&nbsp;Initial RAM filesystem and RAM disk (initramfs/initrd) support  
&nbsp;&nbsp;&nbsp;&nbsp;De-select all compression modes  
&nbsp;&nbsp;&nbsp;&nbsp;Configure standard kernel features (expert users) ----  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;De-select all except Enable support for printk  
&nbsp;&nbsp;&nbsp;&nbsp;De-select Enable rseq() system call  
64-bit kernel // not selecting it causes a conflict if busybox isn't compiled for 32-bit architecture  
Executable file formats --->  
&nbsp;&nbsp;&nbsp;&nbsp;Kernel support for ELF binaries  
&nbsp;&nbsp;&nbsp;&nbsp;Kernel support for scripts starting with #!  
Device drivers --->  
&nbsp;&nbsp;&nbsp;&nbsp;Generic Driver options --->  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Maintain a devtmpfs filesystem to mount at /dev  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Automount devtmpfs at /dev, after the kernel mounted the rootfs  
&nbsp;&nbsp;&nbsp;&nbsp;Input device support --->  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Keyboards ----  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Select all options  
&nbsp;&nbsp;&nbsp;&nbsp;Character devices --->  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serial drives --->  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8250/16550 and compatible serial port  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console on 8250/16550 and compatible serial port  
File systems --->  
&nbsp;&nbsp;&nbsp;&nbsp;Pseudo filesystems --->  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/proc filesystem support  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sysctl support (/proc/sys)  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;sysfs filesystem support  
**Exit & Save configuration**

## References
* [https://www.youtube.com/watch?v=asnXWOUKhTA](https://www.youtube.com/watch?v=asnXWOUKhTA)
* [https://www.youtube.com/watch?v=MBx3JPgHYfI](https://www.youtube.com/watch?v=MBx3JPgHYfI)
* [https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d](https://weeraman.com/building-a-tiny-linux-kernel-8c07579ae79d)
* [https://mgalgs.io/2021/03/23/how-to-build-a-custom-linux-kernel-for-qemu-using-docker.html](https://mgalgs.io/2021/03/23/how-to-build-a-custom-linux-kernel-for-qemu-using-docker.html)
* [https://wiki.gentoo.org/wiki/Custom_Initramfs](https://wiki.gentoo.org/wiki/Custom_Initramfs)
* [https://github.com/ivandavidov/minimal](https://github.com/ivandavidov/minimal)
* [https://stackoverflow.com/questions/47448363/can-i-create-bootable-iso-file-after-kernel-compilation-for-the-customized-kern](https://stackoverflow.com/questions/47448363/can-i-create-bootable-iso-file-after-kernel-compilation-for-the-customized-kern)
* [https://linux-tips.com/t/booting-from-an-iso-image-using-qemu/136](https://linux-tips.com/t/booting-from-an-iso-image-using-qemu/136)
* [https://tldp.org/HOWTO/XFree-Local-multi-user-HOWTO/build_kernel.html](https://tldp.org/HOWTO/XFree-Local-multi-user-HOWTO/build_kernel.html)
---

* [https://gist.github.com/chrisdone/02e165a0004be33734ac2334f215380e](https://gist.github.com/chrisdone/02e165a0004be33734ac2334f215380e)
* [https://gist.github.com/chrisdone/7d9065d62942d8c2c204a016daf4dbe4](https://gist.github.com/chrisdone/7d9065d62942d8c2c204a016daf4dbe4)
* [https://gist.github.com/debuti/43e9104ae9eb59bdbb8b664c4fcf6839](https://gist.github.com/debuti/43e9104ae9eb59bdbb8b664c4fcf6839)
* [https://gist.github.com/tirzasrwn/0601d3c408f2f5aa887ad7511a12f60a](https://gist.github.com/tirzasrwn/0601d3c408f2f5aa887ad7511a12f60a)
---

* [https://medium.com/@ThyCrow/compiling-the-linux-kernel-and-creating-a-bootable-iso-from-it-6afb8d23ba22](https://medium.com/@ThyCrow/compiling-the-linux-kernel-and-creating-a-bootable-iso-from-it-6afb8d23ba22)
* [https://vitaminac.github.io/Simple-Bootstrap-Linux-System/](https://vitaminac.github.io/Simple-Bootstrap-Linux-System/)
* [https://techblog.lankes.org/2015/05/01/My-Memo-to-build-a-custom-Linux-Kernel-for-Qemu/](https://techblog.lankes.org/2015/05/01/My-Memo-to-build-a-custom-Linux-Kernel-for-Qemu/)
---

* [https://web.mit.edu/~firebird/arch/i386_rh9/doc/html/emb-framebuffer-howto.html](https://web.mit.edu/~firebird/arch/i386_rh9/doc/html/emb-framebuffer-howto.html)
* [https://wiki.gentoo.org/wiki/Framebuffer](https://wiki.gentoo.org/wiki/Framebuffer)
* [https://www.csse.uwa.edu.au/programming/linux/Linux-HowTo-9/Framebuffer-HOWTO-5.html](https://www.csse.uwa.edu.au/programming/linux/Linux-HowTo-9/Framebuffer-HOWTO-5.html)
* [https://tldp.org/HOWTO/html_single/Framebuffer-HOWTO/](https://tldp.org/HOWTO/html_single/Framebuffer-HOWTO/)
* [https://www.linuxquestions.org/questions/slackware-14/correct-graphics-framebuffer-kernel-config-options-garbled-console-text-435456/](https://www.linuxquestions.org/questions/slackware-14/correct-graphics-framebuffer-kernel-config-options-garbled-console-text-435456/)
* [https://unix.stackexchange.com/questions/159807/how-to-create-the-framebuffer-file-node](https://unix.stackexchange.com/questions/159807/how-to-create-the-framebuffer-file-node)
* [https://seenaburns.com/2018/04/04/writing-to-the-framebuffer/](https://seenaburns.com/2018/04/04/writing-to-the-framebuffer/)
