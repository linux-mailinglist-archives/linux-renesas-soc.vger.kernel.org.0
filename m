Return-Path: <linux-renesas-soc+bounces-25361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEFFC92C2A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 18:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F3B3A542A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 17:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5A02BEFE5;
	Fri, 28 Nov 2025 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CSsjdXld"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6A52BF3E2;
	Fri, 28 Nov 2025 16:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764348931; cv=none; b=eYYc5Bhm/WG8N48m1Q45v9uRHb/fP9qjJmAIAw+B1MCntJyG8/IFFikcfKi3z24J4GQJi6Fhw4CnOayaNsBYCOv7Fn7DqHFONJqpkPt5mr+a49ut0N6cwJd03h/fMVr/7mKPSL0ygBlr7JdLmqNZro/I0cmSOCQwfb07bkmPmE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764348931; c=relaxed/simple;
	bh=acl0bk3hOTBZPt5mvPuPSXJnLBTHafncgkjfVfpOeRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqF2L2PNo5nWbI0dX8DQbd5mPBe5wMJpEZyhPO+J/AwI6ld2TtmzBsF9x06zpgjJ+Jw1soC5mlJwmTKHdSM//YqBDXOO55rLVt1FHjmFGezRm8gX4aSHR8VsdZWD5qd43u2JHs8CXXDUlZxMft5iQYlWvYQErSTLRsBJLnns4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CSsjdXld; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 169D14E4194E;
	Fri, 28 Nov 2025 16:55:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCD4C60706;
	Fri, 28 Nov 2025 16:55:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 93B1E10B02189;
	Fri, 28 Nov 2025 17:55:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764348926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6ByjE2fDXvVGt+lqsSwFhGv2RTSfBXtxTluzyqLNTpc=;
	b=CSsjdXldrVzhBuMvtUIbEvhf6ttDCn1VnJ8vKgTu6xn9vQybYvLEWcmkloTKFrEMKxUNfH
	MnyyNBZn8P9CwlCNvUE521ACP2dvKeUxoTf2UJpF7n2K2FOeFBWTPASE0oSo7PPbEp8727
	8rObyZtV+7isOU38QcGQfl3N+s1hZKBcqgleVY//sKz677M5qBU7EO9Vs344CEigyKVTgn
	RAe7LNvD23nOdPbRsS/9mq2Wk5UyeCI6lf5J8ktndnXutjNPOaER4AOLHXL+gUV59yJgbK
	axFzQlxaPUifcO/VjooBiVb1yCb+VFZbeWjFhfozeCjtYjRNUitpMSRum8GTvQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 28 Nov 2025 17:50:35 +0100
Subject: [PATCH v2 25/26] drm/bridge: imx8qxp-pixel-link: simplify freeing
 of the remote device_node
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-drm-bridge-alloc-getput-drm_of_find_bridge-v2-25-88f8a107eca2@bootlin.com>
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

The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
of_node_put() in multiple places, complicating code flow. Simplify it by
using a cleanup action and making the 'remote' variable scope local to the
loop.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Cc: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 53016f0d53a0..2ecc3c1051e5 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -260,7 +260,7 @@ static struct drm_bridge *
 imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
-	struct device_node *port, *remote;
+	struct device_node *port;
 	struct drm_bridge *selected_bridge = NULL;
 	u32 port_id;
 	bool found_port = false;
@@ -286,7 +286,8 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
-		remote = of_graph_get_remote_node(np, port_id, reg);
+		struct device_node *remote __free(device_node) =
+			of_graph_get_remote_node(np, port_id, reg);
 		if (!remote)
 			continue;
 
@@ -294,15 +295,12 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 			DRM_DEV_DEBUG(pl->dev,
 				      "port%u endpoint%u remote parent is not available\n",
 				      port_id, reg);
-			of_node_put(remote);
 			continue;
 		}
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
-		if (!next_bridge) {
-			of_node_put(remote);
+		if (!next_bridge)
 			return ERR_PTR(-EPROBE_DEFER);
-		}
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -310,8 +308,6 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 		 */
 		if (!selected_bridge || of_property_present(remote, "fsl,companion-pxl2dpi"))
 			selected_bridge = next_bridge;
-
-		of_node_put(remote);
 	}
 
 	pl->mst_addr = port_id - 1;

-- 
2.51.1


