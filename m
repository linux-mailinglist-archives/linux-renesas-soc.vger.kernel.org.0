Return-Path: <linux-renesas-soc+bounces-24184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F2C382F9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 23:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C5F04E97D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 22:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439022EFDA2;
	Wed,  5 Nov 2025 22:26:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FDE265630;
	Wed,  5 Nov 2025 22:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381563; cv=none; b=Fuf66zOkQr4aZQ72X6cwcTdb5aFQnQnpUIKZWsW3kV+kMcxGHsmyBEdRKYQZTOkz1QxbN2ZOtRbIRWWh50S/FAbLvI3G/NI8cBrdLOZdaEr+IW9h6MwAfdYScWWu2eH2oH5Lrn/iZ9in6spGx87ohZu1kcXLMlD9tucYrDQomSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381563; c=relaxed/simple;
	bh=z2H0JEB4BDaELhrp890z0u572Y8e6546LBsxIKLhXJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqUKPmd9I0PjrpE745Vod+YEp5kzE3tk/lFfLhPRBmclblJWVPD3WxO/kVsPqA8Xvvdl2wrr3TOMHOWrwOXOLHCyYQei3XSQYr7eWk/AOjVlERPHScP+wlDUVrjWfSTGjiJqx4R2iwxl4Wa5HXayFauQR/yru+rKs2oyI4EwZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: TJ4jYchEQBKmVX/WCc6/DQ==
X-CSE-MsgGUID: uVVeu0XKRuO2msvyNwliAA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2025 07:25:59 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id BCD71409F5BB;
	Thu,  6 Nov 2025 07:25:55 +0900 (JST)
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
Date: Wed,  5 Nov 2025 17:25:28 -0500
Message-ID: <20251105222530.979537-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the initial drivers were submitted, some of the timing was hard coded and
did not allow for any MIPI-DSI panel to be attached.
In general, panels or bridges can only be supported if MIPI-DSI lanes were 4.
If the number of lanes were 3,2,1, the math no longer works out.

A new API was created for the clock driver because the behaivior of the clock
driver depends on DPI vs MIPI, the bpp, and the number of MIPI lanes.


Testing:
* RZ/G2L SMARC  (MIPI-DSI to HDMI bridge, lanes = 4)
* RZ/G2L-SBC    (MIPI-DSI to LCD panel, lanes = 2)
* RZ/G2UL SMARC (DPI to HDMI bridge)
* Multiple monitors, multiple resolutions



Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: Set DSI divider based on target MIPI device

 drivers/clk/renesas/rzg2l-cpg.c               | 147 ++++++++++++++++--
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  18 +++
 include/linux/clk/renesas.h                   |  12 ++
 3 files changed, 164 insertions(+), 13 deletions(-)

--
2.50.1


