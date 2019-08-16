Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC6890149
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 14:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727163AbfHPMWh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 08:22:37 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47712 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727134AbfHPMWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 08:22:37 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id poNY2000b05gfCL01oNYu2; Fri, 16 Aug 2019 14:22:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hybFY-0005C4-R8; Fri, 16 Aug 2019 14:22:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hybFY-0003Ry-Op; Fri, 16 Aug 2019 14:22:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7779: Use SYSC "always-on" PM Domain for HSCIF
Date:   Fri, 16 Aug 2019 14:22:29 +0200
Message-Id: <20190816122229.13157-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hook up HSCIF serial devices that are part of the CPG/MSTP Clock Domain
to the SYSC "always-on" PM Domain, for a more consistent
device-power-area description in DT.

Cfr. commit 751e29bbb64ad091 ("ARM: dts: r8a7779: Use SYSC "always-on" PM Domain").

Fixes: 055d15a88f66b096 ("ARM: dts: r8a7779: Add HSCIF0/1 device nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v5.4.

 arch/arm/boot/dts/r8a7779.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 3ff2592075275555..ebf5b7cfe21599c6 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -296,7 +296,7 @@
 			 <&cpg_clocks R8A7779_CLK_S>,
 			 <&scif_clk>;
 		clock-names = "fck", "brg_int", "scif_clk";
-		power-domains = <&cpg_clocks>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
 
@@ -309,7 +309,7 @@
 			 <&cpg_clocks R8A7779_CLK_S>,
 			 <&scif_clk>;
 		clock-names = "fck", "brg_int", "scif_clk";
-		power-domains = <&cpg_clocks>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
 		status = "disabled";
 	};
 
-- 
2.17.1

