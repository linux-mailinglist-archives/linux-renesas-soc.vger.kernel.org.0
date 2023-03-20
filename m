Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D5C6C1CCC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 17:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233019AbjCTQwK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 12:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232873AbjCTQvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 12:51:41 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410D1303F9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:43:17 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id agjA2900G1C8whw06gjAcb; Mon, 20 Mar 2023 17:43:10 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIab-00E2y0-Dv;
        Mon, 20 Mar 2023 17:43:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIbG-007Sdk-7P;
        Mon, 20 Mar 2023 17:43:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: dts: marzen: Add FLASH node
Date:   Mon, 20 Mar 2023 17:43:08 +0100
Message-Id: <07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a device node for the Spansion S29GL512N NOR FLASH on the Marzen
development board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Although the S29GL512N is a CFI FLASH, using "cfi-flash" instead of
"mtd-rom" does not work:
  1. Probing fails with "physmap-flash 0.flash: map_probe failed",
  2. The kernel crashes later in a spectacular way, cfr. the logs below.

U-Boot flinfo says:

    Bank # 1: CFI conformant flash (16 x 16)  Size: 64 MB in 512 Sectors
      AMD Standard command set, Manufacturer ID: 0x01, Device ID: 0x227E
      Erase timeout: 4096 ms, write timeout: 1 ms
      Buffer write timeout: 3 ms, buffer size: 64 bytes
      Sector Start Addresses:
      00000000   RO   00020000        00040000   RO   00060000   RO   00080000
      000A0000        000C0000        000E0000        00100000        00120000
      00140000        00160000        00180000        001A0000        001C0000
      ...
      03FC0000        03FE0000

    Bank # 2: missing or unknown FLASH type

Does anyone have a clue? Using "mtd-rom", I can at least read the FLASH
under Linux.

Thanks in advance!

