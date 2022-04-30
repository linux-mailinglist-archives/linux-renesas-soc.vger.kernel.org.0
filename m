Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD3C515B2F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 Apr 2022 09:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241475AbiD3IDB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 30 Apr 2022 04:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240657AbiD3IDA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Apr 2022 04:03:00 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B967092300;
        Sat, 30 Apr 2022 00:59:39 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,187,1647270000"; 
   d="scan'208";a="118453236"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Apr 2022 16:59:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.1])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EB0DF40065B7;
        Sat, 30 Apr 2022 16:59:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 4/5] arm64: dts: renesas: r9a07g054: Add GPT support
Date:   Sat, 30 Apr 2022 08:59:14 +0100
Message-Id: <20220430075915.5036-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220430075915.5036-1-biju.das.jz@bp.renesas.com>
References: <20220430075915.5036-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add GPT support by adding pwm nodes to RZ/V2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 192 +++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 4313b9e3abed..4a1039572147 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -168,6 +168,198 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		gpt0: pwm@10048000 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048000 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 219 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 220 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 221 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 222 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 223 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 224 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 225 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 226 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 227 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt1: pwm@10048100 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048100 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 232 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 233 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 234 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 238 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 239 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 240 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt2: pwm@10048200 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048200 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 245 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 246 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 248 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 249 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 250 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 251 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 252 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 253 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt3: pwm@10048300 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048300 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 257 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 258 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 259 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 260 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 261 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 266 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt4: pwm@10048400 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048400 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 272 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 273 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 274 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 275 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt5: pwm@10048500 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048500 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 283 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 284 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 285 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 286 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 287 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 288 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 289 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 290 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 292 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt6: pwm@10048600 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048600 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 300 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 301 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 302 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 303 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 304 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 305 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		gpt7: pwm@10048700 {
+			compatible = "renesas,r9a07g054-gpt",
+				     "renesas,rzg2l-gpt";
+			reg = <0 0x10048700 0 0xa4>;
+			#pwm-cells = <2>;
+			interrupts = <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 311 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 312 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 313 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 316 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 317 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+					  "cmpe", "cmpf", "adtrga", "adtrgb",
+					  "ovf", "unf";
+			clocks = <&cpg CPG_MOD R9A07G054_GPT_PCLK>;
+			resets =  <&cpg R9A07G054_GPT_RST_C>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@10049c00 {
 			compatible = "renesas,r9a07g054-ssi",
 				     "renesas,rz-ssi";
-- 
2.25.1

