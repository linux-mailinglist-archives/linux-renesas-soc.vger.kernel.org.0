Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECF91328B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 08:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfFCGmd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 02:42:33 -0400
Received: from mail-eopbgr1400125.outbound.protection.outlook.com ([40.107.140.125]:57504
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726565AbfFCGmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 02:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pcz7XNZujZn0P0Vs+MC/8DXBn2Q+YXRkmkFvyIBvUk=;
 b=Cm7xkPmOu00JwWH0rCVSyGWVc9PcHmgsbbvEldCxYU45CXa0+v1Fh8qCmwvVQ2LnzU5zKa0uGKJSABux1/2C3/m21cjavVikTpYY3lUA35RoUCovvTpfZ2iuHKMwskS5VI/Q+jk/BlO1rG0HdI/osAaZtcdA9HckYzu/110ofL4=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
 OSAPR01MB1620.jpnprd01.prod.outlook.com (52.134.231.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Mon, 3 Jun 2019 06:42:24 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85]) by OSAPR01MB3089.jpnprd01.prod.outlook.com
 ([fe80::19ad:b6ce:a287:dc85%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 06:42:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: How to resolve an issue in swiotlb environment?
Thread-Topic: How to resolve an issue in swiotlb environment?
Thread-Index: AdUZ1Qlk800+Qz0uSuO63mIBeXkktQ==
Date:   Mon, 3 Jun 2019 06:42:23 +0000
Message-ID: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d5175ff-de64-4a4c-3fa0-08d6e7eea2e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:OSAPR01MB1620;
x-ms-traffictypediagnostic: OSAPR01MB1620:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSAPR01MB162025ECBA1EDD6E27B9A432D8140@OSAPR01MB1620.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:186;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(366004)(376002)(39860400002)(136003)(189003)(199004)(486006)(316002)(7736002)(476003)(68736007)(66946007)(71200400001)(71190400001)(86362001)(76116006)(110136005)(4326008)(14454004)(66446008)(64756008)(66556008)(66476007)(53936002)(6436002)(186003)(52536014)(2501003)(25786009)(305945005)(8936002)(5024004)(7696005)(966005)(14444005)(256004)(33656002)(26005)(6506007)(102836004)(53946003)(66066001)(30864003)(5660300002)(74316002)(55016002)(2906002)(9686003)(45080400002)(6306002)(81166006)(478600001)(8676002)(6116002)(3846002)(81156014)(73956011)(99286004)(569006);DIR:OUT;SFP:1102;SCL:1;SRVR:OSAPR01MB1620;H:OSAPR01MB3089.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DkRmCXZiDtblNWkQgHMBYc4B0hupN4sHRbuMxu+AY+DX9JOlTsgnYgwP/FuyKjdV18+5uqCQI56yYjpdRlfYgb09+lADyDqp0FF2NHHY1xdV1adq8akKDd73ER9INKlfnA927C+Cgotbgz6mKBNS0STgnPMjwoZ0YeAZ+I+K5WqaC/5/fSsG0iO2mCmIu0vPXX827gwpVki/QeXajog3+G7iv4NspChDxaLKoKZUOHe9p2Ryc2H8ThBuvFmNt/L46XfJ0YiRP0qjclG1/G3LpVwkvcROSdvRSOrQBppwqqWB/HXYNHFRVXR3Ob8MuLdeDBdm9XGoRgFThTImISEx9C65EjbcK9f8++7bncEef5P64n2hY5arrl2Dj3W7dWMey3J4iDIrMeACylNB+egZy4jdjx+WPcDmgLF5kwRp7TA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5175ff-de64-4a4c-3fa0-08d6e7eea2e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 06:42:23.9210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1620
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi linux-block and iommu mailing lists,

I have an issue that a USB SSD with xHCI on R-Car H3 causes "swiotlb is ful=
l" like below.

    [   36.745286] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 52428=
8 bytes), total 32768 (slots), used 1338 (slots)

I have investigated this issue by using git bisect, and then I found the fo=
llowing commit:

---
commit 09324d32d2a0843e66652a087da6f77924358e62
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue May 21 09:01:41 2019 +0200

    block: force an unlimited segment size on queues with a virt boundary
---

After the patch above was applied, the max_segment_size of USB SSD is set t=
o UINT_MAX so that
it might be possible to use larger memory size than swiotlb's memory limit =
that is up to 256 KiB
as I investigated before [1]. Note that if the patch was not applied, the m=
ax_segment_size is set
to 65536.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/mmc/host/tmio_mmc_core.c?h=3Dv5.2-rc3&id=3De90e8da72ad694a16a4ffa6e5=
adae3610208f73b

How to resolve this issue? JFYI, I pasted a git bisect log and a kernel log=
 as following:

--- git bisect log ---
git bisect start
# bad: [cd6c84d8f0cdc911df435bb075ba22ce3c605b07] Linux 5.2-rc2
git bisect bad cd6c84d8f0cdc911df435bb075ba22ce3c605b07
# good: [e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd] Linux 5.1
git bisect good e93c9c99a629c61837d5a7fc2120cd2b6c70dbdd
# good: [f4d9a23d3dad0252f375901bf4ff6523a2c97241] sparc64: simplify reduce=
_memory() function
git bisect good f4d9a23d3dad0252f375901bf4ff6523a2c97241
# good: [4dbf09fea60d158e60a30c419e0cfa1ea138dd57] Merge tag 'mtd/for-5.2' =
of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux
git bisect good 4dbf09fea60d158e60a30c419e0cfa1ea138dd57
# good: [22c58fd70ca48a29505922b1563826593b08cc00] Merge tag 'armsoc-soc' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 22c58fd70ca48a29505922b1563826593b08cc00
# good: [4c7b63a32d54850a31a00f22131db417face70e4] Merge tag 'linux-kselfte=
st-5.2-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-=
kselftest
git bisect good 4c7b63a32d54850a31a00f22131db417face70e4
# good: [d8848eefc1d541dd0e3ae175e09fb5c66f1d4de6] Merge tag '5.2-rc-smb3-f=
ixes' of git://git.samba.org/sfrench/cifs-2.6
git bisect good d8848eefc1d541dd0e3ae175e09fb5c66f1d4de6
# good: [9e567af4f0fc3bfa77462c87246ceb82896cdebc] treewide: Replace GPLv2 =
boilerplate/reference with SPDX - rule 90
git bisect good 9e567af4f0fc3bfa77462c87246ceb82896cdebc
# good: [51816e9e113934281b44f1a352852ef7631e75ea] locking/lock_events: Use=
 this_cpu_add() when necessary
git bisect good 51816e9e113934281b44f1a352852ef7631e75ea
# bad: [7fbc78e3155a0c464bd832efc07fb3c2355fe9bd] Merge tag 'for-linus-2019=
0524' of git://git.kernel.dk/linux-block
git bisect bad 7fbc78e3155a0c464bd832efc07fb3c2355fe9bd
# good: [e7bd3e248bc36451fdbf2a2e3a3c5a23cd0b1f6f] Merge tag 'devicetree-fi=
xes-for-5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect good e7bd3e248bc36451fdbf2a2e3a3c5a23cd0b1f6f
# good: [cb9e0e5006064a807b5d722c7e3c42f307193792] nvme-pci: use blk-mq map=
ping for unmanaged irqs
git bisect good cb9e0e5006064a807b5d722c7e3c42f307193792
# bad: [7996a8b5511a72465b0b286763c2d8f412b8874a] blk-mq: fix hang caused b=
y freeze/unfreeze sequence
git bisect bad 7996a8b5511a72465b0b286763c2d8f412b8874a
# good: [eded341c085bebdd653f8086c02179098cb81748] block: don't decrement n=
r_phys_segments for physically contigous segments
git bisect good eded341c085bebdd653f8086c02179098cb81748
# bad: [200a9aff7b02feea30b01141b0df9bc19457a232] block: remove the segment=
 size check in bio_will_gap
git bisect bad 200a9aff7b02feea30b01141b0df9bc19457a232
# bad: [09324d32d2a0843e66652a087da6f77924358e62] block: force an unlimited=
 segment size on queues with a virt boundary
git bisect bad 09324d32d2a0843e66652a087da6f77924358e62
# first bad commit: [09324d32d2a0843e66652a087da6f77924358e62] block: force=
 an unlimited segment size on queues with a virt boundary


--- kernel log ---
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd073]
[    0.000000] Linux version 5.1.0-12510-g09324d3 (shimoda@shimoda-RB02198)=
 (gcc version 7.4.1 20181213 [linaro-7.4-2019.02 revision 56ec6f6b99cc167ff=
0c2f8e1a2eed33b1edc85d4] (Linaro GCC 7.4-2019.02)) #17 SMP PREEMPT Mon Jun =
3 14:56:35 JST 2019
[    0.000000] Machine model: Renesas Salvator-X board based on r8a7795 ES2=
.0+
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 32 MiB at 0x000000007e000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000048000000-0x000000073ff=
fffff]
[    0.000000] NUMA: NODE_DATA [mem 0x73f7de840-0x73f7dffff]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000048000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000073fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000048000000-0x000000007fffffff]
[    0.000000]   node   0: [mem 0x0000000500000000-0x000000053fffffff]
[    0.000000]   node   0: [mem 0x0000000600000000-0x000000063fffffff]
[    0.000000]   node   0: [mem 0x0000000700000000-0x000000073fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000048000000-0x000000073ffff=
fff]
[    0.000000] On node 0 totalpages: 1015808
[    0.000000]   DMA32 zone: 3584 pages used for memmap
[    0.000000]   DMA32 zone: 0 pages reserved
[    0.000000]   DMA32 zone: 229376 pages, LIFO batch:63
[    0.000000]   Normal zone: 12288 pages used for memmap
[    0.000000]   Normal zone: 786432 pages, LIFO batch:63
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS resident on physical CPU 0x0
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] percpu: Embedded 23 pages/cpu s56728 r8192 d29288 u94208
[    0.000000] pcpu-alloc: s56728 r8192 d29288 u94208 alloc=3D23*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7=
=20
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: detected: EL2 vector hardening
[    0.000000] ARM_SMCCC_ARCH_WORKAROUND_1 missing from firmware
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 99993=
6
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: console=3DttySC0,115200 ignore_loglevel=
 consoleblank=3D0 rw root=3D/dev/nfs ip=3Ddhcp
