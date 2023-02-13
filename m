Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 447306947BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 15:10:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjBMOKC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 09:10:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjBMOJx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 09:09:53 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51E411EA3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 06:09:47 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id p26so32095000ejx.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Feb 2023 06:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TgEJoW6QMztc3DRN53VevL2Hj4z9FgsTEYdHDZoKXyQ=;
        b=YKCaFBzUmPtyfD3/Gk8EYybZirUBFZrd4FA4U15rytdikYF64XtGTWbAT1uzrjptnt
         BVJyw2+rqX91UleetdKqy6GAjYO2lw/BpCkc+JWfmdwmRw1uuItKqu4yor12EuZdwcJj
         +oGJSQs3DLCEvaUyslFg+yJJPu+zk9ZEAJVzTS5p8TjBI2K06/CLefynSCeTsGe+bImV
         XhuLYOa19dRSjKj82DIvNtVWiXp0NQ8trpbmndhWESGpeU182orz6Tre7HVCzrueSZMD
         pO0jA8jOhW3f4P1p5JkGlwLodjtiO75MRmb993ChNKOQ9Px1PeLxnuDmqQU6jPjmp3zY
         s/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TgEJoW6QMztc3DRN53VevL2Hj4z9FgsTEYdHDZoKXyQ=;
        b=inMQsh7WFpyjMiInj02wUh3AESrHQI4e0PukpHLckIU/yxa+pGDkl6i/b+Z63chEgo
         c1/6dlJBw5dJIZA33iXSkhzpHoahjyayq3SC4h92EN4RtF5WkeXqiiK0CiGz0q79lQLK
         A5m0xHFkY5RNTzcxV6bdgLskNIziUyVCydg6kKa2iKLWmzRwaGc40iyYW/T+to2g7Evt
         qNY0Vq6gRslRPMTbPt5vE7+/jq8wFtuT8UPpV8xqPGfXDb76D56GbUJ5vap7wED6k6Xl
         jtLQjqd/CR8aQvCIaJP+W3Dd3S0SFlFu6Vzz9J4HBEVnZ2dIJ0xTzk9Qp3sTmUx7EW3E
         F+hA==
X-Gm-Message-State: AO0yUKXMM1pxKndtAurvSf05kNtbQwlyxgJpMDoa21O0CntybM+4f1TL
        jYmlhNWVbZkrEvG1seXt5XLIng==
X-Google-Smtp-Source: AK7set+L78kPqi1iOHtaT2H/sAPU4M2hCtv7FmFC64ezi6zI3paCybPuMMG5dFUdf5Rj/qSOhwO5Xg==
X-Received: by 2002:a17:906:6a1b:b0:8af:b63:b4bf with SMTP id qw27-20020a1709066a1b00b008af0b63b4bfmr22828203ejc.27.1676297386211;
        Mon, 13 Feb 2023 06:09:46 -0800 (PST)
Received: from localhost (h-46-59-89-207.A463.priv.bahnhof.se. [46.59.89.207])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906551200b008b11ba87bf4sm796566ejp.209.2023.02.13.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 06:09:45 -0800 (PST)
Date:   Mon, 13 Feb 2023 15:09:43 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Message-ID: <Y+pEpwa3vFEh58Zc@oden.dyn.berto.se>
References: <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
 <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+oJkcP2e5a9H7fr@oden.dyn.berto.se>
 <OS0PR01MB5922EFD04CDA5EE790CE2B0086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+oRDb8DzgUhu6U6@oden.dyn.berto.se>
 <OS0PR01MB592203B32464BE32BC55562886DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB592203B32464BE32BC55562886DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On 2023-02-13 13:01:06 +0000, Biju Das wrote:
> Please get files from here
> 
> https://gitlab.com/bijud/uart-fifo/-/commits/uart-fifo-testing

Thanks for the branch.

