Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71E084EACF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 14:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236233AbiC2MVF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 08:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbiC2MVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 08:21:04 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE84340C7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Mar 2022 05:19:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d553:ff0a:6830:6bde])
        by albert.telenet-ops.be with bizsmtp
        id CCKK2700A49QC4406CKKQJ; Tue, 29 Mar 2022 14:19:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAog-007GVB-So; Tue, 29 Mar 2022 14:19:18 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nZAog-00CDa2-A1; Tue, 29 Mar 2022 14:19:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     u-boot@lists.denx.de
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH u-boot 1/3] ARM: dts: rmobile: Fix RPC-IF device node names
Date:   Tue, 29 Mar 2022 14:19:07 +0200
Message-Id: <550c7fcb2b82b615846f7882e3a3970043b7a035.1648544792.git.geert+renesas@glider.be>
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

According to the Generic Names Recommendation in the Devicetree
Specification Release v0.3, and the DT Bindings for the Renesas Reduced
Pin Count Interface, the node name for a Renesas RPC-IF device should be
"spi".  Especially on R-Car Gen3 and RZ/G2, the node name matters, as
the node is enabled by passing a DT fragment from TF-A to U-Boot, and
from U-Boot to subsequent software.

Fix this by renaming the device nodes from "rpc" to "spi".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Needs a similar patch to TF-A.
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
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/dts/r7s72100-gr-peach-u-boot.dts b/arch/arm/dts/r7s72100-gr-peach-u-boot.dts
index f48121a9a812b481..3f532eced23d354b 100644
--- a/arch/arm/dts/r7s72100-gr-peach-u-boot.dts
+++ b/arch/arm/dts/r7s72100-gr-peach-u-boot.dts
@@ -46,7 +46,7 @@
 	};
 
 
-	rpc: rpc@ee200000 {
+	rpc: spi@ee200000 {
 		compatible = "renesas,rpc-r7s72100", "renesas,rpc";
 		reg = <0x3fefa000 0x100>, <0x18000000 0x08000000>;
 		bank-width = <2>;
diff --git a/arch/arm/dts/r8a774c0-u-boot.dtsi b/arch/arm/dts/r8a774c0-u-boot.dtsi
index af1c86171b601330..f50816a360dc5912 100644
--- a/arch/arm/dts/r8a774c0-u-boot.dtsi
+++ b/arch/arm/dts/r8a774c0-u-boot.dtsi
@@ -10,7 +10,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rcar-gen3-rpc", "renesas,rpc-r8a774c0";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0x04000000>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77950-u-boot.dtsi b/arch/arm/dts/r8a77950-u-boot.dtsi
index 5a11651464655134..5e449a3553cb9712 100644
--- a/arch/arm/dts/r8a77950-u-boot.dtsi
+++ b/arch/arm/dts/r8a77950-u-boot.dtsi
@@ -13,7 +13,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a7795", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77960-u-boot.dtsi b/arch/arm/dts/r8a77960-u-boot.dtsi
index f1cae1c35931e78a..9013c291f5ffca8a 100644
--- a/arch/arm/dts/r8a77960-u-boot.dtsi
+++ b/arch/arm/dts/r8a77960-u-boot.dtsi
@@ -13,7 +13,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a7796", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77965-u-boot.dtsi b/arch/arm/dts/r8a77965-u-boot.dtsi
index 9cc6f205375135dc..f3c99ac99cbc581a 100644
--- a/arch/arm/dts/r8a77965-u-boot.dtsi
+++ b/arch/arm/dts/r8a77965-u-boot.dtsi
@@ -13,7 +13,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a77965", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77970-u-boot.dtsi b/arch/arm/dts/r8a77970-u-boot.dtsi
index ac3c6be4adb885f3..904fc48b2282b52a 100644
--- a/arch/arm/dts/r8a77970-u-boot.dtsi
+++ b/arch/arm/dts/r8a77970-u-boot.dtsi
@@ -13,7 +13,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a77970", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77980-u-boot.dtsi b/arch/arm/dts/r8a77980-u-boot.dtsi
index 365d40ac49b65b05..34d6fcd2f013d762 100644
--- a/arch/arm/dts/r8a77980-u-boot.dtsi
+++ b/arch/arm/dts/r8a77980-u-boot.dtsi
@@ -13,7 +13,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a77980", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77990-u-boot.dtsi b/arch/arm/dts/r8a77990-u-boot.dtsi
index 6655abe8752f5d78..8c75f62f5abec4cf 100644
--- a/arch/arm/dts/r8a77990-u-boot.dtsi
+++ b/arch/arm/dts/r8a77990-u-boot.dtsi
@@ -9,7 +9,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a77990", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
diff --git a/arch/arm/dts/r8a77995-u-boot.dtsi b/arch/arm/dts/r8a77995-u-boot.dtsi
index 0917a80f09630875..cd9466625e27d57c 100644
--- a/arch/arm/dts/r8a77995-u-boot.dtsi
+++ b/arch/arm/dts/r8a77995-u-boot.dtsi
@@ -9,7 +9,7 @@
 
 / {
 	soc {
-		rpc: rpc@ee200000 {
+		rpc: spi@ee200000 {
 			compatible = "renesas,rpc-r8a77995", "renesas,rpc";
 			reg = <0 0xee200000 0 0x100>, <0 0x08000000 0 0>;
 			clocks = <&cpg CPG_MOD 917>;
-- 
2.25.1

