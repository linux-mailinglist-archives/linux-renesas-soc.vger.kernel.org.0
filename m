Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B03051FCCA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 May 2022 14:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234436AbiEIMb7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 May 2022 08:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234543AbiEIMb4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 08:31:56 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5B717E144
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 May 2022 05:28:00 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8886:2b92:63eb:2922])
        by albert.telenet-ops.be with bizsmtp
        id UcTv270070moLbn06cTv0Z; Mon, 09 May 2022 14:27:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1no2UU-003XSj-Ik; Mon, 09 May 2022 14:27:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1no2UU-003Ba7-0r; Mon, 09 May 2022 14:27:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bastian Hecht <hechtb@googlemail.com>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] dt-bindings: mtd: Remove Renesas FLCTL NAND controller support
Date:   Mon,  9 May 2022 14:27:52 +0200
Message-Id: <ef70e24a57d2342458fe11b7b13775ffac1f1bd0.1652098726.git.geert+renesas@glider.be>
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

The DT bindings for the Renesas FLCTL NAND controller document only support a
single SoC, namely the Renesas R-Mobile AP4 (SH7372).
Linux dropped support for this SoC in commit 59b89af1d5551c12 ("ARM:
shmobile: sh7372: Remove Legacy C SoC code") in v4.1.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The FLCTL NAND controller (or an enhanced version) is also present on
SH-Mobile AG5 (sh73a0) and R-Mobile A1 (r8a7740), but the sole boards
supported upstream (KMC KZM-A9-GT resp. Atmark Techno Armadillo-800-EVA)
use eMMC NAND instead of raw NAND FLASH.

What's the policy w.r.t. stale DT bindings?
Should it be converted to json-schema instead?
drivers/mtd/nand/raw/sh_flctl.c still implements these bindings.
The driver cannot be removed, as it is also used on the non-DT
SH7723-based AP-325RXA platform.
---
 .../devicetree/bindings/mtd/flctl-nand.txt    | 49 -------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/flctl-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/flctl-nand.txt b/Documentation/devicetree/bindings/mtd/flctl-nand.txt
deleted file mode 100644
index 427f46dc60add134..0000000000000000
--- a/Documentation/devicetree/bindings/mtd/flctl-nand.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-FLCTL NAND controller
-
-Required properties:
-- compatible : "renesas,shmobile-flctl-sh7372"
-- reg : Address range of the FLCTL
-- interrupts : flste IRQ number
-- nand-bus-width : bus width to NAND chip
-
-Optional properties:
-- dmas: DMA specifier(s)
-- dma-names: name for each DMA specifier. Valid names are
-	     "data_tx", "data_rx", "ecc_tx", "ecc_rx"
-
-The DMA fields are not used yet in the driver but are listed here for
-completing the bindings.
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-	flctl@e6a30000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "renesas,shmobile-flctl-sh7372";
-		reg = <0xe6a30000 0x100>;
-		interrupts = <0x0d80>;
-
-		nand-bus-width = <16>;
-
-		dmas = <&dmac 1 /* data_tx */
-			&dmac 2;> /* data_rx */
-		dma-names = "data_tx", "data_rx";
-
-		system@0 {
-			label = "system";
-			reg = <0x0 0x8000000>;
-		};
-
-		userdata@8000000 {
-			label = "userdata";
-			reg = <0x8000000 0x10000000>;
-		};
-
-		cache@18000000 {
-			label = "cache";
-			reg = <0x18000000 0x8000000>;
-		};
-	};
-- 
2.25.1

