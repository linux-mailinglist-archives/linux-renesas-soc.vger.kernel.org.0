Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872732CD557
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Dec 2020 13:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730406AbgLCMUQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Dec 2020 07:20:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730398AbgLCMUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 07:20:14 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE089C061A52
        for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Dec 2020 04:19:33 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id zoKN2300V4C55Sk01oKNUN; Thu, 03 Dec 2020 13:19:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknZy-007hFn-IO; Thu, 03 Dec 2020 13:19:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kknZy-00C2t9-2B; Thu, 03 Dec 2020 13:19:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v10 0/3] ARM: uncompress: Validate start of physical memory against passed DTB
Date:   Thu,  3 Dec 2020 13:19:13 +0100
Message-Id: <20201203121916.2870975-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Currently, the start address of physical memory is obtained by masking
the program counter with a fixed mask of 0xf8000000.  This mask value
was chosen as a balance between the requirements of different platforms.
However, this does require that the start address of physical memory is
a multiple of 128 MiB, precluding booting Linux on platforms where this
requirement is not fulfilled.

Fix this limitation by validating the masked address against the memory
information in the passed DTB, to support booting Linux on
r7s9210/rza2mevb using the 64 MiB of SDRAM on the RZA2MEVB sub board,
which is located at 0x0C000000 (CS3 space), i.e. not at a multiple of
128 MiB.

Compared to v9[*], the major change is a step back, and only supporting
this on modern systems that pass the DTB explicitly, with improved
validation to avoid regressions.

This has been regression-tested on a variety of boards using a passed or
appended DTB.

Thanks for your comments!

[*] "[PATCH v9] ARM: boot: Validate start of physical memory against DTB"
    (https://lore.kernel.org/r/20200902153606.13652-1-geert+renesas@glider.be)

Geert Uytterhoeven (3):
  ARM: uncompress: Add be32tocpu macro
  ARM: uncompress: Add OF_DT_MAGIC macro
  ARM: uncompress: Validate start of physical memory against passed DTB

 arch/arm/Kconfig                              |   7 +-
 arch/arm/boot/compressed/Makefile             |   5 +-
 .../arm/boot/compressed/fdt_check_mem_start.c | 131 ++++++++++++++++++
 arch/arm/boot/compressed/head.S               |  70 +++++++---
 4 files changed, 187 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm/boot/compressed/fdt_check_mem_start.c

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
