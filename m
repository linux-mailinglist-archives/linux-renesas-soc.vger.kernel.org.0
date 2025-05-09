Return-Path: <linux-renesas-soc+bounces-16879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A461BAB167D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDB58B26CED
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720A429615F;
	Fri,  9 May 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GLTkiwfP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F359429614B;
	Fri,  9 May 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799028; cv=none; b=so0Sb7aHIKHnV52IxUSsqU4Y+dB3eAeHi7nT+kas3podHZqMW90F64iZwLGyvEJBcWni64F5hO19jtseG2PxnXqP4PqJHQWdPjVwMTfiU0vToi+zrlm4HwIAo+HEAQQUMzC3dYof+wuByMA8/94tQ64GlrslEpPoBUJT+1lgDSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799028; c=relaxed/simple;
	bh=98/m/PFHRDmjdTtxkrSA7+iuY8qLKWDeP8bjCaX6tS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aU3XBG6kP5I3H8psSZi4kMVhVd1RJXBDGjklcW8Q09V9PU/+9nJZqfsr92gD2QF2jrF1bi+FOImWrDUFd5Pb7ijIr0eio6AwS6UbZKj7h6zzgDnoALLqAUEbFekNNNXhoOlQh1YNOL5itGOjMPq9lw5rTP2IHaoUFjOe0MYNQ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GLTkiwfP; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CC9D43B5C;
	Fri,  9 May 2025 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+Yzp90os1B1+K7TxmcOkUZ2pL98oF+RE1fH12ahofw=;
	b=GLTkiwfPIyff8yrwQGlb1NRxSNw7C7DYt4+dVEl+10LGfIFOSW4hzkE7/gWMkTxQ954TjV
	Zy50N1Q0HCG98t7SwoIGYqOgxr17LjkP3B4u5btGDg/d+4jzYA/nT63dZhjImayXOo1jXb
	AXTL6wUEEgofInXQVkkOsB/VWpKD/qo+Fz6AoVU8NBY3+bHfIjvrNtnZnk+AZ76OpturfV
	ZU92eRlnMuZvGwryaaRk7RAx51veKDbfnRaTeiLutsdVLtq1n1qhzcfAxt4T5q/o9ckVhD
	Wc5ycGU1BCVpb07X0Ur03Vt1zmzT6mzM2XyA4GfFVRcEEAHSueZauA5I8WTxlQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:42 +0200
Subject: [PATCH v3 16/22] drm/sti: dvo: convert to devm_drm_bridge_alloc()
 API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-16-b8bc1f16d7aa@bootlin.com>
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, 
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
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlrghinhdrvhholhhmrghtsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

This driver allocates the DRM bridge separately from the main driver
private struct, which prevents using the new devm_drm_bridge_alloc()
API. Simplify the code by replacing the struct drm_bridge pointer with an
embedded struct drm_bridge inside the private struct, to make use of the
new API with the same code flow.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>

Changed in v2:
- fix typos in commit message
---
 drivers/gpu/drm/sti/sti_dvo.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
index 74a1eef4674eeabc445b53b380e325f785242024..7484d3c3f4ed5fac7eab408e30cbe2f6b87f27e5 100644
--- a/drivers/gpu/drm/sti/sti_dvo.c
+++ b/drivers/gpu/drm/sti/sti_dvo.c
@@ -97,7 +97,7 @@ struct sti_dvo {
 	struct dvo_config *config;
 	bool enabled;
 	struct drm_encoder *encoder;
-	struct drm_bridge *bridge;
+	struct drm_bridge bridge;
 };
 
 struct sti_dvo_connector {
@@ -439,7 +439,6 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	struct drm_encoder *encoder;
 	struct sti_dvo_connector *connector;
 	struct drm_connector *drm_connector;
-	struct drm_bridge *bridge;
 	int err;
 
 	/* Set the drm device handle */
@@ -455,20 +454,14 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 
 	connector->dvo = dvo;
 
-	bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge)
-		return -ENOMEM;
-
-	bridge->driver_private = dvo;
-	bridge->funcs = &sti_dvo_bridge_funcs;
-	bridge->of_node = dvo->dev.of_node;
-	drm_bridge_add(bridge);
+	dvo->bridge.driver_private = dvo;
+	dvo->bridge.of_node = dvo->dev.of_node;
+	drm_bridge_add(&dvo->bridge);
 
-	err = drm_bridge_attach(encoder, bridge, NULL, 0);
+	err = drm_bridge_attach(encoder, &dvo->bridge, NULL, 0);
 	if (err)
 		return err;
 
-	dvo->bridge = bridge;
 	connector->encoder = encoder;
 	dvo->encoder = encoder;
 
@@ -490,7 +483,7 @@ static int sti_dvo_bind(struct device *dev, struct device *master, void *data)
 	return 0;
 
 err_sysfs:
-	drm_bridge_remove(bridge);
+	drm_bridge_remove(&dvo->bridge);
 	return -EINVAL;
 }
 
@@ -499,7 +492,7 @@ static void sti_dvo_unbind(struct device *dev,
 {
 	struct sti_dvo *dvo = dev_get_drvdata(dev);
 
-	drm_bridge_remove(dvo->bridge);
+	drm_bridge_remove(&dvo->bridge);
 }
 
 static const struct component_ops sti_dvo_ops = {
@@ -515,10 +508,10 @@ static int sti_dvo_probe(struct platform_device *pdev)
 
 	DRM_INFO("%s\n", __func__);
 
-	dvo = devm_kzalloc(dev, sizeof(*dvo), GFP_KERNEL);
-	if (!dvo) {
-		DRM_ERROR("Failed to allocate memory for DVO\n");
-		return -ENOMEM;
+	dvo = devm_drm_bridge_alloc(dev, struct sti_dvo, bridge, &sti_dvo_bridge_funcs);
+	if (IS_ERR(dvo)) {
+		DRM_ERROR("Failed to allocate DVO\n");
+		return PTR_ERR(dvo);
 	}
 
 	dvo->dev = pdev->dev;

-- 
2.49.0


