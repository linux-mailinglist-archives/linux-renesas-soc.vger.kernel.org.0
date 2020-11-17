Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3106A2B5CE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 11:31:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgKQKac (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 05:30:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgKQKab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 05:30:31 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5486AC0613CF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 02:30:31 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id tNWV2300A4C55Sk06NWVKt; Tue, 17 Nov 2020 11:30:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-003Bbu-RL; Tue, 17 Nov 2020 11:30:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1keyFo-008xoz-5B; Tue, 17 Nov 2020 11:30:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] ARM: shmobile: Remove IOMEM and static mappings
Date:   Tue, 17 Nov 2020 11:30:15 +0100
Message-Id: <20201117103022.2136527-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This long-overdue patch series gets rid of the last remaining users of
the legacy IOMEM() macro and the needed static mappings on Renesas ARM
SoCs.

Ideally, all addresses used should be obtained from DT, but given the
maintenance status of R-Car Gen1 and SH-Mobile SoCs, it is very unlikely
the needed DT bindings will ever be written, and the needed DT nodes
will ever be added.

This has been tested on r8a7778/bockw, r8a7779/marzen, and sh73a0/kzm9g.
I plan to queue this series in renesas-devel for v5.11.

Thanks for your comments!

Geert Uytterhoeven (7):
  ARM: shmobile: r8a7778: Introduce HPBREG_BASE
  ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
  ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
  ARM: shmobile: r8a7779: Remove obsolete static mappings
  ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
  ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
  ARM: shmobile: sh73a0: Remove obsolete static mapping

 arch/arm/mach-shmobile/setup-r8a7778.c |  4 +-
 arch/arm/mach-shmobile/setup-r8a7779.c | 56 +++++++++-----------------
 arch/arm/mach-shmobile/setup-sh73a0.c  | 21 +---------
 arch/arm/mach-shmobile/smp-r8a7779.c   | 12 ++++--
 arch/arm/mach-shmobile/smp-sh73a0.c    | 33 ++++++++++-----
 5 files changed, 54 insertions(+), 72 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
