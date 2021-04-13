Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679CA35E6AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 20:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347820AbhDMSte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 14:49:34 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:14986 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347852AbhDMSt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 14:49:29 -0400
X-Halon-ID: ebeecfd5-9c88-11eb-b966-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id ebeecfd5-9c88-11eb-b966-005056917a89;
        Tue, 13 Apr 2021 20:49:05 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add and connect all CSI-2, ISP and VIN nodes
Date:   Tue, 13 Apr 2021 20:48:43 +0200
Message-Id: <20210413184844.2606086-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
other for video capture. Add all nodes and record how they are
interconnected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 1273 +++++++++++++++++++++
 1 file changed, 1273 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 70b3604e56cd7c06..518f98378856112d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -1017,6 +1017,870 @@ msiof5: spi@e6c28000 {
 			status = "disabled";
 		};
 
+		vin00: video@e6ef0000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef0000 0 0x1000>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 730>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 730>;
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin00isp0: endpoint {
+						remote-endpoint = <&isp0vin00>;
+					};
+				};
+			};
+		};
+
+		vin01: video@e6ef1000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef1000 0 0x1000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 731>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 731>;
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin01isp0: endpoint {
+						remote-endpoint = <&isp0vin01>;
+					};
+				};
+			};
+		};
+
+		vin02: video@e6ef2000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef2000 0 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 800>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 800>;
+			renesas,id = <2>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin02isp0: endpoint {
+						remote-endpoint = <&isp0vin02>;
+					};
+				};
+			};
+		};
+
+		vin03: video@e6ef3000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef3000 0 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 801>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 801>;
+			renesas,id = <3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin03isp0: endpoint {
+						remote-endpoint = <&isp0vin03>;
+					};
+				};
+			};
+		};
+
+		vin04: video@e6ef4000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 802>;
+			renesas,id = <4>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin04isp0: endpoint {
+						remote-endpoint = <&isp0vin04>;
+					};
+				};
+			};
+		};
+
+		vin05: video@e6ef5000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 803>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 803>;
+			renesas,id = <5>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin05isp0: endpoint {
+						remote-endpoint = <&isp0vin05>;
+					};
+				};
+			};
+		};
+
+		vin06: video@e6ef6000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef6000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 804>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 804>;
+			renesas,id = <6>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin06isp0: endpoint {
+						remote-endpoint = <&isp0vin06>;
+					};
+				};
+			};
+		};
+
+		vin07: video@e6ef7000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef7000 0 0x1000>;
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 805>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 805>;
+			renesas,id = <7>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					reg = <2>;
+
+					vin07isp0: endpoint {
+						remote-endpoint = <&isp0vin07>;
+					};
+				};
+			};
+		};
+
+		vin08: video@e6ef8000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef8000 0 0x1000>;
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 806>;
+			renesas,id = <8>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin08isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin08>;
+					};
+				};
+			};
+		};
+
+		vin09: video@e6ef9000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ef9000 0 0x1000>;
+			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 807>;
+			renesas,id = <9>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin09isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin09>;
+					};
+				};
+			};
+		};
+
+		vin10: video@e6efa000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6efa000 0 0x1000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 808>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 808>;
+			renesas,id = <10>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin10isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin10>;
+					};
+				};
+			};
+		};
+
+		vin11: video@e6efb000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6efb000 0 0x1000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 809>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 809>;
+			renesas,id = <11>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin11isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin11>;
+					};
+				};
+			};
+		};
+
+		vin12: video@e6efc000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6efc000 0 0x1000>;
+			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 810>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 810>;
+			renesas,id = <12>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin12isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin12>;
+					};
+				};
+			};
+		};
+
+		vin13: video@e6efd000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6efd000 0 0x1000>;
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 811>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 811>;
+			renesas,id = <13>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin13isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin13>;
+					};
+				};
+			};
+		};
+
+		vin14: video@e6efe000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6efe000 0 0x1000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 812>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 812>;
+			renesas,id = <14>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin14isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin14>;
+					};
+				};
+			};
+		};
+
+		vin15: video@e6eff000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6eff000 0 0x1000>;
+			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 813>;
+			renesas,id = <15>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin15isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin15>;
+					};
+				};
+			};
+		};
+
+		vin16: video@e6ed0000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed0000 0 0x1000>;
+			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 814>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 814>;
+			renesas,id = <16>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin16isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin16>;
+					};
+				};
+			};
+		};
+
+		vin17: video@e6ed1000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed1000 0 0x1000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 815>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 815>;
+			renesas,id = <17>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin17isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin17>;
+					};
+				};
+			};
+		};
+
+		vin18: video@e6ed2000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed2000 0 0x1000>;
+			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 816>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 816>;
+			renesas,id = <18>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin18isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin18>;
+					};
+				};
+			};
+		};
+
+		vin19: video@e6ed3000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed3000 0 0x1000>;
+			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 817>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 817>;
+			renesas,id = <19>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin19isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin19>;
+					};
+				};
+			};
+		};
+
+		vin20: video@e6ed4000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed4000 0 0x1000>;
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 818>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 818>;
+			renesas,id = <20>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin20isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin20>;
+					};
+				};
+			};
+		};
+
+		vin21: video@e6ed5000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed5000 0 0x1000>;
+			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 819>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 819>;
+			renesas,id = <21>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin21isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin21>;
+					};
+				};
+			};
+		};
+
+		vin22: video@e6ed6000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed6000 0 0x1000>;
+			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 820>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 820>;
+			renesas,id = <22>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin22isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin22>;
+					};
+				};
+			};
+		};
+
+		vin23: video@e6ed7000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed7000 0 0x1000>;
+			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 821>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 821>;
+			renesas,id = <23>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin23isp2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&isp2vin23>;
+					};
+				};
+			};
+		};
+
+		vin24: video@e6ed8000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed8000 0 0x1000>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 822>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 822>;
+			renesas,id = <24>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin24isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin24>;
+					};
+				};
+			};
+		};
+
+		vin25: video@e6ed9000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ed9000 0 0x1000>;
+			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 823>;
+			renesas,id = <25>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin25isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin25>;
+					};
+				};
+			};
+		};
+
+		vin26: video@e6eda000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6eda000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 824>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 824>;
+			renesas,id = <26>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin26isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin26>;
+					};
+				};
+			};
+		};
+
+		vin27: video@e6edb000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6edb000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 825>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 825>;
+			renesas,id = <27>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin27isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin27>;
+					};
+				};
+			};
+		};
+
+		vin28: video@e6edc000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6edc000 0 0x1000>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 826>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 826>;
+			renesas,id = <28>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin28isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin28>;
+					};
+				};
+			};
+		};
+
+		vin29: video@e6edd000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6edd000 0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 827>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 827>;
+			renesas,id = <29>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin29isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin29>;
+					};
+				};
+			};
+		};
+
+		vin30: video@e6ede000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6ede000 0 0x1000>;
+			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 828>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 828>;
+			renesas,id = <30>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin30isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin30>;
+					};
+				};
+			};
+		};
+
+		vin31: video@e6edf000 {
+			compatible = "renesas,vin-r8a779a0";
+			reg = <0 0xe6edf000 0 0x1000>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 829>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 829>;
+			renesas,id = <31>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin31isp3: endpoint@3 {
+						reg = <3>;
+						remote-endpoint = <&isp3vin31>;
+					};
+				};
+			};
+		};
+
 		dmac1: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779a0";
 			reg = <0 0xe7350000 0 0x1000>,
