Return-Path: <linux-renesas-soc+bounces-10299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8869BCB58
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 12:12:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F9342840F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 11:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EED31D357A;
	Tue,  5 Nov 2024 11:12:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C661CB53F;
	Tue,  5 Nov 2024 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805165; cv=none; b=mo55OXLn1ntuaEPeuoYeGAr3sJEcL3TBJC/NUDHBN7cyoNfSr5+N3rBZA1o8Ls7AmxyAjdPgbMSaz49iy1gmqIILgRYWmYc6lT0X0v5jl8a40g3a97eRfyQcqDYsfzocC+ie3dt7enQWrfl9NjFs1j9AQnQrmSuJULCWod0/RKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805165; c=relaxed/simple;
	bh=OsdW2uOZ/tGOd1RT898rtu5B90zcU+paCDY89Q3An9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zbqj+dTyZI6AG7Frss5hdgiE51dk/XXzxFv5BLkLGedSUg3d2ic+cj6aMGVqJQVJkx0JRWmJP4vKjGEhBME/RDtmZrjyTSRZYpnba0Lah5OYt2IPP3zpB3VHSwBGZhdI1duNq7ftFCg/xy4ol2A5GM1dV279Vmq193oCuqp5nu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,259,1725289200"; 
   d="scan'208";a="227919676"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2024 20:12:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.174])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F1F8941D0AB3;
	Tue,  5 Nov 2024 20:12:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Archit Taneja <architt@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
Date: Tue,  5 Nov 2024 11:12:18 +0000
Message-ID: <20241105111228.112813-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The host_node pointer assigned and freed in adv7533_parse_dt()
and later adv7533_attach_dsi() uses the same. Fix this issue
by freeing the host_node in adv7533_attach_dsi() instead of
adv7533_parse_dt().

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 4481489aaf5e..3e57ba838e5e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -133,6 +133,7 @@ int adv7533_patch_cec_registers(struct adv7511 *adv)
 
 int adv7533_attach_dsi(struct adv7511 *adv)
 {
+	struct device_node *np __free(device_node) = adv->host_node;
 	struct device *dev = &adv->i2c_main->dev;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
@@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	if (!adv->host_node)
 		return -ENODEV;
 
-	of_node_put(adv->host_node);
-
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
-- 
2.43.0


