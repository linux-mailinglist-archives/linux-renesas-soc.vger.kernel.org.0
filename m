Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1541729012B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 11:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405543AbgJPJMj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 05:12:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47951 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405974AbgJPJMb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 05:12:31 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D57EB2005B;
        Fri, 16 Oct 2020 09:12:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: r8a779a0: Add VIN nodes
Date:   Fri, 16 Oct 2020 13:11:58 +0200
Message-Id: <20201016111158.17521-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
References: <20201016111158.17521-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add VIN nodes to R8A779A0 R-Car V3U SoC.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---

v2:
- Add 'renesas,id' property and empty 'ports' node to pass dtbs validation

---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 448 ++++++++++++++++++++++
 1 file changed, 448 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 62ed6ce29cb0..b275807a7a14 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -105,6 +105,454 @@ scif0: serial@e6e60000 {
 			status = "disabled";
 		};

+		vin0: video@e6ef0000 {
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
+			};
+		};
+
+		vin1: video@e6ef1000 {
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
+			};
+		};
+
+		vin2: video@e6ef2000 {
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
+			};
+		};
+
+		vin3: video@e6ef3000 {
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
+			};
+		};
+
+		vin4: video@e6ef4000 {
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
+			};
+		};
+
+		vin5: video@e6ef5000 {
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
+			};
+		};
+
+		vin6: video@e6ef6000 {
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
+			};
+		};
+
+		vin7: video@e6ef7000 {
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
+			};
+		};
+
+		vin8: video@e6ef8000 {
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
+			};
+		};
+
+		vin9: video@e6ef9000 {
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
+			};
+		};
+
 		gic: interrupt-controller@f1000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
--
2.28.0

