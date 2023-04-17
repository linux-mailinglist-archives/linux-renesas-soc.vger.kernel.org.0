Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865F26E430E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 11:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjDQJCK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 05:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjDQJCJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 05:02:09 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A245ABB;
        Mon, 17 Apr 2023 02:02:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,203,1677510000"; 
   d="scan'208";a="159710155"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Apr 2023 18:02:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.249])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D88CB400CEF2;
        Mon, 17 Apr 2023 18:02:04 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r9a07g054: Add MTU3a node
Date:   Mon, 17 Apr 2023 10:01:58 +0100
Message-Id: <20230417090159.191346-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add MTU3a node to R9A07G054 (RZ/V2L) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Driver and binding patches are in next [1]
[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=biju.das
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index cc11e5855d62..69d280e9b2e7 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -174,6 +174,76 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		mtu3: timer@10001200 {
+			compatible = "renesas,r9a07g054-mtu3",
+				     "renesas,rz-mtu3";
+			reg = <0 0x10001200 0 0xb00>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 174 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 175 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 176 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 181 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 182 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 183 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 184 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 185 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 186 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 187 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 192 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 194 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 201 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 202 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 205 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 207 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
+					  "tgiv0", "tgie0", "tgif0",
+					  "tgia1", "tgib1", "tgiv1", "tgiu1",
+					  "tgia2", "tgib2", "tgiv2", "tgiu2",
+					  "tgia3", "tgib3", "tgic3", "tgid3",
+					  "tgiv3",
+					  "tgia4", "tgib4", "tgic4", "tgid4",
+					  "tgiv4",
+					  "tgiu5", "tgiv5", "tgiw5",
+					  "tgia6", "tgib6", "tgic6", "tgid6",
+					  "tgiv6",
+					  "tgia7", "tgib7", "tgic7", "tgid7",
+					  "tgiv7",
+					  "tgia8", "tgib8", "tgic8", "tgid8",
+					  "tgiv8", "tgiu8";
+			clocks = <&cpg CPG_MOD R9A07G054_MTU_X_MCK_MTU3>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G054_MTU_X_PRESET_MTU3>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@10049c00 {
 			compatible = "renesas,r9a07g054-ssi",
 				     "renesas,rz-ssi";
-- 
2.25.1

