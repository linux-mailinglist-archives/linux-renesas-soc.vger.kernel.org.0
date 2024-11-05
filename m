Return-Path: <linux-renesas-soc+bounces-10300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9769BCB5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 12:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6333D1F2375D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 11:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A32D1D3593;
	Tue,  5 Nov 2024 11:12:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F3D1CB53F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Nov 2024 11:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805177; cv=none; b=V2Ax+gIFfgJU/QlIzFIbO/KV9gzldUal+LPMdAjWUwnWaGm25zpFAzUZ445mo3T+mpa1Emw+y8hx9nhmtzIGnwOa9Aj1+zghPvfBgjFFG/67MV0qeu/oIjy5KjvxO15YpIPmCw8eKwIsdXQcg2jsaxWJlOWCyiJzT5XcamH5Wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805177; c=relaxed/simple;
	bh=2D65lXdexeqXMM/9RO1Ure+YDyC/2GbhHCiMuIL3kxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARyFUuBpAtBNTFbgv+zIPHNRcIvxvJTzU1UcZ3njITodRx27PPif2EbsqsoJVm5NMzCvUo1dEgGV4d+yxfPXYUgFcAkfZk4p4bsuU+zxkqdanFMZ8AApo9J0HN4dfxfU5XBtrbXVTFWTde0K1k/8PZBAbAVUjDwqtLAwq5hq7eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,259,1725289200"; 
   d="scan'208";a="227919685"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2024 20:12:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.174])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BD90041D0022;
	Tue,  5 Nov 2024 20:12:42 +0900 (JST)
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
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH v2 2/2] drm: adv7511: Fix out-of-bounds array in clock_div_by_lanes
Date: Tue,  5 Nov 2024 11:12:19 +0000
Message-ID: <20241105111228.112813-3-biju.das.jz@bp.renesas.com>
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

Fix out-of-bounds array in adv7511_dsi_config_timing_gen(),
when dsi lanes = 1.

Fixes: 78fa479d703c ("drm/bridge: adv7533: Use internal timing generator")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped Archit Taneja invalid Mail address
---
 drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
index 3e57ba838e5e..0c2236e53af5 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
@@ -185,6 +185,9 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
 	adv->use_timing_gen = !of_property_read_bool(np,
 						"adi,disable-timing-generator");
 
+	if (adv->use_timing_gen && num_lanes == 1)
+		return -EINVAL;
+
 	/* TODO: Check if these need to be parsed by DT or not */
 	adv->rgb = true;
 	adv->embedded_sync = false;
-- 
2.43.0


