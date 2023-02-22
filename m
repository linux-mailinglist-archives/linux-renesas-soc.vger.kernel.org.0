Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D36D69EE26
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Feb 2023 06:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjBVFGd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Feb 2023 00:06:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjBVFGb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 00:06:31 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE9F2F798
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 21:06:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7FC824E1;
        Wed, 22 Feb 2023 06:06:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677042388;
        bh=ow3TeyVusyQxSdXC9/ygIEnzrguT8/0AX0K3z862/MM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dSWRDt8yJycQ+/DNNwcmrDYB2ahgr2n0Ni5Pqs4YUYb5LycLSdPYdLh5LWOXMv5cz
         2wO6Mmp1f7UNA9/BGrG0oQlFvSh2rhqiZjbSzs6lc8XnbtdiybPs1P1hEIo5Xd3iGE
         0Uw63NJOroBxU4JzFFr+1+qPQscPbm3y77KYCpcM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/2] drm: rcar-du: Disable alpha blending for DU planes used with VSP
Date:   Wed, 22 Feb 2023 07:06:23 +0200
Message-Id: <20230222050623.29080-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
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

When the input to a DU channel comes from a VSP, the DU doesn't perform
any blending operation. Select XRGB8888 instead of ARGB8888 to ensure
that the corresponding registers don't get written with invalid values.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index fe90be51d64e..45c05d0ffc70 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -73,7 +73,7 @@ void rcar_du_vsp_enable(struct rcar_du_crtc *crtc)
 			.src.y2 = mode->vdisplay << 16,
 			.zpos = 0,
 		},
-		.format = rcar_du_format_info(DRM_FORMAT_ARGB8888),
+		.format = rcar_du_format_info(DRM_FORMAT_XRGB8888),
 		.source = RCAR_DU_PLANE_VSPD1,
 		.colorkey = 0,
 	};
-- 
Regards,

Laurent Pinchart

