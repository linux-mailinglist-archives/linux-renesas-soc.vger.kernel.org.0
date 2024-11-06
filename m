Return-Path: <linux-renesas-soc+bounces-10370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A19BF5BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 19:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45B44282807
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 18:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C024E20C335;
	Wed,  6 Nov 2024 18:50:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E809C204F72;
	Wed,  6 Nov 2024 18:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730919005; cv=none; b=QOyBDC64gMcqkkQcE224FTWtsEeg/VEMYrgwC7SNUzJvsKI6g57DzUckloTVpCU6yttTAPjsZa6V+t4+039AB7sE+qIapU7KCDtao3wvVbEaS1gBnooKfq0UHHRo57bDeioKRovVipuN5Rzgla0I10fs6y57FpZ5ZJwtfCY5yrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730919005; c=relaxed/simple;
	bh=uKWLeGyCYqXd76BkL8ENztobHvdId6buSarZN6XJ7Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZKAJLOOlAU34+Kgfb97Lnm3FIf0XIoTupd+1LKITrxEA/9nTAVuZk4HBYq6Xa4GSqFxGulUvGLy2vY6Y1Waq9MLomx7geXZFAksAfyaSKLINmMlVKlXN3NlDuk/I1FLDsKyuoOxZdeZcu01KPuPR5dG8mJStetxJ1BjXcA7G3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,263,1725289200"; 
   d="scan'208";a="224061197"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Nov 2024 03:50:02 +0900
Received: from localhost.localdomain (unknown [10.226.93.42])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05E7E4005440;
	Thu,  7 Nov 2024 03:49:54 +0900 (JST)
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
	Hien Huynh <hien.huynh.px@renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] drm: adv7511: Drop dsi single lane support
Date: Wed,  6 Nov 2024 18:49:30 +0000
Message-ID: <20241106184935.294513-4-biju.das.jz@bp.renesas.com>
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

As per [1], ADV7535/7533 support only 2-, 3-, or 4-lane. Drop
unsupported 1-lane.

[1]
https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v3:
 - Updated commit header and description
 - Updated fixes tag
 - Dropped single lane support
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index de55d687245a..ec360f8b7509 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -173,7 +173,7 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 
 	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
 
-	if (num_lanes < 1 || num_lanes > 4)
+	if (num_lanes < 2 || num_lanes > 4)
 		return -EINVAL;
 
 	adv->num_dsi_lanes = num_lanes;
-- 
2.43.0


