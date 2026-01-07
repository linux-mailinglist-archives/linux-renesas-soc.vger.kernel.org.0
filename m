Return-Path: <linux-renesas-soc+bounces-26365-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692CCFEEA6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 17:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 428BB3359FC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC3A388050;
	Wed,  7 Jan 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bzDLu4ho"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9A378D95
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802967; cv=none; b=iL7smBCxPXvy/2wGHc8wU/61+k3ZHdFQGdV3qREuVvvPdY3r1BkXNSyUKe+vtBPEzdP+rNYEeEtpoz46ngIF51+fx/5Xx9AjMDo+t90y8tNx9dNxPy4ItqU19kbCTGQvL1Y1lkJaFBYc4LWnfSSzZd4PdcfiuERV41aNZF9fNj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802967; c=relaxed/simple;
	bh=0WnxvGR7dNcQV8FWGN9plU+h4WhCklUUdW0/lgwyyHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JH6PgxbJC9NgzGpYQHNQdhEkCtSvNYJ91NUjobVeKURk80qHNnrMLphDvgxBB9EtYaq+f2j8wIjmnuvkH2T0YV0dsaMwRkszx80/2QmqchNrHSD6MeZg5B1DksX0Gf05UfS2Yxzgfy9SQuQMB0+tpTKfbmi5GvSeFnmZBYAlWpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bzDLu4ho; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 083211A26E6;
	Wed,  7 Jan 2026 16:22:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDBE56072B;
	Wed,  7 Jan 2026 16:22:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DAA0103C87C7;
	Wed,  7 Jan 2026 17:22:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767802948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qkiR0P62QEUb1PCOEii1nVoSK2mCmCTz+ERz0qbz4sk=;
	b=bzDLu4hog3Yzapu+FCJaa75iEPEgDSakBa2bewsdNrO75fp1ds4LOGxHwDe7EK4GeGSQhJ
	l9ijvmCRCnj+9qfTD2679M1ipP3NBnXdgBMYGAud8sUuPBztTSS+Cs1CzC/w1APFIhguw8
	V2WVK0uZU8nZ2/mgFTNxxwsnxzVPsYW7MrWu7TF42BAOtRrvqPMjwj8VDRGYA9H6hzDBMd
	ORN05jWhnTBgKBmXhTqTHtMlUCsTzAKGn9EN/JdOOHv1Bcpu4h8PJJzxGuJOmMyswQZtLO
	X3PdwDEEQe+ZgynJ6865m0cZAIlwFoPQYmii3B/XEmsWX+WIc301Hkj56NUGNg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 17:22:00 +0100
Subject: [PATCH 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-2-ef48a517828e@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
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
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
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
is put when done.

dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
avoid potential use-after-free ensure the irq is freed before putting the
dw_hdmi->bridge reference.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 0d7c68b29dff..fef1702acb14 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -778,7 +778,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 	if (IS_ERR(meson_dw_hdmi->hdmi))
 		return PTR_ERR(meson_dw_hdmi->hdmi);
 
-	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
+	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
 
 	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
 
@@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
 				   void *data)
 {
 	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
+	struct platform_device *pdev = to_platform_device(dev);
+	int irq = platform_get_irq(pdev, 0);
 
+	devm_free_irq(dev, irq, meson_dw_hdmi);
 	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
+	drm_bridge_put(meson_dw_hdmi->bridge);
 }
 
 static const struct component_ops meson_dw_hdmi_ops = {

-- 
2.52.0


