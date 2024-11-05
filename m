Return-Path: <linux-renesas-soc+bounces-10297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396679BCB4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 12:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1841283AE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2024 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 459321D357A;
	Tue,  5 Nov 2024 11:08:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A101D279B;
	Tue,  5 Nov 2024 11:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730804886; cv=none; b=HbHxv/xJeyVtzTa4LBhx/iVDR+zML8rCvK18DVMhh8n7rAYkJ5cVa4rEChjTkemiOwa7Qn/5/y4it9w3dSBA0hiL1rBxTtFY88LZgzEMWogjC9bOwe1iO2jKKHKmjIn0prlT+F2sToGS0L9JuZHt2CobYmqXUPTKC6J3Y9Ov1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730804886; c=relaxed/simple;
	bh=hI/47Eg3K1lDBTwD1w32TeXPM+NX9gFtFhPh+Om9y9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h4jG0mI/oADz2pcHilO2nMTPnxt98gz1AZbGLBgJ3lV4cDk1ENci7B4JqkoqCbv9rW4ncYPtB2f4/CqId5W8YriErlPeh33TxMihwSMKHTo14Q4ZX7NHEM6vvLq0wFgzaZm+zuGVEgaW4nUFqzy9mEHJa4T4s8ee1WdR8T+h7b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,259,1725289200"; 
   d="scan'208";a="223929690"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Nov 2024 20:02:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.174])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2FE0041CF38C;
	Tue,  5 Nov 2024 20:02:38 +0900 (JST)
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] drm: adv7511: ADV7535 fixes
Date: Tue,  5 Nov 2024 11:02:26 +0000
Message-ID: <20241105110236.112631-1-biju.das.jz@bp.renesas.com>
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

Biju Das (2):
  drm: adv7511: Fix use-after-free in adv7533_attach_dsi()
  drm: adv7511: Fix out-of-bounds array in clock_div_by_lanes

 drivers/gpu/drm/bridge/adv7511/adv7533.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0


