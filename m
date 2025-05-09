Return-Path: <linux-renesas-soc+bounces-16883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1199AB16C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 666B19E3F75
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68AD3296D29;
	Fri,  9 May 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Usqh6mMP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB461296D08;
	Fri,  9 May 2025 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799040; cv=none; b=QzDg+kld0Ww+2+ccVqHldeBtj6jjpULDbv9n/mQES1rQpkukLCHnch2Kjkub+N4dqvDvayjJTJygZ5Bhd4EupotTdBfw017fNttukR2zwVMDUl+Dh47/NqWpPA8sFIYX6CyMtotjV5oRnzLzyQJB3FugO/+FS5wBnw7iPSbikjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799040; c=relaxed/simple;
	bh=1dytHc3Djh/f1ZiUgTbHvNsKqiqKMFeTjtarSBq5zN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gx7AZIdFvmU9juOASPZeNS0q+CC6tfTjeGZ5qdWqHwv2lXFTAwhSigw1IYaJpeKQmf9gQwljNL06tFdzfAmiqnm1+hKYc20e3GxC13Kf5zt2NlMPw//6kLlYzHqxXvpFSmD2zYGA7XZ856tbigiaDRpVGCgON9xyFC+Iy5TqqTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Usqh6mMP; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA81643B50;
	Fri,  9 May 2025 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZGU6iOHbHyTiUUkRCME+uIMdoFXKaz/X2Ih0wRVgjk=;
	b=Usqh6mMP95pCrT0NiiEmhQhuCbKptj0ZtH1s/XrzXx9idGdBrFVrlqJlZzfMJAvFoRMcHJ
	h4PFKxrZlQnt7ORIp1Iv823ka95zpQi5/alPfta4cChWsI9FyYBg9Avpt1qpEhaWbo18V6
	Zlk6bTk/km2NhKhIH+Msqt0Lel3GDPM9uO2yX6zz0kHxQr+c3QnwlJbd9V5E7yVNH2Ssgm
	/OxE2FqYRVKu9hpRHRXARhWT9ly2LoviG+6g7c+M6n5hXHwdR2lPRTWpGkKh+gwe0o9vn7
	oVq17CQGfv7duymYD6mQ7xH4VbATIHlzNt6dHz7m7vqU/IYG/G/xZ5Tuee/ByA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:46 +0200
Subject: [PATCH v3 20/22] drm/bridge: add devm_drm_put_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-20-b8bc1f16d7aa@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedukeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeelpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnu
 higqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrshhrihhvrghtshesrhgvughhrghtrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Bridges obtained via devm_drm_bridge_alloc(dev, ...) will be put when the
requesting device (@dev) is removed.

However drivers which obtained them may need to put the obtained reference
explicitly. One such case is if they bind the devm removal action to a
different device than the one implemented by the driver itself and which
might be removed at a different time, such as bridge/panel.c.

Add devm_drm_put_bridge() to manually release a devm-obtained bridge in
such cases.

This function is considered only a temporary workaround until the panel
bridge is reworked and should be removed afterwards.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- document this function is a temporary workaround, not to be used
  (in kerneldoc and commit message)

Changes in v2: none
---
 drivers/gpu/drm/drm_bridge.c | 17 +++++++++++++++++
 include/drm/drm_bridge.h     |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index b4c89ec01998b849018ce031c7cd84614e65e710..d0e81639927a73422671b7b43f3e8a946f1d4300 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1392,6 +1392,23 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif
 
+/**
+ * devm_drm_put_bridge - Release a bridge reference obtained via devm
+ * @dev: device that got the bridge via devm
+ * @bridge: pointer to a struct drm_bridge obtained via devm
+ *
+ * Same as drm_bridge_put() for bridge pointers obtained via devm functions
+ * such as devm_drm_bridge_alloc().
+ *
+ * This function is a temporary workaround and MUST NOT be used. Manual
+ * handling of bridge lifetime is inherently unsafe.
+ */
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge)
+{
+	devm_release_action(dev, drm_bridge_put_void, bridge);
+}
+EXPORT_SYMBOL(devm_drm_put_bridge);
+
 static void drm_bridge_debugfs_show_bridge(struct drm_printer *p,
 					   struct drm_bridge *bridge,
 					   unsigned int idx)
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..6f00a3998ed6d026332b0f1e3bb5bee3cb5158e0 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1265,6 +1265,8 @@ static inline struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge) {}
+
 static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 						     struct device_node *node,
 						     u32 port,
@@ -1274,6 +1276,8 @@ static inline struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
 }
 #endif
 
+void devm_drm_put_bridge(struct device *dev, struct drm_bridge *bridge);
+
 void drm_bridge_debugfs_params(struct dentry *root);
 void drm_bridge_debugfs_encoder_params(struct dentry *root, struct drm_encoder *encoder);
 

-- 
2.49.0


