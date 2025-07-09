Return-Path: <linux-renesas-soc+bounces-19468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C604DAFF352
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9888F5A4F38
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450E0239E8D;
	Wed,  9 Jul 2025 20:56:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A690B23B632;
	Wed,  9 Jul 2025 20:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752094578; cv=none; b=KaIvCgwdca2ODbY/l63hWCK7SzMbgNp5JEaNEkyOhfUU9OSRLbxJ8MjLWMY+F9OkhvNzJUq9YvW2PTMnezKT/H5ZWRljlRDCS249xhdxKjAzRGvNgVnNivOzxx6CLPnS2L5qLt3Oz7Xz/bYW8eAbb5Y9iEp58qtttrvzAKlhEuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752094578; c=relaxed/simple;
	bh=7dXHDRgvA5zbVNSP6KYKV9R0As3bO9FaecgU+FjXVOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HO3TCADW4HFQhUIKOct3ISC0KbMonDqWaAQdq57xR9uL4UTT7sK6a8mgVZmNRHK371A1E1DIyvOipTnzKyidMCsYY8CVFe03+WiO6z/5JwqIIxx7JLi9Dfzgz6xD04co/bzW82xdyfgaTpSVyEOu4GY4SfuXMxVYlUrsXpzzDwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: SEHcO6xPRZWzKFG0VDFzGQ==
X-CSE-MsgGUID: LGq+HqAxS1qpbo7yb7rcbA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jul 2025 05:56:08 +0900
Received: from lenovo-p330.. (unknown [132.158.152.96])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4BCA64095590;
	Thu, 10 Jul 2025 05:56:04 +0900 (JST)
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
Subject: [PATCH 0/2] Remove hard coded values for MIPI-DSI
Date: Wed,  9 Jul 2025 16:55:30 -0400
Message-ID: <20250709205532.747596-1-chris.brandt@renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the initial drivers were submitted, some of the timing was hard coded and
did not allow for any MIPI-DSI panel to be attached.

This series assumes the follow patches have been applied.
Both patches exist in drm-misc-next.

5ce16c169a4c ("drm: renesas: rz-du: Add atomic_pre_enable")
6f392f371650 ("drm: renesas: rz-du: Implement MIPI DSI host transfers")



Chris Brandt (2):
  clk: renesas: rzg2l: Remove DSI clock rate restrictions
  drm: renesas: rz-du: Set DSI divider based on target MIPI device

 drivers/clk/renesas/rzg2l-cpg.c               | 113 ++++++++++++++++--
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  17 +++
 include/linux/clk/renesas.h                   |   4 +
 3 files changed, 124 insertions(+), 10 deletions(-)

--
2.49.0


