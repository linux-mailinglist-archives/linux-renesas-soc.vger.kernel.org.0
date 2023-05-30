Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D58715A18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 11:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjE3J2B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 05:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjE3J13 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 05:27:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1024D10CE
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:26:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8AE8F7F3;
        Tue, 30 May 2023 11:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685438778;
        bh=zA4sTK2Jca312XTfJFlyixKDKl3jwNdf4ulN9FP63o4=;
        h=From:To:Cc:Subject:Date:From;
        b=DASpM/W+4WTaKmHn2/R6A4Ko4dr9b6AMrzguOfsw9cf2lXf92d5NddTFdRTO6GvmU
         W+EoNgBJnKsYjF10MJkbpzbYuBJpCPuHFGTUWwVjl+KlUoVjfvnwD0RBLUeu++Mp6t
         h5kh+RARNnxQqi3yw0P1SmZyuazpjFFoElZs6098=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Replace DRM_INFO() with drm_info()
Date:   Tue, 30 May 2023 12:26:39 +0300
Message-Id: <20230530092639.18374-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.3
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

drm_info() adds proper context to the kernel log message, as it receives
the drm_device pointer. It is thus preferred over DRM_INFO(). Replace
the latter with the former.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 91095f9deb8b..fe4d3b3c9b0c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -713,7 +713,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	if (ret)
 		goto error;
 
-	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
+	drm_info(&rcdu->ddev, "Device %s probed\n", dev_name(&pdev->dev));
 
 	drm_fbdev_generic_setup(&rcdu->ddev, 32);
 
-- 
Regards,

Laurent Pinchart

