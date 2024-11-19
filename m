Return-Path: <linux-renesas-soc+bounces-10588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106D9D2E7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BA6BB36C4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 18:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4361F602;
	Tue, 19 Nov 2024 18:44:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C299145B00
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 18:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732041882; cv=none; b=Ivyhs3hrE35U8P9K2X5y/hCVWxdSWCTlXwACE+9jpXNjwLaajjv1wl5xMS4vGuzon1C3uITxzGfqdJTjUWJTaGqTMBUIMdE/ZNIwiFb/bdvlCa06CEkcJAJXribOswpAtoEYtqQO/ZdO4P54Z2IkUxJHK97UvT4NlDt/+EpVJsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732041882; c=relaxed/simple;
	bh=A0KvyNAjRFIeE5GjIATQVrZYHQ5YFhFdztdhxwuebzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NPXp93dPawDn47Z/XeTGoSJnGCEkRdxVO6T7o0LiKpL1o6yND8rbcjSSO7x066XgwX9rvGGc3fDdtb/ZWNK1Z7tSw3Zz9xXaXjkGCwH4O4iWrs+NdwbF+DMYZjrunkI4woyzSHGxx55tkcCp26ffAsFDixxltryD+cRcORQ7ukU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: idwUfOZJT7uxvCdOwL4tpA==
X-CSE-MsgGUID: vFEUuC8iQzyHWPp6+Nyqlw==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; 
   d="scan'208";a="225334498"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Nov 2024 03:44:39 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 86947400752D;
	Wed, 20 Nov 2024 03:44:22 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v6 0/3] drm: adv7511: ADV7535 fixes
Date: Tue, 19 Nov 2024 18:44:13 +0000
Message-ID: <20241119184420.138785-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to fix 2 bugs in the ADV7535 driver

1) use-after-free bug in adv7533_attach_dsi()
2) Drop unsupported single lane.

Changes in v6:
 - Fixed memory leak by adding goto stattement in error path of
   adv7511_init_regulators().
 - Added Rb tag from Adam for patch#3.
Changes in v5:
 - Updated commit description for patch#1.
 - restored host_node in struct adv7511.
 - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
   in error path of probe() and also in the remove().
Changes in v4:
 - Updated commit description for patch#1.
 - Dropped host_node from struct adv7511 and instead used a local pointer
   in probe(). Also freeing of host_node pointer after use is done in
   probe().
 - Added link to ADV7533 data sheet.
 - Collected tags
Changes in v3:
 - Replace __free construct with readable of_node_put().
 - Dropped single lane support from bindings and driver.
changes in v2:
 - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 - Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.

Biju Das (3):
  drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
  dt-bindings: display: adi,adv7533: Drop single lane support
  drm: adv7511: Drop dsi single lane support

 .../bindings/display/bridge/adi,adv7533.yaml         |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c         | 12 ++++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7533.c             |  4 +---
 3 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.43.0


