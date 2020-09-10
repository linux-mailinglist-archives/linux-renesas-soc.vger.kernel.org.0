Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C532646E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 15:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730585AbgIJNZe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 09:25:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:11774 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730674AbgIJNY4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:24:56 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 1B9D3F4FDC170165F4B4;
        Thu, 10 Sep 2020 21:24:41 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 10 Sep 2020
 21:24:35 +0800
From:   Yu Kuai <yukuai3@huawei.com>
To:     <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham+renesas@ideasonboard.com>, <airlied@linux.ie>,
        <daniel@ffwll.ch>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>
Subject: [PATCH] drm: rcar-du: add missing put_device() call in rcar_du_vsp_init()
Date:   Thu, 10 Sep 2020 21:23:54 +0800
Message-ID: <20200910132354.692397-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

if of_find_device_by_node() succeed, rcar_du_vsp_init() doesn't have
a corresponding put_device(). Thus add a jump target to fix the exception
handling for this function implementation.

Fixes: 6d62ef3ac30b ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..172ee3f3b21c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -352,14 +352,16 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 
 	/* Find the VSP device and initialize it. */
 	pdev = of_find_device_by_node(np);
-	if (!pdev)
-		return -ENXIO;
+	if (!pdev) {
+		ret = -ENXIO;
+		goto put_device;
+	}
 
 	vsp->vsp = &pdev->dev;
 
 	ret = vsp1_du_init(vsp->vsp);
 	if (ret < 0)
-		return ret;
+		goto put_device;
 
 	 /*
 	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
@@ -369,8 +371,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 
 	vsp->planes = devm_kcalloc(rcdu->dev, vsp->num_planes,
 				   sizeof(*vsp->planes), GFP_KERNEL);
-	if (!vsp->planes)
-		return -ENOMEM;
+	if (!vsp->planes) {
+		ret = -ENOMEM;
+		goto put_device;
+	}
 
 	for (i = 0; i < vsp->num_planes; ++i) {
 		enum drm_plane_type type = i < num_crtcs
@@ -387,7 +391,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 					       ARRAY_SIZE(rcar_du_vsp_formats),
 					       NULL, type, NULL);
 		if (ret < 0)
-			return ret;
+			goto put_device;
 
 		drm_plane_helper_add(&plane->plane,
 				     &rcar_du_vsp_plane_helper_funcs);
@@ -403,4 +407,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 	}
 
 	return 0;
+put_device:
+	put_device(&pdev->dev);
+	return ret;
 }
-- 
2.25.4

