Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8EC45A671
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 16:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238399AbhKWPX2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 10:23:28 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:48108 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238415AbhKWPX1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 10:23:27 -0500
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 93A463C04C0;
        Tue, 23 Nov 2021 16:20:17 +0100 (CET)
Received: from vmlxhi-121.localdomain (10.72.92.132) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.20; Tue, 23 Nov
 2021 16:20:17 +0100
From:   Michael Rodin <mrodin@de.adit-jv.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <michael@rodin.online>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
Subject: [PATCH] drm: rcar-du: do not restart rcar-du groups on gen3
Date:   Tue, 23 Nov 2021 16:20:11 +0100
Message-ID: <1637680811-90510-1-git-send-email-mrodin@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.92.132]
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Restarting a display unit group can cause a visible flicker on the display.
Particularly when a LVDS display is connected to a Salvator board and an
HDMI display is (re)connected, then there will be 2 visible flickers on the
LVDS display:

 1. during atomic_flush (The need_restart flag is set in this case by
    rcar_du_vsp_enable.):
  rcar_du_crtc_atomic_flush
    rcar_du_crtc_update_planes
      ...
      ...
      /* Restart the group if plane sources have changed. */
      if (rcrtc->group->need_restart)
              rcar_du_group_restart(rcrtc->group);
 2. during atomic_enable:
  rcar_du_crtc_atomic_enable
    rcar_du_crtc_start
      rcar_du_group_start_stop(rcrtc->group, true);

To avoid flickers in all use cases, do not restart DU groups on the Gen3
SoCs at all, since it is not required any more.

Signed-off-by: Michael Rodin <mrodin@de.adit-jv.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 5 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 2 --
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 8665a1d..ff0a1c8 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -250,7 +250,7 @@ void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 	 * when the display controller will have to be restarted.
 	 */
 	if (start) {
-		if (rgrp->used_crtcs++ != 0)
+		if (rgrp->used_crtcs++ != 0 && rgrp->dev->info->gen != 3)
 			__rcar_du_group_start_stop(rgrp, false);
 		__rcar_du_group_start_stop(rgrp, true);
 	} else {
@@ -263,6 +263,9 @@ void rcar_du_group_restart(struct rcar_du_group *rgrp)
 {
 	rgrp->need_restart = false;
 
+	if (rgrp->dev->info->gen == 3)
+		return;
+
 	__rcar_du_group_start_stop(rgrp, false);
 	__rcar_du_group_start_stop(rgrp, true);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b0..a652c06 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -88,8 +88,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	 * Ensure that the plane source configuration takes effect by requesting
 	 * a restart of the group. See rcar_du_plane_atomic_update() for a more
 	 * detailed explanation.
-	 *
-	 * TODO: Check whether this is still needed on Gen3.
 	 */
 	crtc->group->need_restart = true;
 
-- 
2.7.4

