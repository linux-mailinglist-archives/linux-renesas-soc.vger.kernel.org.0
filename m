Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A693B587A7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Aug 2022 12:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236586AbiHBKPw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Aug 2022 06:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236649AbiHBKPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Aug 2022 06:15:45 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 91F3B1D319;
        Tue,  2 Aug 2022 03:15:43 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,210,1654527600"; 
   d="scan'208";a="130048822"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2022 19:15:43 +0900
Received: from localhost.localdomain (unknown [10.226.92.246])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4F4A7400D4DE;
        Tue,  2 Aug 2022 19:15:40 +0900 (JST)
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
Subject: [PATCH 2/3] arm64: dts: renesas: r9a07g054: Fix SCI{Rx,Tx} interrupt type
Date:   Tue,  2 Aug 2022 11:15:33 +0100
Message-Id: <20220802101534.1401342-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802101534.1401342-1-biju.das.jz@bp.renesas.com>
References: <20220802101534.1401342-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per the RZ/V2L Hardware User's Manual (Rev.1.00 Nov, 2021),
the interrupt type of SCI{Rx,TX} is edge triggered.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index bfb7e67b95a1..8f8bfe43b4df 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -405,8 +405,8 @@ sci0: serial@1004d000 {
 			compatible = "renesas,r9a07g054-sci", "renesas,sci";
 			reg = <0 0x1004d000 0 0x400>;
 			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 407 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "eri", "rxi", "txi", "tei";
 			clocks = <&cpg CPG_MOD R9A07G054_SCI0_CLKP>;
@@ -420,8 +420,8 @@ sci1: serial@1004d400 {
 			compatible = "renesas,r9a07g054-sci", "renesas,sci";
 			reg = <0 0x1004d400 0 0x400>;
 			interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 411 IRQ_TYPE_EDGE_RISING>,
 				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "eri", "rxi", "txi", "tei";
 			clocks = <&cpg CPG_MOD R9A07G054_SCI1_CLKP>;
-- 
2.25.1

