Return-Path: <linux-renesas-soc+bounces-26797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EEDD22295
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 03:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BA29302B13E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 02:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14420253B73;
	Thu, 15 Jan 2026 02:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="gXIjaapZ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eogl11+j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6DF27874F;
	Thu, 15 Jan 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768444834; cv=none; b=NAEn3SewhQtyg0vNbqPt2nynmXjCOkXwBBmRgmOPy+vruMRTCsCbcpcYZTq6ZZhFptQR8omhB0ER2WZvDsoWyoRE+MPjGaIH0H1b4sc1rvcIYd05SeKKR0CfWCVtUPLFABiX6+Ki1814mCQ8SJ4nOvaNIxhc8+EIxjjspMiI/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768444834; c=relaxed/simple;
	bh=QnV8Yv0kMb0TY2gN4LyrMZJ3HDiu6ZIHvabwx2pVyOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qrs306DtYYb7kGRs7ae6IQsnSbwrlxijRNK/Vxo2F236wwOqRU4h1QhDalcFDeHbM86Hh5kaOB8DkqDzCuSPH9uHQUKsJfsd255OP+aAHyrHLIE782R7J9hHCfIRSLCN3cubv73xJRmQVq7hT+8f35IdGLYvefgv2hNbIO28LP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=gXIjaapZ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eogl11+j; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ds6fF14rsz9stg;
	Thu, 15 Jan 2026 03:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FkHREHGllR+zq9sdCj0J1g/8JPa9LNvGnTgMplXjf5w=;
	b=gXIjaapZsC/RjoGyk+OTk+Js6Qic2EFCxaLyan1yYZwjnFAW2Ti5CqS0y8VIVvq+4ebrAO
	94QKfj7riG1B/sWmRKicGAejCz2Ek6zUILRcc7RZ2EiNVB4T3IDsVe+/3vKDVHRysE9Hp+
	7D7tZ7GQaolymTvqxi6gVTDLRvMDSr9UZJsEh7PZH2qIZbv/E5a36oYIObdmKP8oli9uO6
	EzdjecWeRTZ1WXIgbhr0FXE35e4aerNvCSlKnAj7rz90ZIZqdp1rSXf76q05D9XcDNYw34
	Ib24/+i7KhMu+Yj2iL15QMAvCzPCpY1BwpbYcvLauuEcfetvwV6ZfsLK+y6KXg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=eogl11+j;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768444819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FkHREHGllR+zq9sdCj0J1g/8JPa9LNvGnTgMplXjf5w=;
	b=eogl11+j4GIKnhtBZgaBT4LjPDDSXEQlG8rLMpPSgpUPmJuDzoXwgpGr0yOLLZq2MZ/KXN
	lfUPPtOIiZlqnpFP2Sg/DjUIb305AxlahrKdeMG2YaLGv7lrhQIzI3vElb8NUZl7IAh84v
	r0oUqU/pBhEbTOQ5G3A5KYbUkBlYMCzvXRuXRFMkQKFKHrGHkmo5yKpQopzuDJ++Zbr4Si
	5o/1S+E+Qxcc7aq7/8WofMerP8lL7Mcrdqiwzpw2MbyANfGdwtd3vrA+n/+jvTyeOSTW3y
	5nz5js8Qdkn4XhgYSnP2qgFPk635yJy9PtE+KqWgFPLoxP6GLnBBJnUEg3L7hw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
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
Subject: [PATCH v2 2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes
Date: Thu, 15 Jan 2026 03:39:43 +0100
Message-ID: <20260115024004.660986-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
References: <20260115024004.660986-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ecmhbyoz1h9jeeytdzdwgkmhybige8hb
X-MBO-RS-ID: 5cf9be8d469c703e0f9
X-Rspamd-Queue-Id: 4ds6fF14rsz9stg

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

Reviewed-by: Joseph Guo <qijian.guo@nxp.com>
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
V2: - Add RB from Joseph
    - Update the error print to "Invalid{ +or missing+}"
---
 drivers/gpu/drm/bridge/waveshare-dsi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/waveshare-dsi.c b/drivers/gpu/drm/bridge/waveshare-dsi.c
index 9254446f54958..0497c7ecbc7a5 100644
--- a/drivers/gpu/drm/bridge/waveshare-dsi.c
+++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
@@ -66,7 +66,12 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = 2;
+	dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
+	if (dsi->lanes < 0) {
+		dev_warn(dev, "Invalid or missing DSI lane count %d, falling back to 2 lanes\n",
+			 dsi->lanes);
+		dsi->lanes = 2;	/* Old DT backward compatibility */
+	}
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0)
-- 
2.51.0


