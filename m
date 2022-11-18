Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A89F062FAA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 17:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242215AbiKRQpX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 11:45:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242221AbiKRQpS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 11:45:18 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AC36A768
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Nov 2022 08:45:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d0b:c833:41f6:da0e])
        by andre.telenet-ops.be with bizsmtp
        id lslC2800Q29fmst01slCAh; Fri, 18 Nov 2022 17:45:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UK-000pA8-Cx; Fri, 18 Nov 2022 17:45:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ow4UJ-00FrgE-SI; Fri, 18 Nov 2022 17:45:11 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/7] Renesas SoC updates for v6.2 (take two)
Date:   Fri, 18 Nov 2022 17:44:57 +0100
Message-Id: <cover.1668788918.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.2, and the first one including support for an SoC with a RISC-V
CPU core (and including no changes for SoCs with arm32 CPU cores).

It consists of 7 parts:

  [GIT PULL 1/7] Renesas ARM defconfig updates for v6.2

    - Enable support for Renesas R-Car S4-8 Spider Ethernet devices in the
      arm64 defconfig.

  [GIT PULL 2/7] Renesas ARM DT updates for v6.2 (take two)

    - Timer (TMU and CMT) and quad Cortex-A76 CPU topology support for
      the R-Car V4H SoC,
    - Watchdog, L2 cache, and system controller support for the RZ/V2M
      SoC on the RZ/V2M Evaluation Kit 2.0,
    - Ethernet Switch and SERDES supports for the R-Car S4-8 SoC and the
      Spider development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/7] Renesas driver updates for v6.2 (take two)

    - Add support for identifying the SoC revision on RZ/V2M.

  [GIT PULL 4/7] Renesas DT binding updates for v6.2 (take two)

    - Document support for the Andes Technology AX45MP RISC-V CPU Core, as
      used on the Renesas RZ/Five SoC,
    - Document support for the Renesas RZ/V2M System Configuration.

  [GIT PULL 5/7] Renesas RISC-V defconfig updates for v6.2

    - Enable support for the Renesas RZ/Five SoC and the RZ/Five SMARC EVK
      board in the risc-v defconfig.

  [GIT PULL 6/7] Renesas RISC-V DT updates for v6.2

    - Add initial support for the Renesas RZ/Five SoC and the Renesas
      RZ/Five SMARC EVK development board.

  [GIT PULL 7/7] Renesas RISC-V SoC updates for v6.2

    - Add Kconfig option for Renesas RISC-V SoCs.

Thanks for pulling!

P.S. I'm wondering if I should reduce the number of branches?
     Probably it would make sense to (at least) use a single branch for
     the DTS changes, as the RZ/Five DTS files share base SoC and board
     DTS with RZ/G2UL through #include <arm64/renesas/...>.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
