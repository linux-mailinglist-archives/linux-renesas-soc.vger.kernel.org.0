Return-Path: <linux-renesas-soc+bounces-23447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F9BFEA0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 01:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3B063A56EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 23:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513542F3602;
	Wed, 22 Oct 2025 23:59:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0498329617D;
	Wed, 22 Oct 2025 23:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761177583; cv=none; b=YloMh1JMz6TUL8y+lNlzPiGMezSMMfOJYC0501AMboswPqzztIB7Fv+nIi9Gmr9pEoBNEwUmFMJGMPFbTffc0JXbSjuWdbmMgOB5jSmyerbUvkOOveuIDI5zZGm3vNDYeN5ENudEewP1s/K7v3WR7dGng7eR+uoG4jqN0Q8uqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761177583; c=relaxed/simple;
	bh=Ls5nFNlw7WMiQ+5z4RgwRWiq74e/hR0xagpl2ln0vAA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZzgu1eT0Wq7od6x5AdPa6BTVP0dLRu05R8tAjQHHK7vfLA0mGEbiQueOwUrfmf1nZ8nYHlSsxwJ5Crm5cuMdvUHeP1aHURrpLXDHhgI6nb38NUySyeOUEVV9Oj5eca3OEqEx+E9mPU3oOexVEPQ4m61zlkotgk/vkkKykbSVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: GTBfhU+lTu+QtsHMoCx48Q==
X-CSE-MsgGUID: 0ulTk4rmRXSBD5IGAA0VjA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Oct 2025 08:59:34 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4AB2E4017D7E;
	Thu, 23 Oct 2025 08:59:30 +0900 (JST)
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
Subject: [PATCH v3 0/2] Remove hard coded values for MIPI-DSI
Date: Wed, 22 Oct 2025 19:59:01 -0400
Message-ID: <20251022235903.1091453-1-chris.brandt@renesas.com>
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
driver depends on DPI vs MIPI, the screen resolution, and the number of MIPI
lanes.


Testing:
* RZ/G2L SMARC  (MIPI-DSI to HDMI bridge, lanes = 4)
* RZ/G2L-SBC    (MIPI-DSI to LCD panel, lanes = 2)
* RZ/G2UL SMARC (DPI to HDMI bridge)


Regression Testing:
There are 2 patches in this series.
If you just apply the first patch that only modifies the clock driver, the
operation of the RZ/G2L SMARC and RZ/G2UL SMARC remains the same.

However of course, the second patch is needed in the mipi-dsi driver in order
to make sure of the new API so that lanes 3,2,1 can be supported.

Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: Set DSI divider based on target MIPI device

 drivers/clk/renesas/rzg2l-cpg.c               | 129 ++++++++++++++++--
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  19 +++
 include/linux/clk/renesas.h                   |  11 ++
 3 files changed, 149 insertions(+), 10 deletions(-)

--
2.50.1