@@ -1137,6 +2001,415 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
 		};
 
+		csi40: csi2@feaa0000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfeaa0000 0 0x10000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 331>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					csi40isp0: endpoint {
+						remote-endpoint = <&isp0csi40>;
+					};
+				};
+			};
+		};
+
+		csi41: csi2@feab0000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfeab0000 0 0x10000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 400>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 400>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					csi41isp1: endpoint {
+						remote-endpoint = <&isp1csi41>;
+					};
+				};
+			};
+		};
+
+		csi42: csi2@fed60000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfed60000 0 0x10000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 401>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					csi42isp2: endpoint {
+						remote-endpoint = <&isp2csi42>;
+					};
+				};
+			};
+		};
+
+		csi43: csi2@fed70000 {
+			compatible = "renesas,r8a779a0-csi2";
+			reg = <0 0xfed70000 0 0x10000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 402>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 402>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					reg = <1>;
+					csi43isp3: endpoint {
+						remote-endpoint = <&isp3csi43>;
+					};
+				};
+			};
+		};
+
+		isp0: isp@fed00000 {
+			compatible = "renesas,isp-r8a779a0";
+			reg = <0 0xfed00000 0 0x10000>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 612>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+			resets = <&cpg 612>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					isp0csi40: endpoint {
+						remote-endpoint = <&csi40isp0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp0vin00: endpoint {
+						remote-endpoint = <&vin00isp0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp0vin01: endpoint {
+						remote-endpoint = <&vin01isp0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp0vin02: endpoint {
+						remote-endpoint = <&vin02isp0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp0vin03: endpoint {
+						remote-endpoint = <&vin03isp0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp0vin04: endpoint {
+						remote-endpoint = <&vin04isp0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp0vin05: endpoint {
+						remote-endpoint = <&vin05isp0>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp0vin06: endpoint {
+						remote-endpoint = <&vin06isp0>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp0vin07: endpoint {
+						remote-endpoint = <&vin07isp0>;
+					};
+				};
+			};
+		};
+
+		isp1: isp@fed20000 {
+			compatible = "renesas,isp-r8a779a0";
+			reg = <0 0xfed20000 0 0x10000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 613>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP01>;
+			resets = <&cpg 613>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <0>;
+					isp1csi41: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&csi41isp1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp1vin08: endpoint {
+						remote-endpoint = <&vin08isp1>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp1vin09: endpoint {
+						remote-endpoint = <&vin09isp1>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp1vin10: endpoint {
+						remote-endpoint = <&vin10isp1>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp1vin11: endpoint {
+						remote-endpoint = <&vin11isp1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp1vin12: endpoint {
+						remote-endpoint = <&vin12isp1>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp1vin13: endpoint {
+						remote-endpoint = <&vin13isp1>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp1vin14: endpoint {
+						remote-endpoint = <&vin14isp1>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp1vin15: endpoint {
+						remote-endpoint = <&vin15isp1>;
+					};
+				};
+			};
+		};
+
+		isp2: isp@fed30000 {
+			compatible = "renesas,isp-r8a779a0";
+			reg = <0 0xfed30000 0 0x10000>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 614>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
+			resets = <&cpg 614>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					isp2csi42: endpoint {
+						remote-endpoint = <&csi42isp2>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp2vin16: endpoint {
+						remote-endpoint = <&vin16isp2>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp2vin17: endpoint {
+						remote-endpoint = <&vin17isp2>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp2vin18: endpoint {
+						remote-endpoint = <&vin18isp2>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp2vin19: endpoint {
+						remote-endpoint = <&vin19isp2>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp2vin20: endpoint {
+						remote-endpoint = <&vin20isp2>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp2vin21: endpoint {
+						remote-endpoint = <&vin21isp2>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp2vin22: endpoint {
+						remote-endpoint = <&vin22isp2>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp2vin23: endpoint {
+						remote-endpoint = <&vin23isp2>;
+					};
+				};
+			};
+		};
+
+		isp3: isp@fed40000 {
+			compatible = "renesas,isp-r8a779a0";
+			reg = <0 0xfed40000 0 0x10000>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 615>;
+			power-domains = <&sysc R8A779A0_PD_A3ISP23>;
+			resets = <&cpg 615>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <0>;
+
+					isp3csi43: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&csi43isp3>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp3vin24: endpoint {
+						remote-endpoint = <&vin24isp3>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp3vin25: endpoint {
+						remote-endpoint = <&vin25isp3>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp3vin26: endpoint {
+						remote-endpoint = <&vin26isp3>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp3vin27: endpoint {
+						remote-endpoint = <&vin27isp3>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp3vin28: endpoint {
+						remote-endpoint = <&vin28isp3>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp3vin29: endpoint {
+						remote-endpoint = <&vin29isp3>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp3vin30: endpoint {
+						remote-endpoint = <&vin30isp3>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp3vin31: endpoint {
+						remote-endpoint = <&vin31isp3>;
+					};
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.31.1

