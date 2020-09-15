Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFFD26B52E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 01:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbgIOXjJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 19:39:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43530 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIOXjH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 19:39:07 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D102FD8;
        Wed, 16 Sep 2020 01:39:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600213145;
        bh=oiifi9xsZl4JM+3W82GS6oFCV5VVyFiziyYzLsUVFMA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nWwTchFVx9CAH6RIi25F6Y6odO0qXjLyElA2+vfnxFIhlEDd+n/m1CRKqgBhVAsEL
         kLySIhyeMgpHg4tm5+k6KyaMRoiIo46O5l2hinyP8hEdxKZpLn7+LaessSp0piRXcg
         kLJXeSpK12VvP33kqgH0WwGCNYESnWVvq+7dN2cU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, Yu Kuai <yukuai3@huawei.com>,
        yi.zhang@huawei.com, kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH] drm: rcar-du: Put reference to VSP device
Date:   Wed, 16 Sep 2020 02:38:32 +0300
Message-Id: <20200915233832.19769-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200915233004.GD14954@pendragon.ideasonboard.com>
References: <20200915233004.GD14954@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The reference to the VSP device acquired with of_find_device_by_node()
in rcar_du_vsp_init() is never released. Fix it with a drmm action,
which gets run both in the probe error path and in the remove path.

Fixes: 6d62ef3ac30b ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
Reported-by: Yu Kuai <yukuai3@huawei.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index f1a81c9b184d..fa09b3ae8b9d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -13,6 +13,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -341,6 +342,13 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
 };
 
+static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
+{
+	struct rcar_du_vsp *vsp = res;
+
+	put_device(vsp->vsp);
+}
+
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 		     unsigned int crtcs)
 {
@@ -357,6 +365,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 
 	vsp->vsp = &pdev->dev;
 
+	ret = drmm_add_action(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
+	if (ret < 0)
+		return ret;
+
 	ret = vsp1_du_init(vsp->vsp);
 	if (ret < 0)
 		return ret;
-- 
Regards,

Laurent Pinchart

