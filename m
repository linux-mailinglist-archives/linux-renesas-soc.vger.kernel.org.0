Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99EE8715A15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 May 2023 11:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjE3J1n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 May 2023 05:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjE3J1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 May 2023 05:27:20 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24904135
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 May 2023 02:26:31 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126205206011.34.openmobile.ne.jp [126.205.206.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 000007EC;
        Tue, 30 May 2023 11:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685438769;
        bh=xyWNyLfZ4XMMC+JRf20PcpUZeFT54eA0T5pwZvOMi8M=;
        h=From:To:Cc:Subject:Date:From;
        b=hcgal3qzvMOVEXUXhheG63dfeAIILx4VcY8tCjF/i1xva6aSWwW4kVRxWzi/jhq93
         mXxoq3U3WFWTOuy4ThzI3sDiwQx+2JG4g+J7LT3qk8dc/hCng3WrE4pNVkgU6mEa/v
         VaJVfbPdZDQEL9e/UCCCxDtrH+v0jpRC7gCpG4jE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Use dev_err_probe()
Date:   Tue, 30 May 2023 12:26:29 +0300
Message-Id: <20230530092629.18329-1-laurent.pinchart+renesas@ideasonboard.com>
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

Replace manual handling of EPROBE_DEFER with dev_err_probe() to simplify
the code.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 1ffde19cb87f..91095f9deb8b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -701,9 +701,7 @@ static int rcar_du_probe(struct platform_device *pdev)
 	/* DRM/KMS objects */
 	ret = rcar_du_modeset_init(rcdu);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev,
-				"failed to initialize DRM/KMS (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "failed to initialize DRM/KMS\n");
 		goto error;
 	}
 

base-commit: 85d712f033d23bb56a373e29465470c036532d46
prerequisite-patch-id: 74c948ef7587221bcc859d7e0b38b54b7c404163
prerequisite-patch-id: 41d31c65b9895beb2f15c1dd2b89e435657a639c
prerequisite-patch-id: bd71c64e0d7f9a6a5212ef9ad499fb7cdc718425
prerequisite-patch-id: a01de55d9563b98ab2d86d78db436da198bc4649
prerequisite-patch-id: 2faeeea13f349cae2470b09926ed52e5743f1579
prerequisite-patch-id: 783a84269c3d66600ec31046bee76e2aabcb32ad
-- 
Regards,

Laurent Pinchart

