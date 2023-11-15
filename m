Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DBD67EC6C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Nov 2023 16:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343952AbjKOPJn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Nov 2023 10:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344364AbjKOPJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 10:09:43 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8AAE8E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Nov 2023 07:09:39 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,305,1694703600"; 
   d="scan'208";a="186884608"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2023 00:09:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.200])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A5B140071E6;
        Thu, 16 Nov 2023 00:09:35 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
Date:   Wed, 15 Nov 2023 15:09:32 +0000
Message-Id: <20231115150932.107796-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The rcar_du_vsps_init() doesn't free the np allocated by
of_parse_phandle_with_fixed_args() for the non-error case.

Fix memory leak for the non-error case.

Fixes: 3e81374e2014 ("drm: rcar-du: Support multiple sources from the same VSP")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 70d8ad065bfa..5cd54ea33313 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -747,8 +747,6 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 			goto error;
 	}
 
-	return 0;
-
 error:
 	for (i = 0; i < ARRAY_SIZE(vsps); ++i)
 		of_node_put(vsps[i].np);
-- 
2.25.1

