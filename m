Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8733C84BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 14:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239444AbhGNMxq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 08:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239411AbhGNMxm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 08:53:42 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B3CC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 05:50:50 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by baptiste.telenet-ops.be with bizsmtp
        id V0qW250061ccfby010qWMr; Wed, 14 Jul 2021 14:50:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLO-0018dL-En; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3eLN-00AaDl-Lw; Wed, 14 Jul 2021 14:50:29 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Mike Rapoport <rppt@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-mm@kvack.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 00/10] Add generic support for kdump DT properties
Date:   Wed, 14 Jul 2021 14:50:10 +0200
Message-Id: <cover.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds generic support for parsing DT properties related
to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
the "/chosen" node), makes use of it on arm64, arm32, and (partially)
riscv, and performs a few cleanups.  It is an evolution of the
combination of [1] and [2].

The series consists of 5 parts:
  1. Patches 1-2 prepare (the visibility of) variables used to hold
     information retrieved from the DT properties.
  2. Patches 3-5 add support to the FDT core for parsing the properties.
     This can co-exist safely with architecture-specific parsing, until
     the latter has been removed.
  3. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
     riscv.
     I think this can be applied independently, as the non-standard
     handling is in v5.13, but upstream riscv kdump support is still
     incomplete.
  4. Patches 7-9 convert arm64 to use the generic handling instead of
     its own implementation.
  5. Patch 10 adds support for kdump properties to arm32.
     The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
     DT properties to crash dump kernel's DTB"[3], which is still valid.

Changes compared to the previous versions:
  - Make elfcorehdr_{addr,size} always visible,
  - Add variables for usable memory limitation,
  - Use IS_ENABLED() instead of #ifdef (incl. initrd and arm64),
  - Clarify what architecture-specific code is still responsible for,
  - Add generic support for parsing linux,usable-memory-range,
  - Remove custom linux,usable-memory-range parsing on arm64,
  - Use generic handling on ARM.
  
This has been tested on arm32 and arm64, and compile-tested on riscv64.

Thanks for your comments!

[1] "[PATCH v3] ARM: Parse kdump DT properties"
    https://lore.kernel.org/r/20210317113130.2554368-1-geert+renesas@glider.be/
[2] "[PATCH 0/3] Add generic-support for linux,elfcorehdr and fix riscv"
    https://lore.kernel.org/r/cover.1623780059.git.geert+renesas@glider.be/
[3] "[PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB"
    https://lore.kernel.org/linux-arm-kernel/20200902154129.6358-1-geert+renesas@glider.be/


Geert Uytterhoeven (10):
  crash_dump: Make elfcorehdr_{addr,size} always visible
  memblock: Add variables for usable memory limitation
  of: fdt: Add generic support for parsing elf core headers property
  of: fdt: Add generic support for parsing usable memory range property
  of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead of #ifdef
  riscv: Remove non-standard linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,elfcorehdr parsing
  arm64: kdump: Remove custom linux,usable-memory-range parsing
  arm64: kdump: Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of #ifdef
  ARM: Parse kdump DT properties

 Documentation/devicetree/bindings/chosen.txt  | 12 ++--
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++++++--
 arch/arm/mm/init.c                            | 30 +++++++++
 arch/arm64/mm/init.c                          | 63 +------------------
 arch/riscv/mm/init.c                          | 20 ------
 drivers/of/fdt.c                              | 63 ++++++++++++++++---
 include/linux/crash_dump.h                    |  7 ++-
 include/linux/memblock.h                      |  6 ++
 mm/memblock.c                                 |  2 +
 9 files changed, 148 insertions(+), 103 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
