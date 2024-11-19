Return-Path: <linux-renesas-soc+bounces-10590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D009D2E35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 19:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB356284076
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 18:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19F51D1729;
	Tue, 19 Nov 2024 18:44:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033CD1D0E22;
	Tue, 19 Nov 2024 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041887; cv=none; b=CzathE4KjZunbud3WtHLQ2b+ziASq5mREIGYDNco/k4SK11DsqmvgITmG+uBw0+XE7b3frv5dvZ1wCoV6KQsBT7yXIzq5PO8PP9xr5VYmVkwW0t29TYO+tMXoDukHAJ9GmsKgkVua9PhrreXEJOzu7aF6nC5OL94j1gEFGumd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041887; c=relaxed/simple;
	bh=LHjb+OvdjSLDLMpwNkdhd66G63JCmx4pXbNZgf+jsJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bQ+KZkXutYeUKLvhNAGhMRZZZ22CsEyKmEEMk4AD09/eqtj/g6pZOBv8CjZsp3hj5StGKaJS0lspHvzV8bOyhlNXXeJ/L0tdzfnMr5+K3Q4YDS+LL/hVIE5BsFhsvDuBz6+fzhnBW8hgcOOfn9I3HA6q3J8RmNoEydPP1czlSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GUmpTOLOQ+u2l1OOq0MFEA==
X-CSE-MsgGUID: hOHYxKI1QhykDf5ChSMJVQ==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; 
   d="scan'208";a="229318280"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Nov 2024 03:44:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C78BF4005620;
	Wed, 20 Nov 2024 03:44:27 +0900 (JST)
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
	dri-devel@lists.freedesktop.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
Date: Tue, 19 Nov 2024 18:44:14 +0000
Message-ID: <20241119184420.138785-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
References: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The host_node pointer was assigned and freed in adv7533_parse_dt(), and
later, adv7533_attach_dsi() uses the same. Fix this use-after-free issue
by dropping of_node_put() in adv7533_parse_dt() and calling of_node_put()
in error path of probe() and also in the remove().

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v6:
 - Fixed memory leak by adding goto stattement in error path of
   adv7511_init_regulators().
Changes in v5:
 - Updated commit description.
 - restored host_node in struct adv7511.
 - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
   in error path of probe() and also in the remove().
Changes in v4:
 - Updated commit description.
 - Dropped host_node from struct adv7511 and instead used a local pointer
   in probe(). Also freeing of host_node pointer after use is done in
   probe().
Changes in v3:
 - Replace __free construct with readable of_node_put().
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 ++++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7533.c     |  2 --
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index eb5919b38263..f5525c12f0cd 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1241,8 +1241,10 @@ static int adv7511_probe(struct i2c_client *i2c)
 		return ret;
 
 	ret = adv7511_init_regulators(adv7511);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to init regulators\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to init regulators\n");
+		goto err_of_node_put;
+	}
 
 	/*
 	 * The power down GPIO is optional. If present, toggle it from active to
@@ -1363,6 +1365,9 @@ static int adv7511_probe(struct i2c_client *i2c)
 	i2c_unregister_device(adv7511->i2c_edid);
 uninit_regulators:
 	adv7511_uninit_regulators(adv7511);
+err_of_node_put:
+	if (adv7511->host_node)
+		of_node_put(adv7511->host_node);
 
 	return ret;
 }
@@ -1371,6 +1376,9 @@ static void adv7511_remove(struct i2c_client *i2c)
 {
 	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
 
+	if (adv7511->host_node)
+		of_node_put(adv7511->host_node);
+
 	adv7511_uninit_regulators(adv7511);
 
 	drm_bridge_remove(&adv7511->bridge);
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 4481489aaf5e..5f195e91b3e6 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -181,8 +181,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	if (!adv->host_node)
 		return -ENODEV;
 
-	of_node_put(adv->host_node);
-
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
-- 
2.43.0


