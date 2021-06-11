Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D1E3A44D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 17:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhFKPXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 11:23:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:5358 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229517AbhFKPXV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 11:23:21 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="84111100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Jun 2021 00:21:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 845E4400618F;
        Sat, 12 Jun 2021 00:21:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a07g044: Add missing GICv3 node properties
Date:   Fri, 11 Jun 2021 16:21:08 +0100
Message-Id: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the below missing properties into GIC node,
- clocks
- clock-names
- power-domains
- resets

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,

This patch depends on patch [1] + patch series [2].

[1] https://lore.kernel.org/linux-devicetree/
    20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498915

Cheers,
Prabhakar
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 2ffdaed6c9a5..81097f1e242c 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -157,6 +157,10 @@
 			reg = <0x0 0x11900000 0 0x40000>,
 			      <0x0 0x11940000 0 0x60000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_GIC600>;
+			clock-names = "aclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_CLK_GIC600>;
 		};
 
 		usbphyctrl: usbphyctrl@11c40000 {
-- 
2.17.1

