Return-Path: <linux-renesas-soc+bounces-14423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D0A63274
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 21:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D0A188E0BF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 15 Mar 2025 20:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED004199238;
	Sat, 15 Mar 2025 20:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GJfp1SaS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34AD74BE1
	for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Mar 2025 20:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742069998; cv=none; b=RKNqmw55Bi+QLtzY2RWFoQPqiBgctZdTMTi4hUgC11VKpsi5RUz75uvDlP/Iwg9nzxyq4ceVz4DgVepyRzF8OgKoKlWQ4Uq3ULXv7LzCw6IGcqjGem4UE2/RN2aS+iIgOFRWzLd+QS7KONZykCvdMe169r33I0AjfKRb7AdfjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742069998; c=relaxed/simple;
	bh=84gYG2YiHcgrB68cM9oVKwypo/bhUwM4uXxDJ9kW7g0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/T6csgK8aCsnco1q4qiTL/m4gsRRbOYU3y2hm0eX27CfNuXCSLhrCzELV4FV/6oP5+xnK9JCZ1Afqv+G9Rh2LN9+k+GVcin7iVexxs8pBeXsieA6/SKWBvAXpJIP2F44qiaRNGc4dCTSxqFr2e5jgxcYLCjKdFWGg7r8GZbpJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GJfp1SaS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=eWVGRd+cO5c5Aq
	RV9/SflveDMTEj8AwCjs98cW1WN3E=; b=GJfp1SaSSvWRrt2GS5Yzxz/6piuuVA
	XwZFmBF9WUsYaoq/qzYQXj5kGt7eb3i3gvuHSvHpudBDWHYqmUyEqPzAC9Nhk/lp
	EHZyGFtN+WC08jgUOJrBdr40LasulMqce20T1bKTmRxSsXY7yEi3OlubgTjNMEcn
	qKFLBibq/p7AuKCI/CWYI4WtItUF4a0MjL6eZOk5CRmMklFR+UYkEIXblyJjEWyE
	AMI5ndFpid4L0AhO8q1aUlqaGEi4JvIs/UATpp3dPQh3I77/GMTLBvKwc1GbZsm/
	mCOg/QOmX4IKi6k/AAC3wbTZ2w2K3RnIVoA6QLrFO6/0Kqck/dOheZNg==
Received: (qmail 2478587 invoked from network); 15 Mar 2025 21:19:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2025 21:19:54 +0100
X-UD-Smtp-Session: l3s3148p1@EXgoR2cwpM8ujnuL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH RFT v2] drm/bridge: ite-it6505: make use of debugfs_init callback
Date: Sat, 15 Mar 2025 21:17:16 +0100
Message-ID: <20250315201946.7428-2-wsa+renesas@sang-engineering.com>
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
for the bridge.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build tested, but following the same pattern as the tested
ti-sn65dsi86.

Changes since v1:
* switch from 'client->debugfs' to DRM 'debugfs_init' callback

 drivers/gpu/drm/bridge/ite-it6505.c | 59 ++++++++++-------------------
 1 file changed, 19 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6..803bfe9954e6 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -302,7 +302,6 @@
 #define WORD_LENGTH_18BIT 1
 #define WORD_LENGTH_20BIT 2
 #define WORD_LENGTH_24BIT 3
-#define DEBUGFS_DIR_NAME "it6505-debugfs"
 #define READ_BUFFER_SIZE 400
 
 /* Vendor option */
@@ -478,7 +477,6 @@ struct it6505 {
 	struct device *codec_dev;
 	struct delayed_work delayed_audio;
 	struct it6505_audio_data audio;
-	struct dentry *debugfs;
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
@@ -3302,21 +3300,6 @@ static const struct drm_edid *it6505_bridge_edid_read(struct drm_bridge *bridge,
 	return drm_edid_dup(it6505->cached_edid);
 }
 
-static const struct drm_bridge_funcs it6505_bridge_funcs = {
-	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
-	.attach = it6505_bridge_attach,
-	.detach = it6505_bridge_detach,
-	.mode_valid = it6505_bridge_mode_valid,
-	.atomic_enable = it6505_bridge_atomic_enable,
-	.atomic_disable = it6505_bridge_atomic_disable,
-	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
-	.atomic_post_disable = it6505_bridge_atomic_post_disable,
-	.detect = it6505_bridge_detect,
-	.edid_read = it6505_bridge_edid_read,
-};
-
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
@@ -3574,36 +3557,34 @@ static const struct debugfs_entries debugfs_entry[] = {
 	{ NULL, NULL },
 };
 
-static void debugfs_create_files(struct it6505 *it6505)
+static void it6505_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
 {
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct dentry *debugfs = debugfs_create_dir(dev_name(it6505->dev), root);
 	int i = 0;
 
 	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
 		debugfs_create_file(debugfs_entry[i].name, 0644,
-				    it6505->debugfs, it6505,
-				    debugfs_entry[i].fops);
+				    debugfs, it6505, debugfs_entry[i].fops);
 		i++;
 	}
 }
 
-static void debugfs_init(struct it6505 *it6505)
-{
-	struct device *dev = it6505->dev;
-
-	it6505->debugfs = debugfs_create_dir(DEBUGFS_DIR_NAME, NULL);
-
-	if (IS_ERR(it6505->debugfs)) {
-		dev_err(dev, "failed to create debugfs root");
-		return;
-	}
-
-	debugfs_create_files(it6505);
-}
-
-static void it6505_debugfs_remove(struct it6505 *it6505)
-{
-	debugfs_remove_recursive(it6505->debugfs);
-}
+static const struct drm_bridge_funcs it6505_bridge_funcs = {
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.attach = it6505_bridge_attach,
+	.detach = it6505_bridge_detach,
+	.mode_valid = it6505_bridge_mode_valid,
+	.atomic_enable = it6505_bridge_atomic_enable,
+	.atomic_disable = it6505_bridge_atomic_disable,
+	.atomic_pre_enable = it6505_bridge_atomic_pre_enable,
+	.atomic_post_disable = it6505_bridge_atomic_post_disable,
+	.detect = it6505_bridge_detect,
+	.edid_read = it6505_bridge_edid_read,
+	.debugfs_init = it6505_debugfs_init,
+};
 
 static void it6505_shutdown(struct i2c_client *client)
 {
@@ -3689,7 +3670,6 @@ static int it6505_i2c_probe(struct i2c_client *client)
 		it6505_poweron(it6505);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
-	debugfs_init(it6505);
 	pm_runtime_enable(dev);
 
 	it6505->aux.name = "DP-AUX";
@@ -3712,7 +3692,6 @@ static void it6505_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&it6505->bridge);
 	drm_dp_aux_unregister(&it6505->aux);
-	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.47.2


