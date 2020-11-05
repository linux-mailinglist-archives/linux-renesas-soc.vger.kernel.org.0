Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A618D2A7E59
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Nov 2020 13:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgKEMLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Nov 2020 07:11:51 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:42336 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725468AbgKEMLv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 07:11:51 -0500
X-IronPort-AV: E=Sophos;i="5.77,453,1596466800"; 
   d="scan'208";a="61764979"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2020 21:11:50 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7582C42CCE89;
        Thu,  5 Nov 2020 21:11:48 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: hihope-rev4: Add a comment explaining switch SW2404 required for audio_clk_b
Date:   Thu,  5 Nov 2020 12:11:27 +0000
Message-Id: <20201105121127.11830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Switch SW2404 should be at poistion 1 so that clock output from CS2000
is connected to AUDIO_CLKB_A.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 3046c07a288b..929f4a1d3f90 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -91,7 +91,11 @@
 	#clock-cells = <1>;
 	clock-frequency = <12288000 11289600>;
 
-	/* update <audio_clk_b> to <cs2000> */
+	/*
+	 * Update <audio_clk_b> to <cs2000>
+	 * Switch SW2404 should be at position 1 so that clock from
+	 * CS2000 is connected to AUDIO_CLKB_A
+	 */
 	clocks = <&cpg CPG_MOD 1005>,
 		 <&cpg CPG_MOD 1006>, <&cpg CPG_MOD 1007>,
 		 <&cpg CPG_MOD 1008>, <&cpg CPG_MOD 1009>,
-- 
2.17.1

