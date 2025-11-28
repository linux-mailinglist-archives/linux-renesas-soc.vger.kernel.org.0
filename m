Return-Path: <linux-renesas-soc+bounces-25351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68FC92BBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 18:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1E23AE275
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8BC2F39A3;
	Fri, 28 Nov 2025 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ouE32eOM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991CF2F2610
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Nov 2025 16:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348844; cv=none; b=EngbLOUP9WTqQTVwnrV+X021Um+B3AhEA+D5H9oSNotITiyylIpBS8oKlftfvQ7rrNL32wVyPN7kflIUmg2g8BQyKhJugLr+RtvgCAn+IdMxOnGXTKRHUMc7aWb+CwnhRYYr2cAx+XenrGjF5L9We8tozRwaCJ+8IFTn2yRH/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348844; c=relaxed/simple;
	bh=AqjkhcoF3fTqOyuLn4+6aSrPs6qITOvGOWT/HgUzk7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRz3Z7O4WrPjR1s3nWhSRVhfmJLk/SA3NVdvgbNSue2mBKGe5UO9X+oKL1/nUBQMA1XAsM2Rtr4jKJApbwFVZgsBqKVOeu5JgcLw3cJ9pQQLGN+FEu/fWG4roB/yI4xHJ36WA3XmivXszDScOpdeNAuFYyvCSq3Iu02UTkscHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ouE32eOM; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D130C16A3C;
	Fri, 28 Nov 2025 16:53:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67BC460706;
	Fri, 28 Nov 2025 16:54:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F5CD10B02195;
	Fri, 28 Nov 2025 17:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348839; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AjHLZ/oS8bDyMocQGjl3IyCNeVOq4ZwFmOT6Ey5ZFAg=;
	b=ouE32eOMmyZkNjAWkjY3zun3JUktr7gy54sR11ENbpWqISBzqMX7fHxXOLOKtZvT+W2v1I
	kiuon0bcxIG/+yQnaVBMGD8X2/IzQpNCYWoKWPdmLiMstwIyasuu0Bp3BOi7aGsI6S1BWa
	133tnVl8iLXT3pamUHPwhRkZHMgivBiyj9u0oAlSprphZL12FXLLCB5sXtirXSU8lrjl7f
	0k39aIJMEzrro/sTqHbZ0uYbQxVCOBmAQhXY9N3+mO+DCV0BAnO4eqaLRPmGZRqX1SaFBf
	DGhNgnBqJpZ1k/min4zloYLcCOBX3qNnwI0Mmj0l19ozvoYAN4I0JwBisko+sw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:25 +0100
Subject: [PATCH v2 15/26] drm/bridge: imx8qxp-ldb: use
 devm_of_drm_get_bridge() to put the companion bridge
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-15-88f8a107eca2@bootlin.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 122502968927..4a3741c9f319 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8qxp_ldb *imx8qxp_ldb)
 		goto out;
 	}
 
-	imx8qxp_ldb->companion = of_drm_find_bridge(companion_port);
+	imx8qxp_ldb->companion = devm_of_drm_get_bridge(dev, companion_port);
 	if (!imx8qxp_ldb->companion) {
 		ret = -EPROBE_DEFER;
 		DRM_DEV_DEBUG_DRIVER(dev,

-- 
2.51.1


