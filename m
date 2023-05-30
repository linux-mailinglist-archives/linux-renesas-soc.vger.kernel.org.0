Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 731D271671C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 17:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjE3PdA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 11:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjE3Pc4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 11:32:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BEFC7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 08:32:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205198071.34.openmobile.ne.jp [126.205.198.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 654F97F3;
        Tue, 30 May 2023 17:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685460752;
        bh=YhWGYeOR1aB5CIVRMB8e9A2z/Uh5jf64rAfGZFLDN58=;
        h=From:To:Cc:Subject:Date:From;
        b=kmJfo7M3Ilc8W5ubokNcRTi1kBmMZtaN0IGuY3h7zHi6YlRnw6cAzE7VcLTtEfdCY
         rSWEyI8KR3Klk2ARL7gC3p2XJODH1LhT3i8gI7S6zbzy2v9WMhYFGNZpusPlVOwZoD
         rN7INznfYXLrZF3KN8DzZu6T9NvO1R2UqLPYbWFM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of KMS init errors
Date:   Tue, 30 May 2023 18:32:51 +0300
Message-Id: <20230530153251.22302-1-laurent.pinchart+renesas@ideasonboard.com>
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

The (large) rcar_du_modeset_init() function can fail for many reasons,
two of two involving probe deferral. Use dev_err_probe() in those code
paths to record the cause of the probe deferral, in order to help
debugging probe issues.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 8 ++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 12a8839fe3be..5b752adb1b02 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -701,6 +701,10 @@ static int rcar_du_probe(struct platform_device *pdev)
 	/* DRM/KMS objects */
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
+		/*
+		 * Don't use dev_err_probe(), as it would overwrite the probe
+		 * deferral reason recorded in rcar_du_modeset_init().
+		 */
 		if (ret != -EPROBE_DEFER)
 			dev_err(&pdev->dev,
 				"failed to initialize DRM/KMS (%d)\n", ret);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index adfb36b0e815..a9b01027bf03 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -932,8 +932,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Initialize the Color Management Modules. */
 	ret = rcar_du_cmm_init(rcdu);
-	if (ret)
+	if (ret) {
+		dev_err_probe(rcdu->dev, "failed to initialize CMM\n", ret);
 		return ret;
+	}
 
 	/* Create the CRTCs. */
 	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
@@ -952,8 +954,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Initialize the encoders. */
 	ret = rcar_du_encoders_init(rcdu);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err_probe(rcdu->dev, "failed to initialize encoders\n", ret);
 		return ret;
+	}
 
 	if (ret == 0) {
 		dev_err(rcdu->dev, "error: no encoder could be initialized\n");
-- 
Regards,

Laurent Pinchart

