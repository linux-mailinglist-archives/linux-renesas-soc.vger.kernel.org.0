Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CCA8B476E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 08:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387735AbfIQGYA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 02:24:00 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:54238 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387513AbfIQGYA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 02:24:00 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id 2WPv2100605gfCL01WPvzg; Tue, 17 Sep 2019 08:23:57 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iA6u3-00067C-3X; Tue, 17 Sep 2019 08:23:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iA6u3-0004QN-1k; Tue, 17 Sep 2019 08:23:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: rcar_lvds: Fix color mismatches on R-Car H2 ES2.0 and later
Date:   Tue, 17 Sep 2019 08:23:53 +0200
Message-Id: <20190917062353.16966-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 5cca30ebe089be23 ("drm/rcar-du: Add LVDS_LANES quirk") states
that LVDS lanes 1 and 3 are inverted on R-Car H2 ES1 only, and that the
problem has been fixed in newer revisions.

However, the code didn't take into account the actual hardware revision,
thus applying the quirk also on newer hardware revisions, causing green
color reversals.

Fix this by applying the quirk when running on R-Car H2 ES1.x only.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Fixes: c6a27fa41fabb35f ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Does anyone know if this was fixed in ES2.0, or in any earlier ES1.x?

While the issue was present before aforementioned commit, I do not think
there is a real need to fix the older code variant, as the new LVDS
encoder was backported to v4.14-ltsi.
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 3fc7e6899cab5843..50c11a7f0467f746 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -842,8 +843,23 @@ static int rcar_lvds_get_clocks(struct rcar_lvds *lvds)
 	return 0;
 }
 
+static const struct rcar_lvds_device_info rcar_lvds_r8a7790es1_info = {
+	.gen = 2,
+	.quirks = RCAR_LVDS_QUIRK_LANES,
+	.pll_setup = rcar_lvds_pll_setup_gen2,
+};
+
+static const struct soc_device_attribute lvds_quirk_matches[] = {
+	{
+		.soc_id = "r8a7790", .revision = "ES1.*",
+		.data = &rcar_lvds_r8a7790es1_info,
+	},
+	{ /* sentinel */ }
+};
+
 static int rcar_lvds_probe(struct platform_device *pdev)
 {
+	const struct soc_device_attribute *attr;
 	struct rcar_lvds *lvds;
 	struct resource *mem;
 	int ret;
@@ -857,6 +873,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
 	lvds->dev = &pdev->dev;
 	lvds->info = of_device_get_match_data(&pdev->dev);
 
+	attr = soc_device_match(lvds_quirk_matches);
+	if (attr)
+		lvds->info = attr->data;
+
 	ret = rcar_lvds_parse_dt(lvds);
 	if (ret < 0)
 		return ret;
@@ -893,12 +913,6 @@ static const struct rcar_lvds_device_info rcar_lvds_gen2_info = {
 	.pll_setup = rcar_lvds_pll_setup_gen2,
 };
 
-static const struct rcar_lvds_device_info rcar_lvds_r8a7790_info = {
-	.gen = 2,
-	.quirks = RCAR_LVDS_QUIRK_LANES,
-	.pll_setup = rcar_lvds_pll_setup_gen2,
-};
-
 static const struct rcar_lvds_device_info rcar_lvds_gen3_info = {
 	.gen = 3,
 	.quirks = RCAR_LVDS_QUIRK_PWD,
@@ -930,7 +944,7 @@ static const struct of_device_id rcar_lvds_of_table[] = {
 	{ .compatible = "renesas,r8a7744-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a774a1-lvds", .data = &rcar_lvds_gen3_info },
 	{ .compatible = "renesas,r8a774c0-lvds", .data = &rcar_lvds_r8a77990_info },
-	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_r8a7790_info },
+	{ .compatible = "renesas,r8a7790-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7791-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7793-lvds", .data = &rcar_lvds_gen2_info },
 	{ .compatible = "renesas,r8a7795-lvds", .data = &rcar_lvds_gen3_info },
-- 
2.17.1

