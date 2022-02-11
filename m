Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 103EB4B27B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Feb 2022 15:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiBKOTt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Feb 2022 09:19:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347617AbiBKOTr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 09:19:47 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565EFB3F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Feb 2022 06:19:45 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
        by albert.telenet-ops.be with bizsmtp
        id tqKi2600D3ZSXJh06qKiu4; Fri, 11 Feb 2022 15:19:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIWlx-000M8j-SO; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIWLx-00Gh8N-JP; Fri, 11 Feb 2022 14:52:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.18
Date:   Fri, 11 Feb 2022 14:52:10 +0100
Message-Id: <cover.1644587197.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.18.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.18

    - Enable the new Audio Graph Card2 driver which can handle sound cards
      more flexibly in the arm64 defconfig,
    - Disable unneeded 8250 serial options in shmobile_defconfig,
    - Enable additional support for Renesas platforms in the arm64
      defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.18

    - External interrupt (INTC-EX) support for the R-Car V3U SoC,
    - Initial support for the RZ/G2LC and RZ/V2L SoCs, and the RZ/G2LC and
      RZ/V2L SMARC EVK development boards,
    - Support for MAX9286 GMSL deserializers and GSML cameras on the Eagle
      and Condor development boards,
    - NAND support for the RZ/N1D SoC,
    - DMA engine (SYS-DMAC) support for the R-Car S4-8 SoC,
    - LVDS support for the R-Car M3-W+ SoC,
    - HDMI output and 9-axis sensor support for the Kingfisher (ULCB
      extension) board,
    - MAX96712 GMSL serializer support for the Falcon development board,
    - MOST network support for the R-Car H3, M3-W, M3-W+, M3-N, E3, and D3
      SoCs,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.18

    - Initial support for the new RZ/V2L SoC,
    - RZ/G2L product revision support.

  [GIT PULL 4/4] Renesas DT binding updates for v5.18

    - Document support for the new RZ/V2L SoC and the RZ/V2L SMARC EVK
      board.

Note that the new Renesas RZ/V2L DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.18" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.18" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
