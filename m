Return-Path: <linux-renesas-soc+bounces-15465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E87BA7E1FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717BF440FA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DCE1FC117;
	Mon,  7 Apr 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YErJ+yRu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D605D1FBE86;
	Mon,  7 Apr 2025 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035895; cv=none; b=lr/nCDaLd8j8tAfPQiceJCo7n79ABUz9JAQC+T1zXSunnXsOaenl8wMqLbLyn5K14CBPR/jCKVC9Em6EzIxOLD//bcOOQtDOqBdezf197NKEjezOfrnMYwnElDSm7XKoDlNQ5//N+kT0Vt2lYzBEGOK3vT0xwMO0wNIGlDV2KB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035895; c=relaxed/simple;
	bh=tTxpAf9alDCJ7L9yUaQDc+4W9VZk0MQmh6p5Fz6cNV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orPCBM6SastgRW9fV7dSZD26oKC3mOzvAjkxau9OhaFCHG82JMyU2RlXzxH+22+LvysSd2lGlkQJ3di7rHyNwgACSI23muDp1/ImqxlSRmQyDEjBJDC9x1QVqle5FBAHnpsoQaGWmffEJpsTUH/hc871uaGvZeGwD51e//8gGvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YErJ+yRu; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 35FCD442B6;
	Mon,  7 Apr 2025 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mG0BdbYLnYS2fDGFJxkE3Brg3k79+bhD5oQ9Jl7rtV8=;
	b=YErJ+yRulJPXcTsWwIx+RjzZfeMBdN94jz2LlpTQWwFVL9QWYXvK48QGceeQ/rBfTl8ZOO
	C5iv1S6pQhYwCoE3QeRDAr2Wy1k6WUemULD/Ht8UyAnpl9WZK9JHu9Mc6g3NsFbOdYHapk
	Zlgmhx60mR6ESmSytuqFCVAs9cDK+j5hp2e0p8Qm4TUHy2s5ll83ftLL94396exFTvYAys
	Z2FCc2q/XUM7QhiK1qUNsdYWheYz8qQ5uwIf5gLHyyEpdw5NefxO2Sv/mxDw/8e51OpKGl
	g6cs+EfWVhvTgACBU0A/PwB4Q+LYoGaJyvMrOojnd3q9sVEqEy1glJVRKf59Cg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:31 +0200
Subject: [PATCH 16/34] drm/msm/dp: convert to devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-16-42113ff8d9c0@bootlin.com>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeduvdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegiedprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 022b3e815cf39e33edc8a54963722d045ac74535..50f503d34e53417b9a622b08a9838e194396a80a 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -295,14 +295,15 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	struct msm_dp_bridge *msm_dp_bridge;
 	struct drm_bridge *bridge;
 
-	msm_dp_bridge = devm_kzalloc(dev->dev, sizeof(*msm_dp_bridge), GFP_KERNEL);
-	if (!msm_dp_bridge)
-		return -ENOMEM;
+	msm_dp_bridge = devm_drm_bridge_alloc(dev->dev, struct msm_dp_bridge, bridge,
+					      msm_dp_display->is_edp ? &msm_edp_bridge_ops :
+					      &msm_dp_bridge_ops);
+	if (IS_ERR(msm_dp_bridge))
+		return PTR_ERR(msm_dp_bridge);
 
 	msm_dp_bridge->msm_dp_display = msm_dp_display;
 
 	bridge = &msm_dp_bridge->bridge;
-	bridge->funcs = msm_dp_display->is_edp ? &msm_edp_bridge_ops : &msm_dp_bridge_ops;
 	bridge->type = msm_dp_display->connector_type;
 	bridge->ycbcr_420_allowed = yuv_supported;
 

-- 
2.49.0


