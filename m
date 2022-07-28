Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B00583EB8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Jul 2022 14:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238319AbiG1MXd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Jul 2022 08:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbiG1MXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 08:23:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C60A86C110;
        Thu, 28 Jul 2022 05:23:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,198,1654527600"; 
   d="scan'208";a="129460835"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2022 21:23:29 +0900
Received: from localhost.localdomain (unknown [10.226.93.50])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 02463400F4FB;
        Thu, 28 Jul 2022 21:23:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a07g054: Add DMA support to RSPI
Date:   Thu, 28 Jul 2022 13:23:12 +0100
Message-Id: <20220728122312.189766-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728122312.189766-1-biju.das.jz@bp.renesas.com>
References: <20220728122312.189766-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dmac phandles to RSPI nodes to support DMA operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 4d6b9d7684c9..bfb7e67b95a1 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -261,6 +261,8 @@ spi0: spi@1004ac00 {
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&cpg CPG_MOD R9A07G054_RSPI0_CLKB>;
 			resets = <&cpg R9A07G054_RSPI0_RST>;
+			dmas = <&dmac 0x2e95>, <&dmac 0x2e96>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -277,6 +279,8 @@ spi1: spi@1004b000 {
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&cpg CPG_MOD R9A07G054_RSPI1_CLKB>;
 			resets = <&cpg R9A07G054_RSPI1_RST>;
+			dmas = <&dmac 0x2e99>, <&dmac 0x2e9a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -293,6 +297,8 @@ spi2: spi@1004b400 {
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&cpg CPG_MOD R9A07G054_RSPI2_CLKB>;
 			resets = <&cpg R9A07G054_RSPI2_RST>;
+			dmas = <&dmac 0x2e9d>, <&dmac 0x2e9e>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			num-cs = <1>;
 			#address-cells = <1>;
-- 
2.25.1

