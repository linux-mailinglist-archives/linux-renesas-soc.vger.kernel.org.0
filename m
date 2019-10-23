Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5C98E1A95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389928AbfJWMdr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:33:47 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41652 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389899AbfJWMdq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:33:46 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id H0Zj2100t05gfCL010Zkg5; Wed, 23 Oct 2019 14:33:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003tg-Tf; Wed, 23 Oct 2019 14:33:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFpf-0003QG-Rr; Wed, 23 Oct 2019 14:33:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 02/11] soc: renesas: Add ARCH_R8A77960 for existing R-Car M3-W
Date:   Wed, 23 Oct 2019 14:33:33 +0200
Message-Id: <20191023123342.13100-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023123342.13100-1-geert+renesas@glider.be>
References: <20191023123342.13100-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add CONFIG_ARCH_R8A77960 as a new config symbol for R-Car M3-W
(R8A77960), to replace CONFIG_ARCH_R8A7796, and avoid confusion with
R-Car M3-W+ (R8A77961), which will use CONFIG_ARCH_R8A77961.

Note that for now, CONFIG_ARCH_R8A7796 is retained, and just selects
CONFIG_ARCH_R8A77960.  This relaxes dependencies of other subsystems on
the SoC configuration symbol, and provides a smooth transition path for
config files through "make oldconfig".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/soc/renesas/Kconfig       | 8 ++++++--
 drivers/soc/renesas/renesas-soc.c | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 328d7c409202e6a5..ce8e86a037d1d704 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -199,10 +199,14 @@ config ARCH_R8A7795
 	help
 	  This enables support for the Renesas R-Car H3 SoC.
 
-config ARCH_R8A7796
-	bool "Renesas R-Car M3-W SoC Platform"
+config ARCH_R8A77960
+	bool
 	select ARCH_RCAR_GEN3
 	select SYSC_R8A77960
+
+config ARCH_R8A7796
+	bool "Renesas R-Car M3-W SoC Platform"
+	select ARCH_R8A77960
 	help
 	  This enables support for the Renesas R-Car M3-W SoC.
 
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 45135bc88e277d34..319e47bb1d99cfcf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -262,7 +262,7 @@ static const struct of_device_id renesas_socs[] __initconst = {
 #ifdef CONFIG_ARCH_R8A7795
 	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
 #endif
-#ifdef CONFIG_ARCH_R8A7796
+#ifdef CONFIG_ARCH_R8A77960
 	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
 #endif
 #ifdef CONFIG_ARCH_R8A77965
-- 
2.17.1

