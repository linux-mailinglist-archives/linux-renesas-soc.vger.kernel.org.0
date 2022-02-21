Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56E94BDDF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343840AbiBUROW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 12:14:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381515AbiBUROU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 12:14:20 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB102611D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 09:13:57 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14DD2993;
        Mon, 21 Feb 2022 18:13:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1645463635;
        bh=TilVVpq2XojcrwNSeLxSeORLbVKOAAbOi/O8iL25oPA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gy90b3Qc27Khyu0scuwi535HfD7cmP0f5VJwLy9vND70hrJZ1oPEDWoUAs6JCTD+o
         urOmAJqKFzvcHfZQbclVI6WFWwgrS1EZeej1hGjrk5kd4aEFPuAPjw0aUYL/pX7rjw
         YkUk8goF1Jr+Rg0aJb5OOo4RNASKUXoESmB9Zpsw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Michael Rodin <mrodin@de.adit-jv.com>, michael@rodin.online,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: [PATCH 2/2] drm: rcar-du: Don't restart group when enabling plane on Gen3
Date:   Mon, 21 Feb 2022 19:13:40 +0200
Message-Id: <20220221171340.11113-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220221171340.11113-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Gen3 hardware enabling a VSP plane doesn't change any register that
requires DRES to take effect. Avoid a group restart in that case.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 6 ++++++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 9 ---------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 9b058d6cb032..22aeeb1cc1fb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -560,6 +560,12 @@ void __rcar_du_plane_setup(struct rcar_du_group *rgrp,
 		if (rcdu->vspd1_sink != vspd1_sink) {
 			rcdu->vspd1_sink = vspd1_sink;
 			rcar_du_set_dpad0_vsp1_routing(rcdu);
+
+			/*
+			 * Changes to the VSP1 sink take effect on DRES and thus
+			 * need a restart of the group.
+			 */
+			rgrp->need_restart = true;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index b7fc5b069cbc..32530d698e75 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -84,15 +84,6 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 
 	__rcar_du_plane_setup(crtc->group, &state);
 
-	/*
-	 * Ensure that the plane source configuration takes effect by requesting
-	 * a restart of the group. See rcar_du_plane_atomic_update() for a more
-	 * detailed explanation.
-	 *
-	 * TODO: Check whether this is still needed on Gen3.
-	 */
-	crtc->group->need_restart = true;
-
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
 
-- 
Regards,

Laurent Pinchart

