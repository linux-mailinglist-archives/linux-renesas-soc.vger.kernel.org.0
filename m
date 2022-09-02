Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73FC65AB730
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 19:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236149AbiIBRIj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 13:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbiIBRIh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:08:37 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D4545110D97
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:08:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,283,1654527600"; 
   d="scan'208";a="133510980"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Sep 2022 02:08:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.67])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B5E14005622;
        Sat,  3 Sep 2022 02:08:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 01/10] drm: rcar-du: Add RZ/G2L reset and clocks to struct rcar_du_crtc
Date:   Fri,  2 Sep 2022 18:08:17 +0100
Message-Id: <20220902170826.599262-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
References: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add RZ/G2L reset and clocks to struct rcar_du_crtc, so that
we can share and optimize the common code between RCar and
RZ/G2L driver using RCar DU library.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Rebased on drm-misc-next and DU-next.
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index d0f38a8b3561..d2164ee6e599 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -43,6 +43,8 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
+ * @rzg2l_clocks: the bus, main and video clock
+ * @rstc: reset controller
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -73,6 +75,14 @@ struct rcar_du_crtc {
 	unsigned int sources_count;
 
 	struct drm_writeback_connector writeback;
+
+	/* RZ/G2L specific */
+	struct reset_control *rstc;
+	struct {
+		struct clk *aclk;
+		struct clk *pclk;
+		struct clk *dclk;
+	} rzg2l_clocks;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
-- 
2.25.1

