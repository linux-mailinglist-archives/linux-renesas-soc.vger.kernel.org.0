Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A06338E60
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 14:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbhCLNKf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 08:10:35 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:48843 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbhCLNKc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 08:10:32 -0500
X-Halon-ID: 4df2f850-8334-11eb-a076-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 4df2f850-8334-11eb-a076-005056917f90;
        Fri, 12 Mar 2021 14:10:30 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: r8a77961: Add VIN and CSI-2 device nodes
Date:   Fri, 12 Mar 2021 14:10:20 +0100
Message-Id: <20210312131020.1747344-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for VIN and CSI-2 to R-Car M3-W+ r8a77961 device tree.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 314 +++++++++++++++++++++-
 1 file changed, 304 insertions(+), 10 deletions(-)
---
Hello,

I have boot tested this and all looks good but the only board access I 
have is remote to a board without any video sources I can't test a real 
capture. If someone have a M3-W+ on their desk a test would be much 
appreciated.

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index e8c31ebec09730c4..db7e5dc8e2b7c773 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1397,43 +1397,259 @@ msiof3: spi@e6c10000 {
 		};
 
 		vin0: video@e6ef0000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef0000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 811>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 811>;
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin0csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin0>;
+					};
+					vin0csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin0>;
+					};
+				};
+			};
 		};
 
 		vin1: video@e6ef1000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef1000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 810>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 810>;
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin1csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin1>;
+					};
+					vin1csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin1>;
+					};
+				};
+			};
 		};
 
 		vin2: video@e6ef2000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef2000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 809>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 809>;
+			renesas,id = <2>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin2csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin2>;
+					};
+					vin2csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin2>;
+					};
+				};
+			};
 		};
 
 		vin3: video@e6ef3000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef3000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 808>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 808>;
+			renesas,id = <3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin3csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin3>;
+					};
+					vin3csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin3>;
+					};
+				};
+			};
 		};
 
 		vin4: video@e6ef4000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef4000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 807>;
+			renesas,id = <4>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin4csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin4>;
+					};
+					vin4csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin4>;
+					};
+				};
+			};
 		};
 
 		vin5: video@e6ef5000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef5000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 806>;
+			renesas,id = <5>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin5csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin5>;
+					};
+					vin5csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin5>;
+					};
+				};
+			};
 		};
 
 		vin6: video@e6ef6000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef6000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 805>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 805>;
+			renesas,id = <6>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin6csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin6>;
+					};
+					vin6csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin6>;
+					};
+				};
+			};
 		};
 
 		vin7: video@e6ef7000 {
+			compatible = "renesas,vin-r8a77961";
 			reg = <0 0xe6ef7000 0 0x1000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 804>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 804>;
+			renesas,id = <7>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+
+					vin7csi20: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi20vin7>;
+					};
+					vin7csi40: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&csi40vin7>;
+					};
+				};
+			};
 		};
 
 		rcar_sound: sound@ec500000 {
@@ -2249,8 +2465,13 @@ vspi0: vsp@fe9a0000 {
 		};
 
 		csi20: csi2@fea80000 {
+			compatible = "renesas,r8a77961-csi2";
 			reg = <0 0xfea80000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 714>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 714>;
+			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
@@ -2259,14 +2480,53 @@ ports {
 				port@1 {
 					#address-cells = <1>;
 					#size-cells = <0>;
+
 					reg = <1>;
+
+					csi20vin0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&vin0csi20>;
+					};
+					csi20vin1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&vin1csi20>;
+					};
+					csi20vin2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&vin2csi20>;
+					};
+					csi20vin3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&vin3csi20>;
+					};
+					csi20vin4: endpoint@4 {
+						reg = <4>;
+						remote-endpoint = <&vin4csi20>;
+					};
+					csi20vin5: endpoint@5 {
+						reg = <5>;
+						remote-endpoint = <&vin5csi20>;
+					};
+					csi20vin6: endpoint@6 {
+						reg = <6>;
+						remote-endpoint = <&vin6csi20>;
+					};
+					csi20vin7: endpoint@7 {
+						reg = <7>;
+						remote-endpoint = <&vin7csi20>;
+					};
 				};
 			};
 		};
 
 		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a77961-csi2";
 			reg = <0 0xfeaa0000 0 0x10000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
+			status = "disabled";
 
 			ports {
 				#address-cells = <1>;
@@ -2277,7 +2537,41 @@ port@1 {
 					#size-cells = <0>;
 
 					reg = <1>;
+
+					csi40vin0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&vin0csi40>;
+					};
+					csi40vin1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&vin1csi40>;
+					};
+					csi40vin2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&vin2csi40>;
+					};
+					csi40vin3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&vin3csi40>;
+					};
+					csi40vin4: endpoint@4 {
+						reg = <4>;
+						remote-endpoint = <&vin4csi40>;
+					};
+					csi40vin5: endpoint@5 {
+						reg = <5>;
+						remote-endpoint = <&vin5csi40>;
+					};
+					csi40vin6: endpoint@6 {
+						reg = <6>;
+						remote-endpoint = <&vin6csi40>;
+					};
+					csi40vin7: endpoint@7 {
+						reg = <7>;
+						remote-endpoint = <&vin7csi40>;
+					};
 				};
+
 			};
 		};
 
-- 
2.30.1

