Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E598E7938A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Sep 2023 11:44:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbjIFJo0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Sep 2023 05:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237603AbjIFJoX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2023 05:44:23 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79A6C19BA
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Sep 2023 02:43:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,231,1688396400"; 
   d="scan'208";a="178914172"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Sep 2023 18:43:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.21])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8E8CD400C9F4;
        Wed,  6 Sep 2023 18:43:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>, Pavel Machek <pavel@denx.de>
Subject: [PATCH] drm: renesas: rcar-du: rzg2l_mipi_dsi: Update the comment in rzg2l_mipi_dsi_start_video()
Date:   Wed,  6 Sep 2023 10:43:46 +0100
Message-Id: <20230906094346.38759-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add missing space in the comment in rzg2l_mipi_dsi_start_video().

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/all/ZPg7STHDn4LbLy7f@duo.ucw.cz/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This issue is noticed while backporting this driver to 6.1.y-cip [1].

[1] https://lore.kernel.org/all/20230905160737.167877-1-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
index 10febea473cd..9b5cfdd3e1c5 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rzg2l_mipi_dsi.c
@@ -479,7 +479,7 @@ static int rzg2l_mipi_dsi_start_video(struct rzg2l_mipi_dsi *dsi)
 	u32 status;
 	int ret;
 
-	/* Configuration for Blanking sequence and start video input*/
+	/* Configuration for Blanking sequence and start video input */
 	vich1set0r = VICH1SET0R_HFPNOLP | VICH1SET0R_HBPNOLP |
 		     VICH1SET0R_HSANOLP | VICH1SET0R_VSTART;
 	rzg2l_mipi_dsi_link_write(dsi, VICH1SET0R, vich1set0r);
-- 
2.25.1

