Return-Path: <linux-renesas-soc+bounces-10595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E79D2EBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 20:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32B4284342
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2024 19:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C911D2700;
	Tue, 19 Nov 2024 19:20:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365011D1E68
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Nov 2024 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044059; cv=none; b=r5qQoCSwrinyA7e8fyISFM/8FlgJ6SuWc+krtA0QmBVVyFE2rLjzReVqKura53Zg1iBvB07PTf5OVtEVI/icBcqvEEFOypsIEGhGj6I5qQcJrESMdZbEd1hHRqEIVyIhhwz2bAW/3dZvbq5tMw2lJ4PuCaKC7O14jSxZK5ovEPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044059; c=relaxed/simple;
	bh=iL8VOfQLODe13h763rLRn5HKdehU/xOkVACfulZUMTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cvvewwPc7UPtvvNv2C8LdDWiAVxrQC2vtQl1M4I8goNbNEcrWwSCM3+onlxK+a8rFIhZ1DWSSHi5u6E0jh3ThK/KMlCYkJPltzuCy3Sppz5MEW1qs86aDOvLgD7+c6YU+8Ra7IEt+dwVi9AZuNRg+nd81Nh2ERZ4CNPN8xBcEfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: dWMZcjCjQhSaKgLvGtfCkA==
X-CSE-MsgGUID: 24wQvAz7QkmTDhFls2ZmsA==
X-IronPort-AV: E=Sophos;i="6.12,166,1728918000"; 
   d="scan'208";a="229320091"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Nov 2024 04:20:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.216])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 55DC84052900;
	Wed, 20 Nov 2024 04:20:42 +0900 (JST)
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
Subject: [PATCH v7 0/3] drm: adv7511: ADV7535 fixes
Date: Tue, 19 Nov 2024 19:20:28 +0000
Message-ID: <20241119192040.152657-1-biju.das.jz@bp.renesas.com>
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

Changes in v7:
 - Dropped check for host_node as of_node_put() is a no-op when called
   with a NULL pointer. 
 - Added Rb tag from Laurent for patch#1.
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

 .../bindings/display/bridge/adi,adv7533.yaml           |  2 +-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c           | 10 ++++++++--
 drivers/gpu/drm/bridge/adv7511/adv7533.c               |  4 +---
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0


