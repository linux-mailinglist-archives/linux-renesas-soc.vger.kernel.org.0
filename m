Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5A6D4EACF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236235AbiC2MVH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236234AbiC2MVG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:21:06 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E98340C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:19:22 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by michel.telenet-ops.be with bizsmtp
        id CCKL2700Q49QC4406CKLFe; Tue, 29 Mar 2022 14:19:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAoi-007GVQ-4K; Tue, 29 Mar 2022 14:19:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAoh-00CDaM-Gt; Tue, 29 Mar 2022 14:19:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     u-boot@lists.denx.de
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC u-boot 3/3] renesas: Fix RPC-IF compatible values
Date:   Tue, 29 Mar 2022 14:19:09 +0200
Message-Id: <1bcdafe3fe2687c50aae328e46f63396100e586f.1648544792.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648544792.git.geert+renesas@glider.be>
References: <cover.1648544792.git.geert+renesas@glider.be>
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

The compatible values used for device nodes representing Renesas Reduced
Pin Count Interfaces were based on preliminary versions of the Device
Tree Bindings.

Correct them in both DTSi files and drivers, to match the final DT
Bindings.

Note that there are no DT bindings for RPC-IF on RZ/A1 yet, hence the
most logical SoC-specific value is used, without specifying a
family-specific value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not strictly necessary.

Perhaps you prefer to do this in a future DTS sync with e.g. Linux
v5.19, to take care of the other differences in the RPC device nodes?
---
 arch/arm/dts/r7s72100-gr-peach-u-boot.dts | 2 +-
 arch/arm/dts/r8a774c0-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77950-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77960-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77965-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77970-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77980-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77990-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a77995-u-boot.dtsi         | 2 +-
 arch/arm/dts/r8a779a0-u-boot.dtsi         | 2 +-
 drivers/mtd/renesas_rpc_hf.c              | 3 ++-
 drivers/spi/renesas_rpc_spi.c             | 9 ++-------
 12 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/arch/arm/dts/r7s72100-gr-peach-u-boot.dts b/arch/arm/dts/r7s72100-gr-peach-u-boot.dts
