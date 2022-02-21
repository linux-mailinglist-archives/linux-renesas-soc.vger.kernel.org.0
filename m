Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05F3C4BDCCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:42:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380261AbiBUQ1P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 11:27:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380573AbiBUQ1D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 11:27:03 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A743227B29
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 08:26:20 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:49dc:a1b5:3fe0:3d2b])
        by baptiste.telenet-ops.be with bizsmtp
        id xsSJ260083YJRAw01sSJq1; Mon, 21 Feb 2022 17:26:18 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBVx-001TiT-Ov; Mon, 21 Feb 2022 17:26:17 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nMBVx-006G2O-19; Mon, 21 Feb 2022 17:26:17 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm: rcar-du: Simplify division/shift logic
Date:   Mon, 21 Feb 2022 17:26:15 +0100
Message-Id: <aee36069582647a0841ec8b49c4c824f901a3f9f.1645460725.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"a / (1 << b)" == "a >> b".

No change in generated code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 72a272cfc11ee129..30afc1d3482a9670 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -229,7 +229,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 				 * the PLL, followed by a an optional fixed /7
 				 * divider.
 				 */
-				fout = fvco / (1 << e) / div7;
+				fout = (fvco >> e) / div7;
 				div = max(1UL, DIV_ROUND_CLOSEST(fout, target));
 				diff = abs(fout / div - target);
 
@@ -249,7 +249,7 @@ static void rcar_lvds_d3_e3_pll_calc(struct rcar_lvds *lvds, struct clk *clk,
 	}
 
 done:
-	output = fin * pll->pll_n / pll->pll_m / (1 << pll->pll_e)
+	output = (fin * pll->pll_n / pll->pll_m >> pll->pll_e)
 	       / div7 / pll->div;
 	error = (long)(output - target) * 10000 / (long)target;
 
-- 
2.25.1

