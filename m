Return-Path: <linux-renesas-soc+bounces-24791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E1C6EC2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64D9A35E0F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 13:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928BB3587A7;
	Wed, 19 Nov 2025 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0Hd83lZn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D035771B;
	Wed, 19 Nov 2025 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557582; cv=none; b=itdMSKEfCsd6g+uWPTmzmf3Ex1xU24QhdDGzl4VwWnhNbTF3emniK381clMB+SESvksEYdIyv8X2zrKgEcdZHq6MenM8SkDcD4CcMy9099XmYBYaARwnDkFvcAXch+iZ6WAx/OcX6FuBUXNQsO6QDjOrdMkve8FHXW6ZTcoI96o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557582; c=relaxed/simple;
	bh=XS60QQAn35MGcoJ66s1TT11J/m5NoBX1WGVDZ696d/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNJlHAQzwLFiX4K5byNnILrInjymSdAqFcL1Lax2qmedgT+c6XcHxIh0BxfctUhPtO08aEsRfAPz2hp5FGJyMYuOUidFrBBWT9tXqpREbuJKBdFHrmL2x+8TUjsg4V6hqkNvAU5tn6F0cbnOjWPCAyy8+JACOI6hlEV3Yl/EMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0Hd83lZn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3669B1A1BE0;
	Wed, 19 Nov 2025 13:06:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07FAC60720;
	Wed, 19 Nov 2025 13:06:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F0AD10371A51;
	Wed, 19 Nov 2025 14:06:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763557576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7gXiH7KcRJHe1y+SYEzwMmqFZuuFI7TA/lpp17IXqG8=;
	b=0Hd83lZn7CdaVUWqOlfWjJu1jw/lw2DIktzY9jb0BeiS7Y4iIApnXv4P92JPO2ooDgbfDq
	v7u5idqxDSoseWG//QVTOcBPGjFmXiNTrbASRGB/nRtdeMAunctuzwm98BbFQvhOeDQVGD
	l4Ts7WrSeasXZM1QJ/fw0WHIIWWBlxsenw+f7vMNUQgE1Xh9xO+mTq7UmiZdq45tyFU9S2
	XKbKIfz2IRdhFZVRRVV6pHl5yrHQhhAgLGzw7PjQcfuiDRV5MT2wNKndy0RkwsclB3fgNt
	b0VhYtHooEpKf/t2W6nWBWBfYm4XKqM9y3ZAG0Q2F+12er81mhAqq2pfA/oBIQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 14:05:33 +0100
Subject: [PATCH 02/26] drm/bridge: deprecate of_drm_find_bridge()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-bridge-alloc-getput-drm_of_find_bridge-v1-2-0db98a7fe474@bootlin.com>
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

of_drm_find_bridge() does not increment the returned bridge
refcount. drm_of_find_bridge() is to be used as a replacement.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d98a7b4a83c0..6debbf20aaa8 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -299,7 +299,7 @@ EXPORT_SYMBOL(__devm_drm_bridge_alloc);
  * @bridge: bridge control structure
  *
  * Add the given bridge to the global list of bridges, where they can be
- * found by users via of_drm_find_bridge().
+ * found by users via drm_of_find_bridge().
  *
  * The bridge to be added must have been allocated by
  * devm_drm_bridge_alloc().
@@ -360,7 +360,7 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  * @bridge: bridge control structure
  *
  * Remove the given bridge from the global list of registered bridges, so
- * it won't be found by users via of_drm_find_bridge(), and add it to the
+ * it won't be found by users via drm_of_find_bridge(), and add it to the
  * lingering bridge list, to keep track of it until its allocated memory is
  * eventually freed.
  */
@@ -1452,6 +1452,9 @@ EXPORT_SYMBOL(drm_of_find_bridge);
  *
  * @np: device node
  *
+ * This function is deprecated. Use drm_of_find_bridge() instead for proper
+ * refcounting.
+ *
  * RETURNS:
  * drm_bridge control struct on success, NULL on failure
  */

-- 
2.51.1


