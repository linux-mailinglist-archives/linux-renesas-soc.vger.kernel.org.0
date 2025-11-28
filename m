Return-Path: <linux-renesas-soc+bounces-25352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87851C92BC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 18:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1BDC3B2C2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1372F4A0E;
	Fri, 28 Nov 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2skVqUO2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0A92F49F7;
	Fri, 28 Nov 2025 16:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348853; cv=none; b=K96RDwsB7Qfp6uIveffXrgm7n4DlJC+AcTaAmCkZj+u/Uu+Dtt/FJzj2G28JJvaaiLWUR3ze4Tz6TUV2p9XGddQ9tp1+RWE/ID3ieA0DlEgu84ul/GNPlfEYGdtLx0xjj8dOChlDPMKFr0mJnGm2BpfnJBLp29TUfwiPk17cwts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348853; c=relaxed/simple;
	bh=QslyN0LXfSiI9HAiT7HMIQq8bBQnK8kDKTZ2LrRWj3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFvFhvdNek30zxifhp1MNxnT0RQtLSIiQUrUUpkIJ6CzNhsbWDw+zUZExClQ3nKocg5f0NKvuYNog52pyKTtNlpe0KtekxTg4QRiYYUVO3J5HghgtqeR2EkXh/gzB37BZn/Rtn8rcGmOiYEMcgA9dpsP8TIi5EmKn3G1alPJDO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2skVqUO2; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 606C14E4194E;
	Fri, 28 Nov 2025 16:54:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C14D60706;
	Fri, 28 Nov 2025 16:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EEA610B02187;
	Fri, 28 Nov 2025 17:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=P7PuQnrr2U0mS6+K0q3iGdpY5r4F/rhA/7tugsaTWHQ=;
	b=2skVqUO2wpq9PHtRVHRtqRhujv2FbueuNpP1H5JWR6CVK7xatL4uwySXumc3/taO9CvVMb
	acdli3XiqiV9CdPG5t8Qh3060lAfnNWjI2VPpk8RzD30MX13YdAas9gX/xJI+V5stGJ9IF
	QMH5qEERVOgRkIBJ381RLvqZ46+x/Sv0HHJQUeu21s2J1xRIOi9XngP+WMtr6FzDBX329V
	U87a1CUVxVq3zlNfVkGzc1y+sh9gaBb+ChDYlklggLCAaOMizlEfNE4HN5DHjPnhCkjqDX
	xtna16A1xSoMZcoauwJAsmEKEJxKySi463KCX3OOU9NqVtVl/UJy/drjwNFnOQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:26 +0100
Subject: [PATCH v2 16/26] drm/rcar-du: lvds: use devm_of_drm_get_bridge()
 to put the next bridge
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-16-88f8a107eca2@bootlin.com>
References: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
In-Reply-To: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-0-88f8a107eca2@bootlin.com>
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
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to devm_of_drm_get_bridge() which puts the bridge
reference on remove or on probe failure.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
index 001b3543924a..2dd95fd52e71 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
@@ -740,7 +740,7 @@ static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
 		goto done;
 	}
 
-	lvds->companion = of_drm_find_bridge(companion);
+	lvds->companion = devm_of_drm_get_bridge(dev, companion);
 	if (!lvds->companion) {
 		ret = -EPROBE_DEFER;
 		goto done;

-- 
2.51.1


