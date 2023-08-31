Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7828978EBCB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Aug 2023 13:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241118AbjHaLSC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Aug 2023 07:18:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242203AbjHaLSA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Aug 2023 07:18:00 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B5CBCF4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 31 Aug 2023 04:17:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
        by xavier.telenet-ops.be with bizsmtp
        id gBHs2A00Y3874jb01BHs0h; Thu, 31 Aug 2023 13:17:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbfgC-0026un-5m;
        Thu, 31 Aug 2023 13:17:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qbfgO-00CHXo-JG;
        Thu, 31 Aug 2023 13:17:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/4] ARM: shmobile: Reserve boot area when SMP is enabled
Date:   Thu, 31 Aug 2023 13:17:43 +0200
Message-Id: <cover.1693409184.git.geert+renesas@glider.be>
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

	Hi all,

On Renesas ARM SoCs predating R-Car Gen3, CPU core bringup does not use
a hardware register to program the CPU boot address directly.  Instead,
it uses a set of registers (thus not involving the MMU) to remap any CPU
access to the page(s) at physical address zero to the specified address
block containing the CPU core startup code.  the MMU.  Hence when this
is enabled, any device residing in this low part of physical address
space cannot be accessed.  On some boards, a CFI FLASH lives there.

Hence this causes conflicts between CPU onlining and FLASH operation:
  - Reading the first page(s) of FLASH returns the CPU startup code
    instead of the FLASH contents,
  - CFI FLASH probing fails, as it operates on the RAM that contains the
    CPU startup code.  Moreover, as this probing involves writes, it
    corrupts the CPU startup code, causing any subsequent CPU onlining
    to fail.

CPU cores can be onlined in 3 places:
  A. Secondary core bringup, during early boot (FLASH not yet in use),
  B. Enabling secondary CPUs when resuming after s2ram (FLASH not in
     use),
  C. Manual CPU hotplug (at any time, FLASH may or may not be in use).

Possible solutions:
  1. Disable FLASH in SMP initialization:
       - Simple to implement,
       - Accessing the FLASH from Linux needs a reboot with nosmp.

  2. Disable SMP when FLASH@0 is used:
       - How to check if @0 is actually used/mapped?
         SMP is initialized before FLASH.

  3. Map core startup code only when needed:
      - Unmap core startup code after secondary core bringup,
      - Map/unmap core startup code during s2ram suspend/resume,
      - Call cpu_hotplug_disable() from smp_cpus_done(),
	  - CPU hotplug is broken.
	  - How to check if @0 is actually used/mapped?

  4. As this FLASH is typically used to boot the system, Marek suggested
     to fix this in the boot loader (e.g. put a (modified) copy of the
     CPU bringup code in FLASH).  But I think this is fragile, and cannot
     be a generic solution, as there are other ways to boot the system,
     and the FLASH may be used for other purposes.

This patch series implements solution 1, by marking the boot area region
reserved during SMP initialization (an alternative method would be to
disable any device node in DT that resides in this area).  Subsequent
probing of FLASH will fail with -EBUSY:

    physmap-flash 0.flash: can't request region for resource [mem 0x00000000-0x03ffffff]
    physmap-flash: probe of 0.flash failed with error -16

When CONFIG_SMP is disabled, or when booted with "nosmp", the FLASH
is available again.

The first patch is a small cleanup in code affected by the third patch.
The other three patches fix the issue on R-Car Gen2 (and RZ/G1), R-Car
H1, and SH-Mobile AG5 SoCs.

Other Renesas SoCs:
  - R-Mobile APE6 is also affected, but has no upstream SMP support yet,
  - EMMA Mobile EV2 is unaffected, as it uses internal boot ROM code
    that watches a special general purpose register in the SMU block,
  - RZ/N1 is not affected, as it uses a "cpu-release-addr" property in
    DT,
  - R-Car Gen3 is not affected, as it extended the R-Car Gen2 RST block
    with Cortex-A53/A57 Boot Address Registers for 64-bit mode
    (CA5[37]CPUnBAR[HL]), which control the boot address directly,
  - R-Car Gen4 is not affected, as it has Reset Vector Base Address
    Registers (RVBAR[HL]Cn), which control the boot address directly.

This series has been tested on R-Car V2H (Blanche) and R-Car H1
(Marzen).  With this, the CFI FLASHes on Marzen[1] and Blanche (DTS
patch to be posted) work when booted with nosmp.

Thanks for your comments!

[1] "[PATCH/RFC] ARM: dts: marzen: Add FLASH node"
    https://lore.kernel.org/r/07cf5e2b466f3ba217403afc66a8246460609e09.1679330105.git.geert+renesas@glider.be/

Geert Uytterhoeven (4):
  ARM: shmobile: rcar-gen2: Remove unneeded once handling
  ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
  ARM: shmobile: r8a7779: Reserve boot area when SMP is enabled
  ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

 arch/arm/mach-shmobile/pm-rcar-gen2.c |  5 +++--
 arch/arm/mach-shmobile/smp-r8a7779.c  |  9 ++++++++-
 arch/arm/mach-shmobile/smp-sh73a0.c   | 10 ++++++++--
 3 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
