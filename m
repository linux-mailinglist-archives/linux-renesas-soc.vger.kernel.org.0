Return-Path: <linux-renesas-soc+bounces-15477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 375F3A7E20A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9893F1889C45
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732482040B9;
	Mon,  7 Apr 2025 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oOWb8P9F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FEC202C23;
	Mon,  7 Apr 2025 14:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035934; cv=none; b=vAt3rbX3KsW80YGLCBMxwrhMF9A+W1fXPooolN82oODreOtZyCP1cfZxIZQExFt66MAdfFkketsLmk8LymMFhMHWbOaVk+fCsVtQm8Si2k5G8ZQTmoPf52mhiLUHaXN23+nzWvd3VL9sDLbn1Oawa32UfVqe4u6Y8pdbr+BabK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035934; c=relaxed/simple;
	bh=FWwt5r1M6saI4datoXqxaURLvlzRbT6Al4pQENhM+24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VgCcFpaDFjtE5/HDsIAB54u4TS7A+4o7Iw38kIHULMLMAq1vyoeQAYPZ2F9DumBv1XtOTpHL3OH6skfH4VvEunSquBwdx4FqrY9H9Uanku8GqaLY9rRdll348P3VeAIfhtq/zQhqjniUjQaH9pGpV2qqekSqTaks2bdPeoOXlY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oOWb8P9F; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 883A3442C1;
	Mon,  7 Apr 2025 14:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMuV5fQzvBWH2GbEM+/UwAu4+XYOKk8NTQ6qP9rMcHQ=;
	b=oOWb8P9F8Nk9dMyl+CzbOf8XSs55YAkHBYF2NMy3SAmczv+oMrrl2MCUE8O5QgJGinFvm+
	S8kx3PzENmYH5LLyDrYRsTE0ml3A04SW6GgvUsp/gQ/1ncU+cFpbXcg+5q9SAJp+Tlba0H
	upUrh9i3nNqNifNCsfXGXk+4jBT8b7smsxrO438VRL76o53XyNtPyHRDh8xEqqA1wB0KMP
	0pPp4KjzLxRDZWQ6exLQwmO3n1ErLuBe+kxf0T8sRut4oNY/axsYAW3MsjmH53/NZxrGBF
	j4v1U9T06Xc9Y4i+WHYPPGxz1WT/AjdfamNvCFRvC+CvYPC35mGCC3y7L4Mi2g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:43 +0200
Subject: [PATCH 28/34] drm/sti: dvo: convert to devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-28-42113ff8d9c0@bootlin.com>
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
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvgeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegfedprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

This driver allocates the DRM bridge separately from the main driver
private struct, which prevents using the new devm_drm_bridge_alloc()
API. Simplify the code by replacing the struct drm_bridge opinter with an
embedded struct drm_bridge inside the provate struct, to make use of the
new API with the same code flow.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
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