[    0.000000] software IO TLB: mapped [mem 0x7a000000-0x7e000000] (64MB)
[    0.000000] Memory: 3868876K/4063232K available (11260K kernel code, 174=
8K rwdata, 5804K rodata, 1472K init, 448K bss, 161588K reserved, 32768K cma=
-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D8, N=
odes=3D1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_ids=
=3D8.
[    0.000000] 	Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 2=
5 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D8
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] random: get_random_bytes called from start_kernel+0x2c4/0x47=
8 with crng_init=3D0
[    0.000000] arch_timer: cp15 timer(s) running at 8.33MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x1ec02923e, max_idle_ns: 440795202125 ns
[    0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every =
2199023255496ns
[    0.000126] Console: colour dummy device 80x25
[    0.000182] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 16.66 BogoMIPS (lpj=3D33333)
[    0.000189] pid_max: default: 32768 minimum: 301
[    0.000238] LSM: Security Framework initializing
[    0.002190] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes)
[    0.003202] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes)
[    0.003260] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.003304] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes)
[    0.003634] *** VALIDATE proc ***
[    0.003756] *** VALIDATE cgroup1 ***
[    0.003762] *** VALIDATE cgroup2 ***
[    0.027979] ASID allocator initialised with 32768 entries
[    0.035969] rcu: Hierarchical SRCU implementation.
[    0.045084] Detected Renesas R-Car Gen3 r8a7795 ES3.0
[    0.046342] EFI services will not be available.
[    0.051994] smp: Bringing up secondary CPUs ...
[    0.084172] Detected PIPT I-cache on CPU1
[    0.084209] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
[    0.116180] Detected PIPT I-cache on CPU2
[    0.116200] CPU2: Booted secondary processor 0x0000000002 [0x411fd073]
[    0.148213] Detected PIPT I-cache on CPU3
[    0.148234] CPU3: Booted secondary processor 0x0000000003 [0x411fd073]
[    0.180258] CPU features: detected: ARM erratum 845719
[    0.180268] Detected VIPT I-cache on CPU4
[    0.180308] CPU4: Booted secondary processor 0x0000000100 [0x410fd034]
[    0.212279] Detected VIPT I-cache on CPU5
[    0.212302] CPU5: Booted secondary processor 0x0000000101 [0x410fd034]
[    0.244311] Detected VIPT I-cache on CPU6
[    0.244335] CPU6: Booted secondary processor 0x0000000102 [0x410fd034]
[    0.276346] Detected VIPT I-cache on CPU7
[    0.276368] CPU7: Booted secondary processor 0x0000000103 [0x410fd034]
[    0.276442] smp: Brought up 1 node, 8 CPUs
[    0.276461] SMP: Total of 8 processors activated.
[    0.276466] CPU features: detected: 32-bit EL0 Support
[    0.276471] CPU features: detected: CRC32 instructions
[    0.277098] CPU: All CPU(s) started at EL1
[    0.277123] alternatives: patching kernel code
[    0.277992] devtmpfs: initialized
[    0.283492] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.283549] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.284307] pinctrl core: initialized pinctrl subsystem
[    0.285688] DMI not present or invalid.
[    0.285975] NET: Registered protocol family 16
[    0.286271] audit: initializing netlink subsys (disabled)
[    0.286357] audit: type=3D2000 audit(0.284:1): state=3Dinitialized audit=
_enabled=3D0 res=3D1
[    0.287513] cpuidle: using governor menu
[    0.287707] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.288332] DMA: preallocated 256 KiB pool for atomic allocations
[    0.289503] Serial: AMBA PL011 UART driver
[    0.292045] sh-pfc e6060000.pin-controller: r8a77951_pfc support registe=
red
[    0.313332] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.313341] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
[    0.313346] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.313350] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
[    0.314458] cryptd: max_cpu_qlen set to 1000
[    0.318053] ACPI: Interpreter disabled.
[    0.321969] vgaarb: loaded
[    0.322132] SCSI subsystem initialized
[    0.322263] libata version 3.00 loaded.
[    0.322422] usbcore: registered new interface driver usbfs
[    0.322453] usbcore: registered new interface driver hub
[    0.322495] usbcore: registered new device driver usb
[    0.323516] i2c-sh_mobile e60b0000.i2c: I2C adapter 7, bus speed 400000 =
Hz
[    0.323816] pps_core: LinuxPPS API ver. 1 registered
[    0.323821] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    0.323836] PTP clock support registered
[    0.323984] EDAC MC: Ver: 3.0.0
[    0.325013] Advanced Linux Sound Architecture Driver Initialized.
[    0.325461] clocksource: Switched to clocksource arch_sys_counter
[    0.325581] VFS: Disk quotas dquot_6.6.0
[    0.325618] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.325644] *** VALIDATE hugetlbfs ***
[    0.325729] pnp: PnP ACPI: disabled
[    0.329791] NET: Registered protocol family 2
[    0.330208] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3,=
 32768 bytes)
