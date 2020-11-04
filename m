Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C492A62B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 11:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgKDKzQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 05:55:16 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:5188 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728741AbgKDKzP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 05:55:15 -0500
X-IronPort-AV: E=Sophos;i="5.77,450,1596466800"; 
   d="scan'208";a="61433724"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Nov 2020 19:55:13 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DA8754266B8F;
        Wed,  4 Nov 2020 19:55:11 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774e1: Add missing audio_clk_b
Date:   Wed,  4 Nov 2020 10:55:08 +0000
Message-Id: <20201104105508.21197-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add audio_clk_b configured as 0 Hz, this will be overridden by the
boards providing the audio clock.

Fixes: 8183a7938cfec ("arm64: dts: renesas: r8a774e1: Add audio support")
Reported-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Geert,

I have rebased this patch on renesas-arm-dt-for-v5.10 branch.

Cheers,
Prabhakar
---
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 9cbf963aa068..c29643442e91 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -28,6 +28,12 @@
 		clock-frequency = <0>;
 	};
 
+	audio_clk_b: audio_clk_b {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	audio_clk_c: audio_clk_c {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.17.1

