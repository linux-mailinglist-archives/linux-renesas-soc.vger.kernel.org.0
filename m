Return-Path: <linux-renesas-soc+bounces-15476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E862A7E202
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 702E01897442
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1151A202C36;
	Mon,  7 Apr 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IdnM/FzW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC7202988;
	Mon,  7 Apr 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035932; cv=none; b=Fn489B++EPIESayQUk39pVJI8h1dvvuhCxUAfINCd1fI36pRBIW8Y6mhcfmRJxGQSdbDVXtjHATjk94aw+ohcEwD2S+tplnCLw6S5k8csFr0OZoPGf4tJzFWDeWWeIU4gNRurzrg9oXAnVM7srmgUyJS3TBLYhMI9F+PLxjX8iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035932; c=relaxed/simple;
	bh=52S05p2aebn8qW6eDEFbFvmRjFpJQTqqkScplegH+RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEoDaVZ8bbDa1KAlOKo77vnMtTvSRjFW3XpPhnTR7VpbuehOi8J3brj5cGJHyKMJm4rIm3JNmm/o7d2pT/nJRptBM28kBZAfUhqiA7RfTZ2RE9tk2s6pHVNv7TbUivIMj9pNmhMrS9jVIrpzFNBYKQhqtbPBGL57isT2sh6V0KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IdnM/FzW; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ED98442B9;
	Mon,  7 Apr 2025 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F/X88yeD1voD1ZKSu14DhZwpptFTgIWDAW6qq25rOxI=;
	b=IdnM/FzWiqmeC4QLFNCoiaAiunvmEJdv+JOhvr+KgITXbyea9Nb/myky8AH7792qyUIAKb
	GXChJ406E5DOWWT80omvrh/feLFLi+aIk58+t+KBfm0z03mJHu+hEYqrKl/aTnrBFlJVvc
	c8aqvDV6iPYgcQdNwZnwCugnaTUqZ0LDtS6pxqLPV5WCbQoCVRsy9JT8jtJj26+iTmD/VD
	yRqkLdUZGexZAY0xUGoYauDk71Y8kWnmJPldCFLXcjnL4IPlbbO2bbe5DNxNtTqDS8broP
	LLAbNMf78c2dwGGtF/1WDG75gmA8KnHEDd1366lJq5e9VN3RWurZpRmJ0H3fFQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:42 +0200
Subject: [PATCH 27/34] drm/vc4: convert to devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-27-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffffgfefghfettedtfeehgfdtveekhfekudeiueetkeehleetveetjeffhedugeenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeegpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

This driver already implements refcounting of the struct vc4_dsi, which
embeds struct drm_bridge. Now this is a duplicate of the refcounting
implemented by the DRM bridge core, so convert the vc4_dsi_get/put() calls
into drm_bridge_get/put() calls and get rid of the driver-specific
refcounting implementation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_dsi.c | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index efc6f6078b026764c59cfb2a33b28a88b7018c3a..3071fa36fdfa8e3f4485019a64d83ef69fac73b6 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -552,8 +552,6 @@ struct vc4_dsi {
 	struct vc4_encoder encoder;
 	struct mipi_dsi_host dsi_host;
 
-	struct kref kref;
-
 	struct platform_device *pdev;
 
 	struct drm_bridge *out_bridge;
@@ -1622,29 +1620,11 @@ static void vc4_dsi_dma_chan_release(void *ptr)
 	dsi->reg_dma_chan = NULL;
 }
 
-static void vc4_dsi_release(struct kref *kref)
-{
-	struct vc4_dsi *dsi =
-		container_of(kref, struct vc4_dsi, kref);
-
-	kfree(dsi);
-}
-
-static void vc4_dsi_get(struct vc4_dsi *dsi)
-{
-	kref_get(&dsi->kref);
-}
-
-static void vc4_dsi_put(struct vc4_dsi *dsi)
-{
-	kref_put(&dsi->kref, &vc4_dsi_release);
-}
-
 static void vc4_dsi_release_action(struct drm_device *drm, void *ptr)
 {
 	struct vc4_dsi *dsi = ptr;
 
-	vc4_dsi_put(dsi);
+	drm_bridge_put(&dsi->bridge);
 }
 
 static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
@@ -1655,7 +1635,7 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder = &dsi->encoder.base;
 	int ret;
 
-	vc4_dsi_get(dsi);
+	drm_bridge_get(&dsi->bridge);
 
 	ret = drmm_add_action_or_reset(drm, vc4_dsi_release_action, dsi);
 	if (ret)
@@ -1810,15 +1790,12 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
 
-	dsi = kzalloc(sizeof(*dsi), GFP_KERNEL);
+	dsi = devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge, &vc4_dsi_bridge_funcs);
 	if (!dsi)
 		return -ENOMEM;
 	dev_set_drvdata(dev, dsi);
 
-	kref_init(&dsi->kref);
-
 	dsi->pdev = pdev;
-	dsi->bridge.funcs = &vc4_dsi_bridge_funcs;
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = dev->of_node;
 #endif
@@ -1836,7 +1813,6 @@ static void vc4_dsi_dev_remove(struct platform_device *pdev)
 	struct vc4_dsi *dsi = dev_get_drvdata(dev);
 
 	mipi_dsi_host_unregister(&dsi->dsi_host);
-	vc4_dsi_put(dsi);
 }
 
 struct platform_driver vc4_dsi_driver = {

-- 
2.49.0


