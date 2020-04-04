Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE1319E707
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Apr 2020 20:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgDDSUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Apr 2020 14:20:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37848 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbgDDSUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Apr 2020 14:20:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F82D312;
        Sat,  4 Apr 2020 20:20:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586024431;
        bh=XOLvUS/nwQ8k+iOW9cXQxOb3zLwHL8lCzE8BHfpfC3k=;
        h=From:To:Cc:Subject:Date:From;
        b=H2Ts6cj5O8Y1aS1Crk2GIoBqRnpH3mlUCPicsW/sdihfwr/fT97aUFoVEqR8t1WA2
         0jeydb5hfDeAybQcjJ2F7ELa/s+XTGrlosm1L3YHN6dOZD9PZdQWAt0dQ86poasoui
         d9UhdZEbZ4jAm9IukGHjDh5Hldcph0iiCU1S7yRo=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomohito Esaki <etom@igel.co.jp>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm: rcar-du: Set primary plane zpos immutably at initializing
Date:   Sat,  4 Apr 2020 21:20:15 +0300
Message-Id: <20200404182015.26481-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Tomohito Esaki <etom@igel.co.jp>

According to drm_plane_create_zpos_property() function documentation,
all planes zpos range should be set if zpos property is supported.
However, the rcar-du driver didn't set primary plane zpos range. Since
the primary plane's zpos is fixed, set it immutably.

Reported-by: Yoshihito Ogawa <yoshihito.ogawa.kc@renesas.com>
Reported-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Daniel Stone <daniels@collabora.com>
[Turn continue into if ... else ...]
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 16 +++++++++-------
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 14 ++++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index c6430027169f..a0021fc25b27 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -785,13 +785,15 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 
 		drm_plane_create_alpha_property(&plane->plane);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY)
-			continue;
-
-		drm_object_attach_property(&plane->plane.base,
-					   rcdu->props.colorkey,
-					   RCAR_DU_COLORKEY_NONE);
-		drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			drm_plane_create_zpos_immutable_property(&plane->plane,
+								 0);
+		} else {
+			drm_object_attach_property(&plane->plane.base,
+						   rcdu->props.colorkey,
+						   RCAR_DU_COLORKEY_NONE);
+			drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 5e4faf258c31..f1a81c9b184d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -392,12 +392,14 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		drm_plane_helper_add(&plane->plane,
 				     &rcar_du_vsp_plane_helper_funcs);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY)
-			continue;
-
-		drm_plane_create_alpha_property(&plane->plane);
-		drm_plane_create_zpos_property(&plane->plane, 1, 1,
-					       vsp->num_planes - 1);
+		if (type == DRM_PLANE_TYPE_PRIMARY) {
+			drm_plane_create_zpos_immutable_property(&plane->plane,
+								 0);
+		} else {
+			drm_plane_create_alpha_property(&plane->plane);
+			drm_plane_create_zpos_property(&plane->plane, 1, 1,
+						       vsp->num_planes - 1);
+		}
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

