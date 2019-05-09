Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 839CA184EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 07:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfEIFrH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 01:47:07 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33772 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfEIFrH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 01:47:07 -0400
Received: by mail-pl1-f195.google.com with SMTP id y3so580109plp.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 22:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=lwNz168KjUZWyiHLGZCJglYcp7ouOwdKzpPYb4dLQGo=;
        b=ubXFkuBZxcrkM42gyzXEfO8daFy+3hCNYDLt0MFCoDKQhor5bBmu9gu5UmXl4KtiVp
         4uDNoHaW8d3/7nRI/yrxmtxlFiW0J8ERl+ZQdr4SH1/MRgak3xrbCX14/FRBfXRvR6hL
         f6r2C1k4vRrrvmgl4IxgtC6RyquEVjmGVktYGbqePtlZgv0u56yLwPm6bGLxoFf2AW1s
         vLPw/62kAmUPgp7c5WXsXgxLhmLcTlhA6vsqS7OQbwte4sRrj1muoaGqi5cPMS24jrQW
         pCyjVhATMDK9eEcx2UEVMHirJ+WvM+JPwkWrqJRyafUKiulVNgYjKOwiei+7cgScVuYI
         HeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lwNz168KjUZWyiHLGZCJglYcp7ouOwdKzpPYb4dLQGo=;
        b=kSAFlUc2K9feRI7qFQNZ5G5rnkISi7PM1l33OLXYeI1gI6EN0OSnIZxDUu7AI4nvDL
         +/Mlns+av9HFxrRlnPgEdl5z84k5wapuQZZx/+YkCLkU91UxMtXJLVqLgIhvTizZ2yL2
         i/r6mjt2YstWlIY0lPI04WP8E/4MUcx07gTRKIVW//RMx2TWET3uGafMsgKjXc7XEeFS
         8EFpEthFECDB7pBKGuKAxhKh9ngmutFoAUg1TtgAJPTxG8svimsXkDWH6c1kziLUwK5s
         BvGPJ5ybePCWfSfLXUQms9v3HLbAt0E+YQ6gr9eDqK1WGcqcl9Ud6ikwv/5Vy2L4nEJq
         QCgw==
X-Gm-Message-State: APjAAAUrRrqgp6CzZva6hDESs5U9klg8rrvtnnrh1tIzW6aHgItbJFeq
        j2XlPVK29zdVWHx34F2o5T2UnG8BN2A=
X-Google-Smtp-Source: APXvYqxMSiGUtjgFm+7Zvs305OPoTNrtVVXiDX/2FgaJDaEIbKkNzxt29UdoPqB/9L+2Xg6F2pLHyw==
X-Received: by 2002:a17:902:8bc3:: with SMTP id r3mr2645720plo.53.1557380826153;
        Wed, 08 May 2019 22:47:06 -0700 (PDT)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id q17sm1962038pfi.185.2019.05.08.22.47.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 May 2019 22:47:05 -0700 (PDT)
From:   Tomohito Esaki <etom@igel.co.jp>
To:     linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, etom@igel.co.jp
Subject: [PATCH] drm: rcar-du: add modifiers support
Date:   Thu,  9 May 2019 14:45:18 +0900
Message-Id: <20190509054518.10781-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the linear modifier. Since the rcar-du device supports
only linear modifier, this driver doesn't support other modifiers.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 11 +++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 15 ++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 15 ++++++++++++++-
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3b7d50a8fb9b..9c5e15a5ab1c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -214,6 +214,16 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-EINVAL);
 	}
 
+	/*
+	 * Support only LINEAR modifier.
+	 */
+	if ((mode_cmd->flags & DRM_MODE_FB_MODIFIERS) &&
+	    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR) {
+		dev_dbg(dev->dev, "unsupported fb modifier 0x%llx\n",
+			mode_cmd->modifier[0]);
+		return ERR_PTR(-EINVAL);
+	}
+
 	if (rcdu->info->gen < 3) {
 		/*
 		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
@@ -529,6 +539,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 	dev->mode_config.normalize_zpos = true;
+	dev->mode_config.allow_fb_modifiers = true;
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
 	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index c6430027169f..32135ad387fa 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -726,6 +726,13 @@ static int rcar_du_plane_atomic_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+static bool rcar_du_plane_format_mod_supported(struct drm_plane *plane,
+					       uint32_t format,
+					       uint64_t modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
 static const struct drm_plane_funcs rcar_du_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -735,6 +742,7 @@ static const struct drm_plane_funcs rcar_du_plane_funcs = {
 	.atomic_destroy_state = rcar_du_plane_atomic_destroy_state,
 	.atomic_set_property = rcar_du_plane_atomic_set_property,
 	.atomic_get_property = rcar_du_plane_atomic_get_property,
+	.format_mod_supported = rcar_du_plane_format_mod_supported,
 };
 
 static const uint32_t formats[] = {
@@ -750,6 +758,11 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_NV16,
 };
 
+static const uint64_t modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
 int rcar_du_planes_init(struct rcar_du_group *rgrp)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -776,7 +789,7 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
 		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
 					       &rcar_du_plane_funcs, formats,
 					       ARRAY_SIZE(formats),
-					       NULL, type, NULL);
+					       modifiers, type, NULL);
 		if (ret < 0)
 			return ret;
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 0878accbd134..9d1382b02717 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -139,6 +139,11 @@ static const u32 formats_kms[] = {
 	DRM_FORMAT_YVU444,
 };
 
+static const uint64_t modifiers_kms[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID,
+};
+
 static const u32 formats_v4l2[] = {
 	V4L2_PIX_FMT_RGB332,
 	V4L2_PIX_FMT_ARGB444,
@@ -344,6 +349,13 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
 	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
 }
 
+static bool rcar_du_vsp_plane_format_mod_supported(struct drm_plane *plane,
+						   uint32_t format,
+						   uint64_t modifier)
+{
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
 static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -351,6 +363,7 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
 	.destroy = drm_plane_cleanup,
 	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
 	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
+	.format_mod_supported = rcar_du_vsp_plane_format_mod_supported,
 };
 
 int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
@@ -397,7 +410,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
 					       &rcar_du_vsp_plane_funcs,
 					       formats_kms,
 					       ARRAY_SIZE(formats_kms),
-					       NULL, type, NULL);
+					       modifiers_kms, type, NULL);
 		if (ret < 0)
 			return ret;
 
-- 
2.17.1

