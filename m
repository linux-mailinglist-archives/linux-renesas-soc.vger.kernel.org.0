Return-Path: <linux-renesas-soc+bounces-26500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C4D08787
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 11:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 18630305DA6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 10:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8B433A008;
	Fri,  9 Jan 2026 10:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QMd2Dhf8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88143339872
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767953022; cv=none; b=sL3XWYhMbpd/X1vpfsJYppmbZMuZMQ7654RntqL8JPi4distdR1RAUiZGEG6B/BcQ2/F5ggI4DDhOJrb7nnUHgu581+YHWu2a8tKVLubX1Y05A8m3+xkLGEL96rMsxPQwHyFYge78KATk31a6IECNf+1BnJFOwMUI/muK5WiNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767953022; c=relaxed/simple;
	bh=8WTfePXDBQqLnstD3XXctVN8qSsinPcyJ1aBUmWBJyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SGpO9XCfQIZhGdEa0Y0tua6jDczw9W/8FMAp7/gTfWFf5cvIT6ayDnNot9FJ1c8963KdwI/xDwxnCWOsZxIXeZo4WI1D48n9v3+nRMIYklD/v5RZQwmktd0pvaZnVe1ynNbCtyuxxaZQ2bvL5dJa2Vl7afUlH2kkh+9yME+W9xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QMd2Dhf8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7309C1F6D3;
	Fri,  9 Jan 2026 10:03:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11C9560734;
	Fri,  9 Jan 2026 10:03:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83744103C88D2;
	Fri,  9 Jan 2026 11:03:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767953015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/SEnvILKis2K8TQc2e0J/EfZp0VkAsieLSYp0vPG558=;
	b=QMd2Dhf8C7VDVY3winTShkqSbLELJJwFtbNxwjnPdCYsv8g1PpxVZh24c+Bq48qPKiXjVN
	kSMcnUO28jl24PrPhnxMhrXlYUL/hSZvaikbjBD4V7SpAUWGNvApTykY97V3vh6kTOM/2/
	b/o6NEpKo5enWj0jrpimRtal1LjRDf4V+075vvDB3FF+7JmNeXv2asPqmmpp/H9n5G+MHN
	V7DkWGe7zaeGxohbnHgc1y/FtBrzWeOGidIdUinCMJKjHZyXOYu8LxNdhkQMDrZJ9Mygog
	I3oOefYg2q/VCnl08Xa8KStJ+I4utKEc0cXNLT6gEf+A/hnsFuBVVSC5yc6PRQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 11:02:53 +0100
Subject: [PATCH v2 4/6] drm/mediatek: mtk_hdmi*: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-4-8d7a3dbacdf4@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c        | 4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 4 ++--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0face4dcaa36..1ea259854780 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -986,8 +986,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(encoder, hdmi->next_bridge,
+	if (hdmi->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->bridge.next_bridge,
 					bridge, flags);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..40ded86dbea3 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -315,8 +315,8 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return -EINVAL;
 
 	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
+		hdmi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
+		if (!hdmi->bridge.next_bridge) {
 			dev_err(dev, "Waiting for external bridge\n");
 			of_node_put(remote);
 			return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..cace3c5dc067 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -150,7 +150,6 @@ struct mtk_hdmi_conf {
 
 struct mtk_hdmi {
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
 	struct device *dev;
 	const struct mtk_hdmi_conf *conf;
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..2adeece499b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -940,8 +940,8 @@ static int mtk_hdmi_v2_bridge_attach(struct drm_bridge *bridge,
 		DRM_ERROR("The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
 		return -EINVAL;
 	}
-	if (hdmi->next_bridge) {
-		ret = drm_bridge_attach(encoder, hdmi->next_bridge, bridge, flags);
+	if (hdmi->bridge.next_bridge) {
+		ret = drm_bridge_attach(encoder, hdmi->bridge.next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}

-- 
2.52.0