[    0.330251] TCP established hash table entries: 32768 (order: 6, 262144 =
bytes)
[    0.330375] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
[    0.330623] TCP: Hash tables configured (established 32768 bind 32768)
[    0.330729] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.330756] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.330864] NET: Registered protocol family 1
[    0.331151] RPC: Registered named UNIX socket transport module.
[    0.331156] RPC: Registered udp transport module.
[    0.331159] RPC: Registered tcp transport module.
[    0.331163] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.331173] PCI: CLS 0 bytes, default 64
[    0.331939] hw perfevents: enabled with armv8_cortex_a53 PMU driver, 7 c=
ounters available
[    0.332180] hw perfevents: enabled with armv8_cortex_a57 PMU driver, 7 c=
ounters available
[    0.332535] kvm [1]: HYP mode not available
[    0.337553] Initialise system trusted keyrings
[    0.337640] workingset: timestamp_bits=3D44 max_order=3D20 bucket_order=
=3D0
[    0.341330] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.341797] NFS: Registering the id_resolver key type
[    0.341816] Key type id_resolver registered
[    0.341820] Key type id_legacy registered
[    0.341829] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.341940] 9p: Installing v9fs 9p2000 file system support
[    0.342134] Key type asymmetric registered
[    0.342140] Asymmetric key parser 'x509' registered
[    0.342170] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.342176] io scheduler mq-deadline registered
[    0.342180] io scheduler kyber registered
[    0.354049] gpio_rcar e6050000.gpio: driving 16 GPIOs
[    0.354267] gpio_rcar e6051000.gpio: driving 29 GPIOs
[    0.354445] gpio_rcar e6052000.gpio: driving 15 GPIOs
[    0.354621] gpio_rcar e6053000.gpio: driving 16 GPIOs
[    0.354790] gpio_rcar e6054000.gpio: driving 18 GPIOs
[    0.354952] gpio_rcar e6055000.gpio: driving 26 GPIOs
[    0.355125] gpio_rcar e6055400.gpio: driving 32 GPIOs
[    0.355284] gpio_rcar e6055800.gpio: driving 4 GPIOs
[    0.356879] rcar-pcie fe000000.pcie: host bridge /soc/pcie@fe000000 rang=
es:
[    0.356904] rcar-pcie fe000000.pcie:    IO 0xfe100000..0xfe1fffff -> 0x0=
0000000
[    0.356921] rcar-pcie fe000000.pcie:   MEM 0xfe200000..0xfe3fffff -> 0xf=
e200000
[    0.356935] rcar-pcie fe000000.pcie:   MEM 0x30000000..0x37ffffff -> 0x3=
0000000
[    0.356944] rcar-pcie fe000000.pcie:   MEM 0x38000000..0x3fffffff -> 0x3=
8000000
[    0.421381] rcar-pcie fe000000.pcie: PCIe link down
[    0.421560] rcar-pcie ee800000.pcie: host bridge /soc/pcie@ee800000 rang=
es:
[    0.421578] rcar-pcie ee800000.pcie:    IO 0xee900000..0xee9fffff -> 0x0=
0000000
[    0.421594] rcar-pcie ee800000.pcie:   MEM 0xeea00000..0xeebfffff -> 0xe=
ea00000
[    0.421608] rcar-pcie ee800000.pcie:   MEM 0xc0000000..0xc7ffffff -> 0xc=
0000000
[    0.421617] rcar-pcie ee800000.pcie:   MEM 0xc8000000..0xcfffffff -> 0xc=
8000000
[    0.489086] rcar-pcie ee800000.pcie: PCIe link down
[    0.491101] EINJ: ACPI disabled.
[    0.502516] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.504563] SuperH (H)SCI(F) driver initialized
[    0.505001] e6550000.serial: ttySC1 at MMIO 0xe6550000 (irq =3D 34, base=
_baud =3D 0) is a hscif
[    0.505581] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq =3D 119, bas=
e_baud =3D 0) is a scif
[    1.534039] printk: console [ttySC0] enabled
[    1.539150] msm_serial: driver initialized
[    1.549971] loop: module loaded
[    1.557809] libphy: Fixed MDIO Bus: probed
[    1.562131] tun: Universal TUN/TAP device driver, 1.6
[    1.568028] thunder_xcv, ver 1.0
[    1.571284] thunder_bgx, ver 1.0
[    1.574535] nicpf, ver 1.0
[    1.577858] hclge is initializing
[    1.581167] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - v=
ersion
[    1.588386] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.593727] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    1.599557] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.605493] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.6.=
0-k
[    1.612451] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.618043] igbvf: Intel(R) Gigabit Virtual Function Network Driver - ve=
rsion 2.4.0-k
[    1.625868] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.632110] sky2: driver version 1.30
[    1.636742] VFIO - User Level meta-driver version: 0.3
[    1.643310] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.649844] ehci-pci: EHCI PCI platform driver
[    1.654311] ehci-platform: EHCI generic platform driver
[    1.659885] ehci-platform ee0a0100.usb: EHCI Host Controller
[    1.665557] ehci-platform ee0a0100.usb: new USB bus registered, assigned=
 bus number 1
