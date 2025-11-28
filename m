Return-Path: <linux-renesas-soc+bounces-25342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A8C92B30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 17:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 258573B0DBE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08AB2DBF4B;
	Fri, 28 Nov 2025 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D9SPrZQm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97A52D876C;
	Fri, 28 Nov 2025 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348767; cv=none; b=TNUIwtDNV26UCKwesHXgPc5TUy7TpGlWd/cdPNV9MMJ/ESHlA1Hk7Cn+OrLViJrd1HIYKBZIlWSx7OOV1c+vNVwI+8X/+DNGoS7wgkl/hbm6PbaupIWAmeVpwvrJZAmgs8MG9MO9NkPJD2/IJEsQ5WmChzmEIJm3A/ho6C4SMSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348767; c=relaxed/simple;
	bh=knINAi4rAp8THNDJbIaP/v2VffMuZMS6fjT3GUTXpXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbBFhJx7eZyzAgA67RCFnrrl198asmkF7wLSINqVXZTyH8jnXSkkoBJSYIoYbgiZbR6edFTAVGlHLaJF8llrhkuGuKpJ7qJNNy6Z+4EWyHPdUO7i15d95eMhB2DY9cf6pGLW3izsW06OFNUF9eGlAzaNWlVHf0mVPUUF9WIyUWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D9SPrZQm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9D172C16A3C;
	Fri, 28 Nov 2025 16:52:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87E9D60706;
	Fri, 28 Nov 2025 16:52:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1009910B02155;
	Fri, 28 Nov 2025 17:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348762; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xY2ofXoGQhkxcQSEXj3JcIw9s5fwbRbm+biYrRLlQeM=;
	b=D9SPrZQmQfsfSxVbGR+pwv3gviqhxSdWmav5IWju8BOBdF1lGyaPh4I68aJac3CHyvbmCR
	xC+BaiLIpef6bnSe4czCRlm6hOy4g1r6spxJmmnkSC71kqqeyVqbSXNNoyUHuhkwAnlnrq
	YiQ5mlF3oiU4W9y1EdpSgW0NZmUVZsnsLvREUscdwINbFYUQf8lVH/uDovhtQLDPK+UxrH
	7ppyE5A3DM8VFejWx+CAdzSQCeY912uXF7DC2gvluWw94Xwewk2y/qw7uYsCyktC6XCtsb
	cDlXYTUTVJvHwZXYaAFIP6ApTsR118MyQ0obvDW7fqNBp3FxCkomcEwJpBF3FA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:16 +0100
Subject: [PATCH v2 06/26] drm/bridge: add devm_of_drm_get_bridge
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-6-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
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
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
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
refcount and should be replaced with of_drm_get_bridge() +
drm_bridge_put().

However some of those drivers have a complex code flow and adding a
drm_bridge_put() call in all the appropriate locations is error-prone,
leads to ugly and more complex code, and can lead to errors over time with
code flow changes.

To handle all those drivers in a straightforward way, add a devm variant of
of_drm_get_bridge() that adds a devm action to invoke drm_bridge_put()
when the said driver is removed. This allows all those drivers to put the
reference automatically and safely with a one line change:

  - priv->next_bridge = of_drm_find_bridge(remote_np);
  + priv->next_bridge = devm_of_drm_get_bridge(dev, remote_np);

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- fix return value: NULL on error, as documented, not an ERR_PTR
---
 drivers/gpu/drm/drm_bridge.c | 28 ++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 9b7e3f859973..59575a84eff6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1442,6 +1442,34 @@ struct drm_bridge *of_drm_get_bridge(struct device_node *np)
 }
 EXPORT_SYMBOL(of_drm_get_bridge);
 
+/**
+ * devm_of_drm_get_bridge - find the bridge corresponding to the device
+ *			    node in the global bridge list and add a devm
+ *			    action to put it
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
+struct drm_bridge *devm_of_drm_get_bridge(struct device *dev, struct device_node *np)
+{
+	struct drm_bridge *bridge = of_drm_get_bridge(np);
+
+	if (bridge) {
+		if (devm_add_action_or_reset(dev, drm_bridge_put_void, bridge))
+			return NULL;
+	}
+
+	return bridge;
+}
+EXPORT_SYMBOL(devm_of_drm_get_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0977eab78aac..da69cb252cad 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1314,12 +1314,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_get_bridge(struct device_node *np);
+struct drm_bridge *devm_of_drm_get_bridge(struct device *dev, struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
 static inline struct drm_bridge *of_drm_get_bridge(struct device_node *np)
 {
 	return NULL;
 }
+static inline struct drm_bridge *devm_of_drm_get_bridge(struct device *dev, struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.51.1


