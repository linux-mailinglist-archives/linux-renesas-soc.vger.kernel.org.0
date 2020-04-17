Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8C81AD76B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 09:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728939AbgDQH3H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 03:29:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:27166 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728801AbgDQH3H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 03:29:07 -0400
X-IronPort-AV: E=Sophos;i="5.72,394,1580742000"; 
   d="scan'208";a="44773257"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Apr 2020 16:29:05 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3D9D841E1678;
        Fri, 17 Apr 2020 16:29:05 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a77980: Fix IPMMU VIP[01] nodes
Date:   Fri, 17 Apr 2020 16:29:03 +0900
Message-Id: <1587108543-23786-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Missing the renesas,ipmmu-main property on ipmmu_vip[01] nodes.

Fixes: 55697cbb44e4 ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes)
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index e01b050..d672b32 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1318,6 +1318,7 @@
 		ipmmu_vip0: mmu@e7b00000 {
 			compatible = "renesas,ipmmu-r8a77980";
 			reg = <0 0xe7b00000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
@@ -1325,6 +1326,7 @@
 		ipmmu_vip1: mmu@e7960000 {
 			compatible = "renesas,ipmmu-r8a77980";
 			reg = <0 0xe7960000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 11>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			#iommu-cells = <1>;
 		};
-- 
2.7.4

