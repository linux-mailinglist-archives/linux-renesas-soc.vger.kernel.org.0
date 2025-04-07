Return-Path: <linux-renesas-soc+bounces-15478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD6A7E21B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0E41188A61B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA98204C26;
	Mon,  7 Apr 2025 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MvR2Us08"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E1C2046A5;
	Mon,  7 Apr 2025 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035937; cv=none; b=LBzDEi/xmigsb30xWhkFJs6BngzqEme51NE8nWjvssW14YUqPJvpYRBIDfAOUutTsuhaGcEkMo6dG/v6MH1kDUDgb7RG6afyWHn8qrAmNrKB0c572ca7It8Xj2vgMELsacyXMmIdAv5SUvTzl5HPxIz9uLNKJR3kGNp0RJothsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035937; c=relaxed/simple;
	bh=eGV1NHLmDnQV5yd06+zozzhVtqMip8coDzanoHDdWcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZVGkebrqNvX9JR7rLd5FUkt2yItZq3dLG9478CEfdDhKfbGyG/0r01yQ+NkwClvLKdOzIDxVUr2/4AOS1zo492SdoBbWXuu0Lld92avy7jAAcM6NdKxOgIAP+wBwdD67FUfageva/FhmsUjisBI07SUhHjGahHEM8rDFfksiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MvR2Us08; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8B68443AE;
	Mon,  7 Apr 2025 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3FWEw1G2sbWwRwK4wsDs1lETDuJQR8YFKZYWm0MnUo=;
	b=MvR2Us08NUfikuKz4xh+TnkajC5v+jRtsCRc7Cd3VY8SJP9Wr51paCNX+JRjk6QuX7otMl
	yzzUFfYbwsxpeqK6/w7k9JqSrw+I3VuHUW1RQHZCLS1CbB3ecpIQe39MMfVR4qJtP0WK6p
	Re/c+2bE2ag2UEQlqF60XSinQe5BFOnBwh87sche2KJW2UfNhtmiqeoztFAuQdmNe1qCQT
	SV8PuiiyLNPZDRMKZP8ahQL0hX42lIrb5FquWctVJ7+9Ql55iMVoT5R1MTxeYUj9NztgjQ
	9RTeLa732ATrp4N/BM8UcWsiNz6/vXe2ri8t1aYvq9TZVI4vx7RmEOaU42UbUw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:44 +0200
Subject: [PATCH 29/34] drm: zynqmp_dp: convert to devm_drm_bridge_alloc()
 API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-29-42113ff8d9c0@bootlin.com>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedvgeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeggedprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

This driver has a peculiar structure. zynqmp_dpsub.c is the actual driver,
which delegates to a submodule (zynqmp_dp.c) the allocation of a
sub-structure embedding the drm_bridge and its initialization, however it
does not delegate the drm_bridge_add(). Hence, following carefully the code
flow, it is correct to change the allocation function and .funcs assignment
in the submodule, while the drm_bridge_add() is not in that submodule.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 11d2415fb5a1f7fad03421898331289f2295d68b..de22b6457a78a7a2110f9f308d0b5a8700544010 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2439,9 +2439,9 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 	struct zynqmp_dp *dp;
 	int ret;
 
-	dp = kzalloc(sizeof(*dp), GFP_KERNEL);
-	if (!dp)
-		return -ENOMEM;
+	dp = devm_drm_bridge_alloc(&pdev->dev, struct zynqmp_dp, bridge, &zynqmp_dp_bridge_funcs);
+	if (IS_ERR(dp))
+		return PTR_ERR(dp);
 
 	dp->dev = &pdev->dev;
 	dp->dpsub = dpsub;
@@ -2488,7 +2488,6 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
 
 	/* Initialize the bridge. */
 	bridge = &dp->bridge;
-	bridge->funcs = &zynqmp_dp_bridge_funcs;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;

-- 
2.49.0