[    1.673567] ehci-platform ee0a0100.usb: irq 165, io mem 0xee0a0100
[    1.693467] ehci-platform ee0a0100.usb: USB 2.0 started, EHCI 1.10
[    1.699975] hub 1-0:1.0: USB hub found
[    1.703740] hub 1-0:1.0: 1 port detected
[    1.707966] ehci-platform ee0c0100.usb: EHCI Host Controller
[    1.713635] ehci-platform ee0c0100.usb: new USB bus registered, assigned=
 bus number 2
[    1.721572] ehci-platform ee0c0100.usb: irq 166, io mem 0xee0c0100
[    1.741464] ehci-platform ee0c0100.usb: USB 2.0 started, EHCI 1.10
[    1.747909] hub 2-0:1.0: USB hub found
[    1.751672] hub 2-0:1.0: 1 port detected
[    1.755851] ehci-orion: EHCI orion driver
[    1.760068] ehci-exynos: EHCI EXYNOS driver
[    1.764343] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.770532] ohci-pci: OHCI PCI platform driver
[    1.775011] ohci-platform: OHCI generic platform driver
[    1.780480] ohci-platform ee0a0000.usb: Generic Platform OHCI controller
[    1.787190] ohci-platform ee0a0000.usb: new USB bus registered, assigned=
 bus number 3
[    1.795092] ohci-platform ee0a0000.usb: irq 165, io mem 0xee0a0000
[    1.888404] hub 3-0:1.0: USB hub found
[    1.892168] hub 3-0:1.0: 1 port detected
[    1.896322] ohci-platform ee0c0000.usb: Generic Platform OHCI controller
[    1.903030] ohci-platform ee0c0000.usb: new USB bus registered, assigned=
 bus number 4
