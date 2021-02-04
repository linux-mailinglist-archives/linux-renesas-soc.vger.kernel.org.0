Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF73A30FA56
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Feb 2021 18:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbhBDRyb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Feb 2021 12:54:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238761AbhBDRv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:51:28 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D63C06178A
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Feb 2021 09:50:43 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id R5qf240074C55Sk065qfy3; Thu, 04 Feb 2021 18:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7im7-003Fgj-04; Thu, 04 Feb 2021 18:50:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l7f5F-006vvl-S5; Thu, 04 Feb 2021 14:54:09 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/6] ARM: r8a73a4: Add SMP support
Date:   Thu,  4 Feb 2021 14:54:03 +0100
Message-Id: <20210204135409.1652604-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This RFC patch series leverages the existing APMU support for R-Car Gen2
and RZ/G1 SoCs to enable SMP support on R-Mobile APE6.  This allows me
to enjoy the 4 Cortex-A15 CPU cores on the APE6-EVM development board.
The core APE6-specific code was lifted from an old series by Magnus[1].

Known issues:
  - While initial secondary CPU bring-up during boot works, CPU cores
    fail to come online after offlining/onlining them using the sysfs
    interface ("echo [01] > /sys/*/*/cpu/cpu[0-9]*{off,on}line").

  - This breaks detection of the CFI FLASH.  I traced this back to
    setting the SBAR_BAREN bit in the SYSC.CA15BAR register.
    Presumably this affects the LBSC in some way?

To do:
  - Call into rmobile-sysc instead of hardcoding the SYSC mapping,
  - Describe CCI-400 in DT and call cci_enable_port_by_index()?
  - Let pm-rcar-gen2.c call into rcar-rst instead of hardcoding the RST
    mapping,
  - Abstract SYSC vs. RST access and merge with pm-rcar-gen2.c?

Questions:
  - Do we want to bring up the Cortex-A7 cores, too? We don't on R-Car
    H2 neither.

Thanks for your comments!

[1] [PATCH 00/02] ARM: shmobile: Initial r8a73a4 APMU SMP code
    https://lore.kernel.org/linux-arm-kernel/20130807225531.9856.18974.sendpatchset@w520/

Geert Uytterhoeven (6):
  soc: renesas: Introduce RENESAS_APMU Kconfig option
  dt-bindings: power: renesas,apmu: Document R-Mobile APE6 support
  ARM: dts: r8a73a4: Add secondary CPU nodes
  ARM: dts: r8a73a4: Add Media RAM for SMP jump stub
  ARM: dts: r8a73a4: Add APMU nodes
  [WIP] ARM: shmobile: r8a73a4: Add SMP support

 .../bindings/power/renesas,apmu.yaml          |   6 +-
 arch/arm/boot/dts/r8a73a4.dtsi                |  96 +++++++++++
 arch/arm/mach-shmobile/Makefile               |   6 +-
 arch/arm/mach-shmobile/platsmp-apmu.c         |  15 +-
 arch/arm/mach-shmobile/pm-r8a73a4.c           | 152 ++++++++++++++++++
 arch/arm/mach-shmobile/r8a73a4.h              |   7 +
 drivers/soc/renesas/Kconfig                   |   5 +
 7 files changed, 281 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/mach-shmobile/pm-r8a73a4.c
 create mode 100644 arch/arm/mach-shmobile/r8a73a4.h

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
