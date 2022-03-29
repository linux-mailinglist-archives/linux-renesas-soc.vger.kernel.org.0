Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE894EACFA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:20:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236241AbiC2MVw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236234AbiC2MVv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:21:51 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0734340C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:20:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by michel.telenet-ops.be with bizsmtp
        id CCL72700F49QC4406CL7PD; Tue, 29 Mar 2022 14:20:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZApS-007GW3-VM; Tue, 29 Mar 2022 14:20:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZApS-00CDdQ-HH; Tue, 29 Mar 2022 14:20:06 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support
Date:   Tue, 29 Mar 2022 14:20:00 +0200
Message-Id: <cover.1648548339.git.geert+renesas@glider.be>
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

The first two issues are handled by patches for TF-A[1] and U-Boot[2].

This patch series takes care of the third issue, by adding device nodes
for the RPC-IF interfaces and the HyperFlash devices to the various DTS
files.  The "status" properties of the RPC-IF device nodes are left
"disabled", and are to be updated by U-Boot when unlocked.

HyperFlash operation has been tested on a variety of SoCs (R-Car H3
ES1.1 & ES2.0, M3-W ES1.0, M3-N ES1.0, E3 ES1.0, and D3 ES1.1) and
boards (Salvator-XS, ULCB, Ebisu-4D, and Draak).

For testing, this series and its Linux dependencies (HF fix[3], clk[4],
pinctrl[5]) can be found at[6].

Thanks for your comments!

[1] "[PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name"
    https://lore.kernel.org/r/3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be

[2] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
    https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be

[3] "[PATCH v3] memory: renesas-rpc-if: Fix HF/OSPI data transfer in
     Manual mode"
    https://lore.kernel.org/r/ad6ef2af754c8163f825d3a199d64f910d63f802.1648545212.git.geert+renesas@glider.be

[4] "[PATCH 0/2] clk: renesas: r8a7799[05]: Add RPC clocks"
    https://lore.kernel.org/r/cover.1648546700.git.geert+renesas@glider.be

[5] "[PATCH 0/2] pinctrl: renesas: r8a7799[05]: Add RPC pins, groups,
     and functions"
    https://lore.kernel.org/r/cover.1648547080.git.geert+renesas@glider.be

[6] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rcar3-rpc-hf-v1

Geert Uytterhoeven (5):
  arm64: dts: renesas: rcar-gen3: Add RPC device nodes
  arm64: dts: renesas: draak: Add RPC HyperFlash device node
  arm64: dts: renesas: ebisu: Add RPC HyperFlash device node
  arm64: dts: renesas: salvator-common: Add RPC HyperFlash device node
  arm64: dts: renesas: ulcb: Add RPC HyperFlash device node

 arch/arm64/boot/dts/renesas/draak.dtsi        | 58 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi        | 58 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi     | 16 +++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi     | 16 +++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 16 +++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 16 +++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi     | 16 +++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi     | 16 +++++
 .../boot/dts/renesas/salvator-common.dtsi     | 49 ++++++++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi         | 49 ++++++++++++++++
 10 files changed, 310 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
