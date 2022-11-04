Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA6D26194CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 11:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiKDKuM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 06:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbiKDKuG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 06:50:06 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F29B2B63C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 03:50:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
        by laurent.telenet-ops.be with bizsmtp
        id gAq4280122kjr6L01Aq4ST; Fri, 04 Nov 2022 11:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGx-002mVI-9X; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGw-00HWEj-Mo; Fri, 04 Nov 2022 11:50:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM DT updates for v6.2
Date:   Fri,  4 Nov 2022 11:49:53 +0100
Message-Id: <cover.1667558738.git.geert+renesas@glider.be>
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

This is my first pull request for the inclusion of Renesas SoC updates
for v6.2.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM DT updates for v6.2

    - DMA, SPI (MSIOF), external interrupt (INTC-EX), PWM (PWM and TPU),
      SDHI, HyperFLASH/QSPI (RPC), and serial ((H)SCIF) support for the
      R-Car V4H SoC,
    - I/O expander, eMMC, and QSPI FLASH support for the White Hawk
      development board,
    - Preparatory work to share r9a07g043.dtsi between the ARM-based
      RZ/G2UL (R9A07G043U) and the RISC-V-based RZ/Five (R9A07G043F) SoCs,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/4] Renesas ARM SoC updates for v6.2

    - Drop selecting GPIOLIB and PINCTRL, which are already automatically
      selected as part of the SOC_RENESAS config option in
      drivers/soc/renesas/Kconfig.

  [GIT PULL 3/4] Renesas driver updates for v6.2

    - Let SOC_RENESAS select GPIOLIB and PINCTRL, so this does not have to
      be handled in two (soon three: arm/arm64/riscv), places.

  [GIT PULL 4/4] Renesas DT binding updates for v6.2

    - Move renesas.yaml from arm to soc, and document RZ/Five support.

Note that the second pull request depends on the third, and thus is
based on it.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