[    1.910917] ohci-platform ee0c0000.usb: irq 166, io mem 0xee0c0000
[    2.003712] hub 4-0:1.0: USB hub found
[    2.007474] hub 4-0:1.0: 1 port detected
[    2.011614] ohci-exynos: OHCI EXYNOS driver
[    2.016315] xhci-hcd ee000000.usb: xHCI Host Controller
[    2.021547] xhci-hcd ee000000.usb: new USB bus registered, assigned bus =
number 5
[    2.028979] xhci-hcd ee000000.usb: Direct firmware load for r8a779x_usb3=
_v3.dlmem failed with error -2
[    2.038295] xhci-hcd ee000000.usb: can't setup: -2
[    2.043092] xhci-hcd ee000000.usb: USB bus 5 deregistered
[    2.048519] xhci-hcd: probe of ee000000.usb failed with error -2
[    2.054854] usbcore: registered new interface driver usb-storage
[    2.063624] i2c /dev entries driver
[    2.075017] cs2000-cp 2-004f: revision - C1
[    2.079246] i2c-rcar e6510000.i2c: probed
[    2.083621] pca953x 4-0020: 4-0020 supply vcc not found, using dummy reg=
ulator
[    2.091674] i2c-rcar e66d8000.i2c: probed
[    2.102362] rcar_gen3_thermal e6198000.thermal: TSC0: Loaded 2 trip poin=
ts
[    2.113385] rcar_gen3_thermal e6198000.thermal: TSC1: Loaded 2 trip poin=
ts
[    2.124402] rcar_gen3_thermal e6198000.thermal: TSC2: Loaded 2 trip poin=
ts
[    2.133918] cpufreq: cpufreq_online: CPU0: Running at unlisted freq: 149=
9999 KHz
[    2.141325] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency ch=
anged to: 1500000 KHz
[    2.150197] cpufreq: cpufreq_online: CPU4: Running at unlisted freq: 119=
9999 KHz
[    2.157596] cpufreq: cpufreq_online: CPU4: Unlisted initial frequency ch=
anged to: 1200000 KHz
[    2.166957] sdhci: Secure Digital Host Controller Interface driver
[    2.173142] sdhci: Copyright(c) Pierre Ossman
[    2.178318] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    2.184258] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    2.239165] renesas_sdhi_internal_dmac ee140000.sd: mmc0 base at 0xee140=
000 max clock rate 200 MHz
[    2.248546] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    2.254498] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    2.260795] Synopsys Designware Multimedia Card Interface Driver
[    2.267786] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.275042] ledtrig-cpu: registered to indicate activity on CPUs
[    2.282216] usbcore: registered new interface driver usbhid
[    2.287790] usbhid: USB HID core driver
[    2.294743] NET: Registered protocol family 17
[    2.299308] 9pnet: Installing 9P2000 support
[    2.303622] Key type dns_resolver registered
[    2.308275] registered taskstats version 1
[    2.312373] Loading compiled-in X.509 certificates
[    2.323539] renesas_irqc e61c0000.interrupt-controller: driving 6 irqs
[    2.335588] bd9571mwv 7-0030: Device: BD9571MWV rev. 1
[    2.357099] mmc0: new HS400 MMC card at address 0001
[    2.362482] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB=20
[    2.367175] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    2.369486] ehci-platform ee080100.usb: EHCI Host Controller
[    2.373257] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    2.378762] ehci-platform ee080100.usb: new USB bus registered, assigned=
 bus number 5
[    2.384764] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev =
(237:0)
[    2.392635] ehci-platform ee080100.usb: irq 164, io mem 0xee080100
[    2.400479]  mmcblk0: p1
[    2.421472] ehci-platform ee080100.usb: USB 2.0 started, EHCI 1.10
[    2.427979] hub 5-0:1.0: USB hub found
[    2.431746] hub 5-0:1.0: 1 port detected
[    2.436708] ohci-platform ee080000.usb: Generic Platform OHCI controller
[    2.443425] ohci-platform ee080000.usb: new USB bus registered, assigned=
 bus number 6
[    2.451365] ohci-platform ee080000.usb: irq 164, io mem 0xee080000
[    2.548461] hub 6-0:1.0: USB hub found
[    2.552225] hub 6-0:1.0: 1 port detected
[    2.557467] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    2.563402] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    2.617785] renesas_sdhi_internal_dmac ee100000.sd: mmc1 base at 0xee100=
000 max clock rate 200 MHz
[    2.627848] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    2.633786] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    2.688108] renesas_sdhi_internal_dmac ee160000.sd: mmc2 base at 0xee160=
000 max clock rate 200 MHz
[    2.700525] rcar-dmac e6700000.dma-controller: ignoring dependency for d=
evice, assuming no driver
[    2.711646] rcar-dmac e7300000.dma-controller: ignoring dependency for d=
evice, assuming no driver
[    2.723042] rcar-dmac e7310000.dma-controller: ignoring dependency for d=
evice, assuming no driver
[    2.734296] rcar-dmac ec700000.dma-controller: ignoring dependency for d=
evice, assuming no driver
[    2.745521] rcar-dmac ec720000.dma-controller: ignoring dependency for d=
evice, assuming no driver
[    2.756954] sata_rcar ee300000.sata: ignoring dependency for device, ass=
uming no driver
[    2.765649] scsi host0: sata_rcar
[    2.769148] ata1: SATA max UDMA/133 irq 170
[    2.774232] ravb e6800000.ethernet: ignoring dependency for device, assu=
ming no driver
[    2.782522] libphy: ravb_mii: probed
[    2.787073] ravb e6800000.ethernet eth0: Base address at 0xe6800000, 2e:=
09:0a:00:83:ea, IRQ 116.
[    2.797527] input: keys as /devices/platform/keys/input/input0
[    2.803597] hctosys: unable to open rtc device (rtc0)
[    2.884166] Micrel KSZ9031 Gigabit PHY e6800000.ethernet-ffffffff:00: at=
tached PHY driver [Micrel KSZ9031 Gigabit PHY] (mii_bus:phy_addr=3De6800000=
.ethernet-ffffffff:00, irq=3D175)
[    3.189464] ata1: link resume succeeded after 1 retries
[    3.300885] ata1: SATA link down (SStatus 0 SControl 300)
[    4.475382] ravb e6800000.ethernet eth0: Link is Up - 100Mbps/Full - flo=
w control off
[    4.501462] Sending DHCP requests ..,
[    6.981908] random: fast init done
[    6.989458]  OK
[    6.991223] IP-Config: Got DHCP answer from 192.168.44.74, my address is=
 192.168.44.104
