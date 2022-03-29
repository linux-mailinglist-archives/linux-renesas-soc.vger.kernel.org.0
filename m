Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3AA74EACF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236231AbiC2MVC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiC2MVC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:21:02 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D23A340C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:19:19 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by laurent.telenet-ops.be with bizsmtp
        id CCKH2700X49QC4401CKH5S; Tue, 29 Mar 2022 14:19:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAof-007GV1-4K; Tue, 29 Mar 2022 14:19:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAoe-00CDZr-NT; Tue, 29 Mar 2022 14:19:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     u-boot@lists.denx.de
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH u-boot 0/3] renesas: Fix RPC-IF enablement
Date:   Tue, 29 Mar 2022 14:19:06 +0200
Message-Id: <cover.1648544792.git.geert+renesas@glider.be>
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

	Hi all,

On Renesas R-Car Gen3 platforms, the SPI Multi I/O Bus Controllers
(RPC-IF) provide access to HyperFlash or QSPI storage.  On production
systems, they are typically locked by the TF-A firmware, unless TF-A is
built with RCAR_RPC_HYPERFLASH_LOCKED=0.  When unlocked, TF-A
communicates this to subsequent software by passing a DT fragment that
sets the "status" property of the RPC-IF device node to "okay".

Unfortunately there are several issues preventing this from working all
the way to Linux:
  1. TF-A (and U-Boot on the receiving side) uses a device node name
     that does not conform to the DT specification nor the DT bindings
     for RPC-IF,
  2. While U-Boot receives the RPC-IF enablement from TF-A, it does not
     propagate it to Linux yet,
  3. The DTS files that are part of Linux do not have RPC HyperFlash
     support yet.

The first issue in TF-A is handled by [1].

This patch series takes care of the first and second issue in U-Boot, by
renaming the RPC-IF device node, and by propagating the enablement from
TF-A, if present, to Linux.  The third patch updates the RPC-IF
compatible values to match the actual DT bindings, but this is not
critical for operation, and can be postponed (e.g. by syncing DTS with
Linux v5.19).

Patches to enable RPC-IF support in Linux are available at [2].

Thanks for your comments!

[1] "[PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name"
    https://lore.kernel.org/r/3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be
[2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
    https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be

Geert Uytterhoeven (3):
  ARM: dts: rmobile: Fix RPC-IF device node names
  ARM: renesas: Propagate RPC-IF enablement to subsequent software
  [RFC] renesas: Fix RPC-IF compatible values

 arch/arm/dts/r7s72100-gr-peach-u-boot.dts |  4 +-
 arch/arm/dts/r8a774c0-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77950-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77960-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77965-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77970-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77980-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77990-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a77995-u-boot.dtsi         |  4 +-
 arch/arm/dts/r8a779a0-u-boot.dtsi         |  2 +-
 board/renesas/rcar-common/common.c        | 46 ++++++++++++++++++++++-
 drivers/mtd/renesas_rpc_hf.c              |  3 +-
 drivers/spi/renesas_rpc_spi.c             |  9 +----
 13 files changed, 67 insertions(+), 29 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
