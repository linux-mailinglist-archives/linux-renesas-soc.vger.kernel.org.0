Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2114211E835
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 17:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbfLMQ0J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:26:09 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:36978 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfLMQ0J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:26:09 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id dUS7210055USYZQ06US7zc; Fri, 13 Dec 2019 17:26:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifnlX-0006me-2t; Fri, 13 Dec 2019 17:26:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ifnlX-0000VD-0v; Fri, 13 Dec 2019 17:26:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: rcar-gen2: Add missing mmio-sram bus properties
Date:   Fri, 13 Dec 2019 17:26:04 +0100
Message-Id: <20191213162604.1890-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"#address-cells", "#size-cells", and "ranges" are required properties
for devices nodes compatible with "mmio-sram", leading to warnings when
running "make dtbs_check":

    $ make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/sram/sram.yaml
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: sram@e63a0000: '#address-cells' is a required property
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: sram@e63a0000: '#size-cells' is a required property
    arch/arm/boot/dts/r8a7791-koelsch.dt.yaml: sram@e63a0000: 'ranges' is a required property
    ...

Fix this by adding the missing properties to the mmio-sram device nodes
in the DTS files for all affected R-Car Gen2 and RZ/G1 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7743.dtsi  | 6 ++++++
 arch/arm/boot/dts/r8a7744.dtsi  | 6 ++++++
 arch/arm/boot/dts/r8a7745.dtsi  | 6 ++++++
 arch/arm/boot/dts/r8a77470.dtsi | 6 ++++++
 arch/arm/boot/dts/r8a7790.dtsi  | 3 +++
 arch/arm/boot/dts/r8a7791.dtsi  | 3 +++
 arch/arm/boot/dts/r8a7792.dtsi  | 3 +++
 arch/arm/boot/dts/r8a7793.dtsi  | 3 +++
 arch/arm/boot/dts/r8a7794.dtsi  | 3 +++
 9 files changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743.dtsi b/arch/arm/boot/dts/r8a7743.dtsi
index 5f88d9f585988c0c..dcf09d9a1d76bb02 100644
--- a/arch/arm/boot/dts/r8a7743.dtsi
+++ b/arch/arm/boot/dts/r8a7743.dtsi
@@ -399,6 +399,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
@@ -417,6 +420,9 @@
 		icram2:	sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe6300000 0x40000>;
 		};
 
 		/* The memory map in the User's Manual maps the cores to
diff --git a/arch/arm/boot/dts/r8a7744.dtsi b/arch/arm/boot/dts/r8a7744.dtsi
index 446dbb5409e67aeb..357640e3693480f3 100644
--- a/arch/arm/boot/dts/r8a7744.dtsi
+++ b/arch/arm/boot/dts/r8a7744.dtsi
@@ -399,6 +399,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
@@ -417,6 +420,9 @@
 		icram2:	sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe6300000 0x40000>;
 		};
 
 		/* The memory map in the User's Manual maps the cores to
diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
index 04f1ca1828b15954..edcc74ff90865540 100644
--- a/arch/arm/boot/dts/r8a7745.dtsi
+++ b/arch/arm/boot/dts/r8a7745.dtsi
@@ -363,6 +363,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
@@ -381,6 +384,9 @@
 		icram2:	sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe6300000 0x40000>;
 		};
 		i2c0: i2c@e6508000 {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index 51806c7f486a3681..8b522ed4eb1ef815 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -242,6 +242,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
@@ -260,6 +263,9 @@
 		icram2:	sram@e6300000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe6300000 0 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe6300000 0x20000>;
 		};
 
 		i2c0: i2c@e6508000 {
diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index cf7bf7d7caee1808..344519957916f473 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -487,6 +487,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index e5fa01034666616b..119e67b665392a5a 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -421,6 +421,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index c4ea2d6760301706..5956854e60d8d585 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -345,6 +345,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index bf05110fac4e23be..91c7c3cfe7476cbf 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -406,6 +406,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 945b1378dc40d53a..7d4644fac3771798 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -351,6 +351,9 @@
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0xe63a0000 0x12000>;
 		};
 
 		icram1:	sram@e63c0000 {
-- 
2.17.1

