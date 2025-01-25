Return-Path: <linux-renesas-soc+bounces-12498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E35A1C35C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EAD83A4B4E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738AF1FC7C3;
	Sat, 25 Jan 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J44Rw9f/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904DB20766F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809617; cv=none; b=jY+4BklEmOq4bo3PYd2nwA/78nzRwf1gA4KrM4QpR/fSBo/n6TXKxw6urC0le6LHzmhcvbXRic+w6lmUXuNOnRmqlXkaQrEsC4QBUyGi1hlqWKo3SVTjCRIUtA1tSrY5pQD1LgFa/JeAyAiZtSxO/VrOk0BzU1CAxRXBGP5dIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809617; c=relaxed/simple;
	bh=FEBmWeLkZEqerjLIrB/unHPzKBICosqu+iR4Sr1RkHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQuUW4ekMGLoSwjcOwZLkmhv+n1rPXm+kCiViAWea5ydx1gjnnSShZAOnWsYOcPFtTta57pQSEu6Dko+M99u1Vuc7s6qcOA3UV7XKjhk72fL0+WzCU+Lzp0sABKezpxpSYnDIgZFqojSL8PTEB2bgrdYAk87ZA6ppPzTJYxU6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J44Rw9f/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HpHS4odsVswjCqjbec+pXYeIVQniHDgBLzuk8GR/0gY=; b=J44Rw9
	f/FfHGhighMk4Iv8wMGqN60UtiXzNNMXZK8dUDzm513dc3W0OVfiBndLcqV/AcJE
	Cu0HojUnKH65akaslCTOwMEnDlVOwomqhugRk4SGbFLBKtUKJTLKuzxYqKUcomZ+
	IEBsjXUuM/V5/BNd0r3Y140O3Ar7doVcE4uGBtVl3XljelZ2WFob7jynZx0iI7xX
	29wVPON2Gld8ZiyLHnWaqkfMC0GiZYZuo3V9x2mGlHwibEq8KuH7tWxmOG2k+4k4
	r+h/sdky+SjviTEUKIz7CpGxh3ypokAW0AFpfqIRB5/dRMYvGnl4ceoeXy0+ptKF
	mgpDBk/ChY2hNBgQ==
Received: (qmail 3874032 invoked from network); 25 Jan 2025 13:53:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:53:33 +0100
X-UD-Smtp-Session: l3s3148p1@BtqnVIcsksYujnvm
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
Subject: [PATCH RFT 2/2] drm/bridge: ti-sn65dsi86: Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:53:22 +0100
Message-ID: <20250125125320.37285-6-wsa+renesas@sang-engineering.com>
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
remove the custom handling.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 29 +--------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index e4d9006b59f1..57a3f592c057 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -427,33 +427,6 @@ static int status_show(struct seq_file *s, void *data)
 
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
@@ -1936,7 +1909,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	ti_sn65dsi86_debugfs_init(pdata);
+	debugfs_create_file("status", 0600, client->debugfs, pdata, &status_fops);
 
 	/*
 	 * Break ourselves up into a collection of aux devices. The only real
-- 
2.45.2


