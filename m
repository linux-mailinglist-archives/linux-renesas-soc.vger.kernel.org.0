Return-Path: <linux-renesas-soc+bounces-10581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 331F29D2687
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 14:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B531F22D83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 13:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B3B1CDFCA;
	Tue, 19 Nov 2024 13:10:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97DFE1CCEF7;
	Tue, 19 Nov 2024 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732021841; cv=none; b=pjSJHQ2BBbp8kUUnWBlL4i09W8sBhHHjH5jb5+w/kyAnBQraDD9HS+af7m/KFSX+LcJFk6YC4gjfN7sb1qdBzWYXNcjQuTlxKiNEiRYLX1G21wSIrwPTJJ/VvJeoWhBbob8g3xYOb8oKrX4sF6o1H9THYbD8zJi3klBFxabHBQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732021841; c=relaxed/simple;
	bh=2tHCGPS76iErLjvn7a/o/MtqLL/KqUEn4i2rgpyLTcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+QWxY8GGd7ASGd15REIQTYcAsMKwX1q2ssmRSJ1Iyc/qYAG8kxFkh95Jx6/FWEEbBDQD4X2XAp+7nU2yCbloeBn9XzQdfFJoHDLqUOg1wkF1JJAj2ojs6HiEiYdDqgzld8OrxHNdsyl1AkLBQVyeLUVl4+Ma51VTnqxhyGZq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: xNmRzfxsSCOFxr7NVVL4Zw==
X-CSE-MsgGUID: 32QdmpE1TEGJIjcsMiCjZg==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; 
   d="scan'208";a="229300915"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2024 22:10:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3A4BC41D2395;
	Tue, 19 Nov 2024 22:10:31 +0900 (JST)
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
	stable@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v5 3/3] drm: adv7511: Drop dsi single lane support
Date: Tue, 19 Nov 2024 13:10:05 +0000
Message-ID: <20241119131011.105359-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per [1] and [2], ADV7535/7533 supports only 2-, 3-, or 4-lane. Drop
unsupported 1-lane.

[1] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7535.pdf
[2] https://www.analog.com/media/en/technical-documentation/data-sheets/ADV7533.pdf

Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v5:
 - No change.
Changes in v4:
 - Added link to ADV7533 data sheet.
 - Collected tags
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
index 5f195e91b3e6..122ad91e8a32 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -172,7 +172,7 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 
 	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
 
-	if (num_lanes < 1 || num_lanes > 4)
+	if (num_lanes < 2 || num_lanes > 4)
 		return -EINVAL;
 
 	adv->num_dsi_lanes = num_lanes;
-- 
2.43.0


