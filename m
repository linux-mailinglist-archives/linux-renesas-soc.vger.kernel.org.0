Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A756D8BDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 10:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404193AbfJPIzR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 04:55:17 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:45333 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404197AbfJPIzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 04:55:16 -0400
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 93B16240003;
        Wed, 16 Oct 2019 08:55:12 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, airlied@linux.ie,
        daniel@ffwll.ch, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] arm64: dts: renesas: Add CMM units to Gen3 SoCs
Date:   Wed, 16 Oct 2019 10:55:47 +0200
Message-Id: <20191016085548.105703-8-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CMM units to Renesas R-Car Gen3 SoC that support it, and reference them
from the Display Unit they are connected to.

Sort the 'vsps', 'renesas,cmm' and 'status' properties in the DU unit
consistently in all the involved DTS.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 39 +++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 31 +++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 31 +++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 21 ++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 21 ++++++++++++
 5 files changed, 141 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 6675462f7585..e16757af8c27 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -2939,6 +2939,42 @@
 			iommus = <&ipmmu_vi1 10>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,r8a7795-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 711>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,r8a7795-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 710>;
+			resets = <&cpg 710>;
+		};
+
+		cmm2: cmm@fea60000 {
+			compatible = "renesas,r8a7795-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea60000 0 0x1000>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 709>;
+			resets = <&cpg 709>;
+		};
+
+		cmm3: cmm@fea70000 {
+			compatible = "renesas,r8a7795-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea70000 0 0x1000>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 708>;
+			resets = <&cpg 708>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a7795-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
@@ -3142,7 +3178,10 @@
 				 <&cpg CPG_MOD 722>,
 				 <&cpg CPG_MOD 721>;
 			clock-names = "du.0", "du.1", "du.2", "du.3";
+
+			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
 			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
+
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index 822c96601d3c..597c47f3f994 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -2641,6 +2641,33 @@
 			renesas,fcp = <&fcpvi0>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,r8a7796-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 711>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,r8a7796-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 710>;
+			resets = <&cpg 710>;
+		};
+
+		cmm2: cmm@fea60000 {
+			compatible = "renesas,r8a7796-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea60000 0 0x1000>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 709>;
+			resets = <&cpg 709>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a7796-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
@@ -2791,10 +2818,12 @@
 				 <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 722>;
 			clock-names = "du.0", "du.1", "du.2";
-			status = "disabled";
 
+			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>;
 			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
 
+			status = "disabled";
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 4ae163220f60..c3da8d26ccba 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2320,6 +2320,33 @@
 			resets = <&cpg 611>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,r8a77965-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 711>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,r8a77965-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 710>;
+			resets = <&cpg 710>;
+		};
+
+		cmm3: cmm@fea70000 {
+			compatible = "renesas,r8a77965-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea70000 0 0x1000>;
+			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 708>;
+			resets = <&cpg 708>;
+		};
+
 		csi20: csi2@fea80000 {
 			compatible = "renesas,r8a77965-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
@@ -2467,10 +2494,12 @@
 				 <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 721>;
 			clock-names = "du.0", "du.1", "du.3";
-			status = "disabled";
 
+			renesas,cmms = <&cmm0>, <&cmm1>, <&cmm3>;
 			vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
 
+			status = "disabled";
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 455954c3d98e..bab9b7f96c72 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1727,6 +1727,24 @@
 			iommus = <&ipmmu_vi0 9>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,r8a77990-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 711>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,r8a77990-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 710>;
+			resets = <&cpg 710>;
+		};
+
 		csi40: csi2@feaa0000 {
 			compatible = "renesas,r8a77990-csi2";
 			reg = <0 0xfeaa0000 0 0x10000>;
@@ -1768,7 +1786,10 @@
 			clock-names = "du.0", "du.1";
 			resets = <&cpg 724>;
 			reset-names = "du.0";
+
+			renesas,cmms = <&cmm0>, <&cmm1>;
 			vsps = <&vspd0 0>, <&vspd1 0>;
+
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 183fef86cf7c..871c70cc2d2e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -993,6 +993,24 @@
 			iommus = <&ipmmu_vi0 9>;
 		};
 
+		cmm0: cmm@fea40000 {
+			compatible = "renesas,r8a77995-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea40000 0 0x1000>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 711>;
+			resets = <&cpg 711>;
+		};
+
+		cmm1: cmm@fea50000 {
+			compatible = "renesas,r8a77995-cmm",
+				     "renesas,rcar-gen3-cmm";
+			reg = <0 0xfea50000 0 0x1000>;
+			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+			clocks = <&cpg CPG_MOD 710>;
+			resets = <&cpg 710>;
+		};
+
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a77995";
 			reg = <0 0xfeb00000 0 0x40000>;
@@ -1003,7 +1021,10 @@
 			clock-names = "du.0", "du.1";
 			resets = <&cpg 724>;
 			reset-names = "du.0";
+
+			renesas,cmms = <&cmm0>, <&cmm1>;
 			vsps = <&vspd0 0>, <&vspd1 0>;
+
 			status = "disabled";
 
 			ports {
-- 
2.23.0

