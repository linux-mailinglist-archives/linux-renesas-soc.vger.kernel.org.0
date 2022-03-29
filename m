Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3754EACF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbiC2MTS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:19:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiC2MTR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:19:17 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D684237FFF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:17:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by laurent.telenet-ops.be with bizsmtp
        id CCHY2700F49QC4401CHYk8; Tue, 29 Mar 2022 14:17:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAmx-007GUM-V3; Tue, 29 Mar 2022 14:17:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAmx-00CDVB-7A; Tue, 29 Mar 2022 14:17:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     tf-a@lists.trustedfirmware.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH TF-A] fix(plat/rcar3): Fix RPC-IF device node name
Date:   Tue, 29 Mar 2022 14:17:20 +0200
Message-Id: <3685623bed84674039adb61e723288d359ab0a50.1648544199.git.geert+renesas@glider.be>
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

According to the Generic Names Recommendation in the Devicetree
Specification Release v0.3, and the DT Bindings for the Renesas Reduced
Pin Count Interface, the node name for a Renesas RPC-IF device should be
"spi".  The node name matters, as the node is enabled by passing a DT
fragment from TF-A to subsequent software.

Fix this by renaming the device nodes from "rpc" to "spi".

Fixes: 12c75c8886a0ee69 ("feat(plat/rcar3): emit RPC status to DT fragment if RPC unlocked")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Background:

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

This patch takes care of the first issue in TF-A.

The related patches for U-Boot are [1].
Patches to enable RPC-IF support in Linux are available at [2].

Thanks for your comments!

[1] "[PATCH u-boot 0/3] renesas: Fix RPC-IF enablement"
    https://lore.kernel.org/r/cover.1648544792.git.geert+renesas@glider.be
[2] "[PATCH 0/5] arm64: dts: renesas: rcar-gen3: Enable HyperFlash support"
    https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be

---
 plat/renesas/rcar/bl2_plat_setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/plat/renesas/rcar/bl2_plat_setup.c b/plat/renesas/rcar/bl2_plat_setup.c
index bbfa16927d6c2384..f85db8d650c6b1a5 100644
--- a/plat/renesas/rcar/bl2_plat_setup.c
+++ b/plat/renesas/rcar/bl2_plat_setup.c
@@ -574,7 +574,7 @@ static void bl2_add_rpc_node(void)
 		goto err;
 	}
 
-	node = ret = fdt_add_subnode(fdt, node, "rpc@ee200000");
+	node = ret = fdt_add_subnode(fdt, node, "spi@ee200000");
 	if (ret < 0) {
 		goto err;
 	}
-- 
2.25.1

