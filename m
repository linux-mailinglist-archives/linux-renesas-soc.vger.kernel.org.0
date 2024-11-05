Return-Path: <linux-renesas-soc+bounces-10298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E25EB9BCB57
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 12:12:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59A71B2107F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 11:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8036C1D357A;
	Tue,  5 Nov 2024 11:12:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5F01D278B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Nov 2024 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730805161; cv=none; b=hlnkARpl3C9wge6ZAYvkfmWoA+6QnDhr6maIfGbyfnO6D/Un0appxZIms8EYXFIZof/nrT2PZU2yBwKyrp1JnLIncQcgdlGXRNlJJrNqCIpGPHR0Gny9HKGu3/RcJ8ehUgYXd1GIZZC37H1+tS0uSgLofJNnnu/9GQkPGGtBXgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730805161; c=relaxed/simple;
	bh=g5+lIM1ExpaUD/upDG6aYgLPjxhxJxWIjuKyv2slXXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oCaL/musAyAWzMPRoGdIoqKzWZykfhHroyJdKH+dMsgUCaOu11v+IrD126mp1PKPMQly7x69oHYSSEszDXYCB6k4S7ROhdI8Be1h6wC0Uo7p0xbfpgjCRvq4/JUsB70k15zYpFUzr7jfpHl/jrtnRZAOc2ZOKKrn9gpcb4vcC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,259,1725289200"; 
   d="scan'208";a="223930453"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2024 20:12:38 +0900
Received: from localhost.localdomain (unknown [10.226.92.174])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6EAFF41D0022;
	Tue,  5 Nov 2024 20:12:31 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/2] drm: adv7511: ADV7535 fixes
Date: Tue,  5 Nov 2024 11:12:17 +0000
Message-ID: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
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
2) out-of-bounds array in adv7511_dsi_config_timing_gen() for
   clock_div_by_lanes[].

changes in v2:
 * Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
 * Dropped invalid Mail address Archit Taneja <architt@codeaurora.org>.

Biju Das (2):
  drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
  drm: adv7511: Fix out-of-bounds array in clock_div_by_lanes

 drivers/gpu/drm/bridge/adv7511/adv7533.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0


