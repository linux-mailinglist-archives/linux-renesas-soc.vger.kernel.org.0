Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E948248CA38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355941AbiALRrN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:47:13 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59315 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1343961AbiALRqy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:46:54 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824728"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:46:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 226BB4000913;
        Thu, 13 Jan 2022 02:46:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 14/28] drm: rcar-du: Allow DU plane feature based on DU feature bit
Date:   Wed, 12 Jan 2022 17:45:58 +0000
Message-Id: <20220112174612.10773-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L LCDC does not have DU plane registers. This patch
supports DU planes only for the SoC's with plane feature
bit is set.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 3 +++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f361a604337f..521446890d3d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -349,6 +349,9 @@ static void rcar_du_crtc_update_planes(struct rcar_du_crtc *rcrtc)
 	unsigned int i;
 	u32 dspr = 0;
 
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_PLANE))
+		return;
+
 	for (i = 0; i < rcrtc->group->num_planes; ++i) {
 		struct rcar_du_plane *plane = &rcrtc->group->planes[i];
 		unsigned int j;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index cf045a203aa5..364d0e911735 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -82,7 +82,8 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 	else
 		state.hwindex = crtc->index % 2;
 
-	__rcar_du_plane_setup(crtc->group, &state);
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_PLANE))
+		__rcar_du_plane_setup(crtc->group, &state);
 
 	/*
 	 * Ensure that the plane source configuration takes effect by requesting
-- 
2.17.1

