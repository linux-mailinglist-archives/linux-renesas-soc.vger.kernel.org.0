Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E07155458E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbiFIXzm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiFIXzl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:55:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 864113AA42
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:55:40 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C615D6CF;
        Fri, 10 Jun 2022 01:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818939;
        bh=bUAnnkB0+RRerAUlNojTPxGZcNjmTLfHTFwRZ7umC0E=;
        h=From:To:Cc:Subject:Date:From;
        b=Fm/vmoAKEmPA5EIkRyYMB7I/3fx9IruQGPFXA3xqdub5udHaPSzyIblRiQqd9ggHD
         dHdpQXaJTfk959avkOMUG78IIQ8JTU8iPSdSKq3Vg87gRrtka4EVlDH2+A6jQccpQi
         LRhSJn2Ka8LSG/25LURk9B5BR0c1S7x1X8clQez0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Lift z-pos restriction on primary plane for Gen3
Date:   Fri, 10 Jun 2022 02:55:29 +0300
Message-Id: <20220609235529.22254-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There's no reason to require the primary plane to always be at the
bottom of the stack, as the VSP supports arbitrary ordering of planes,
and the KMS API doesn't have such a requirement either. Lift the
restriction.

As the primary plane can now be positioned arbitrarily, enable control
of its alpha channel as well.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 6b535abd799a..356861de17b0 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -431,14 +431,9 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		drm_plane_helper_add(&plane->plane,
 				     &rcar_du_vsp_plane_helper_funcs);
 
-		if (type == DRM_PLANE_TYPE_PRIMARY) {
-			drm_plane_create_zpos_immutable_property(&plane->plane,
-								 0);
-		} else {
-			drm_plane_create_alpha_property(&plane->plane);
-			drm_plane_create_zpos_property(&plane->plane, 1, 1,
-						       num_planes - 1);
-		}
+		drm_plane_create_alpha_property(&plane->plane);
+		drm_plane_create_zpos_property(&plane->plane, i, 0,
+					       num_planes - 1);
 
 		vsp->num_planes++;
 	}

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
Regards,

Laurent Pinchart

