Return-Path: <linux-renesas-soc+bounces-10367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BA9BF59C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 19:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5DAF1F223C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Nov 2024 18:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5BD205E01;
	Wed,  6 Nov 2024 18:49:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6A5176AC8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Nov 2024 18:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730918994; cv=none; b=Sps2gsxEqUKKI0N1/nktb4KY8Vr1jQramH+emHhC55XZZCBERPO2MaA1M3ADFYUiSbxPmZIWIDk/U6YykEeD6zk2tVRNBtEiFPce77uOh3y91LRFzYs8zhSovGH7pV2dKhZ7JetKeoiFxjtGun34qhG6mCO53c3k/C6CVmMImLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730918994; c=relaxed/simple;
	bh=WWJ45ik5QA7KTFt3HYJhtUJmNjE3PoAnMbWmqOmcqfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JZfqQzL+IyoP3vsMgS/uZhcWBEnIXgVkjL7Kejw6XfpWzPT6CEjx00BWAA9ufQq7p5gzQBR02k0JS3T8l8HhSfVSXBPcHv38vyo9z7jHRBrzByd0dVFGYzu0VcFde/PkFxnyJm5P15l5PwFVZ0kw6bfkjQmr9eCiAJWVJHco0Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,263,1725289200"; 
   d="scan'208";a="224061184"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Nov 2024 03:49:45 +0900
Received: from localhost.localdomain (unknown [10.226.93.42])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ADCEA40065AD;
	Thu,  7 Nov 2024 03:49:37 +0900 (JST)
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
Subject: [PATCH v3 0/3]  drm: adv7511: ADV7535 fixes
Date: Wed,  6 Nov 2024 18:49:27 +0000
Message-ID: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to fix 2 bugs in ADV7535 driver
1) use-after-free bug in adv7533_attach_dsi()
2) Drop unsupported single lane.

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

 .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 2 +-
 drivers/gpu/drm/bridge/adv7511/adv7533.c                     | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.43.0


