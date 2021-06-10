Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAAA33A286B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 11:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhFJJjl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 05:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFJJji (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 05:39:38 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8959C061224
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jun 2021 02:37:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a946:bccb:b1a1:3055])
        by laurent.telenet-ops.be with bizsmtp
        id FMdf2500X0wnyou01Mdf6g; Thu, 10 Jun 2021 11:37:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH87-00FDX2-5F; Thu, 10 Jun 2021 11:37:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrH85-00BTlZ-OT; Thu, 10 Jun 2021 11:37:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 03/14] pinctrl: renesas: Fix pin control matching on R-Car H3e-2G
Date:   Thu, 10 Jun 2021 11:37:16 +0200
Message-Id: <ab1acd836e990c536ff3a8c715ce57363d3ff8cb.1623315732.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623315732.git.geert+renesas@glider.be>
References: <cover.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As R-Car H3 ES1.x (R8A77950) and R-Car ES2.0+ (R8A77951) use the same
compatible value, the pin control driver relies on soc_device_match()
with soc_id = "r8a7795" and the (non)matching of revision = "ES1.*" to
match with and distinguish between the two SoC variants.  The
corresponding entries in the normal of_match_table are present only to
make the optional sanity checks work.

The R-Car H3e-2G (R8A779M1) SoC is a different grading of the R-Car H3
ES3.0 (R8A77951) SoC.  It uses the same compatible values for individual
devices, but has an additional compatible value for the root node.
When running on an R-Car H3e-2G SoC, soc_device_match() with soc_id =
"r8a7795" does not return a match.  Hence the pin control driver falls
back to the normal of_match_table, and, as the R8A77950 entry is listed
first, incorrectly uses the sub-driver for R-Car H3 ES1.x.

Fix this by moving the entry for R8A77951 before the entry for R8A77950.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 5ccc49b387f17eb9..9adb97065704270d 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -571,17 +571,21 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a7794_pinmux_info,
 	},
 #endif
-/* Both r8a7795 entries must be present to make sanity checks work */
-#ifdef CONFIG_PINCTRL_PFC_R8A77950
+/*
+ * Both r8a7795 entries must be present to make sanity checks work, but only
+ * the first entry is actually used, for R-Car H3e.
+ * R-Car H3 ES1.x and ES2.0+ are matched using soc_device_match() instead.
+ */
+#ifdef CONFIG_PINCTRL_PFC_R8A77951
 	{
 		.compatible = "renesas,pfc-r8a7795",
-		.data = &r8a77950_pinmux_info,
+		.data = &r8a77951_pinmux_info,
 	},
 #endif
-#ifdef CONFIG_PINCTRL_PFC_R8A77951
+#ifdef CONFIG_PINCTRL_PFC_R8A77950
 	{
 		.compatible = "renesas,pfc-r8a7795",
-		.data = &r8a77951_pinmux_info,
+		.data = &r8a77950_pinmux_info,
 	},
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A77960
-- 
2.25.1

