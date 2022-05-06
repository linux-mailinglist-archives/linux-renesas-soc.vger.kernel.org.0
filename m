Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD4751D4B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 11:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390724AbiEFJhG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 05:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390733AbiEFJg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:36:57 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A2AF6A00D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:32:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by laurent.telenet-ops.be with bizsmtp
        id TMYM270051UVucw01MYMdQ; Fri, 06 May 2022 11:32:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJw-0038XA-Jc; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJv-00Aek5-PT; Fri, 06 May 2022 11:32:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.19 (take two)
Date:   Fri,  6 May 2022 11:32:11 +0200
Message-Id: <cover.1651828600.git.geert+renesas@glider.be>
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

This is my second pull request for the inclusion of Renesas SoC updates
for v5.19.

It consists of five parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v5.19 (take two)

    - Enable support for the Renesas RZ/G2UL and RZ/V2M SoCs in the arm64
      defconfig,

  [GIT PULL 2/5] Renesas ARM DT updates for v5.19 (take two)

    - I2C, sound, USB, CANFD, timer, watchdog, (Q)SPI, cpufreq, and
      thermal support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVK
      development board,
    - Initial support for the R-Car V4H SoC and the Renesas White Hawk
      development board stack,
    - DMA, RTC, and USB support for the RZ/N1D SoC,
    - Initial support for the RZ/V2M SoC an the RZ/V2M Evaluation Kit
      Board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/5] Renesas ARM SoC updates for v5.19

    - Drop commas after sentinels.

  [GIT PULL 4/5] Renesas driver updates for v5.19 (take two)

    - Initial support for the R-Car V4H and RZ/V2M SoCs,
    - Miscellaneous fixes and improvements.

  [GIT PULL 5/5] Renesas DT binding updates for v5.19 (take two)

    - Document support for the R-Car V4H SoC and the White Hawk
      development board stack,
    - Document support for the RZ/V2M SoC and the RZ/V2M Evaluation Kit
      Board,
    - Document SPI Multi I/O Bus Controller (RPC-IF) support for RZ/G2UL,
    - Miscellaneous fixes and improvements.

Note that the new Renesas R-Car V4H and RZ/V2M DT Binding Definitions
are shared by driver and DT source files, and thus included in multiple
pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.19 (take two)" (for clk),
  - "[GIT PULL 2/5] Renesas ARM DT updates for v5.19 (take two)" (for soc),
  - "[GIT PULL 4/5] Renesas driver updates for v5.19 (take two)" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
