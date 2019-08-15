Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521268E98E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 13:05:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730559AbfHOLFa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 07:05:30 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:34169 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726008AbfHOLFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 07:05:30 -0400
X-IronPort-AV: E=Sophos;i="5.64,389,1559487600"; 
   d="scan'208";a="23867492"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Aug 2019 20:05:28 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 07C40417763E;
        Thu, 15 Aug 2019 20:05:23 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 8/9] drm/panel: lvds: Add support for the IDK-2121WR
Date:   Thu, 15 Aug 2019 12:04:32 +0100
Message-Id: <1565867073-24746-9-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The IDK-2121WR from Advantech is a dual-LVDS display.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v1->v2:
* new patch

 drivers/gpu/drm/panel/panel-lvds.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 1ec57d0..2cd41757 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -22,6 +22,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_timings.h>
 
 struct panel_lvds {
 	struct drm_panel panel;
@@ -259,6 +260,7 @@ static int panel_lvds_probe(struct platform_device *pdev)
 	/* Register the panel. */
 	drm_panel_init(&lvds->panel);
 	lvds->panel.dev = lvds->dev;
+	lvds->panel.timings = of_device_get_match_data(lvds->dev);
 	lvds->panel.funcs = &panel_lvds_funcs;
 
 	ret = drm_panel_add(&lvds->panel);
@@ -287,7 +289,13 @@ static int panel_lvds_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct drm_timings advantech_idk_2121wr = {
+	.dual_link = true,
+	.link_flags = DRM_LINK_DUAL_LVDS_ODD_EVEN,
+};
+
 static const struct of_device_id panel_lvds_of_table[] = {
+	{ .compatible = "advantech,idk-2121wr", .data = &advantech_idk_2121wr},
 	{ .compatible = "panel-lvds", },
 	{ /* Sentinel */ },
 };
-- 
2.7.4

