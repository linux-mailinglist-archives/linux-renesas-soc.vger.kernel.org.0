Return-Path: <linux-renesas-soc+bounces-10547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC91F9CFEF2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 13:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AF141F229E1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 12:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73414191F77;
	Sat, 16 Nov 2024 12:59:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3416BA47;
	Sat, 16 Nov 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731761990; cv=none; b=L8/9JuimwhnuBf5qZ58cYmsG6CH+3PiRCG3bYp1/gVBTqF5yM0sYPdyC3JdkaQiSh6DAnjboSsyM0EJsJeAeeljKK3eTzOgtakEAp+Tw5GFoQK8htiAWkWE/FhhN66FQSiW1lDhQm3GRo7Bmwp49RV1eCzje+e+cItmsrClk07A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731761990; c=relaxed/simple;
	bh=JDxl1KCthDGbEtSRq8k2hqZqo9b5GOkmzcbdHO4VwaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b12q5yCEnyT8SlRfWclwUx7Op6vc29Tpbrbnp1zp++jPrQS/Nef88xa1x9JTpQlwPEFadCfJ673TcqU+ikbk9mPh8YAbMbrczXO+VIFkevWp4SlBmYXCryJ32RhRmI4a/eiafNxf7BFRXVawaIP0BYVpYPwrPkVqhVMWStxZGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.12,159,1728918000"; 
   d="scan'208";a="225033480"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2024 21:54:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2A5C140065CD;
	Sat, 16 Nov 2024 21:54:35 +0900 (JST)
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
Subject: [PATCH v4 3/3] drm: adv7511: Drop dsi single lane support
Date: Sat, 16 Nov 2024 12:54:12 +0000
Message-ID: <20241116125415.30799-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241116125415.30799-1-biju.das.jz@bp.renesas.com>
References: <20241116125415.30799-1-biju.das.jz@bp.renesas.com>
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
index 5d0e55ef4028..51ddd935b568 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -174,7 +174,7 @@ struct device_node *adv7533_parse_dt(struct device_node *np,
 
 	of_property_read_u32(np, "adi,dsi-lanes", &num_lanes);
 
-	if (num_lanes < 1 || num_lanes > 4)
+	if (num_lanes < 2 || num_lanes > 4)
 		return ERR_PTR(-EINVAL);
 
 	adv->num_dsi_lanes = num_lanes;
-- 
2.43.0


