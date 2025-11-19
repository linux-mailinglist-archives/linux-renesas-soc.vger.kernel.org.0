Return-Path: <linux-renesas-soc+bounces-24757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B3C6C647
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 03:33:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id DF75B298B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 02:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A192727E7;
	Wed, 19 Nov 2025 02:33:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C52199935;
	Wed, 19 Nov 2025 02:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519605; cv=none; b=TsLyB0D5+RJohNtiUKUMR+MmuekuJbUpndrZXiUF4FvMBx0GCWYoH6tA2IFn1CayxBYS96rFudFHUjng1sjbM7PxQvOt0PgbToAA+s5g74dZVsvojj6UpDB5wJ1mEtJPOjD9XEKMuJVoiZdHk8CuaMAzC30vyJcvJOYQEJlGpCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519605; c=relaxed/simple;
	bh=efDInDTWsVSJM3tu7ryZOHSOBy0PBAkzJT913BNuIc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNKJJMmAnVz7mR8R31G18c4BWAkeOVKEm7EuTwvWyE7vWDLxHT2VIsJVtt4UcforjWIi3G0hcYo6czRkOqlq+fZG/LrKfgYwl4pmjKpNTZfgvYc/qHgM42NCoBtpKCgVqvojr3bhKnFE8mIXWOr+aVZOTlS62jATzKJbtVbvF4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: qbymO1OgTcWvOru52OEXDg==
X-CSE-MsgGUID: NCc1z54/ThOkOlzcTGMJAQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Nov 2025 11:28:14 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E0EB641ECC05;
	Wed, 19 Nov 2025 11:28:10 +0900 (JST)
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
Subject: [PATCH v5 0/2] Remove hard coded values for MIPI-DSI
Date: Tue, 18 Nov 2025 21:27:42 -0500
Message-ID: <20251119022744.1599235-1-chris.brandt@renesas.com>
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

* repo: https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
* branch: master
* base: 6.18-rc5

base-commit: dd30a345f284e0d9b1755e3538f8257cf4deb79f

Depends-on:
"clk: renesas: rzg2l: Fix intin variable size"
"clk: renesas: rzg2l: Select correct div round macro"


Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: mipi_dsi: Set DSI divider

 drivers/clk/renesas/rzg2l-cpg.c               | 162 +++++++++++++++---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  21 ++-
 include/linux/clk/renesas.h                   |  12 ++
 3 files changed, 166 insertions(+), 29 deletions(-)

--
2.50.1


