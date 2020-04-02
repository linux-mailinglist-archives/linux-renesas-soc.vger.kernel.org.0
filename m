Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73C4119BF81
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 12:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387984AbgDBKks (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 06:40:48 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40898 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbgDBKks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 06:40:48 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 155D580E;
        Thu,  2 Apr 2020 12:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585824047;
        bh=zexcxHTvs3Clc1+zo3EKPdnRieJB95Z8ud4HjoyHT3s=;
        h=From:To:Cc:Subject:Date:From;
        b=OeuZRPgsmlNzJ1fT6o3P8Gd1xuZb6wNJjI6Ar2p6Ovvb+gmnxrIifidOCWpmqSm3t
         YG04L19YX0ZMmmpVcuytQXr4tW6VkNbu6iQjpETFz0Qp3scXDy8pzHmTZqwuSjR47u
         jVXDO4Gw243ZkmVXDl1CtS1Xc5Jdg/J3J7Pn1ulI=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] drm: rcar-du: Create immutable zpos property for primary planes
Date:   Thu,  2 Apr 2020 13:40:35 +0300
Message-Id: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
all the overlay planes, but leaves the primary plane without a zpos
property. The DRM/KMS API doesn't clearly specify if this is acceptable,
of it the property is mandatory for all planes when exposed for some of
the planes. Nonetheless, weston v8.0 has been reported to have trouble
handling this situation.

The DRM core offers support for immutable zpos properties. Creating an
immutable zpos property set to 0 for the primary planes seems to be a
good way forward, as it shouldn't introduce any regression, and can fix
the issue. Do so.

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

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
-- 
Regards,

Laurent Pinchart

