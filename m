Return-Path: <linux-renesas-soc+bounces-24795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B3C6EC50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:15:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EEFDB387381
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998BB35A931;
	Wed, 19 Nov 2025 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wbwzn0uV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1775189906;
	Wed, 19 Nov 2025 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557617; cv=none; b=SZ6a5FBARiwL7s8ByAALd1OwZzl+SOoSSSYJU+w80gooQ3S0CJ6FMiGYFoLGdmVZhN1nA+f2g48cnmNdL4xNrHWKsV3GbjnghHOo4uVw47Nmk2SJk8HqJubtkiie0+RoI58EyMvIY1FI4KkFs96SATqgYedDk69pVNu5RjrQkVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557617; c=relaxed/simple;
	bh=WXwByyf8l8pwrIsUAoYT1/6g0UQBe65bfyQ07PZGFLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rY0oSI6WqYHIAOQY+vsVSSSBVHJhmeXJTK8LuNRdd1nXPLUL+JXbtpSSYQH8e5S3tgi3tmqLHPTz+/eCMRBFhOgYegCRFEOW1Z03Oh7ysIjZarVSmz3fboxDRwp628ZDI0TEoTmu2QXHunH+YFWOLC/lMGvQm0AO6Cl3gQ58rr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wbwzn0uV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61F1B1A1BE0;
	Wed, 19 Nov 2025 13:06:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D36F60720;
	Wed, 19 Nov 2025 13:06:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B60E410371A4D;
	Wed, 19 Nov 2025 14:06:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a6WNrs9Y6V3IsNLzdFtu7YCg0CGh4zNPN+hLyMO6Fv8=;
	b=Wbwzn0uVxzL0e/KdCS6XpEu2u22Bhj89nT+j8V+lPOjs5nB08HSlWeIApMk5lqJTqTx0O8
	9a5kGAyCI0h3tBIL8GeAcGlzc0wiypsysOh5/bTgohaGSpK/RcIzB2QSLjN3z7w7CSPZM1
	cM4BGVsG3eh7Tde1ClKXPAce/5EIU5PYIfS7SFSnZMXIk6yiqFYu9m27WJGMB+JzN8Zh2P
	quo7b5H7V2VwfrAeEsKpGgEDayBJtAZF4iG5+3Q8xtiLzu1eFF4eWL6V54/8JN+uRhynPR
	JnW87vN4WO5iAWPI0jGeBK1k5B58PyuUE/mB32X4RBtSbbm9g6gPzztHbAeBPQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:37 +0100
Subject: [PATCH 06/26] drm/bridge: add devm_drm_of_find_bridge
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-6-0db98a7fe474@bootlin.com>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Several drivers (about 20) follow the same pattern:

 1. get a pointer to a bridge (typically the next bridge in the chain) by
    calling of_drm_find_bridge()
 2. store the returned pointer in the private driver data, keep it until
    driver .remove
 3. dereference the pointer at attach time and possibly at other times

of_drm_find_bridge() is now deprecated because it does not increment the
refcount and should be replaced with drm_of_find_bridge() +
drm_bridge_put().

However some of those drivers have a complex code flow and adding a
drm_bridge_put() call in all the appropriate locations is error-prone,
leads to ugly and more complex code, and can lead to errors over time with
code flow changes.

To handle all those drivers in a straightforward way, add a devm variant of
drm_of_find_bridge() that adds a devm action to invoke drm_bridge_put()
when the said driver is removed. This allows all those drivers to put the
reference automatically and safely with a one line change:

  - priv->next_bridge = of_drm_find_bridge(remote_np);
  + priv->next_bridge = devm_drm_of_find_bridge(dev, remote_np);

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 09ad825f9cb8..c7baafbe5695 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1446,6 +1446,36 @@ struct drm_bridge *drm_of_find_bridge(struct device_node *np)
 }
 EXPORT_SYMBOL(drm_of_find_bridge);
 
+/**
+ * devm_drm_of_find_bridge - find the bridge corresponding to the device
+ *			     node in the global bridge list and add a devm
+ *			     action to put it
+ *
+ * @dev: device requesting the bridge
+ * @np: device node
+ *
+ * On success the returned bridge refcount is incremented, and a devm
+ * action is added to call drm_bridge_put() when @dev is removed. So the
+ * caller does not have to put the returned bridge explicitly.
+ *
+ * RETURNS:
+ * drm_bridge control struct on success, NULL on failure
+ */
+struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np)
+{
+	struct drm_bridge *bridge = drm_of_find_bridge(np);
+
+	if (bridge) {
+		int err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
+
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_drm_of_find_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e74e91004c48..98d5433f7d35 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1314,12 +1314,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 #ifdef CONFIG_OF
 struct drm_bridge *drm_of_find_bridge(struct device_node *np);
+struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
 static inline struct drm_bridge *drm_of_find_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline struct drm_bridge *devm_drm_of_find_bridge(struct device *dev, struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.51.1


