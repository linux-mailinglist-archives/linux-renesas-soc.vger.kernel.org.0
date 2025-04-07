Return-Path: <linux-renesas-soc+bounces-15459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C35FBA7E1BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFB30160C74
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 14:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5861F471D;
	Mon,  7 Apr 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Wcey+UEO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F601F3D49;
	Mon,  7 Apr 2025 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035876; cv=none; b=iv9cF9UeyoVsqHs9WmypmOk0hcRHsh8E9UWN5SBX5gviarCuo/a5QsmizSo1V0ZtMWQHu+RPV5lvciWgZTt26ljW91iiE5ofPopVfcoMDJNw7iMcWjq8KJyh0sYRZ+sszf5sU5VE7avibqid+syk4arttoueZQit/DwnBIhX3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035876; c=relaxed/simple;
	bh=Dr2/FBKG5N3XOxQItoeq452nlj8aeJNdHz2fGY0lxLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vF9b6mbWiGe0Sj0ALaUwxeA95LpzI/Yj+Odqa2Cj02VcVYOeVkkIEDc/NEMu/aicOmVb/D3ytlh+BMtnbR7irHj1ezAUUIgKx0XDht6OnnFHq2pHf6rqQa+CfJ37NkSz1Jzlc4d9yGc7Dx9J1o6HLHZkaFVycOfRVhqpTp/IAzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Wcey+UEO; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF6F2443B8;
	Mon,  7 Apr 2025 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744035872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovm6LFCEU6u/vAeHaFCp1xRU21VlYlfHIc92sjuJU6g=;
	b=Wcey+UEOHLzO2eg8XFAHGxf7/MmFRmm+043HFwS0qe36ZuOmA1eHEaRG0O33KLOEODQcDh
	XXVZfewNqqzVfKv1b+g0XlnkcXeXQQ4qxQhOWU8380+19h/G5jhzwK4CkhLDlJS664dzL6
	O4R8E90UK+vUYkOAWapNXmyuthjTYURRJzm+SMN+fneCJI5+0/gUNYcVRjQns50pWPTpwQ
	jFCbxPIYm20L57Ca/bS+dz2gRndHUQ92uRNTNxSHDxKTUSnIfMNRJpj/vyzB85b9NvqHaw
	69B/j8Skb/6fNc/8pKFJts97AJgTyJXce8TBafv2ES5eSAAS6fZCbSwYryvJqg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 07 Apr 2025 16:23:25 +0200
Subject: [PATCH 10/34] drm/bridge: sii902x: convert to
 devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-bridge-convert-to-alloc-api-v1-10-42113ff8d9c0@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrn
 hgvlhdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 6de61d9fe06487856e8b3c32db3c8d8c25633fd8..882973e900628c0d972d32cd4ff3588432daa8e9 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -1135,7 +1135,6 @@ static int sii902x_init(struct sii902x *sii902x)
 	if (ret)
 		goto err_unreg_audio;
 
-	sii902x->bridge.funcs = &sii902x_bridge_funcs;
 	sii902x->bridge.of_node = dev->of_node;
 	sii902x->bridge.timings = &default_sii902x_timings;
 	sii902x->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID;
@@ -1170,9 +1169,9 @@ static int sii902x_probe(struct i2c_client *client)
 		return -EIO;
 	}
 
-	sii902x = devm_kzalloc(dev, sizeof(*sii902x), GFP_KERNEL);
-	if (!sii902x)
-		return -ENOMEM;
+	sii902x = devm_drm_bridge_alloc(dev, struct sii902x, bridge, &sii902x_bridge_funcs);
+	if (IS_ERR(sii902x))
+		return PTR_ERR(sii902x);
 
 	sii902x->i2c = client;
 	sii902x->regmap = devm_regmap_init_i2c(client, &sii902x_regmap_config);

-- 
2.49.0


