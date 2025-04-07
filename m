Return-Path: <linux-renesas-soc+bounces-15485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB673A7E4F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 17:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B1CD427A9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FC01FF1B9;
	Mon,  7 Apr 2025 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LBZvLE2G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BC31FCFD3;
	Mon,  7 Apr 2025 15:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039672; cv=none; b=bswnRZuVtOQXcPrTThzmYfJgeGEJm8evqH4RarMheH+22nWSuFYqclAXHUGMc3kBiVGediePhtAVt8OSFfqy08Wf7AtBEM0z80cA4XNtJTZvyTm25kzGYGhbQYUWFnb9UP/YXsW0zkj//RYTTjEJ2vakCyDvBRkiojzwjkXSUmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039672; c=relaxed/simple;
	bh=ft5fAVeWE1b1HKhaLeGcIb2VFYMlP13maxhipyRumJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZY2Xu1OM3QMHWceYmnS7TTCp5/YBiXwM1XWu86slA+7PA7qxkW4nGhj0c1fHD4YOkWfaQgr7A5pWQAfBbcoX6hC/V5WepP4bcnb0iYzRBkju6U7KBtt8v+RKSHMjgVscSQIn1xci7wdCMFH0jF7JB6NkuhwM+w6idGENVpzJQQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LBZvLE2G; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72646431EA;
	Mon,  7 Apr 2025 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744039667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgX6S64ngnXsjU0lQPqeLHBfnA+UnbXv6BjQk1oGXZU=;
	b=LBZvLE2G+afaVJ2bwhuBl1x1YRR/aqaZ2Xm5yU+xaLjjIqM+WbNAKPx85Swnqti9EdXmCR
	jxm3gIWcOaG1co2jTwQSHLMwRfa/o37ZW3TL5sERhaicxQw3i4iyp8UcVcTXkH1w4KSGdk
	Y19KevZYjLYHr3HXXP8AducFPd1YdMFTPsJeGctmaMWsKIGeEO+n7SDKrX8kxYN5Z1gWgI
	+UT+rfLgfI9oZV+al0AMr7X1Hj0w9CZsV0S3DJwxwGrF5CvYlrRAnPH725fFHTQ9VF1+RR
	KAa03YipbyuRmYOv8qQstJ9OZTNaCvUkN6DRY2d/JonMQilxNjXgv50w/l7c9A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Dmitry Baryshkov <lumag@kernel.org>,
	=?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 34/34] drm/bridge: panel: convert to devm_drm_bridge_alloc() API
Date: Mon,  7 Apr 2025 17:27:39 +0200
Message-ID: <20250407-drm-bridge-convert-to-alloc-api-v1-34-42113ff8d9c0@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
References: <20250407-drm-bridge-convert-to-alloc-api-v1-0-42113ff8d9c0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtoffgsehtkeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudffiefgvdfftdffkeejjefhffduleejleeuieetieetgeehtefhjedtgeegieegnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhfrhhithiirdgsohigpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvp
 dhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

The devm lifetime management of this driver is peculiar. The underlying
device for the panel_bridge is the panel, and the devm lifetime is tied the
panel device (panel->dev). However the panel_bridge allocation is not
performed by the panel driver, but rather by a separate entity (typically
the previous bridge in the encoder chain).

Thus when that separate entoty is destroyed, the panel_bridge is not
removed automatically by devm, so it is rather done explicitly by calling
drm_panel_bridge_remove(). This is the function that does devm_kfree() the
panel_bridge in current code, so update it as well to put the bridge
reference instead.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Hervé Codina <herve.codina@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: dri-devel@lists.freedesktop.org
Cc: asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: chrome-platform@lists.linux.dev
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/gpu/drm/bridge/panel.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 79b009ab9396048eac57ad47631a902e949d77c6..ddd1e91970d09b93aa64f50cd9155939a12a2c6f 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -287,15 +287,14 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 	if (!panel)
 		return ERR_PTR(-EINVAL);
 
-	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
-				    GFP_KERNEL);
-	if (!panel_bridge)
-		return ERR_PTR(-ENOMEM);
+	panel_bridge = devm_drm_bridge_alloc(panel->dev, struct panel_bridge, bridge,
+					     &panel_bridge_bridge_funcs);
+	if (IS_ERR(panel_bridge))
+		return (void *)panel_bridge;
 
 	panel_bridge->connector_type = connector_type;
 	panel_bridge->panel = panel;
 
-	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
@@ -327,7 +326,7 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
 	panel_bridge = drm_bridge_to_panel_bridge(bridge);
 
 	drm_bridge_remove(bridge);
-	devm_kfree(panel_bridge->panel->dev, bridge);
+	devm_drm_put_bridge(panel_bridge->panel->dev, bridge);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 

-- 
2.49.0