index 3f532eced23d354b..5b176a9acd75b62f 100644
--- a/arch/arm/dts/r7s72100-gr-peach-u-boot.dts
+++ b/arch/arm/dts/r7s72100-gr-peach-u-boot.dts
@@ -47,7 +47,7 @@
 
 
 	rpc: spi@ee200000 {
-		compatible = "renesas,rpc-r7s72100", "renesas,rpc";
+		compatible = "renesas,r7s72100-rpc-if";
 		reg = <0x3fefa000 0x100>, <0x18000000 0x08000000>;
 		bank-width = <2>;
 		num-cs = <1>;
diff --git a/arch/arm/dts/r8a774c0-u-boot.dtsi b/arch/arm/dts/r8a774c0-u-boot.dtsi
index f50816a360dc5912..d29610676cacb7f6 100644
--- a/arch/arm/dts/r8a774c0-u-boot.dtsi
+++ b/arch/arm/dts/r8a774c0-u-boot.dtsi
@@ -11,7 +11,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rcar-gen3-rpc", "renesas,rpc-r8a774c0";
+			compatible = "renesas,r8a774c0-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0x04000000>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77950-u-boot.dtsi b/arch/arm/dts/r8a77950-u-boot.dtsi
index 5e449a3553cb9712..2306c7bab8489eb4 100644
--- a/arch/arm/dts/r8a77950-u-boot.dtsi
+++ b/arch/arm/dts/r8a77950-u-boot.dtsi
@@ -14,7 +14,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a7795", "renesas,rpc";
+			compatible = "renesas,r8a7795-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77960-u-boot.dtsi b/arch/arm/dts/r8a77960-u-boot.dtsi
index 9013c291f5ffca8a..f64e5a416b0c18a6 100644
--- a/arch/arm/dts/r8a77960-u-boot.dtsi
+++ b/arch/arm/dts/r8a77960-u-boot.dtsi
@@ -14,7 +14,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a7796", "renesas,rpc";
+			compatible = "renesas,r8a7796-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77965-u-boot.dtsi b/arch/arm/dts/r8a77965-u-boot.dtsi
index f3c99ac99cbc581a..c4abcc5a9b72b544 100644
--- a/arch/arm/dts/r8a77965-u-boot.dtsi
+++ b/arch/arm/dts/r8a77965-u-boot.dtsi
@@ -14,7 +14,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a77965", "renesas,rpc";
+			compatible = "renesas,r8a77965-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77970-u-boot.dtsi b/arch/arm/dts/r8a77970-u-boot.dtsi
index 904fc48b2282b52a..614caa9e9c250f7a 100644
--- a/arch/arm/dts/r8a77970-u-boot.dtsi
+++ b/arch/arm/dts/r8a77970-u-boot.dtsi
@@ -14,7 +14,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a77970", "renesas,rpc";
+			compatible = "renesas,r8a77970-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77980-u-boot.dtsi b/arch/arm/dts/r8a77980-u-boot.dtsi
index 34d6fcd2f013d762..54f01c926dcc1c14 100644
--- a/arch/arm/dts/r8a77980-u-boot.dtsi
+++ b/arch/arm/dts/r8a77980-u-boot.dtsi
@@ -14,7 +14,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a77980", "renesas,rpc";
+			compatible = "renesas,r8a77980-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77990-u-boot.dtsi b/arch/arm/dts/r8a77990-u-boot.dtsi
index 8c75f62f5abec4cf..50bbbe186471e1a5 100644
--- a/arch/arm/dts/r8a77990-u-boot.dtsi
+++ b/arch/arm/dts/r8a77990-u-boot.dtsi
@@ -10,7 +10,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a77990", "renesas,rpc";
+			compatible = "renesas,r8a77990-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a77995-u-boot.dtsi b/arch/arm/dts/r8a77995-u-boot.dtsi
index cd9466625e27d57c..347b59ac42c058b6 100644
--- a/arch/arm/dts/r8a77995-u-boot.dtsi
+++ b/arch/arm/dts/r8a77995-u-boot.dtsi
@@ -10,7 +10,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a77995", "renesas,rpc";
+			compatible = "renesas,r8a77995-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
 			bank-width = <2>;
diff --git a/arch/arm/dts/r8a779a0-u-boot.dtsi b/arch/arm/dts/r8a779a0-u-boot.dtsi
index 83dbe3f20ef06824..9f2772a948581c01 100644
--- a/arch/arm/dts/r8a779a0-u-boot.dtsi
+++ b/arch/arm/dts/r8a779a0-u-boot.dtsi
@@ -10,7 +10,7 @@
 / {
 	soc {
 		rpc: spi@ee200000 {
-			compatible = "renesas,rpc-r8a779a0", "renesas,rcar-gen3-rpc";
+			compatible = "renesas,r8a779a0-rpc-if", "renesas,rcar-gen3-rpc-if";
 			reg = <0 0xee200000 0 0x200>, <0 0x08000000 0 0x04000000>;
 			clocks = <&cpg CPG_MOD 629>;
 			bank-width = <2>;
diff --git a/drivers/mtd/renesas_rpc_hf.c b/drivers/mtd/renesas_rpc_hf.c
index 2c61ce7b6e69326e..aca7a6cdd25b54eb 100644
--- a/drivers/mtd/renesas_rpc_hf.c
+++ b/drivers/mtd/renesas_rpc_hf.c
@@ -388,7 +388,8 @@ static int rpc_hf_probe(struct udevice *dev)
 }
 
 static const struct udevice_id rpc_hf_ids[] = {
-	{ .compatible = "renesas,rpc" },
+	{ .compatible = "renesas,r7s72100-rpc-if" },
+	{ .compatible = "renesas,rcar-gen3-rpc-if" },
 	{}
 };
 
diff --git a/drivers/spi/renesas_rpc_spi.c b/drivers/spi/renesas_rpc_spi.c
index 26b6aa85c92bb711..cb2b8fb64def8266 100644
--- a/drivers/spi/renesas_rpc_spi.c
+++ b/drivers/spi/renesas_rpc_spi.c
@@ -449,13 +449,8 @@ static const struct dm_spi_ops rpc_spi_ops = {
 };
 
 static const struct udevice_id rpc_spi_ids[] = {
-	{ .compatible = "renesas,rpc-r7s72100" },
-	{ .compatible = "renesas,rpc-r8a7795" },
-	{ .compatible = "renesas,rpc-r8a7796" },
-	{ .compatible = "renesas,rpc-r8a77965" },
-	{ .compatible = "renesas,rpc-r8a77970" },
-	{ .compatible = "renesas,rpc-r8a77995" },
-	{ .compatible = "renesas,rcar-gen3-rpc" },
+	{ .compatible = "renesas,r7s72100-rpc-if" },
+	{ .compatible = "renesas,rcar-gen3-rpc-if" },
 	{ }
 };
 
-- 
2.25.1

