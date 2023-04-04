Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D9B6D5935
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 09:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233800AbjDDHKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 03:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbjDDHKR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 03:10:17 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03D11FC7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 00:10:13 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id gXAA2900Q1C8whw06XAAjZ; Tue, 04 Apr 2023 09:10:11 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pjanC-00FsJA-Qt;
        Tue, 04 Apr 2023 09:10:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pjany-00HGas-LT;
        Tue, 04 Apr 2023 09:10:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Revise renesas,ipmmu-main
Date:   Tue,  4 Apr 2023 09:10:08 +0200
Message-Id: <ed4c21150e42dd23412a8f4af7976f81edc1c9c2.1680592069.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since IMSSTR register was undocumented on the latest datasheet and
dt-bindings of renesas,ipmmu-vmsa was updated about the
renesas,ipmmu-main property, revise the property on each cache IPMMU
node.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Reviewed-by from internal review.

To be queued in renesas-devel for v6.4.

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 7925341a69c8361c..bf587a14ec195c5c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2098,7 +2098,7 @@ ipmmu_rt0: iommu@ee480000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xee480000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 10>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2107,7 +2107,7 @@ ipmmu_rt1: iommu@ee4c0000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xee4c0000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 19>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2116,7 +2116,7 @@ ipmmu_ds0: iommu@eed00000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed00000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2125,7 +2125,7 @@ ipmmu_ds1: iommu@eed40000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed40000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2134,7 +2134,7 @@ ipmmu_ir: iommu@eed80000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed80000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 3>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_A3IR>;
 			#iommu-cells = <1>;
 		};
@@ -2143,7 +2143,7 @@ ipmmu_vc0: iommu@eedc0000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeedc0000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 12>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2152,7 +2152,7 @@ ipmmu_vi0: iommu@eee80000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeee80000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 14>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2161,7 +2161,7 @@ ipmmu_vi1: iommu@eeec0000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeeec0000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 15>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2170,7 +2170,7 @@ ipmmu_3dg: iommu@eee00000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeee00000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2179,7 +2179,7 @@ ipmmu_vip0: iommu@eef00000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeef00000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -2188,7 +2188,7 @@ ipmmu_vip1: iommu@eef40000 {
 			compatible = "renesas,ipmmu-r8a779a0",
 				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeef40000 0 0x20000>;
-			renesas,ipmmu-main = <&ipmmu_mm 11>;
+			renesas,ipmmu-main = <&ipmmu_mm>;
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
-- 
2.34.1

