Return-Path: <linux-renesas-soc+bounces-10296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE799BCB32
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 12:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8019E282DF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 11:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8813D1D416A;
	Tue,  5 Nov 2024 11:03:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5601CB53F;
	Tue,  5 Nov 2024 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804590; cv=none; b=lFnAPSLhoRq6ZRTeS5rC+YF+hkqqUsYx7oqfut0sWq0Nh3wE/85BK/47d5OI3XvyfxgSTLSe40GVDnR1ix8fyjmX7Wl83I9S0a6jMoACKJoNfcYVkUGS8LqwGA3UPdEplSVAewNA3fF4qKrtcLKKNawO/1Lj6WoO+u/mf+dRi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804590; c=relaxed/simple;
	bh=80gnAaZk5mK4yh6QOItjebhsujRhtYtlTv/zIOp9BQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2rey11O1bJH1rk5BA/g/jOuhjDdXMRihwsSvE6W2Y5YhmSDu5FJ+6teZxQKUtdRpgenTqJUn+YGl2+zltF3D6KLlDZ2As+1p6ocFAsukkmIJWa8nTXZ1Y7r67Y8p/+Zfoem1qcK/igwaBZ9UrHqssc59mv5YvYiDV4nae7WEIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,259,1725289200"; 
   d="scan'208";a="227918973"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Nov 2024 20:03:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.174])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BBD2841CF051;
	Tue,  5 Nov 2024 20:02:50 +0900 (JST)
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
	stable@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Hien Huynh <hien.huynh.px@renesas.com>
Subject: [PATCH 2/2] drm: adv7511: Fix out-of-bounds array in clock_div_by_lanes
Date: Tue,  5 Nov 2024 11:02:28 +0000
Message-ID: <20241105110236.112631-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105110236.112631-1-biju.das.jz@bp.renesas.com>
References: <20241105110236.112631-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix out-of-bounds array in adv7511_dsi_config_timing_gen() for
clock_div_by_lanes[], when dsi lanes = 1.

Fixes: 78fa479d703c ("drm/bridge: adv7533: Use internal timing generator")
Reported-by: Hien Huynh <hien.huynh.px@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


