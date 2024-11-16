Return-Path: <linux-renesas-soc+bounces-10546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A309D9CFEF1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 13:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA43BB22354
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 12:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF8A191F89;
	Sat, 16 Nov 2024 12:59:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6F7A47;
	Sat, 16 Nov 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731761987; cv=none; b=crmRGdejoQqVbJJOSaFDrEVe/KbZJ5JmI7U0b06n9QRMrsWBtZDvdmpN9VTqyhPegUXgiaUVtcK8rkoyFqeSdHIwCFjFxucwL9JD7XuUnxOudAKpGlDb7A1KNbfAOoX0cdtt/p911UvsXoYrZwibYhg6m/IPYnqD4pJuP0RtIBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731761987; c=relaxed/simple;
	bh=NVgFw+SSpPSIvYU6uBDlHDa2fpEyehwmTmHD0H5B6OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSdOdK2UKZPpnf9GbtVMPBYpr6RyHocLC2u0+TDJRIPh8/O5WCAcu5kETgadJaQXtuctb+nN4Mm96xlXmyZtSuPNEOALrVhMiNKGGg7owem28QSFuXKH7okWgkNwdiLNUpZ42KYjN5s4aIAQvfeF2QOv5dnOqpbHiSWqi3A+6Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.12,159,1728918000"; 
   d="scan'208";a="225033474"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2024 21:54:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 845E240061A2;
	Sat, 16 Nov 2024 21:54:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
Date: Sat, 16 Nov 2024 12:54:10 +0000
Message-ID: <20241116125415.30799-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241116125415.30799-1-biju.das.jz@bp.renesas.com>
References: <20241116125415.30799-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host_node pointer was assigned and freed in adv7533_parse_dt(), and
later, adv7533_attach_dsi() used the same. Fix this use-after-free issue
with the below changes:

 1. Drop host_node from struct adv7511 and instead use a local pointer in
    adv7511_probe().
 2. Update adv7533_parse_dt() to return the host_node.
 3. Pass the host_node as a parameter to adv7533_attach_dsi().
 4. Call of_node_put() after use.

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v4:
 - Updated commit description.
 - Dropped host_node from struct adv7511 and instead used a local pointer
   in probe(). Also freeing of host_node pointer after use is done in
   probe().
Changes in v3:
 - Replace __free construct with readable of_node_put().
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7511.h     |  6 +++---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 22 ++++++++++++++------
 drivers/gpu/drm/bridge/adv7511/adv7533.c     | 20 +++++++++---------
 3 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
index ec0b7f3d889c..9f3fae7cc597 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
@@ -383,7 +383,6 @@ struct adv7511 {
 	struct regulator_bulk_data *supplies;
 
 	/* ADV7533 DSI RX related params */
-	struct device_node *host_node;
 	struct mipi_dsi_device *dsi;
 	u8 num_dsi_lanes;
 	bool use_timing_gen;
@@ -417,8 +416,9 @@ enum drm_mode_status adv7533_mode_valid(struct adv7511 *adv,
 					const struct drm_display_mode *mode);
 int adv7533_patch_registers(struct adv7511 *adv);
 int adv7533_patch_cec_registers(struct adv7511 *adv);
-int adv7533_attach_dsi(struct adv7511 *adv);
-int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
+int adv7533_attach_dsi(struct adv7511 *adv, struct device_node *host_node);
+struct device_node *adv7533_parse_dt(struct device_node *np,
+				     struct adv7511 *adv);
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
 int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index eb5919b38263..3f1f309791a5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1209,6 +1209,7 @@ static int adv7511_parse_dt(struct device_node *np,
 static int adv7511_probe(struct i2c_client *i2c)
 {
 	struct adv7511_link_config link_config;
+	struct device_node *host_node = NULL;
 	struct adv7511 *adv7511;
 	struct device *dev = &i2c->dev;
 	unsigned int val;
@@ -1233,12 +1234,17 @@ static int adv7511_probe(struct i2c_client *i2c)
 	if (ret && ret != -ENODEV)
 		return ret;
 
-	if (adv7511->info->link_config)
+	if (adv7511->info->link_config) {
 		ret = adv7511_parse_dt(dev->of_node, &link_config);
-	else
-		ret = adv7533_parse_dt(dev->of_node, adv7511);
-	if (ret)
-		return ret;
+		if (ret)
+			return ret;
+	}
+
+	if (adv7511->info->has_dsi) {
+		host_node = adv7533_parse_dt(dev->of_node, adv7511);
+		if (IS_ERR(host_node))
+			return PTR_ERR(host_node);
+	}
 
 	ret = adv7511_init_regulators(adv7511);
 	if (ret)
@@ -1343,9 +1349,11 @@ static int adv7511_probe(struct i2c_client *i2c)
 	}
 
 	if (adv7511->info->has_dsi) {
-		ret = adv7533_attach_dsi(adv7511);
+		ret = adv7533_attach_dsi(adv7511, host_node);
 		if (ret)
 			goto err_unregister_audio;
+
+		of_node_put(host_node);
 	}
 
 	return 0;
@@ -1362,6 +1370,8 @@ static int adv7511_probe(struct i2c_client *i2c)
 err_i2c_unregister_edid:
 	i2c_unregister_device(adv7511->i2c_edid);
 uninit_regulators:
+	if (host_node)
+		of_node_put(host_node);
 	adv7511_uninit_regulators(adv7511);
 
 	return ret;
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 4481489aaf5e..5d0e55ef4028 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -131,7 +131,7 @@ int adv7533_patch_cec_registers(struct adv7511 *adv)
 				    ARRAY_SIZE(adv7533_cec_fixed_registers));
 }
 
-int adv7533_attach_dsi(struct adv7511 *adv)
+int adv7533_attach_dsi(struct adv7511 *adv, struct device_node *host_node)
 {
 	struct device *dev = &adv->i2c_main->dev;
 	struct mipi_dsi_host *host;
@@ -142,7 +142,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 						   .node = NULL,
 						 };
 
-	host = of_find_mipi_dsi_host_by_node(adv->host_node);
+	host = of_find_mipi_dsi_host_by_node(host_node);
 	if (!host)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "failed to find dsi host\n");
@@ -166,22 +166,22 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 	return 0;
 }
 
-int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
+struct device_node *adv7533_parse_dt(struct device_node *np,
+				     struct adv7511 *adv)
 {
+	struct device_node *host_node;
 	u32 num_lanes;
 
 	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
 
 	if (num_lanes < 1 || num_lanes > 4)
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	adv->num_dsi_lanes = num_lanes;
 
-	adv->host_node = of_graph_get_remote_node(np, 0, 0);
-	if (!adv->host_node)
-		return -ENODEV;
-
-	of_node_put(adv->host_node);
+	host_node = of_graph_get_remote_node(np, 0, 0);
+	if (!host_node)
+		return ERR_PTR(-ENODEV);
 
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
@@ -190,5 +190,5 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	adv->rgb = true;
 	adv->embedded_sync = false;
 
-	return 0;
+	return host_node;
 }
-- 
2.43.0


