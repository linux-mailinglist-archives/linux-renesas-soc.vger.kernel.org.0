Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7734D741D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 13:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbfJOLB5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 07:01:57 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:10408 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726054AbfJOLB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 07:01:56 -0400
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; 
   d="scan'208";a="28928200"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 20:01:53 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0069040062C5;
        Tue, 15 Oct 2019 20:01:50 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774b1: Add VIN and CSI-2 support
Date:   Tue, 15 Oct 2019 12:01:11 +0100
Message-Id: <1571137271-33973-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add VIN and CSI-2 support to the RZ/G2N SoC specific dtsi.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 366 ++++++++++++++++++++++++++++++
 1 file changed, 366 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 98feb29..0cd9d16 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1282,6 +1282,262 @@
 			status = "disabled";
 		};
 
+		vin0: video@e6ef0000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef0000 0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 811>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin1: video@e6ef1000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef1000 0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 810>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin2: video@e6ef2000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef2000 0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 809>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin3: video@e6ef3000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef3000 0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 808>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin4: video@e6ef4000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin5: video@e6ef5000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin6: video@e6ef6000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef6000 0 0x1000>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 805>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
+		vin7: video@e6ef7000 {
+			compatible = "renesas,vin-r8a774b1";
+			reg = <0 0xe6ef7000 0 0x1000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 804>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
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
+		};
+
 		rcar_sound: sound@ec500000 {
 			/*
 			 * #sound-dai-cells is required
@@ -2065,6 +2321,116 @@
 			resets = <&cpg 611>;
 		};
 
+		csi20: csi2@fea80000 {
+			compatible = "renesas,r8a774b1-csi2";
+			reg = <0 0xfea80000 0 0x10000>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 714>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 714>;
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
+				};
+			};
+		};
+
+		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a774b1-csi2";
+			reg = <0 0xfeaa0000 0 0x10000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 716>;
+			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
+			resets = <&cpg 716>;
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
+				};
+			};
+		};
+
 		hdmi0: hdmi@fead0000 {
 			compatible = "renesas,r8a774b1-hdmi",
 				     "renesas,rcar-gen3-hdmi";
-- 
2.7.4

