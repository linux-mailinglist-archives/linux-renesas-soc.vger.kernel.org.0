Return-Path: <linux-renesas-soc+bounces-10368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F26079BF5AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 19:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A84DF1F23375
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 18:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC247209F4E;
	Wed,  6 Nov 2024 18:49:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8CC176AC8;
	Wed,  6 Nov 2024 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918996; cv=none; b=PF2YY89wZjUhhYbnK2TxQ3zX7Kc+aoIIawpeONwNRYSoy2m6cyjpAWIGYqGaxpbah7cJP6LJnKbA9fzxC6fl5lMk9KJ6gmj0jB3bJtP57XxjAeD1RkAQlZnikJOsVmpn0PKcOURhWVllkUUNtmKAyMygk3itiUpT/CkkyAh4LjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918996; c=relaxed/simple;
	bh=LAd9pgsSNiO3FgghYmopn7R5v+TmzpSn31AvnMdUVao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KI6SxzDQLM0Qoz54EQ+8Tuz6nwmwripuNKt5m17aG63GY47OeWMN3055Y7e/Fc9WfnQz83VI+7FeMsFayfv9BxLkP+lvJnv0bIVfI3TQevq4ur23tfiEsC4/Dvu6h9T28ZEhaGh+gzyd0Ze0Lcd2BHJJwC+e52QYfjPbLK+VuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,263,1725289200"; 
   d="scan'208";a="224061187"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Nov 2024 03:49:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.42])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E80114007CE9;
	Thu,  7 Nov 2024 03:49:42 +0900 (JST)
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
Subject: [PATCH v3 1/3] drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
Date: Wed,  6 Nov 2024 18:49:28 +0000
Message-ID: <20241106184935.294513-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
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
Changes in v3:
 - Replace __free construct with readable of_node_put().
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 4481489aaf5e..de55d687245a 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -143,6 +143,7 @@ int adv7533_attach_dsi(struct adv7511 *adv)
 						 };
 
 	host = of_find_mipi_dsi_host_by_node(adv->host_node);
+	of_node_put(adv->host_node);
 	if (!host)
 		return dev_err_probe(dev, -EPROBE_DEFER,
 				     "failed to find dsi host\n");
@@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	if (!adv->host_node)
 		return -ENODEV;
 
-	of_node_put(adv->host_node);
-
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
-- 
2.43.0


