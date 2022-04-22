Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8942C50BAD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 16:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1448626AbiDVO6F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 10:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448637AbiDVO57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 10:57:59 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F3960C6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 07:54:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2928:9f72:c4af:fbd9])
        by baptiste.telenet-ops.be with bizsmtp
        id Mqux2700A2Ah9RF01quxTH; Fri, 22 Apr 2022 16:54:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugS-001cQ7-MT; Fri, 22 Apr 2022 16:54:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nhugR-00COl7-MQ; Fri, 22 Apr 2022 16:54:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas ARM defconfig updates for v5.19
Date:   Fri, 22 Apr 2022 16:54:49 +0200
Message-Id: <cover.1650638502.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.19.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.19

    - Enable support for the Renesas RZ/V2L SoC and the Maxim MAX96712
      Quad GMSL2 Deserializer in the arm64 defconfig,
    - Refresh shmobile_defconfig for v5.18-rc1.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.19

    - ADC, SDHI, CAN-FD, I2C, QSPI, timer, watchdog, sound, USB, SPI, GPU,
      cpufreq, and thermal support for the RZ/V2L SoC, and the RZ/V2L
      SMARC EVK development board,
    - USB, I2C, Audio, NOR Flash, timer, SPI support for RZ/G2LC SMARC EVK
      development board,
    - Can-FD support for the R-Car M30W+ and V3U SoCs, and the Falcon
      development board,
    - I2C and GPIO support for the R-Car S4-8 SoC,
    - I2C EEPROM support for the Falcon development board,
    - SPI Multi I/O Bus Controller (RPC-IF) support for the R-Car H3,
      M3-W(+), M3-N, E3, and D3 SoCs,
    - RPC HyperFlash support for the Draak, Ebisu, Salvator-X(S), and ULCB
      development boards,
    - Initial support (UART, DMAC, pin control, SDHI, eMMC, Ethernet) for
      the RZ/G2UL SoC, and the RZ/G2UL SMARC EVK development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.19

    - Initial support for the new RZ/G2UL SoC.

  [GIT PULL 4/4] Renesas DT binding updates for v5.19

    - Document support for the new RZ/G2UL SoC and the RZ/G2UL SMARC EVK
      development board.

Note that the new Renesas RZ/G2UL DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL] clk: renesas: Updates for v5.19" (for clk),
  - "[GIT PULL 2/4] Renesas ARM DT updates for v5.19" (for soc).

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
