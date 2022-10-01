Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3815F203A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Oct 2022 00:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiJAWDu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Oct 2022 18:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiJAWDu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 18:03:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14E458DC4
        for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Oct 2022 15:03:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB0D82D8;
        Sun,  2 Oct 2022 00:03:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664661824;
        bh=jm2TSyXmNjpUAmKxmtErUYtx/QOViVdSEQnOZcCk8kA=;
        h=From:To:Cc:Subject:Date:From;
        b=rMCALcnbkZWXYrwD1WWJBiKm62PzSVMmw0EXerWWyPRn0itPpYXpYRVzxVy3CRIFq
         GvPeWcqXjY+agjqVcHrrgJXalrScqAs2dsNh9YTEfmPtbQrcwk2x5RwkifPr4/+YUj
         zpszv2+0T+H8bb9zGwFro0UTD9OqqD81LW6s8BNw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and RCAR_MIPI_DSI
Date:   Sun,  2 Oct 2022 01:03:42 +0300
Message-Id: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When the R-Car MIPI DSI driver was added, it was a standalone encoder
driver without any dependency to or from the R-Car DU driver. Commit
957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
added a direct call from the DU driver to the MIPI DSI driver, without
updating Kconfig to take the new dependency into account. Fix it the
same way that the LVDS encoder is handled.

Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index c959e8c6be7d..fd2c2eaee26b 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
 	select OF_FLATTREE
 	select OF_OVERLAY
 
+config DRM_RCAR_USE_MIPI_DSI
+	bool "R-Car DU MIPI DSI Encoder Support"
+	depends on DRM_BRIDGE && OF
+	default DRM_RCAR_DU
+	help
+	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
+
 config DRM_RCAR_MIPI_DSI
-	tristate "R-Car DU MIPI DSI Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
+	def_tristate DRM_RCAR_DU
+	depends on DRM_RCAR_USE_MIPI_DSI
 	select DRM_MIPI_DSI
-	help
-	  Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
 
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM

base-commit: 7860d720a84c74b2761c6b7995392a798ab0a3cb
-- 
Regards,

Laurent Pinchart