Crash logs:

    WARNING: bad unlock balance detected!
    6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #29 Not tainted
    -------------------------------------
    rcS/66 is trying to release lock ((null)) at:
    [<c011f038>] copy_process+0x1120/0x193c
    but there are no more locks to release!

    other info that might help us debug this:
    1 lock held by rcS/66:
     #0: c28008d8 (&mm->mmap_lock){++++}-{3:3}, at: copy_process+0xcc4/0x193c

    stack backtrace:
    CPU: 0 PID: 66 Comm: rcS Not tainted 6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #29
    Hardware name: Generic R8A7779 (Flattened Device Tree)
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x68/0x90
     dump_stack_lvl from lock_release+0x168/0x328
     lock_release from up_write+0x20/0x244
     up_write from copy_process+0x1120/0x193c
     copy_process from kernel_clone+0xa0/0x2e4
     kernel_clone from sys_clone+0x6c/0x94
     sys_clone from ret_fast_syscall+0x0/0x1c
    Exception stack(0xf0a2dfa8 to 0xf0a2dff0)
    dfa0:                   00200068 bed21738 01200011 00000000 00000000 00000000
    dfc0: 00200068 bed21738 00000042 00000078 00000000 00200000 0020123c bed2176c
    dfe0: 002004c0 bed21738 00000000 00119664
    ------------[ cut here ]------------
    WARNING: CPU: 0 PID: 66 at kernel/locking/rwsem.c:1364 up_write+0x98/0x244
    DEBUG_RWSEMS_WARN_ON(sem->magic != sem): count = 0x0, magic = 0x0, owner = 0x0, curr 0xc27b04c0, list not empty
    Modules linked in:
    CPU: 0 PID: 66 Comm: rcS Not tainted 6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #29
    Hardware name: Generic R8A7779 (Flattened Device Tree)
     unwind_backtrace from show_stack+0x10/0x14
     show_stack from dump_stack_lvl+0x68/0x90
     dump_stack_lvl from __warn+0x7c/0x1c0
     __warn from warn_slowpath_fmt+0xec/0x138
     warn_slowpath_fmt from up_write+0x98/0x244
     up_write from copy_process+0x1120/0x193c
     copy_process from kernel_clone+0xa0/0x2e4
     kernel_clone from sys_clone+0x6c/0x94
     sys_clone from ret_fast_syscall+0x0/0x1c
    Exception stack(0xf0a2dfa8 to 0xf0a2dff0)
    dfa0:                   00200068 bed21738 01200011 00000000 00000000 00000000
    dfc0: 00200068 bed21738 00000042 00000078 00000000 00200000 0020123c bed2176c
    dfe0: 002004c0 bed21738 00000000 00119664
    irq event stamp: 1863
    hardirqs last  enabled at (1863): [<c026c664>] kmem_cache_free+0x130/0x158
    hardirqs last disabled at (1862): [<c026c614>] kmem_cache_free+0xe0/0x158
    softirqs last  enabled at (1624): [<c0101474>] __do_softirq+0x178/0x3e8
    softirqs last disabled at (1611): [<c01276f0>] __irq_exit_rcu+0x110/0x168
    ---[ end trace 0000000000000000 ]---

  or:

    WARNING: bad unlock balance detected!
    6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #27 Not tainted
    -------------------------------------
    systemd/1 is trying to release lock (
    8<--- cut here ---
    Unable to handle kernel paging request at virtual address 4e22202c when read
    [4e22202c] *pgd=00000000
    Internal error: Oops: 5 [#1] SMP ARM
    Modules linked in:
    CPU: 2 PID: 1 Comm: systemd Not tainted 6.3.0-rc1-marzen-02372-g053d8eb1df8a-dirty #27
    Hardware name: Generic R8A7779 (Flattened Device Tree)
    PC is at string_nocheck+0x44/0x64
    LR is at 0xffffffff
    pc : [<c080ac48>]    lr : [<ffffffff>]    psr: 000f0093
    sp : f0829a28  ip : f0829af4  fp : c0b13875
    r10: 00000008  r9 : f0829a7c  r8 : f0829aec
    r7 : f0829af4  r6 : f0829b7c  r5 : 4e22202c  r4 : f0829af4
    r3 : ffffff04  r2 : 4e22202c  r1 : 00000000  r0 : f0829aee
    Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
    Control: 10c5387d  Table: 6332004a  DAC: 00000051
    Register r0 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r1 information: NULL pointer
    Register r2 information: non-paged memory
    Register r3 information: non-paged memory
    Register r4 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r5 information: non-paged memory
    Register r6 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r7 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r8 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r9 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Register r10 information: non-paged memory
    Register r11 information: non-slab/vmalloc memory
    Register r12 information: 2-page vmalloc region starting at 0xf0828000 allocated at kernel_clone+0xa0/0x2e4
    Process systemd (pid: 1, stack limit = 0x(ptrval))
    Stack: (0xf0829a28 to 0xf082a000)
    9a20:                   f0829aee f0829af4 4e22202c c080c990 c18c0918 ffffff04
    [...]
     string_nocheck from string+0x54/0x64
     string from vsnprintf+0x220/0x36c
     vsnprintf from vprintk_store+0x130/0x3b4
     vprintk_store from vprintk_emit+0xa8/0x23c
     vprintk_emit from vprintk_default+0x1c/0x24
     vprintk_default from _printk+0x28/0x58
     _printk from print_lockdep_cache+0x3c/0x68
     print_lockdep_cache from print_unlock_imbalance_bug+0x6c/0xe0
     print_unlock_imbalance_bug from lock_release+0x168/0x328
     lock_release from up_write+0x20/0x244
     up_write from copy_process+0x1120/0x193c
     copy_process from kernel_clone+0xa0/0x2e4
     kernel_clone from sys_clone+0x6c/0x94
     sys_clone from ret_fast_syscall+0x0/0x1c
    Exception stack(0xf0829fa8 to 0xf0829ff0)
    9fa0:                   b64f47b8 b64f4c10 01200011 00000000 00000000 00000000
    9fc0: b64f47b8 b64f4c10 00000000 00000078 00000020 00000000 b64f4750 00000001
    9fe0: 00000078 be953908 b6ea5253 b6e47746
    Code: e28dd00c e49de004 e28dd008 e12fff1e (e7d23001)
    ---[ end trace 0000000000000000 ]---

---
 arch/arm/boot/dts/r8a7779-marzen.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
index fd40890bd77bc64c..632519edba6b5a47 100644
--- a/arch/arm/boot/dts/r8a7779-marzen.dts
+++ b/arch/arm/boot/dts/r8a7779-marzen.dts
@@ -26,6 +26,33 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	flash@0 {
+		compatible = "mtd-rom";
+		reg = <0x0 0x04000000>;
+		bank-width = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "uboot";
+				reg = <0x00000000 0x00040000>;
+				read-only;
+			};
+			partition@40000 {
+				label = "uboot-env";
+				reg = <0x00040000 0x00040000>;
+				read-only;
+			};
+			partition@80000 {
+				label = "flash";
+				reg = <0x00080000 0x03f80000>;
+			};
+		};
+	};
+
 	memory@60000000 {
 		device_type = "memory";
 		reg = <0x60000000 0x40000000>;
-- 
2.34.1

