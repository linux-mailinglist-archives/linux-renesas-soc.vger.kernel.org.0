Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7801B50F6AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 10:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345715AbiDZI6Q (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 04:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345607AbiDZI53 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 04:57:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22B3C84EFF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2022 01:42:04 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,290,1643641200"; 
   d="scan'208";a="118023982"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2022 17:42:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.117])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE0E840071E2;
        Tue, 26 Apr 2022 17:41:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2] drm: rcar-du: Fix Alpha blending issue on Gen3
Date:   Tue, 26 Apr 2022 09:41:57 +0100
Message-Id: <20220426084157.10979-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: LUU HOAI <hoai.luu.ub@renesas.com>

As per R-Car-Gen3_Common_OPC_Customer_Notifications_V30.1.pdf,
unexpected image output(such as incorrect colors or planes being
invisible) can happen on the below conditions, as PnALPHAR register
is not initialized by reset.

When alpha blending (PpMRm.PpSPIM=0b101) is performed and:
	•two Planes are enabled on any DUn (n=0,1,2,3)
		oDSPRn= 0x0000 0031 or 0x0000 0013
	•or DU0 and DU1 is used for display at the same time
		oDSPR0= 0x0000 0001 and DSPR1= 0x0000 0003
		oDSPR0= 0x0000 0003 and DSPR1= 0x0000 0001
	•or DU2 and DU3(H3 Only) is used for display at the same time
		oDSPR2= 0x0000 0001 and DSPR3= 0x0000 0003
		oDSPR2= 0x0000 0003 and DSPR3= 0x0000 0001

This patch set PnALPHAR register to 0 to avoid this issue.

Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description
 * Updated the code comments
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index f214a8b6cfd3..aa80c44dd8d7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -510,6 +510,18 @@ static void rcar_du_plane_setup_format_gen3(struct rcar_du_group *rgrp,
 
 	rcar_du_plane_write(rgrp, index, PnDDCR4,
 			    state->format->edf | PnDDCR4_CODE);
+
+	/*
+	 * On Gen3, some DU channels have two planes, each being wired to a
+	 * separate VSPD instance. The DU can then blend two planes. While
+	 * this feature isn't used by the driver, issues related to alpha
+	 * blending (such as incorrect colors or planes being invisible) may
+	 * still occur if the PnALPHAR register has a stale value. Set the
+	 * register to 0 to avoid this.
+	 */
+
+	/* TODO: Check if alpha-blending should be disabled in PnMR. */
+	rcar_du_plane_write(rgrp, index, PnALPHAR, 0);
 }
 
 static void rcar_du_plane_setup_format(struct rcar_du_group *rgrp,
-- 
2.25.1

