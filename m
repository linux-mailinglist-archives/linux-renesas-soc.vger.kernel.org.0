Return-Path: <linux-renesas-soc+bounces-10544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2619CFEE4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 13:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 442C3287954
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Nov 2024 12:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0F216631C;
	Sat, 16 Nov 2024 12:54:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DCD913D297
	for <linux-renesas-soc@vger.kernel.org>; Sat, 16 Nov 2024 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731761674; cv=none; b=M0hrjhKpkyMCAJ1/5DMLWhnm+oJHvL8w1GzJq8+bggct7PEZiY9RhaSDsbAn5PTrV/x179xdspfYcql5e1GtaLjNKgLuOjS1Qoji1kwC/x0Ysr/3ZYpIyw1IJeNsIrK3moRFK2V2FYjv397fURZfmr9mQJ56+mkLQWmbBPwl5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731761674; c=relaxed/simple;
	bh=GHKDUC0JJsqzP2wpJ4CeYe+XcIRaLZvyq253na+4CX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjmo96yJipWExYu7oo6nJtsrkUiAzgkAGye0JC5JZIL/aDWHcZuapP8BgyGhy2BNY4mglY4L1vpZJIBBDgZ6dLAOuuhDZ1H+RUOHBgrH3a60sMh6QFAY2+uAn2iXBDBsVMOO165M6yz4wxhaMHwc+kjxOE8vAtofim4hb53UDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.12,159,1728918000"; 
   d="scan'208";a="229020473"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Nov 2024 21:54:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4548D40065CD;
	Sat, 16 Nov 2024 21:54:18 +0900 (JST)
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
Subject: [PATCH v4 0/3] drm: adv7511: ADV7535 fixes
Date: Sat, 16 Nov 2024 12:54:09 +0000
Message-ID: <20241116125415.30799-1-biju.das.jz@bp.renesas.com>
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

 .../bindings/display/bridge/adi,adv7533.yaml  |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511.h      |  6 ++---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 22 ++++++++++++++-----
 drivers/gpu/drm/bridge/adv7511/adv7533.c      | 22 +++++++++----------
 4 files changed, 31 insertions(+), 21 deletions(-)

-- 
2.43.0


