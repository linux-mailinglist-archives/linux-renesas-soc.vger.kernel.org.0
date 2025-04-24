Return-Path: <linux-renesas-soc+bounces-16348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E83A9B7B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 21:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B81F34C3A10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 19:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DEA293440;
	Thu, 24 Apr 2025 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g1r8+lR7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9908290BD0;
	Thu, 24 Apr 2025 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745521267; cv=none; b=e4ZwRfI3pncs8t1y0lRCa5BQbmD76DnG/evLyvjjKdCSmVK4eoepaQqYy3qgdhK3uNFWm6LMW7MkfFtuFF6EElSfo3jqAf4O9jgisa0j+gFY/wI5C40TrUcARTNrkiPY0tXdAPhuYZePoEkSqJ3Zj7dC4fQ/93fRipaocALJz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745521267; c=relaxed/simple;
	bh=uW4iQOdfg6yxuzNxeT4j6N+iwFwXu1WXryh43KlkTWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdmiMYTjBwSSa7Snj1hyIQB84Ekhq/zD3r/HG/Y8wwhQiDVZK1ho0T/nUwuLDc2SC76Af5SEPqp+R89c+8BAvLgHLFB0kFKzUQvNhxo1ivKSattIIesZgd2fmkW9vxYfEWYvtXTD46g3NinUeiaix2zAFBj0VqBumtl0PJ6YqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g1r8+lR7; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A1BE43B79;
	Thu, 24 Apr 2025 19:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOcho37MvrVhiA5dQkVJX8FlRBRSDHiJRf+zEmA1rlY=;
	b=g1r8+lR75BILuX/h2jyNQ8ZdU7XNQTBhAGYf7L/DICym+nMkLhdqblJBO1iyhrCl1ztRvS
	KBJnU8b5He5cXQruyxT/422xyr4fP/+DNv/W169SHYgBCX0daOZTFcLE6CoSpIa2ODu234
	+IBUyQ86avR/i1e8HAO4aqh1uMhGvyGl48Xj69C7vAqJyq7bmFcmk3HRcJ6ff9swuRD5Nl
	DrSKZFaK9XgbC/EiGQmkhWmwY1W+hK4eXE++3IK/fw76a9JLFJh/6oZeVASdnMYFK9lrkA
	st+miVeJoDdqcJlJNkly+tbRknfhXPkegVSt8xT0UuaP78ConW/b1y8byun+dw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:31 +0200
Subject: [PATCH v2 24/34] drm/omap: dss: venc: convert to
 devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-24-8f91a404d86b@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvddunecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

Switching from a non-devm to a devm allocation allows removing the kfree()
in the remove function and in the probe error management code, and as a
consequence to simplify the code flow by removing now unnecessary gotos.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 50349518eda1630400529caf27ca4469bb09fc82..9b5d53dc361e654a2e4009c3c81b726f9ef76ced 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -664,7 +664,6 @@ static const struct drm_bridge_funcs venc_bridge_funcs = {
 
 static void venc_bridge_init(struct venc_device *venc)
 {
-	venc->bridge.funcs = &venc_bridge_funcs;
 	venc->bridge.of_node = venc->pdev->dev.of_node;
 	venc->bridge.ops = DRM_BRIDGE_OP_MODES;
 	venc->bridge.type = DRM_MODE_CONNECTOR_SVIDEO;
@@ -809,9 +808,9 @@ static int venc_probe(struct platform_device *pdev)
 	struct venc_device *venc;
 	int r;
 
-	venc = kzalloc(sizeof(*venc), GFP_KERNEL);
-	if (!venc)
-		return -ENOMEM;
+	venc = devm_drm_bridge_alloc(&pdev->dev, struct venc_device, bridge, &venc_bridge_funcs);
+	if (IS_ERR(venc))
+		return PTR_ERR(venc);
 
 	venc->pdev = pdev;
 
@@ -824,26 +823,24 @@ static int venc_probe(struct platform_device *pdev)
 	venc->config = &venc_config_pal_trm;
 
 	venc->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(venc->base)) {
-		r = PTR_ERR(venc->base);
-		goto err_free;
-	}
+	if (IS_ERR(venc->base))
+		return PTR_ERR(venc->base);
 
 	venc->vdda_dac_reg = devm_regulator_get(&pdev->dev, "vdda");
 	if (IS_ERR(venc->vdda_dac_reg)) {
 		r = PTR_ERR(venc->vdda_dac_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDA_DAC regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	r = venc_get_clocks(venc);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = venc_probe_of(venc);
 	if (r)
-		goto err_free;
+		return r;
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -861,8 +858,6 @@ static int venc_probe(struct platform_device *pdev)
 	venc_uninit_output(venc);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free:
-	kfree(venc);
 	return r;
 }
 
@@ -875,8 +870,6 @@ static void venc_remove(struct platform_device *pdev)
 	venc_uninit_output(venc);
 
 	pm_runtime_disable(&pdev->dev);
-
-	kfree(venc);
 }
 
 static __maybe_unused int venc_runtime_suspend(struct device *dev)

-- 
2.49.0


