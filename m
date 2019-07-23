Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30B071D28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 18:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729558AbfGWQzz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 12:55:55 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:54927 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390765AbfGWQzy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 12:55:54 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 7A35E40005;
        Tue, 23 Jul 2019 16:55:49 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, fabrizio.castro@bp.renesas.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm: rcar_lvds: Fix dual link mode operations
Date:   Tue, 23 Jul 2019 18:57:00 +0200
Message-Id: <20190723165700.13124-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car LVDS encoder units support dual-link operations by splitting
the pixel output between the primary encoder and the companion one.

In order for the primary encoder to succesfully control the companion's
operations this should not fail at probe time and register itself its
associated drm bridge so that the primary one can find it.

Currently the companion encoder fails at probe time, causing the
registration of the primary to fail preventing the whole DU unit to be
registered correctly.

Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---
The "Fixes" tag refers to a patch currently part of the
renesas-drivers-2019-07-09-v5.2 branch of Geert's renesas-drivers tree.

 drivers/gpu/drm/rcar-du/rcar_lvds.c | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index bada7ee98544..8b015ba95895 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -767,14 +767,29 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 	of_node_put(remote_input);
 	of_node_put(remote);

-	/*
-	 * On D3/E3 the LVDS encoder provides a clock to the DU, which can be
-	 * used for the DPAD output even when the LVDS output is not connected.
-	 * Don't fail probe in that case as the DU will need the bridge to
-	 * control the clock.
-	 */
-	if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
-		return ret == -ENODEV ? 0 : ret;
+	switch (ret) {
+	case -ENODEV:
+		/*
+		 * On D3/E3 the LVDS encoder provides a clock to the DU, which
+		 * can be used for the DPAD output even when the LVDS output is
+		 * not connected. Don't fail probe in that case as the DU will
+		 * need the bridge to control the clock.
+		 */
+		if (lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)
+			ret = 0;
+		break;
+	case -ENXIO:
+		/*
+		 * When the LVDS output is used in dual link mode, the
+		 * companion encoder fails at
+		 * 'rcar_lvds_parse_dt_companion()'. Don't fail probe in
+		 * that case as the master encoder will need the companion's
+		 * bridge to control its operations.
+		 */
+		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
+			ret = 0;
+		break;
+	}

 	return ret;
 }
--
2.22.0

