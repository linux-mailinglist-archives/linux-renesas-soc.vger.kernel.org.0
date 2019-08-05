Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7784E8217F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 18:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbfHEQR2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 12:17:28 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:55327 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbfHEQR1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 12:17:27 -0400
X-Originating-IP: 79.51.24.150
Received: from uno.homenet.telecomitalia.it (host150-24-dynamic.51-79-r.retail.telecomitalia.it [79.51.24.150])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D4E52C000B;
        Mon,  5 Aug 2019 16:17:23 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, fabrizio.castro@bp.renesas.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm: rcar_lvds: Fix dual link mode operations
Date:   Mon,  5 Aug 2019 18:18:37 +0200
Message-Id: <20190805161837.11856-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car LVDS encoder units support dual-link operations by splitting
the pixel output between the primary encoder and the companion one.

Currently the companion encoder fails at probe time, causing the
registration of the primary to fail as well, preventing the whole DU unit
from being registered at all.

Fix this by not bailing out from probe with error if the
"renesas,companion" property is not specified.

Fixes: fa440d870358 ("drm: rcar-du: lvds: Add support for dual-link mode")
Reported-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index bada7ee98544..0b872d00760b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -662,10 +662,8 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)

 	/* Locate the companion LVDS encoder for dual-link operation, if any. */
 	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
-	if (!companion) {
-		dev_err(dev, "Companion LVDS encoder not found\n");
-		return -ENXIO;
-	}
+	if (!companion)
+		return 0;

 	/*
 	 * Sanity check: the companion encoder must have the same compatible
--
2.22.0

