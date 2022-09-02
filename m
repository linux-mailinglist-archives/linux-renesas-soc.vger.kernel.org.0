Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98895AAB8A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 11:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232699AbiIBJhT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 05:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235486AbiIBJhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 05:37:10 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E39718B2F9
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 02:37:07 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id Exd32800z4C55Sk06xd3Wo; Fri, 02 Sep 2022 11:37:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU36l-003hal-Ej; Fri, 02 Sep 2022 11:37:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU36k-007eR1-Jz; Fri, 02 Sep 2022 11:37:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.1
Date:   Fri,  2 Sep 2022 11:36:48 +0200
Message-Id: <cover.1662111124.git.geert+renesas@glider.be>
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
for v6.1.

It consists of 3 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.1

    - Refresh shmobile_defconfig for v6.0-rc1,
    - Enable additional support for Renesas platforms in the arm64
      defconfig.

  [GIT PULL 2/4] Renesas ARM DT updates for v6.1

    - SDHI and eMMC support for the R-Car S4-8 SoC and the Spider
      development board,
    - Timer (CMT and TMU) and SPI (MSIOF) support for the R-Car S4-8 SoC,
    - External and GPIO interrupt support for the RZ/G2L and RZ/V2L SoCs,
    - Initial support for the R-Car H3Ne-1.7G (R8A779MB) SoC,
    - SPI DMA support for the RZ/G2UL, RZ/G2L, and RZ/V2L SoCs,
    - Pin control and I2C support for the RZ/V2M SoC and the RZ/V2M
      Evaluation Kit,
    - initial support for the R-Car V3H2 (R8A77980A) SoC and the Condor-I
      development board,
    - Miscellaneous fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v6.1

    - Auto-enable the RZ/G2L external and GPIO interrupt controller driver
      when needed,
    - Identify the R-Car H3Ne-1.7G and RZ/Five SoCs.

  [GIT PULL 4/4] Renesas DT binding updates for v6.1

    - Document support for the R-Car H3Ne-1.7G SoC on the Salvator-XS and
      ULCB development boards,
    - Document system controller support for the RZ/Five SoC,
    - Document support for the R-Car V3H2 SoC and the Condor-I development
      board.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
