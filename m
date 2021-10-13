Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B236E42CBB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 22:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhJMUvn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 16:51:43 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55823 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230172AbhJMUv3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 16:51:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 1FFC5581177;
        Wed, 13 Oct 2021 16:49:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 13 Oct 2021 16:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=wTeB+AcsPUqMT
        kq0tx5O/S28gFdBW8XNnb+QC7S+PpM=; b=wKRI4ru/5mGdxKbXoV389wBbxUoub
        XFYtTacCNpsC0tGZj5GZ3G33WPqdTDGyZhWaq+E15xF1lv8kP8azHlCblEqPBVuj
        C7Gyq0MYj2nJ+kocASrkB9bkCFQgM4VNe2GhQfu/1AJnrArHZ+33fgBXkMWyFiKl
        6jdEej6H+adb2/Ns3U4yBYHTrtmLzrLkL8hZy/gm9DMavoOlbNzMgm0EkgyGJKEx
        UnJvztEZUPA9a45b8oWcY5rvUfi3kZXM3eVEThlSHTyjRAd9dbwC9rNVXi48WrcZ
        SnTcBeOERM1LzrHwGMbOplqVwsxzcdWxA8sO8mv5fXWYlntteeChZcStQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=wTeB+AcsPUqMTkq0tx5O/S28gFdBW8XNnb+QC7S+PpM=; b=SwVLD4MW
        9nUg8dCNsHVB6ibxALzWVqUnVqP682UqfneZ4BTt6IYTai8pmbVJVaQkmJR8se9N
        ZOdCfG6hxIuIi00yc9MOy/gbuBxOQ9SrmF7MoXxecFeS/m3LVtN2J085ycUwMkcA
        mbckJXbf3moMFcPE0rCfokwNUpbI0/sgR4a8cKpBr80fuLJy4NRED4l013BvmGPt
        ggXFNWjILN0IuQB2zFTuw/aeYoA7DxP9xcZGf1zw6DzFC5XUi2pPgrHAyKXK3tyc
        zMrLMGPCxBJxIVsKJqbf2uoo2BQ78cX/l1nNfIwxpcv4kjsaP/WkfXHr4++SgaKG
        CA63JxV7p3YH2w==
X-ME-Sender: <xms:VEZnYbrJmSXxkl4Nr1CfGrN46N5uQAplfY2A3_3SCnuaKjaE2wdaaA>
    <xme:VEZnYVocJrlRHxQQVOi9cQNn0fV6IE6DRNSpUret_JQwhEYW8zanRGdvW8Y0ydby0
    OeUnBjPTubPbzAmnQ>
X-ME-Received: <xmr:VEZnYYNGCzmTmwmHGmU9cfmHAwNIrDyMx1XAfegTtJDwFMvuyvbrJNwe4Oqye9DRDP79>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddutddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedunecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:VUZnYe4jzkqzEyD4bCZ8IoZWZNMOXVkl39VRzrqBXHXByJ9VaxhKCw>
    <xmx:VUZnYa7kuM3l0Gc4_9tztp4rb6b1L7gl8WU3fLDIxLKPKvMzAOy2yw>
    <xmx:VUZnYWhOfOpzjFUWJIimOtN_2s49mxErRFIxwi1qO7tdnGBRlFLkCA>
    <xmx:VUZnYTEcjD90oqNIZXA5-OvBdx4b031kYcdRaid0LiHHkndrVGFSJA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Oct 2021 16:49:22 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v4 11/20] drm/msm: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Wed, 13 Oct 2021 22:48:37 +0200
Message-Id: <20211013204846.90026-12-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013204846.90026-1-greenfoo@u92.eu>
References: <20211013204846.90026-1-greenfoo@u92.eu>
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

