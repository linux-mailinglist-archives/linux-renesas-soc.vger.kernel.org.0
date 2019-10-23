Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3956E1A15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391316AbfJWM3s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:29:48 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:35644 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391324AbfJWM3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:29:47 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id H0Vl2100j05gfCL010Vm2x; Wed, 23 Oct 2019 14:29:46 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0000eV-T4; Wed, 23 Oct 2019 14:29:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlp-0003E2-RP; Wed, 23 Oct 2019 14:29:45 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/4] clk: renesas: Rename CLK_R8A7796 to CLK_R8A77960
Date:   Wed, 23 Oct 2019 14:29:40 +0200
Message-Id: <20191023122941.12342-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023122941.12342-1-geert+renesas@glider.be>
References: <20191023122941.12342-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Rename CONFIG_CLK_R8A7796 for R-Car M3-W (R8A77960) to
CONFIG_CLK_R8A77960, to avoid confusion with R-Car M3-W+ (R8A77961),
which will use CONFIG_CLK_R8A77961.

Extend the dependency of CONFIG_CLK_R8A77960 from CONFIG_ARCH_R8A7796 to
CONFIG_ARCH_R8A77960, to relax dependencies for a future rename of the
SoC configuration symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/clk/renesas/Kconfig            | 4 ++--
 drivers/clk/renesas/Makefile           | 2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index be03bb74801252bc..a48f75ec1400c090 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -21,7 +21,7 @@ config CLK_RENESAS
 	select CLK_R8A7792 if ARCH_R8A7792
 	select CLK_R8A7794 if ARCH_R8A7794
 	select CLK_R8A7795 if ARCH_R8A7795
-	select CLK_R8A7796 if ARCH_R8A7796
+	select CLK_R8A77960 if ARCH_R8A77960 || ARCH_R8A7796
 	select CLK_R8A77965 if ARCH_R8A77965
 	select CLK_R8A77970 if ARCH_R8A77970
 	select CLK_R8A77980 if ARCH_R8A77980
@@ -109,7 +109,7 @@ config CLK_R8A7795
 	bool "R-Car H3 clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
-config CLK_R8A7796
+config CLK_R8A77960
 	bool "R-Car M3-W clock support" if COMPILE_TEST
 	select CLK_RCAR_GEN3_CPG
 
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index ef0fdd00d2b741b2..58211d0f04bf4d4b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_CLK_R8A7791)		+= r8a7791-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7792)		+= r8a7792-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7794)		+= r8a7794-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A7795)		+= r8a7795-cpg-mssr.o
-obj-$(CONFIG_CLK_R8A7796)		+= r8a7796-cpg-mssr.o
+obj-$(CONFIG_CLK_R8A77960)		+= r8a7796-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77965)		+= r8a77965-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77970)		+= r8a77970-cpg-mssr.o
 obj-$(CONFIG_CLK_R8A77980)		+= r8a77980-cpg-mssr.o
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 35966678148e2c8b..c2f96e63498e14cc 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -749,7 +749,7 @@ static const struct of_device_id cpg_mssr_match[] = {
 		.data = &r8a7795_cpg_mssr_info,
 	},
 #endif
-#ifdef CONFIG_CLK_R8A7796
+#ifdef CONFIG_CLK_R8A77960
 	{
 		.compatible = "renesas,r8a7796-cpg-mssr",
 		.data = &r8a7796_cpg_mssr_info,
-- 
2.17.1

