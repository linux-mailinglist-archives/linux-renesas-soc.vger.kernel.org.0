Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 632B95A0E05
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 12:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240893AbiHYKjT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 06:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbiHYKjS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 06:39:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A2AE6A1D5F
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 03:39:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,262,1654527600"; 
   d="scan'208";a="132530670"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Aug 2022 19:39:16 +0900
Received: from localhost.localdomain (unknown [10.226.93.110])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9CF0C400BAC9;
        Thu, 25 Aug 2022 19:39:12 +0900 (JST)
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
Subject: [PATCH 2/2] drm: rcar-du: Use %p4cc to print 4CC format
Date:   Thu, 25 Aug 2022 11:39:05 +0100
Message-Id: <20220825103905.2450049-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
References: <20220825103905.2450049-1-biju.das.jz@bp.renesas.com>
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

Replace use of struct rcar_du_format_info with %p4cc for printing
4CC formats.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 21881fb5e84a..8c2719efda2a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -405,8 +405,8 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 
 	format = rcar_du_format_info(mode_cmd->pixel_format);
 	if (format == NULL) {
-		dev_dbg(dev->dev, "unsupported pixel format %08x\n",
-			mode_cmd->pixel_format);
+		dev_dbg(dev->dev, "unsupported pixel format %p4cc\n",
+			&mode_cmd->pixel_format);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.25.1

