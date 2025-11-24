Return-Path: <linux-renesas-soc+bounces-25068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C282AC80ABF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCFD74E0F17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB4D26F467;
	Mon, 24 Nov 2025 13:10:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809B32E8E12;
	Mon, 24 Nov 2025 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989836; cv=none; b=MPaS8TbV5xqMRUchkDtY344X5GBz0Z1/5fsyv3FbX8P/9XStUekuSiEjBzMqmr3UGNFkSFyGx7NqkCI0hzL/1r+J/u70rsFMsNawFBXJ454VTn8jygoefA9Z8CuFwK+4XHIdc+LIi01pCAVM4RVdFIqK3cWf+EnckWbc0wnTAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989836; c=relaxed/simple;
	bh=RCG0Wya/kYhATnaxZvkcsbiCsiZFMyT3hPdYnlE9tH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ueMjxfivYGjUJAgqP7JjKUqQ1zj/LFhkAxY3IIYNeViPzR0dBWeuShBs2VnFyh5Llu05AB/xWPWrIjebiGcTwCVeqMflotGzNwaT0KUAWj8EniSs2HvdmqiG6642yCjyUq/wG9ua17Zxu6WbdvyerIgps2qnZEi0uIkErxyB6t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: glT/dnI2QDCWiSCn5lOSMw==
X-CSE-MsgGUID: SleVyjPkQV2+R6LS6Hz/Cw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Nov 2025 22:10:26 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 93F404054E66;
	Mon, 24 Nov 2025 22:10:22 +0900 (JST)
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
Subject: [PATCH v6 0/2] Remove hard coded values for MIPI-DSI
Date: Mon, 24 Nov 2025 08:10:01 -0500
Message-ID: <20251124131003.992554-1-chris.brandt@renesas.com>
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

* repo: git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
* branch: renesas-clk

base-commit: 5fb2f67341bd4b7c482f2bbda6b78244a51c3923

Depends-on:
"clk: renesas: rzg2l: Fix intin variable size"
	https://lore.kernel.org/all/20251114193711.3277912-1-chris.brandt@renesas.com

"clk: renesas: rzg2l: Select correct div round macro"
	https://lore.kernel.org/all/20251114194529.3304361-1-chris.brandt@renesas.com


Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: mipi_dsi: Set DSI divider

 drivers/clk/renesas/rzg2l-cpg.c               | 170 +++++++++++++++---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  17 +-
 include/linux/clk/renesas.h                   |  11 ++
 3 files changed, 168 insertions(+), 30 deletions(-)

--
2.50.1


