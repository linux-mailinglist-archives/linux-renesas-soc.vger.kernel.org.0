Return-Path: <linux-renesas-soc+bounces-15466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F96DA7E1CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65EE9189B4B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837831FCF49;
	Mon,  7 Apr 2025 14:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PDIiOoG2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2004B1FC7D2;
	Mon,  7 Apr 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035898; cv=none; b=WkX3Nywffe1wwiGfkHPEpHzkglPXvJmJo463Q50kN5Es7nsKNEvdEUJCnuLSPwyCRACDdTXWYpZLTHeUZKoEHfOwivLQF7Atmk+7LMX3cDRr5QcTUMnYaGqIiyMaE1uY4y8AbmQ0F2tfYKReTHcegc4fNulTImt+MB8/YjDavfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035898; c=relaxed/simple;
	bh=WMvG2q3UbEbc5Gn3zfbZ4VlHL7Oquu7EjUQzjOOjz5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HfUyvpb/9G/GgQSKGZ92uViSK0hF7ohWnrM5zgueY97s6ViMJw+EnRBEELmPe05qVet1qC6Dvflj5qAY3m+PgOtfA8deCynbHLXEJKZkungg0MM9Q1JJ1StWv9PB7qi6RdTSFCBoNYNz6eKSswjNT6yWTygo1pODD6KVwc5Z5P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PDIiOoG2; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9819143281;
	Mon,  7 Apr 2025 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbkWAwvgsbpLvkTdp569jDde0qki3P/6p20V1n4J56E=;
	b=PDIiOoG2UCcoiQhTO66+W55Ptua8GSKHLdefcPkhWQlXHwL6+yJAhkWH5GKcKWMcL6KjQi
	mD8cFY4nEtBizaKv4L5xzylYlUbYA5i462gAAnoJfO7z1yZZzrzHcyyXGzYw4N54ONvsdZ
	5bc5Io/04NJqh69nwiVBE1crfkW3LWnigqJCyRmJu4hmbHCpzE/Bzv3dGaml70c1nUvB/p
	7aUlG12eSZgkj1xhi5foBednNfcqOe1j6QJF/l8DsaFQxGVJ7149KMISmAR3yJ0lkxCV3+
	QBsVMPM+Fu9G8VTx6NgzvYVMU+Fh5QQw9Rvedp5uJz6eGuOrZfmPHJYTpNQbnQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:32 +0200
Subject: [PATCH 17/34] drm/msm/dsi: convert to devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-17-42113ff8d9c0@bootlin.com>
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
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedugeenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegludelvddrudeikedrudejkedrjeehngdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeghedprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepjfhuihdrrfhusehgvghhvggrlhhthhgtrghrvgdrtghomhdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 895ba9815a652f00f7ace9cb7125ef8cef555d35..609bca109c19d803ea1896df27338a4b3fdf809f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -452,15 +452,14 @@ int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
 	struct drm_connector *connector;
 	int ret;
 
-	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
-				sizeof(*dsi_bridge), GFP_KERNEL);
-	if (!dsi_bridge)
-		return -ENOMEM;
+	dsi_bridge = devm_drm_bridge_alloc(msm_dsi->dev->dev, struct dsi_bridge, base,
+					   &dsi_mgr_bridge_funcs);
+	if (IS_ERR(dsi_bridge))
+		return PTR_ERR(dsi_bridge);
 
 	dsi_bridge->id = msm_dsi->id;
 
 	bridge = &dsi_bridge->base;
-	bridge->funcs = &dsi_mgr_bridge_funcs;
 
 	ret = devm_drm_bridge_add(msm_dsi->dev->dev, bridge);
 	if (ret)

-- 
2.49.0


