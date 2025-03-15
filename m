Return-Path: <linux-renesas-soc+bounces-14422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 702FFA63272
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 21:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49223B9AE3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 20:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA95199238;
	Sat, 15 Mar 2025 20:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OGTeX5Oy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4619E19CCEC
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 20:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742069831; cv=none; b=Dq2cZInMCZlaD4dEJWsHtCPR5qsF3dNJeA3JOb/HJZzayrwZh1KZYT3sRXfMB4iyEYv2r20xOoslKQaTi3R9r5EL9K2QJwpo4LrnegeFK/1shsAvA0/DfyqDPkm3gR7ckuuOKK9k/cjuI+nJ+Dy6fVE2yQbhRxyxz/pHBAhs7mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742069831; c=relaxed/simple;
	bh=9cKDy7k6oR8I1FyDsoaF3J1FUVk6dQ4xQURo/8AgIZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jUehGiOE821avt0kIE0AndBZfzFxVAQeWypSp0yEHzHKQdx4WufUMISxpZV7gW8pykvHiREO3O1wu1/KE4GZqetmh82FT+OUyYZFOrBuisinIzom0NzIUHbTzHB4kW6qx86HoSWNGe875/GMmT2JM7Ve0a0lX5zaaPaXAX2JLMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OGTeX5Oy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Us8PyY3gv4PUu0
	pMP/QFG6QiXMK71hLOBzPUoqo8EgI=; b=OGTeX5Oya9dkp38+5ky1cKNvZPil6B
	RYAlHYB2TevCxiKR3gl0ed+dFEgxs79Qn4Rw724lqaL4LL3EYBuMZRW2+AKKKdQp
	hPbJ7tsOe4B2ReMqpoaXJjXYK7+3ypZT/snOf2pYxBMQ5Aw4gVQ0+xWYakkIIdon
	v4mfOjqTgYVBNV45RQ59n0VkHWnoY3WtwQmUmfy2G98QkOqkjuQ0nV+TApBrNzzr
	RgDI9qx5Kyjv2ycijFTNKSbs/mVMaQuVnGayu7QURO/0/LbJhOK3eEbDbXHcUgR/
	5RvHYV7p/XEHIVESBX1nY67+uG3N2nhbhWxJRGp/4FTmnMFht+d27d1Q==
Received: (qmail 2477721 invoked from network); 15 Mar 2025 21:17:04 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2025 21:17:04 +0100
X-UD-Smtp-Session: l3s3148p1@xYMMPWcw8tAujnuL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
Date: Sat, 15 Mar 2025 21:15:11 +0100
Message-ID: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not create a custom directory in debugfs-root, but use the
debugfs_init callback to create a custom directory at the given place
for the bridge. The new directory layout looks like this on a Renesas
GrayHawk-Single with a R-Car V4M SoC:

	/sys/kernel/debug/dri/feb00000.display/DP-1/1-002c

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* switch from 'client->debugfs' to DRM 'debugfs_init' callback
* remove RFT because tested on hardware

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++--------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1..87fffaa52bb0 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -424,36 +424,8 @@ static int status_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-
 DEFINE_SHOW_ATTRIBUTE(status);
 
-static void ti_sn65dsi86_debugfs_remove(void *data)
-{
-	debugfs_remove_recursive(data);
-}
-
-static void ti_sn65dsi86_debugfs_init(struct ti_sn65dsi86 *pdata)
-{
-	struct device *dev = pdata->dev;
-	struct dentry *debugfs;
-	int ret;
-
-	debugfs = debugfs_create_dir(dev_name(dev), NULL);
-
-	/*
-	 * We might get an error back if debugfs wasn't enabled in the kernel
-	 * so let's just silently return upon failure.
-	 */
-	if (IS_ERR_OR_NULL(debugfs))
-		return;
-
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_debugfs_remove, debugfs);
-	if (ret)
-		return;
-
-	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
-}
-
 /* -----------------------------------------------------------------------------
  * Auxiliary Devices (*not* AUX)
  */
@@ -1215,6 +1187,15 @@ static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid_read_ddc(connector, &pdata->aux.ddc);
 }
 
+static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct dentry *debugfs;
+
+	debugfs = debugfs_create_dir(dev_name(pdata->dev), root);
+	debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
+}
+
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
@@ -1228,6 +1209,7 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.debugfs_init = ti_sn65dsi86_debugfs_init,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1936,8 +1918,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ti_sn65dsi86_debugfs_init(pdata);
-
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
 	 * motiviation here is to solve the chicken-and-egg problem of probe
-- 
2.47.2