[    6.999227] IP-Config: Complete:
[    7.002454]      device=3Deth0, hwaddr=3D2e:09:0a:00:83:ea, ipaddr=3D192=
.168.44.104, mask=3D255.255.255.0, gw=3D192.168.44.74
[    7.012885]      host=3D192.168.44.104, domain=3Dshimoda-i7.org, nis-dom=
ain=3D(none)
[    7.020103]      bootserver=3D192.168.44.74, rootserver=3D192.168.44.74,=
 rootpath=3D/var/lib/tftpboot/aarch64/rootfs/has-iperf-from-jinso
[    7.020105]      nameserver0=3D192.168.44.74
[    7.036390] SDHI0 Vcc: disabling
[    7.039619] SDHI3 Vcc: disabling
[    7.042845] SDHI0 VccQ: disabling
[    7.046157] SDHI3 VccQ: disabling
[    7.049474] ALSA device list:
[    7.052435]   No soundcards found.
[    7.061330] VFS: Mounted root (nfs filesystem) on device 0:18.
[    7.067608] devtmpfs: mounted
[    7.071300] Freeing unused kernel memory: 1472K
[    7.085499] Run /sbin/init as init process
[    8.271958] random: crng init done
[    8.630917] NET: Registered protocol family 10
[    8.636057] Segment Routing with IPv6
[    8.656171] systemd[1]: systemd 225 running in system mode. (+PAM -AUDIT=
 -SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT +GNU=
TLS +ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS +KMOD -IDN)
[    8.674495] systemd[1]: Detected architecture arm64.

Welcome to Poky (Yocto Project Reference Distro) 2.0.2 (jethro)!

[    8.698436] systemd[1]: Set hostname to <salvator-x>.
[    9.062474] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[  OK  ] Started Dispatch Password Requests to Console Directory Watch.
[    9.085554] systemd[1]: Reached target Remote File Systems.
[  OK  ] Reached target Remote File Systems.
[    9.105499] systemd[1]: Reached target Swap.
[  OK  ] Reached target Swap.
[    9.121593] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[  OK  ] Started Forward Password Requests to Wall Directory Watch.
[    9.145496] systemd[1]: Reached target Paths.
[  OK  ] Reached target Paths.
[    9.162045] systemd[1]: Created slice Root Slice.
[  OK  ] Created slice Root Slice.
[    9.181856] systemd[1]: Created slice System Slice.
[  OK  ] Created slice System Slice.
[  OK  ] Created slice system-serial\x2dgetty.slice.
[  OK  ] Listening on udev Control Socket.
[  OK  ] Listening on Journal Socket (/dev/log).
[  OK  ] Listening on Journal Audit Socket.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Listening on Journal Socket.
         Starting Load Kernel Modules...
         Mounting Debug File System...
         Starting Remount Root and Kernel File Systems...
         Starting Journal Service...
         Mounting Temporary Directory...
         Mounting POSIX Message Queue File System...
         Starting Create list of required st... nodes for the current kerne=
l...
         Starting Setup Virtual Console...
[  OK  ] Created slice User and Session Slice.
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Reached target Slices.
         Mounting Huge Pages File System...
[  OK  ] Created slice system-getty.slice.
[  OK  ] Mounted Temporary Directory.
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Mounted Debug File System.
[  OK  ] Mounted Huge Pages File System.
[  OK  ] Started Journal Service.
[FAILED] Failed to start Load Kernel Modules.
See 'systemctl status systemd-modules-load.service' for details.
[  OK  ] Started Remount Root and Kernel File Systems.
[  OK  ] Started Create list of required sta...ce nodes for the current ker=
nel.
[  OK  ] Started Setup Virtual Console.
         Starting Create Static Device Nodes in /dev...
         Starting udev Coldplug all Devices...
         Mounting Configuration File System...
         Mounting NFSD configuration filesystem...
         Starting Apply Kernel Variables...
         Starting Flush Journal to Persistent Storage...
[  OK  ] Mounted Configuration File System.
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Started Create Static Device Nodes in /dev.
[FAILED] Failed to mount NFSD configuration filesystem.
See 'systemctl status proc-fs-nfsd.mount' for details.
[    9.910877] systemd-journald[2022]: Received request to flush runtime jo=
urnal from PID 1
         Starting udev Kernel Device Manager...
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /var/volatile...
[  OK  ] Mounted /var/volatile.
[  OK  ] Started Flush Journal to Persistent Storage.
         Starting Load/Save Random Seed...
