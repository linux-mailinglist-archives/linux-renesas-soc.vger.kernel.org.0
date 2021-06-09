Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703D33A1B1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 18:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbhFIQjz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 12:39:55 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24418 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231934AbhFIQjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 12:39:53 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83736877"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 01:37:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 41E9140A2B81;
        Thu, 10 Jun 2021 01:37:56 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/3] arm64: dts: renesas: r9a07g044: Add SYSC node to RZ/G2L SoC DTSI
Date:   Wed,  9 Jun 2021 17:37:17 +0100
Message-Id: <20210609163717.3083-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SYSC node to RZ/G2L (R9A07G044) SoC DTSI

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 6a103a62eccb..476ee9a69065 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -99,6 +99,18 @@
 			#power-domain-cells = <0>;
 		};
 
+		sysc: system-controller@11020000 {
+			compatible = "renesas,r9a07g044-sysc";
+			reg = <0 0x11020000 0 0x10000>;
+			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "sys_lpm_int", "sys_ca55stbydone_int",
+					  "sys_cm33stbyr_int", "sys_ca55_deny";
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@11900000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.17.1

