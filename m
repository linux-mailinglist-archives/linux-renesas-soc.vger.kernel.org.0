Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4683E54EE9C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jun 2022 03:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379455AbiFQBCV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jun 2022 21:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiFQBCU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 21:02:20 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DDFE357B3C
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jun 2022 18:02:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,306,1650898800"; 
   d="scan'208";a="123183413"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jun 2022 10:02:19 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F4664004BB2;
        Fri, 17 Jun 2022 10:02:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] arm64: dts: renesas: r8a779f0: Fix IPMMU compatible strings
Date:   Fri, 17 Jun 2022 10:01:54 +0900
Message-Id: <20220617010154.3229844-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix IPMMU compatible strings for R-Car S4-8 (r8a779f0).

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 4ff21ed92697 ("arm64: dts: renesas: r8a779f0: Add IPMMU nodes")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index ad8c77edb126..60419fcee16c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -361,7 +361,7 @@ dmac1: dma-controller@e7351000 {
 
 		ipmmu_rt0: iommu@ee480000 {
 			compatible = "renesas,ipmmu-r8a779f0",
-				     "renesas,rcar-gen4-ipmmu";
+				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xee480000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 10>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -370,7 +370,7 @@ ipmmu_rt0: iommu@ee480000 {
 
 		ipmmu_rt1: iommu@ee4c0000 {
 			compatible = "renesas,ipmmu-r8a779f0",
-				     "renesas,rcar-gen4-ipmmu";
+				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xee4c0000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 19>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -379,7 +379,7 @@ ipmmu_rt1: iommu@ee4c0000 {
 
 		ipmmu_ds0: iommu@eed00000 {
 			compatible = "renesas,ipmmu-r8a779f0",
-				     "renesas,rcar-gen4-ipmmu";
+				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed00000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 0>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -388,7 +388,7 @@ ipmmu_ds0: iommu@eed00000 {
 
 		ipmmu_hc: iommu@eed40000 {
 			compatible = "renesas,ipmmu-r8a779f0",
-				     "renesas,rcar-gen4-ipmmu";
+				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeed40000 0 0x20000>;
 			renesas,ipmmu-main = <&ipmmu_mm 2>;
 			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
@@ -397,7 +397,7 @@ ipmmu_hc: iommu@eed40000 {
 
 		ipmmu_mm: iommu@eefc0000 {
 			compatible = "renesas,ipmmu-r8a779f0",
-				     "renesas,rcar-gen4-ipmmu";
+				     "renesas,rcar-gen4-ipmmu-vmsa";
 			reg = <0 0xeefc0000 0 0x20000>;
 			interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