[  OK  ] Reached target Local File Systems.
         Starting Create Volatile Files and Directories...
[  OK  ] Started udev Kernel Device Manager.
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Started Load/Save Random Seed.
[  OK  ] Started Create Volatile Files and Directories.
[   10.411246] rcar-fcp fe950000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.419784] rcar-fcp fe951000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.428003] rcar-fcp fe96f000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.436707] rcar-fcp fe92f000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.445153] rcar-fcp fe9af000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.453199] rcar-fcp fe9bf000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.461235] rcar-fcp fea27000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.469289] rcar-fcp fea2f000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.477287] rcar-fcp fea37000.fcp: ignoring dependency for device, assum=
ing no driver
[   10.601133] renesas_usb3 ee020000.usb: probed with phy
[   10.722281] media: Linux media interface: v0.10
[  OK  ] Found device /dev/ttySC0.
[   10.974026] renesas_usbhs e6590000.usb: no transceiver found
[   10.980299] renesas_usbhs e6590000.usb: gadget probed
[   10.985996] renesas_usbhs e6590000.usb: probed
[   11.276933] rcar_sound ec500000.sound: probed
[   11.349185] videodev: Linux video capture interface: v2.00
[  OK  ] Created slice system-systemd\x2dbacklight.slice.
         Starting Load/Save Screen Backlight...htness of backlight:backligh=
t...
         Starting Update UTMP about System Boot/Shutdown...
[  OK  ] Started Load/Save Screen Backlight Brightness of backlight:backlig=
ht.
[  OK  ] Started Update UTMP about System Boot/Shutdown.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Listening on dropbear.socket.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target Timers.
[  OK  ] Listening on RPCbind Server Activation Socket.
[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
[  OK  ] Reached target Sockets.
         Starting Restore Sound Card State...
[  OK  ] Reached target Basic System.
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Started System Logging Service.
[  OK  ] Started Kernel Logging Service.
         Starting PowerVR consumer services...
         Starting Avahi mDNS/DNS-SD Stack...
         Starting Permit User Sessions...
         Starting optee services...
         Starting Login Service...
[  OK  ] Started Restore Sound Card State.
[  OK  ] Started Permit User Sessions.
[  OK  ] Started Serial Getty on ttySC0.
[  OK  ] Started Getty on tty1.
[  OK  ] Reached target Login Prompts.
[FAILED] Failed to start optee services.
See 'systemctl status optee.service' for details.
[  OK  ] Started Login Service.
[  OK  ] Started Avahi mDNS/DNS-SD Stack.
[   14.384413] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   14.391048] [drm] No driver support for vblank timestamp query.

Poky (Yocto Project Reference Distro) 2.0.2 salvator-x ttySC0

salvator-x login: root
root@salvator-x:~# 09324d32d2a0843e66652a087da6f77924358e62^C
root@salvator-x:~# ./usb/bind-xhci.sh 2
[   27.465397] xhci-hcd ee000000.usb: xHCI Host Controller
[   27.470655] xhci-hcd ee000000.usb: new USB bus registered, assigned bus =
number 7
[   27.497520] xhci-hcd ee000000.usb: hcc params 0x014051ce hci version 0x1=
00 quirks 0x0000000000810410
[   27.506695] xhci-hcd ee000000.usb: irq 162, io mem 0xee000000
[   27.513043] hub 7-0:1.0: USB hub found
[   27.516900] hub 7-0:1.0: 1 port detected
[   27.521890] xhci-hcd ee000000.usb: xHCI Host Controller
[   27.524370] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   27.527144] xhci-hcd ee000000.usb: new USB bus registered, assigned bus =
number 8
[   27.527158] xhci-hcd ee000000.usb: Host supports USB 3.0  SuperSpeed
[   27.533790] [drm] No driver support for vblank timestamp query.
[   27.541249] usb usb8: We don't know the algorithms for LPM for this host=
, disabling LPM.
[   27.562036] hub 8-0:1.0: USB hub found
[   27.565829] hub 8-0:1.0: 1 port detected
root@salvator-x[: ~ # =20
27.572663] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   27.580828] [drm] No driver support for vblank timestamp query.
root@salvator-x:~#  sleep 5
[   28.161889] usb 8-1: new SuperSpeed Gen 1 USB device number 2 using xhci=
-hcd
[   28.196054] usb-storage 8-1:1.0: USB Mass Storage device detected
[   28.202497] scsi host1: usb-storage 8-1:1.0
[   28.209795] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   28.216685] [drm] No driver support for vblank timestamp query.
[   29.214389] scsi 1:0:0:0: Direct-Access     SanDisk  Ext SSD          0 =
   PQ: 0 ANSI: 6
[   29.223997] sd 1:0:0:0: [sda] 468862128 512-byte logical blocks: (240 GB=
/224 GiB)
[   29.224631] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   29.238345] [drm] No driver support for vblank timestamp query.
[   29.244381] sd 1:0:0:0: [sda] Write Protect is off
[   29.249183] sd 1:0:0:0: [sda] Mode Sense: 43 00 00 00
[   29.254948] sd 1:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[   29.266473]  sda: sda1
[   29.271399] sd 1:0:0:0: [sda] Attached SCSI removable disk
root@salvator-x:~#=20
root@salvator-x:~#  cat /sys/block/sda/queue/max_segment_size
4294967295
root@salvator-x:~#=20
root@salvator-x:~#  sleep 3
root@salvator-x:~#=20
root@salvator-x:~#  mkfs.ext4 /dev/sda1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=3D
OS type: Linux
Block size=3D4096 (log=3D2)
Fragment size=3D4096 (log=3D2)
Stride=3D0 blocks, Stripe width=3D0 blocks
14655488 inodes, 58599574 blocks
2929978 blocks (5.00%) reserved for the super user
First data block=3D0
Maximum filesystem blocks=3D4294967296
1789 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:=20
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,=20
	4096000, 7962624, 11239424, 20480000, 23887872

