Return-Path: <linux-renesas-soc+bounces-12497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F21A1C35D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 645A17A1D9C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3812A1E505;
	Sat, 25 Jan 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NCNLjLRz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC831FC7C3
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809617; cv=none; b=PClOhbEI4l53F/KN8DDfmCgksNJOkcaMuUCjyn6yNBJ6r0eWDTrNbt3+r/QGn27H2HRpr/NRkND0ROpj2WOG0EmiU1NDZ4InyfRFKImaht7Bi/1sIw8WDJWYN+rDSlVgBzlL2crAO1R3GzrB2A7vW6AF4/cYat0+Nsc8VijmIJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809617; c=relaxed/simple;
	bh=X93IH5ekqKPkW134N/DqU5nDLh8ZAZUiINv69Bci4kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDXKRTRCwm55iycvZ2AJox+gLxbxRJ5YI0WgZtbflmV/V8e4slGmw7V9lWphe8VZfG5UYUo0uT5EGe+BPUifIwXj0wABUAGCY4dDMVfJQTFjQtIZUTBxgh+iF5I3uPI5NiSpS9mABaErzGQNAW4SvO5RL34USssAoNXhEQd/UQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NCNLjLRz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=P9m862YSmX3S8l8jtQOeauNjSlWlKU9EXkQGHv8RUAc=; b=NCNLjL
	Rzwe1KQQX9vu3qDQCfQcmYB5a0F2ZvldcWPZJUg1xzNlReOrZGcxpQZE5zxuTJUM
	/Qy6tLLcX+L6Kts1M7xfQd2Hdbqgt+wfVjh2nY9eK+qf+1qCT+TboF3UscoU624B
	gC3G4k0VSTrVhR73GGYUEcp5TVKfwf/qU9c9IpQZCkJ4OC/9OvrbQojugCPcofNt
	DhLcSVmhSPwTyW8C0OUjcd9uOGt+ixVXLjg1mKnI4iPcn+3ftfcyitpnmrcycWVD
	A2mI+BxyGQ1dJpapS8DYKxZT5j9YMMjuTiVfwFAbWx1aAJKvYFY5YueEZUHsODv3
	orLZQHH7R+i/GnYg==
Received: (qmail 3873966 invoked from network); 25 Jan 2025 13:53:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:53:32 +0100
X-UD-Smtp-Session: l3s3148p1@nseaVIcsjMYujnvm
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
Subject: [PATCH RFT 1/2] drm/bridge: it6505: Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:53:21 +0100
Message-ID: <20250125125320.37285-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling. This also fixes the problem of a static
debugfs dir name which would break if two of these devices would be on
one system.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 28 +++-------------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6..f32e3691a9ea 100644
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
@@ -3574,37 +3572,18 @@ static const struct debugfs_entries debugfs_entry[] = {
 	{ NULL, NULL },
 };
 
-static void debugfs_create_files(struct it6505 *it6505)
+static void it6505_debugfs_create_files(struct i2c_client *client, struct it6505 *it6505)
 {
 	int i = 0;
 
 	while (debugfs_entry[i].name && debugfs_entry[i].fops) {
 		debugfs_create_file(debugfs_entry[i].name, 0644,
-				    it6505->debugfs, it6505,
+				    client->debugfs, it6505,
 				    debugfs_entry[i].fops);
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
-
 static void it6505_shutdown(struct i2c_client *client)
 {
 	struct it6505 *it6505 = dev_get_drvdata(&client->dev);
@@ -3689,7 +3668,7 @@ static int it6505_i2c_probe(struct i2c_client *client)
 		it6505_poweron(it6505);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "it6505 device name: %s", dev_name(dev));
-	debugfs_init(it6505);
+	it6505_debugfs_create_files(client, it6505);
 	pm_runtime_enable(dev);
 
 	it6505->aux.name = "DP-AUX";
@@ -3712,7 +3691,6 @@ static void it6505_i2c_remove(struct i2c_client *client)
 
 	drm_bridge_remove(&it6505->bridge);
 	drm_dp_aux_unregister(&it6505->aux);
-	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
 	it6505_remove_edid(it6505);
 }
-- 
2.45.2


