Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDCED425BF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 21:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242189AbhJGTks (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 15:40:48 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:39249 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243953AbhJGTko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 15:40:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 5FC1E2B00A16;
        Thu,  7 Oct 2021 15:38:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 07 Oct 2021 15:38:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=wTeB+AcsPUqMT
        kq0tx5O/S28gFdBW8XNnb+QC7S+PpM=; b=PyS3mDweVHBvBQF0jED1LgnqWHezr
        UhMz95EymKd0Bk6mZGaG3gcFpAXb3i5KzSqUT5ad7oFf6WCRULKveLo44eShUQ0C
        5d8jXmNWCZErQ757vt1n0NiCmxdhlgHbNFvn/SShYMmDgzps8M9i+AHBgUR4qsb6
        r1MKv/6lJAzAqwEwa3ML8O/3gawEOEYVks1GWaGi643yrptZNRv2eA6ymTv8drdk
        4wFUDashCOuFzBM6jzarrGw4MZ8s9+2cUlhLdEUarX2W54ibpEBC+AfVGFym5RIp
        3Uzd/C8XYIDnz/De0eiT+EdFj3yE6TqKrRZruBUUWa9tBpcviQMVLGrPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=wTeB+AcsPUqMTkq0tx5O/S28gFdBW8XNnb+QC7S+PpM=; b=CxWtsUmp
        r1oHGJtxvYjUPXO1EKMOvLHzyhX79GH1aNw+WZ4yVfnf0VkYg7yz+SNilHn53LKQ
        ZkEe7oOhEslu4kEf5ti4WvHxeBAo8kDitcIaHGp5gKUuYOThXcPsPXlEJfxGgbUI
        duOtzbdRlXenmiVE2ivoM38RuknZfSjFaFmeCTXGPxblFL72R4jvzeiabWocAhoM
        kGG0uwY+K+QiHgiRFmhmd5iO9L/pa9CumaFmDfOM7i4okXsThmIlzz7ucFsECihE
        S++eTJTSJ6DWLhnAne+eAVRKrOQlgw1h0Jny+aYSP+vhsZGKcCEwdWsMjyayiwG8
        iIBkAzw8HHEdcw==
X-ME-Sender: <xms:yExfYZ147yvbIVXGz9-WLKqm_mAIuOHTmIMCuKU6oN-7crvUEMwmEA>
    <xme:yExfYQGFBXr8Ri8jDfsxFptDECSqVLmZlDUIq8srZfh8QplQr58yvMcRx-ZZOk2sP
    Ahtc4vwsoct9N74Fw>
X-ME-Received: <xmr:yExfYZ7fJFwTyQEFGsVcvBb-nxbDKG7xWoGT-f-4selCEr_RJC_usypxPuTg3EBV5OEn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpeefnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:yExfYW2WJsvLfCenQPzoCuWpmQBGts3KL0CQHI8O3XejqmE6i53LlQ>
    <xmx:yExfYcG-U5lPvgbRsBPfWkGytJLUj0QBBaY24JwbagexwS-Eo3L10Q>
    <xmx:yExfYX863D7HtS7OPBLoDpKb0zNDT3FEvSEtX5WujoK9GUFhHeKpkw>
    <xmx:yUxfYXAscggHroooWSXJ14cZcWxgkr6p3ufZEasFQ_Ad041akeRxkZdqI5M>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 15:38:46 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 11/20] drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Thu,  7 Oct 2021 21:37:46 +0200
Message-Id: <20211007193755.29579-12-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007193755.29579-1-greenfoo@u92.eu>
References: <20211007193755.29579-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 768012243b44..b89687074890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -18,6 +18,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_drv.h>
 
 #include "dpu_kms.h"
 #include "dpu_hw_lm.h"
@@ -1172,14 +1173,15 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
 	struct drm_plane_state *state;
+	struct drm_modeset_acquire_ctx ctx;
 	struct dpu_crtc_state *cstate;
 
-	int i, out_width;
+	int i, out_width, ret;
 
 	dpu_crtc = s->private;
 	crtc = &dpu_crtc->base;
 
-	drm_modeset_lock_all(crtc->dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(crtc->dev, ctx, 0, ret);
 	cstate = to_dpu_crtc_state(crtc->state);
 
 	mode = &crtc->state->adjusted_mode;
@@ -1263,9 +1265,9 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 		dpu_crtc->vblank_cb_time = ktime_set(0, 0);
 	}
 
-	drm_modeset_unlock_all(crtc->dev);
+	DRM_MODESET_LOCK_ALL_END(crtc->dev, ctx, ret);
 
-	return 0;
+	return ret;
 }
 
 DEFINE_SHOW_ATTRIBUTE(_dpu_debugfs_status);
-- 
2.33.0

