Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7BA41305A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Sep 2021 10:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhIUIrp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Sep 2021 04:47:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:50341 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231168AbhIUIrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Sep 2021 04:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.85,310,1624287600"; 
   d="scan'208";a="94564269"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Sep 2021 17:46:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.242])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7827B40061B7;
        Tue, 21 Sep 2021 17:46:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] arm64: dts: renesas: r9a07g044: Add DMA support to SSI
Date:   Tue, 21 Sep 2021 09:46:02 +0100
Message-Id: <20210921084605.16250-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dmac phandles to SSI nodes to support DMA operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 49f579856f14..95d80d1f0c6a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -106,6 +106,9 @@
 				 <&audio_clk1>, <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x2655>,
+			       <&dmac 0x2656>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -125,6 +128,9 @@
 				 <&audio_clk1>, <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x2659>,
+			       <&dmac 0x265a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -144,6 +150,8 @@
 				 <&audio_clk1>, <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x265f>;
+			dma-names = "rt";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -163,6 +171,9 @@
 				 <&audio_clk1>, <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x2661>,
+			       <&dmac 0x2662>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
-- 
2.17.1

