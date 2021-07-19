Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23123CD5E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 15:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239312AbhGSNAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 09:00:39 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:53543 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S239333AbhGSNAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 09:00:38 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88083393"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2021 22:41:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.148])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D7D4B425839B;
        Mon, 19 Jul 2021 22:41:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 8/8] arm64: dts: renesas: r9a07g044: Add SSI DMA support
Date:   Mon, 19 Jul 2021 14:40:40 +0100
Message-Id: <20210719134040.7964-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SSI DMA support to SoC DTS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 17bd09641529..a08deca44086 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -100,6 +100,9 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x255>,
+			       <&dmac 0x256>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -120,6 +123,9 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x259>,
+			       <&dmac 0x25a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -140,6 +146,8 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x25f>;
+			dma-names = "rt";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -160,6 +168,9 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x261>,
+			       <&dmac 0x262>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
-- 
2.17.1

