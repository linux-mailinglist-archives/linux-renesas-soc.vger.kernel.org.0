Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE125B8B2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Sep 2022 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiINPBh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Sep 2022 11:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiINPBf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2022 11:01:35 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B7767160
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2022 08:01:33 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
        by michel.telenet-ops.be with bizsmtp
        id Kr1X2801x3vs4GX06r1XMB; Wed, 14 Sep 2022 17:01:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTtL-005BMM-2d; Wed, 14 Sep 2022 17:01:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTtK-00110U-ET; Wed, 14 Sep 2022 17:01:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: spider: Move aliases and chosen
Date:   Wed, 14 Sep 2022 17:01:29 +0200
Message-Id: <c03500bb10eae10caeb3f4f97bc979eeee6cce75.1663167551.git.geert+renesas@glider.be>
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

The serial console and serial debug ports on Spider is located on the
CPU board.  Hence move the aliases and chosen nodes containing serial
port configuration from the main Spider DTS file to the DTS file that
describes the CPU board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 9 +++++++++
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
index 42526fc43d81ae1d..9739592570df589f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
@@ -11,6 +11,15 @@ / {
 	model = "Renesas Spider CPU board";
 	compatible = "renesas,spider-cpu", "renesas,r8a779f0";
 
+	aliases {
+		serial0 = &scif3;
+		serial1 = &scif0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
index 7a7c8ffba7118a1f..7aac3f4d319c330c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
@@ -12,15 +12,6 @@
 / {
 	model = "Renesas Spider CPU and Breakout boards based on r8a779f0";
 	compatible = "renesas,spider-breakout", "renesas,spider-cpu", "renesas,r8a779f0";
-
-	aliases {
-		serial0 = &scif3;
-		serial1 = &scif0;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
 };
 
 &i2c4 {
-- 
2.25.1