Allocating group tables:    0/1789=08=08=08=08=08=08=08=08=081039/1789=08=
=08=08=08=08=08=08=08=08         =08=08=08=08=08=08=08=08=08done           =
                =20
Writing inode tables:    0/1789=08=08=08=08=08=08=08=08=08         =08=08=
=08=08=08=08=08=08=08done                           =20
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information:    0/1789=08=08=
=08=08=08=08=08=08=08         =08=08=08=08=08=08=08=08=08[   36.745286] xhc=
i-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 bytes), total 32768 =
(slots), used 1338 (slots)
[   36.755854] xhci-hcd ee000000.usb: overflow 0x0000000733580000+524288 of=
 DMA mask ffffffff bus mask 0
[   36.765148] WARNING: CPU: 4 PID: 3652 at kernel/dma/direct.c:43 report_a=
ddr+0x38/0xa0
[   36.772971] Modules linked in: rcar_du_drm rcar_lvds drm_kms_helper drm =
drm_panel_orientation_quirks vsp1 videobuf2_vmalloc videobuf2_dma_contig vi=
deobuf2_memops videobuf2_v4l2 videobuf2_common videodev snd_soc_rcar renesa=
s_usbhs snd_soc_audio_graph_card media snd_soc_simple_card_utils crct10dif_=
ce renesas_usb3 snd_soc_ak4613 rcar_fcp pwm_rcar usb_dmac phy_rcar_gen3_usb=
3 pwm_bl ipv6
[   36.806896] CPU: 4 PID: 3652 Comm: usb-storage Not tainted 5.1.0-12510-g=
09324d3 #17
[   36.814545] Hardware name: Renesas Salvator-X board based on r8a7795 ES2=
.0+ (DT)
[   36.821936] pstate: 40000005 (nZcv daif -PAN -UAO)
[   36.826723] pc : report_addr+0x38/0xa0
[   36.830466] lr : report_addr+0x98/0xa0
[   36.834208] sp : ffff000011f63970
[   36.837516] x29: ffff000011f63970 x28: 0000000000000000=20
[   36.842823] x27: 0000000000000000 x26: 000000001f020280=20
[   36.848129] x25: ffff8006f32682a8 x24: 0000000000000000=20
[   36.853435] x23: 0000000000000001 x22: 0000000000000000=20
[   36.858742] x21: 0000000000080000 x20: ffff0000112b9000=20
[   36.864049] x19: ffff8006fa399010 x18: ffffffffffffffff=20
[   36.869355] x17: 0000000000000000 x16: 0000000000000000=20
[   36.874662] x15: ffff0000112b96c8 x14: 666666666666206b=20
[   36.879968] x13: 73616d20414d4420 x12: 666f203838323432=20
[   36.885275] x11: 352b303030303835 x10: ffff0000112b9f20=20
[   36.890582] x9 : ffff000011293018 x8 : 0000000000000187=20
[   36.895888] x7 : 00000000ffffffcc x6 : ffff8006ff77f180=20
[   36.901195] x5 : ffff8006ff77f180 x4 : 0000000000000000=20
[   36.906501] x3 : ffff8006ff785f10 x2 : e0090e1a0d687e00=20
[   36.911808] x1 : e0090e1a0d687e00 x0 : 0000000000000000=20
[   36.917116] Call trace:
[   36.919558]  report_addr+0x38/0xa0
[   36.922957]  dma_direct_map_page+0x140/0x150
[   36.927222]  dma_direct_map_sg+0x78/0xe0
[   36.931146]  usb_hcd_map_urb_for_dma+0x2e4/0x448
[   36.935763]  xhci_map_urb_for_dma+0x54/0x60
[   36.939941]  usb_hcd_submit_urb+0x88/0x948
[   36.944032]  usb_submit_urb+0x3b4/0x558
[   36.947863]  usb_sg_wait+0x98/0x158
[   36.951352]  usb_stor_bulk_transfer_sglist.part.3+0x94/0x128
[   36.957006]  usb_stor_bulk_srb+0x48/0x88
[   36.960923]  usb_stor_Bulk_transport+0x10c/0x380
[   36.965536]  usb_stor_invoke_transport+0x3c/0x4f0
[   36.970236]  usb_stor_transparent_scsi_command+0xc/0x18
[   36.975456]  usb_stor_control_thread+0x1bc/0x258
[   36.980071]  kthread+0x124/0x128
[   36.983298]  ret_from_fork+0x10/0x18
[   36.986868] ---[ end trace 26ffc6c07675054c ]---
[   36.991976] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.002973] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.013873] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.024721] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.035537] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.046333] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.057115] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.067899] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   37.078676] xhci-hcd ee000000.usb: swiotlb buffer is full (sz: 524288 by=
tes), total 32768 (slots), used 1338 (slots)
[   41.745471] swiotlb_tbl_map_single: 22211 callbacks suppressed

Best regards,
Yoshihiro Shimoda

