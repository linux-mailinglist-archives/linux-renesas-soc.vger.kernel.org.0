Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34603458C6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 11:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239296AbhKVKmk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 05:42:40 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:41407 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235098AbhKVKmg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 05:42:36 -0500
X-IronPort-AV: E=Sophos;i="5.87,254,1631545200"; 
   d="scan'208";a="101057625"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2021 19:39:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.178])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 60BC24001962;
        Mon, 22 Nov 2021 19:39:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a07g044: Rename SDHI clocks
Date:   Mon, 22 Nov 2021 10:39:05 +0000
Message-Id: <20211122103905.14439-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
References: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename the below SDHI clocks to match with the clocks used in driver.

     imclk->core
     clk_hs->clkh
     imclk2->cd

Also re-arrange the clocks to match with the sorting order used in the
binding document.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 2dd6eff471cb..6d7dc4785161 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -613,10 +613,10 @@
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD R9A07G044_SDHI0_IMCLK>,
-				 <&cpg CPG_MOD R9A07G044_SDHI0_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G044_SDHI0_CLK_HS>,
+				 <&cpg CPG_MOD R9A07G044_SDHI0_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G044_SDHI0_ACLK>;
-			clock-names = "imclk", "imclk2", "clk_hs", "aclk";
+			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A07G044_SDHI0_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
@@ -629,10 +629,10 @@
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD R9A07G044_SDHI1_IMCLK>,
-				 <&cpg CPG_MOD R9A07G044_SDHI1_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G044_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A07G044_SDHI1_IMCLK2>,
 				 <&cpg CPG_MOD R9A07G044_SDHI1_ACLK>;
-			clock-names = "imclk", "imclk2", "clk_hs", "aclk";
+			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A07G044_SDHI1_IXRST>;
 			power-domains = <&cpg>;
 			status = "disabled";
-- 
2.17.1