It boots and the serial console appears to be functioning as expected.  
Is there anything in particular you like me to test? I attach the full 
boot log in case it's useful for you.

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.2.0-rc7-next-20230210-12179-g91bd68019b4b (neg@sleipner) (arm-linux-gnueabihf-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35.1) #2 SMP Mon Feb 13 15:02:12 CET 2023
[    0.000000] CPU: ARMv7 Processor [411fc092] revision 2 (ARMv7), cr=10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
[    0.000000] OF: fdt: Machine model: EMEV2 KZM9D Board
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] cma: Failed to reserve 128 MiB
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000040000000-0x0000000047ffffff]
[    0.000000]   HighMem  empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x0000000047ffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000047ffffff]
[    0.000000] percpu: Embedded 14 pages/cpu s33620 r0 d23724 u57344
[    0.000000] pcpu-alloc: s33620 r0 d23724 u57344 alloc=14*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 32512
[    0.000000] Kernel command line: ignore_loglevel rw root=/dev/nfs ip=on
[    0.000000] Dentry cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
[    0.000000] Inode-cache hash table entries: 8192 (order: 3, 32768 bytes, linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 116068K/131072K available (8192K kernel code, 1150K rwdata, 2596K rodata, 1024K init, 251K bss, 15004K reserved, 0K cma-reserved, 0K highmem)
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] GIC: enabling workaround for broken byte access
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] timer_probe: no matching timers found
[    0.000000] Console: colour dummy device 80x30
[    0.000000] printk: console [tty0] enabled
[    0.000000] sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every 21474836475000000ns
[    0.000000] Calibrating delay loop (skipped) preset value.. 1066.00 BogoMIPS (lpj=5330000)
[    0.000000] pid_max: default: 32768 minimum: 301
[    0.000000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.000000] CPU: Testing write buffer coherency: ok
[    0.000000] CPU0: Spectre v2: using BPIALL workaround
[    0.000000] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.000000] Setting up static identity map for 0x40100000 - 0x40100060
[    0.000000] rcu: Hierarchical SRCU implementation.
[    0.000000] rcu: 	Max phase no-delay instances is 1000.
[    0.000000] smp: Bringing up secondary CPUs ...
[    0.000000] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.000000] CPU1: Spectre v2: using BPIALL workaround
[    0.000000] smp: Brought up 1 node, 2 CPUs
[    0.000000] SMP: Total of 2 processors activated (2132.00 BogoMIPS).
[    0.000000] CPU: All CPU(s) started in SVC mode.
[    0.000000] devtmpfs: initialized
[    0.000000] VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 1
[    0.000000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.000000] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
[    0.000000] pinctrl core: initialized pinctrl subsystem
[    0.000000] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.000000] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.000000] thermal_sys: Registered thermal governor 'step_wise'
[    0.000000] No ATAGs?
[    0.000000] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watchpoint registers.
[    0.000000] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.000000] sh-pfc e0140200.pinctrl: emev2_pfc support registered
[    0.000000] SCSI subsystem initialized
[    0.000000] libata version 3.00 loaded.
[    0.000000] usbcore: registered new interface driver usbfs
[    0.000000] usbcore: registered new interface driver hub
[    0.000000] usbcore: registered new device driver usb
[    0.000000] mc: Linux media interface: v0.10
[    0.000000] videodev: Linux video capture interface: v2.00
[    0.000000] pps_core: LinuxPPS API ver. 1 registered
[    0.000000] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.000000] PTP clock support registered
[    0.000000] em_sti e0180000.timer: used for clock events
[    0.000000] em_sti e0180000.timer: used for oneshot clock events
[    0.000000] em_sti e0180000.timer: used as clock source
[    0.000000] clocksource: e0180000.timer: mask: 0xffffffffffff max_cycles: 0x1ef4687b1, max_idle_ns: 112843571739654 ns
[    0.000000] Advanced Linux Sound Architecture Driver Initialized.
[    0.000000] vgaarb: loaded
[    0.890000] clocksource: Switched to clocksource e0180000.timer
[    0.900000] Clockevents: could not switch to one-shot mode:
[    0.900000] Clockevents: could not switch to one-shot mode: dummy_timer is not functional.
[    0.900000]  dummy_timer is not functional.
[    0.910000] NET: Registered PF_INET protocol family
[    0.910000] IP idents hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.910000] tcp_listen_portaddr_hash hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.910000] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.910000] TCP established hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.910000] TCP bind hash table entries: 1024 (order: 2, 16384 bytes, linear)
[    0.910000] TCP: Hash tables configured (established 1024 bind 1024)
[    0.910000] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.910000] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.910000] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.910000] RPC: Registered named UNIX socket transport module.
[    0.910000] RPC: Registered udp transport module.
[    0.910000] RPC: Registered tcp transport module.
[    0.910000] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.910000] PCI: CLS 0 bytes, default 64
[    0.950000] hw perfevents: enabled with armv7_cortex_a9 PMU driver, 7 counters available
[    0.950000] workingset: timestamp_bits=30 max_order=15 bucket_order=0
[    0.950000] NFS: Registering the id_resolver key type
[    0.950000] Key type id_resolver registered
[    0.950000] Key type id_legacy registered
[    0.950000] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.950000] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.960000] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 246)
[    0.960000] io scheduler mq-deadline registered
[    0.960000] io scheduler kyber registered
[    0.960000] io scheduler bfq registered
[    0.970000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.970000] e1020000.serial: ttyS0 at MMIO 0xe1020000 (irq = 37, base_baud = 796444) is a TI16750
[    0.970000] e1030000.serial: ttyS1 at MMIO 0xe1030000 (irq = 38, base_baud = 7168000) is a TI16750
[    0.970000] printk: console [ttyS1] enabled
[    1.660000] e1040000.serial: ttyS2 at MMIO 0xe1040000 (irq = 39, base_baud = 14336000) is a TI16750
[    1.670000] e1050000.serial: ttyS3 at MMIO 0xe1050000 (irq = 40, base_baud = 2389333) is a TI16750
[    1.680000] SuperH (H)SCI(F) driver initialized
[    1.700000] CAN device driver interface
[    1.760000] smsc911x 20000000.ethernet eth0: MAC Address: 00:0a:a3:02:12:92
[    1.770000] UDC core: g_ether: couldn't find an available UDC
[    1.770000] i2c_dev: i2c /dev entries driver
[    1.780000] em-i2c e0070000.i2c: Added i2c controller 0, irq 42
[    1.790000] em-i2c e10a0000.i2c: Added i2c controller 1, irq 43
[    1.800000] cpu cpu0: OPP table can't be empty
[    1.800000] usbcore: registered new interface driver usbhid
[    1.810000] usbhid: USB HID core driver
[    1.820000] NET: Registered PF_INET6 protocol family
[    1.820000] Segment Routing with IPv6
[    1.830000] In-situ OAM (IOAM) with IPv6
[    1.830000] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.840000] NET: Registered PF_PACKET protocol family
[    1.840000] can: controller area network core
[    1.850000] NET: Registered PF_CAN protocol family
[    1.850000] can: raw protocol
[    1.860000] can: broadcast manager protocol
[    1.860000] can: netlink gateway - max_hops=1
[    1.870000] Key type dns_resolver registered
[    1.870000] Registering SWP/SWPB emulation handler
[    1.900000] input: gpio_keys as /devices/platform/gpio_keys/input/input0
[    1.960000] SMSC LAN8700 20000000.ethernet-ffffffff:01: attached PHY driver (mii_bus:phy_addr=20000000.ethernet-ffffffff:01, irq=POLL)
[    2.000000] smsc911x 20000000.ethernet eth0: SMSC911x/921x identified at 0xc8920000, IRQ: 41
[    4.080000] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    4.130000] Sending DHCP requests ., OK
[    4.170000] IP-Config: Got DHCP answer from 10.0.1.1, my address is 10.0.1.2
[    4.180000] IP-Config: Complete:
[    4.180000]      device=eth0, hwaddr=00:0a:a3:02:12:92, ipaddr=10.0.1.2, mask=255.255.255.0, gw=10.0.1.1
[    4.190000]      host=10.0.1.2, domain=dyn.berto.se, nis-domain=(none)
[    4.200000]      bootserver=10.0.1.1, rootserver=10.0.1.1, rootpath=/srv/nfs4/arch,tcp,v3
[    4.200000]      nameserver0=192.168.20.1
[    4.210000] ALSA device list:
[    4.210000]   No soundcards found.
[    4.240000] VFS: Mounted root (nfs filesystem) on device 0:15.
[    4.240000] devtmpfs: mounted
[    4.250000] Freeing unused kernel image (initmem) memory: 1024K
[    4.290000] Run /sbin/init as init process
[    4.290000]   with arguments:
[    4.290000]     /sbin/init
[    4.300000]   with environment:
[    4.300000]     HOME=/
[    4.300000]     TERM=linux
[    5.980000] systemd[1]: System time before build time, advancing clock.
[    6.030000] systemd[1]: Failed to find module 'autofs4'
[    6.160000] systemd[1]: systemd 252.5-1-arch running in system mode (+PAM +AUDIT -SELINUX -APPARMOR -IMA +SMACK +SECCOMP +GCRYPT +GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT -QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +XKBCOMMON +UTMP -SYSVINIT default-hierarchy=unified)
[    6.190000] systemd[1]: Detected architecture arm.
[    6.260000] systemd[1]: Hostname set to <arm>.
[    6.510000] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the kernel, BPF LSM not supported
[    6.520000] memfd_create() without MFD_EXEC nor MFD_NOEXEC_SEAL, pid=1 'systemd'
[    8.810000] systemd[1]: Queued start job for default target Graphical Interface.
[    8.830000] systemd[1]: Created slice Slice /system/getty.
[    8.870000] systemd[1]: Created slice Slice /system/modprobe.
[    8.910000] systemd[1]: Created slice Slice /system/serial-getty.
[    8.950000] systemd[1]: Created slice User and Session Slice.
[    8.990000] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
[    9.030000] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
[    9.070000] systemd[1]: Arbitrary Executable File Formats File System Automount Point was skipped because of an unmet condition check (ConditionPathExists=/proc/sys/fs/binfmt_misc).
[    9.080000] systemd[1]: Reached target Local Encrypted Volumes.
[    9.120000] systemd[1]: Reached target Local Integrity Protected Volumes.
[    9.160000] systemd[1]: Reached target Network is Online.
[    9.200000] systemd[1]: Reached target Path Units.
[    9.240000] systemd[1]: Reached target Slice Units.
[    9.280000] systemd[1]: Reached target Swaps.
[    9.320000] systemd[1]: Reached target Local Verity Protected Volumes.
[    9.360000] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    9.420000] systemd[1]: Listening on Process Core Dump Socket.
[    9.460000] systemd[1]: Journal Audit Socket was skipped because of an unmet condition check (ConditionSecurity=audit).
[    9.470000] systemd[1]: Listening on Journal Socket (/dev/log).
[    9.510000] systemd[1]: Listening on Journal Socket.
[    9.550000] systemd[1]: Listening on udev Control Socket.
[    9.590000] systemd[1]: Listening on udev Kernel Socket.
[    9.630000] systemd[1]: Huge Pages File System was skipped because of an unmet condition check (ConditionPathExists=/sys/kernel/mm/hugepages).
[    9.640000] systemd[1]: POSIX Message Queue File System was skipped because of an unmet condition check (ConditionPathExists=/proc/sys/fs/mqueue).
[    9.710000] systemd[1]: Mounting /root/shared...
[    9.750000] systemd[1]: Mounting Kernel Debug File System...
[    9.790000] systemd[1]: Mounting Kernel Trace File System...
[    9.850000] systemd[1]: Mounting Temporary Directory /tmp...
[    9.900000] systemd[1]: Create List of Static Device Nodes was skipped because of an unmet condition check (ConditionFileNotEmpty=/lib/modules/6.2.0-rc7-next-20230210-12179-g91bd68019b4b/modules.devname).
[    9.960000] systemd[1]: Starting Load Kernel Module configfs...
[    9.990000] systemd[1]: Starting Load Kernel Module drm...
[   10.040000] systemd[1]: Starting Load Kernel Module fuse...
[   10.120000] systemd[1]: Load Kernel Modules was skipped because no trigger condition checks were met.
[   10.210000] systemd[1]: Starting Remount Root and Kernel File Systems...
[   10.250000] systemd[1]: Repartition Root Disk was skipped because no trigger condition checks were met.
[   10.270000] systemd[1]: Starting Apply Kernel Variables...
[   10.360000] systemd[1]: Starting Coldplug All udev Devices...
[   10.440000] systemd[1]: Mounted Kernel Debug File System.
[   10.480000] systemd[1]: Mounted Kernel Trace File System.
[   10.510000] systemd[1]: Mounted Temporary Directory /tmp.
[   10.560000] systemd[1]: modprobe@configfs.service: Deactivated successfully.
[   10.570000] systemd[1]: Finished Load Kernel Module configfs.
[   10.640000] systemd[1]: modprobe@drm.service: Deactivated successfully.
[   10.660000] systemd[1]: Finished Load Kernel Module drm.
[   10.680000] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[   10.690000] systemd[1]: Finished Load Kernel Module fuse.
[   10.730000] systemd[1]: Finished Remount Root and Kernel File Systems.
[   10.770000] systemd[1]: Finished Apply Kernel Variables.
[   10.810000] systemd[1]: FUSE Control File System was skipped because of an unmet condition check (ConditionPathExists=/sys/fs/fuse/connections).
[   10.880000] systemd[1]: Mounting Kernel Configuration File System...
[   10.920000] systemd[1]: First Boot Wizard was skipped because of an unmet condition check (ConditionFirstBoot=yes).
[   10.930000] systemd[1]: Rebuild Hardware Database was skipped because of an unmet condition check (ConditionNeedsUpdate=/etc).
[   10.980000] systemd[1]: Starting Load/Save Random Seed...
[   11.010000] systemd[1]: Create System Users was skipped because no trigger condition checks were met.
[   11.030000] systemd[1]: Starting Create Static Device Nodes in /dev...
[   11.100000] systemd[1]: Mounted Kernel Configuration File System.
[   11.500000] systemd[1]: Reached target Host and Network Name Lookups.
[   11.540000] systemd[1]: Listening on RPCbind Server Activation Socket.
[   11.580000] systemd[1]: Reached target RPC Port Mapper.
[   11.650000] systemd[1]: Starting NFS status monitor for NFSv2/3 locking....
[   11.830000] systemd[1]: Finished Coldplug All udev Devices.
[   11.930000] systemd[1]: Starting RPC Bind...
[   12.270000] systemd[1]: Finished Create Static Device Nodes in /dev.
[   12.310000] systemd[1]: Reached target Preparation for Local File Systems.
[   12.350000] systemd[1]: Virtual Machine and Container Storage (Compatibility) was skipped because of an unmet condition check (ConditionPathExists=/var/lib/machines.raw).
[   12.370000] systemd[1]: Reached target Local File Systems.
[   12.410000] systemd[1]: Entropy Daemon based on the HAVEGE algorithm was skipped because of an unmet condition check (ConditionKernelVersion=<5.6).
[   12.430000] systemd[1]: Rebuild Dynamic Linker Cache was skipped because no trigger condition checks were met.
[   12.490000] systemd[1]: Starting Notify NFS peers of a restart...
[   12.540000] systemd[1]: Set Up Additional Binary Formats was skipped because no trigger condition checks were met.
[   12.550000] systemd[1]: systemd-journald.service: unit configures an IP firewall, but the local system does not support BPF/cgroup firewalling.
[   12.570000] systemd[1]: (This warning is only shown for the first unit using IP firewalling.)
[   12.620000] systemd[1]: Starting Journal Service...
[   12.690000] systemd[1]: Starting Rule-based Manager for Device Events and Files...
[   12.750000] systemd[1]: Started RPC Bind.
[   12.800000] systemd[1]: Started Notify NFS peers of a restart.
[   12.870000] systemd[1]: Started NFS status monitor for NFSv2/3 locking..
[   13.180000] systemd[1]: Started Journal Service.
[   17.010000] systemd-journald[86]: Received client request to flush runtime journal.
[   21.390000] random: dbus-daemon: uninitialized urandom read (12 bytes read)
[   22.200000] random: dbus-daemon: uninitialized urandom read (12 bytes read)
[   51.370000] random: crng init done

-- 
Kind Regards,
Niklas Söderlund
