Return-Path: <linux-renesas-soc+bounces-26633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B8D15DE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 00:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6972330124D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 23:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0150290DBB;
	Mon, 12 Jan 2026 23:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mJ7zvACA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JAgcyPVO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ADA241CB7;
	Mon, 12 Jan 2026 23:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768261731; cv=none; b=QD0ua/51AjNUxzd17hSCM7jfUOS+wg37WHtY2VX7JQNLOUvOgRiaYymOmgAAThxqUzGETSRjYHwHrd+U8qWdfGKHmFDu3X8PnmcYwpoXO8bk0Yaz8osuC/STNafL0+hwbW1BAS+v8nes6NB3J/TUksFi15jwcmVLN8Xg4MIQcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768261731; c=relaxed/simple;
	bh=guR1x4pmWGhxAafhSDEMtu2AZcQTLvFYliTeM1igFrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jh7WxbFVlhO5Um6Do5IefWAYDaDu/UG35e8JfJtkbMOqn/u9DYHlW3dK0hUZ8eld+skWd6YaoirnJLFUDGFrEbNzALJWayoRCi5uxsyO8fe9v52rTQAF3zGTbgxMVGPFXChYH9TcYAV/Pp8jCapmnudkbZ5UZkX11Bbt2y5KPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mJ7zvACA; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JAgcyPVO; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dqpxD5Pjfz9srT;
	Tue, 13 Jan 2026 00:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iM2b5gOUQ7qmIDWC4AJaeVNpSYjr/hygekEC/yksaTg=;
	b=mJ7zvACAPuS98kMc2hpYBK/8t+96Uy6Td5Bh2bcBQGqn7c8j8MapVn/CGjYufvm+OKB6u+
	63OEyrZB+/VwpS1sArnQhpeY6AibkaRFjZd8x4+1I8wUt4rQPsvj0RJjMKPOso0cEUM/wy
	AFD66Yfesmc6/z796zgFXnakLB5cltL6DX8iH/P+kuNz3m8+t0BT9r22Hye9gJ47xeyJEB
	soRn0gEHjZ63XjADs1r6Jt9FK5mbfnaVuzyDRsl+JVjdfCmaNJT3iqAyRErEN+Wjeljdm3
	37P0Cm7zBUl+9dvBheKwM+eJ5t1rYuFz/sCb7ubZwcxmkE7H7hoqMW5nxb8qKQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768261726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iM2b5gOUQ7qmIDWC4AJaeVNpSYjr/hygekEC/yksaTg=;
	b=JAgcyPVOQh0PHdqbNF/co/ClYMOycDEiFVR/lB1lSQlKePLdrdYrCkM8AsGgr+hdimzSJO
	EvM3r7AJ71QmiUgCbGO6Juj44MXgSAKrMsW/4g4J9YiDdoSgk8VTwVZjKXbYTaIe233nOi
	OyKBAJpV1KjBcC1hjxRzXyT8H6jFRn51nFr/pNejHm35bbCyxok6qhZLM5vzybO8SYyYRi
	6vMK5flU2mpi4z/87HcNQ1t6B7761gq3UXTvJNb0hwJBo3RYBn0Gz6p7Gb2dfGJrk64QDI
	uyDxYIWxTaMhtESNob3A5QohW4YIpogj6ulPxCh8XUw4heax+qZp8YB7MySd/g==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Joseph Guo <qijian.guo@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes
Date: Tue, 13 Jan 2026 00:47:39 +0100
Message-ID: <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f9bd0521b2c6d8e43f1
X-MBO-RS-META: ku7re1uxjpbu3y6fiowt6k9aeoa54y8d

Parse the data lane count out of DT. Limit the supported data lanes
to 1..4 which is the maximum available DSI pairs on the connector of
any known panels which may use this bridge. Internally, this bridge
is an ChipOne ICN6211 which loads its register configuration from a
dedicated storage and its I2C does not seem to be accessible. The
ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.

To avoid any breakage on old DTs where the parsing of data lanes from
DT may fail, fall back to the original hard-coded value of 2 lanes and
warn user.

The lane configuration is preconfigured in the bridge for each of the
WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
others seem to use 2-lane configuration. This is a hardware property,
so the actual count should come from DT.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Joseph Guo <qijian.guo@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 9254446f54958..7fcb878f37e2b 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -66,7 +66,11 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = 2;
+	dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
+	if (dsi->lanes < 0) {
+		dev_warn(dev, "Invalid DSI lane count %d, falling back to 2 lanes\n", dsi->lanes);
+		dsi->lanes = 2;	/* Old DT backward compatibility */
+	}
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0)
-- 
2.51.0


