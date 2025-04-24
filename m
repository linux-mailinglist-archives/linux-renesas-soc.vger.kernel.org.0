Return-Path: <linux-renesas-soc+bounces-16354-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBCDA9B7F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 21:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4B6A927CF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 19:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2922A29CB42;
	Thu, 24 Apr 2025 19:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K3FME/bW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B3929C35F;
	Thu, 24 Apr 2025 19:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745521293; cv=none; b=ixUX0653LdA9b1UGgcQ36rV/SCRKLHJsJZ9QLmgYKODQkyOrcz/5/tIwofdyixl2nBoaDsBZAMtZz3BeVJGKZFI7x9bDWlMuo7zUawy50EK3H5UnYSyLxGbH7Yf6SsOkGOfT+Med/uiRWkx3QlKXvURqHKow/ThVpLOfZpw3sQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745521293; c=relaxed/simple;
	bh=KyXPTPFgyj3ldp9bVyQSuNSlKY/XNgERIaZ8QzB0VwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5iyU/V/JooZ051zzFyVBKrTOkYrrfepazZbRUhDX7tGMjMVJow6yDF/nhGxZNr1TiUkQILuLgcIvtapTiMfS3WWClVXJvktEHqRB8atvvPKRuXuIuWwvga4SMJVG/Nu5MpSPSC3N33ZjtcLJkXYA/dAaQfpnvGVz9DzQysgt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K3FME/bW; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F24B4439D;
	Thu, 24 Apr 2025 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745521289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhZpj5I/cWr8OxjpC/2t/ycyRXj9GzxVo+pFftfveRA=;
	b=K3FME/bWZ+JV4HZT+XIqZhe/4KSTbTPg3v+B1TH1HfUix79YJlrxW9liDFEmpIUas8fgTn
	8tGjfwPZtUM+y4Oc32SyM263P5ApBnNm9IRgmLMq2KPUqg54Aedxv6ST/KSVACafBMolEO
	ieV5Mcw5g5MYHKVFYXLEyU2jJUpfafkIsOxJi2n/D5RudTAL5dmuKggCV0CiBE+JjOKVaA
	ujjuu4YCH9GaN5dsQ1zQ3nDSX3Zrz7hI/WJs6z9yFh3Ugh2Dn/vpOW4syRBufd5fTKqklV
	83dPIZbCra3oHwdjkwjE/mmVwORIXzHPPGURX8LXVjhsW6jW/1AGbfT0YT/hXA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 24 Apr 2025 20:59:37 +0200
Subject: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeuvdfftefgueduleehueetgffgjeeitedtteetkeeuueeuueekveevvdeuveenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegrgeeivdemudgsuggumeeluddtudemvdelgehfnecuvehluhhsthgvrhfuihiivgepvdehnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemrgegiedvmedusgguugemledutddumedvleegfhdphhgvlhhopegludelvddrudeikedrudejkedruddukegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedtpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepjhgrghgrnhesrghmrghruhhlrghsohhluhhtihhonhhsrdgtohhmpdhrt
 ghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehfrhgvvggurhgvnhhosehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

This is the new API for allocating DRM bridges.

This driver embeds an array of channels in the main struct, and each
channel embeds a drm_bridge. This prevents dynamic, refcount-based
deallocation of the bridges.

To make the new, dynamic bridge allocation possible:

 * change the array of channels into an array of channel pointers
 * allocate each channel using devm_drm_bridge_alloc()
 * adapt the code wherever using the channels

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 1f6fd488e7039e943351006d3373009f0c15cb08..40a8a5a53a781137e722309ff91692cf90d881da 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -68,7 +68,7 @@ struct imx8qxp_pc_channel {
 
 struct imx8qxp_pc {
 	struct device *dev;
-	struct imx8qxp_pc_channel ch[2];
+	struct imx8qxp_pc_channel *ch[2];
 	struct clk *clk_apb;
 	void __iomem *base;
 };
@@ -307,7 +307,14 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 			goto free_child;
 		}
 
-		ch = &pc->ch[i];
+		ch = devm_drm_bridge_alloc(dev, struct imx8qxp_pc_channel, bridge,
+					   &imx8qxp_pc_bridge_funcs);
+		if (IS_ERR(ch)) {
+			ret = PTR_ERR(ch);
+			goto free_child;
+		}
+
+		pc->ch[i] = ch;
 		ch->pc = pc;
 		ch->stream_id = i;
 
@@ -333,7 +340,6 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 		of_node_put(remote);
 
 		ch->bridge.driver_private = ch;
-		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
 		ch->bridge.of_node = child;
 		ch->is_available = true;
 
@@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0].next_bridge)
-		drm_bridge_remove(&pc->ch[0].bridge);
+	if (i == 1 && pc->ch[0]->next_bridge)
+		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);
 	return ret;
@@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		ch = &pc->ch[i];
+		ch = pc->ch[i];
 
 		if (!ch->is_available)
 			continue;

-- 
2.49.0


