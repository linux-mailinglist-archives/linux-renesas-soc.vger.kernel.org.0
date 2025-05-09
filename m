Return-Path: <linux-renesas-soc+bounces-16874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3CAB169A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90859A21692
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40359295530;
	Fri,  9 May 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eMFvtUxV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C05292921;
	Fri,  9 May 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799012; cv=none; b=j+3ECEl5ufPbjQx5uYWKl3gffwM/R51HaIr7LR3c9VmrWXaSPFo/Jum/tYzuRm75rDo/Gm4gDIgRKWFLgI07MuTrCY/xQZL6l3YE2HFV/+b2H93r4P7oLp5gVb/WKLWLEvDOsN2Lp93FuT/Kiobbe2l1XoVtMv5TcLqD4VOiJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799012; c=relaxed/simple;
	bh=vl60lS2778JvwMCV2jLiYdxpmbXzOA5yssjilAqc57Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hTXom/lR+4CKp0Fo9ZhH4dkqMSgZRDKNgjXu56m9dx0vw1qRYbcvI31Kp9rWCDfub7Tdsc5xDtoy1t1z8HV+rIsT89bUgRNLqAOKFWtfiNZlQyWOX2jdnRSFUzVkTEFUOfL0uxtqpFQh6Q9XJsHw0TQC2+yEqIDHDe6nALy9PMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eMFvtUxV; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D4D243B67;
	Fri,  9 May 2025 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746799008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9+BYFVcRDiQgQH/nZjjYWzU/YP4kTmfchyC/pK/sOu4=;
	b=eMFvtUxV94hk0KKVGnqokdbyDGaJFQhieStJx4Rbr6YB07c5V61xRWT/fQSFhPQ3IJwm3s
	43cks3Cyyp3F9VMJwPJuF3IBo/p2cvQ0EH48vvk56AhZqZp5vZ7MupNa3ztDfOzxf62Z/3
	WMiRvLIXntMtDwZLJGOkac5/5zamOBPDCt5KUf1dW7HtQENOOQE8U0r0cvsBJHY4ocMjqj
	myG4mBtINqcdLVo4Oz24exG/K7vKDNDqVCyzOng4Xx9LxaE9xydjBGHrkutMwoN4IL14Rh
	1lwnUa6UdiDKvMfZeN/H8KJUW5zrXDUJ9gxo5r171whxoqaY+5ID7icAR27Y2g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 May 2025 15:53:37 +0200
Subject: [PATCH v3 11/22] drm/omap: dss: hdmi5: convert to
 devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-drm-bridge-convert-to-alloc-api-v3-11-b8bc1f16d7aa@bootlin.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdduudekngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegtddprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhug
 idqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

Switching from a non-devm to a devm allocation allows removing the kfree()
in the remove function and in the probe error management code, and as a
consequence to simplify the code flow by removing now unnecessary gotos.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index 0c98444d39a93d8336b4d8dbd45aa4521181c3b4..5636b3dfec1c9581118b20adecd268c03e882efb 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -480,7 +480,6 @@ static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
 
 static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
 {
-	hdmi->bridge.funcs = &hdmi5_bridge_funcs;
 	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
@@ -727,9 +726,9 @@ static int hdmi5_probe(struct platform_device *pdev)
 	int irq;
 	int r;
 
-	hdmi = kzalloc(sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(&pdev->dev, struct omap_hdmi, bridge, &hdmi5_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->pdev = pdev;
 
@@ -740,25 +739,24 @@ static int hdmi5_probe(struct platform_device *pdev)
 
 	r = hdmi5_probe_of(hdmi);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi_wp_init(pdev, &hdmi->wp, 5);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi_phy_init(pdev, &hdmi->phy, 5);
 	if (r)
-		goto err_free;
+		return r;
 
 	r = hdmi5_core_init(pdev, &hdmi->core);
 	if (r)
-		goto err_free;
+		return r;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		DSSERR("platform_get_irq failed\n");
-		r = -ENODEV;
-		goto err_free;
+		return -ENODEV;
 	}
 
 	r = devm_request_threaded_irq(&pdev->dev, irq,
@@ -766,7 +764,7 @@ static int hdmi5_probe(struct platform_device *pdev)
 			IRQF_ONESHOT, "OMAP HDMI", hdmi);
 	if (r) {
 		DSSERR("HDMI IRQ request failed\n");
-		goto err_free;
+		return r;
 	}
 
 	hdmi->vdda_reg = devm_regulator_get(&pdev->dev, "vdda");
@@ -774,7 +772,7 @@ static int hdmi5_probe(struct platform_device *pdev)
 		r = PTR_ERR(hdmi->vdda_reg);
 		if (r != -EPROBE_DEFER)
 			DSSERR("can't get VDDA regulator\n");
-		goto err_free;
+		return r;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -793,8 +791,6 @@ static int hdmi5_probe(struct platform_device *pdev)
 	hdmi5_uninit_output(hdmi);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
-err_free:
-	kfree(hdmi);
 	return r;
 }
 
@@ -807,8 +803,6 @@ static void hdmi5_remove(struct platform_device *pdev)
 	hdmi5_uninit_output(hdmi);
 
 	pm_runtime_disable(&pdev->dev);
-
-	kfree(hdmi);
 }
 
 static const struct of_device_id hdmi_of_match[] = {

-- 
2.49.0


