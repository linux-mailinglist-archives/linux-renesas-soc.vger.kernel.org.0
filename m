Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816275A3330
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Aug 2022 02:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbiH0Amb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Aug 2022 20:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiH0Ama (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 20:42:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D26EA323
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Aug 2022 17:42:29 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E9A9120A;
        Sat, 27 Aug 2022 02:42:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661560948;
        bh=RleVrAR/2zyTBHESYFKnzNMjWNWTLl5Da+yoZ69dWCE=;
        h=From:To:Cc:Subject:Date:From;
        b=NDbrtX6bPVpN1mFv5R//RfpzqPSUypr9sDKB1Kq5Ys81Nvss2WHqZc8+CzmSTxVUb
         PVOrhBn4bdQlrVvHje4aTByDP9ndKrSe/edLA0u4Lfc5i/Stcr1j5/KdgMRKFPetq5
         mRLBbKObDah0TgOfSsPz9azEdDNzYWMCSAmmMe3M=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Drop leftovers variables from Makefile
Date:   Sat, 27 Aug 2022 03:42:20 +0300
Message-Id: <20220827004220.8397-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
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

Commit 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward
compatibility") has removed device tree overlay sources used for
backward compatibility with old bindings, but forgot to remove related
variables from the Makefile. Fix it.

Fixes: 841281fe52a7 ("drm: rcar-du: Drop LVDS device tree backward compatibility")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index e7275b5e7ec8..6f132325c8b7 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -14,10 +14,3 @@ obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
-
-# 'remote-endpoint' is fixed up at run-time
-DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
-DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint

base-commit: 2c2d7a67defa198a8b8148dbaddc9e5554efebc8
-- 
Regards,

Laurent Pinchart

