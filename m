Return-Path: <linux-renesas-soc+bounces-24796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BD5C6EB42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id DF7602E5A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8C0359F92;
	Wed, 19 Nov 2025 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SINksK3O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C633C19E;
	Wed, 19 Nov 2025 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557627; cv=none; b=RA3LXGyM4G1jb+JnJVPTNpCRj+pALRNMoEEj6dZxroV4Pn83/cyeq0JnElITkPIiON3h8xAC3aA5M7iGvHMrjNBQqVK1XRTA727UCEILi2zn9kSXGSshitMby5z6ir9uxIMx6M3wtZWeSxUBcWicE720mY7Rzgqf1i5xgylqSjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557627; c=relaxed/simple;
	bh=ZaFMPR95GygBIjZUmjyJIV5vHH5hv36SMX8/swqOATU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUWN1ZJHGlZgt++W0WlrFU7Tz2CWVuI4ILFN7LnNAUzKpXkSohiFyOdMYgw+NOLicJVCTKuIHOq6akLao0ND/+0KU6zj8z65Q11MLvvboY39S4nf26tyeOrjBy7qOgYo23wvye+k1SstpygZJpORlwNbnY6ScWGUoFhmGH+TkQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SINksK3O; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E649A1A1BDD;
	Wed, 19 Nov 2025 13:07:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B600660720;
	Wed, 19 Nov 2025 13:07:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95D7A10371A50;
	Wed, 19 Nov 2025 14:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557621; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qsazag2An/fgMKK08J9HfhnhU42+l2KXmaAJPH5Vluw=;
	b=SINksK3OTvoGnmlWlEC2/vSxrmPi+Mro0sJJXQaFJuKGFTUA252iHhYx9EgmLc5PrbVKZM
	RUr4gvoz9t6J9epsIL181FJgX+PDDF8pNu6M9USf2VcP7kWsaMShijyzm3GOItW+ABL7e0
	+HSv/zNLf7bSGeSvlqjM8dkVZWu5RtJHnKc5V05UvOaa2waluCoxBZx3x+2P3f2Otb0Gtx
	vVSWGhk0rCFESdXYMGery+tKQSB7m5QqpY7TahdE8Dpl2x8rYCC2poMCPoPxeuujw7DJeq
	7YupO9sXu+i9jcaWlNcyrgtk4Q5dmaMC8Wf9vqrZRKLaAu1dnSW0FhhY1c6RfA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:38 +0100
Subject: [PATCH 07/26] drm/bridge: ite-it66121: use
 devm_drm_of_find_bridge() to put the next bridge
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-7-0db98a7fe474@bootlin.com>
References: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
In-Reply-To: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-0-0db98a7fe474@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to devm_drm_of_find_bridge() which puts the bridge
reference on remove or on probe failure.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index aa7b1dcc5d70..5bc4e5afb823 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -1542,7 +1542,7 @@ static int it66121_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ctx->next_bridge = of_drm_find_bridge(ep);
+	ctx->next_bridge = devm_drm_of_find_bridge(dev, ep);
 	of_node_put(ep);
 	if (!ctx->next_bridge) {
 		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");

-- 
2.51.1


