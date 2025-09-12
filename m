Return-Path: <linux-renesas-soc+bounces-21831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD5B5512B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 16:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E28887C6F2B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 14:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D47320380;
	Fri, 12 Sep 2025 14:22:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7453E311C2D;
	Fri, 12 Sep 2025 14:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686921; cv=none; b=Q0xOO91SZcM6paWFXInWQgoIvICIBo6KaDBKe4IDAsIUAqHOK6CW190ZRNbwNuNmojAMXUr532EwcmfkBtRxoJHpxunCtER/EUTxFA9Kk8AjNZ8VgEvNSQgao+Y58UcBEBP49PcABjVAhEkveWawU24Qq65XDG3MTwiOb+B4ZuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686921; c=relaxed/simple;
	bh=XkZXuBVZUYkDRWEjcp1JheN68pAAc5clfuNlMYP07p4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gfe0Vgksbqaa3KdCkiUTB7uta54s7PhXOxXJFOKuPMKyt9G3B6VfZ4FGQDwpfeJM4460NR6xUUwTef2QgaJb8Wcx8ooJKY8MUKYRlNzE3WQUq72JqSP7GgozviWp6+5c7HAPT/d9CFuPPH1fkIMKMsIr6N0Qg3WS/LrnVw6Ln9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: dpLWEU3xTlaUD6pkzIWXNA==
X-CSE-MsgGUID: 8IdTKR8FRAOylqcMpebazQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Sep 2025 23:21:50 +0900
Received: from lenovo-p330 (unknown [132.158.152.96])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6F22F400CA1A;
	Fri, 12 Sep 2025 23:21:47 +0900 (JST)
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
Subject: [PATCH v2 0/2] Remove hard coded values for MIPI-DSI
Date: Fri, 12 Sep 2025 10:20:54 -0400
Message-ID: <20250912142056.2123725-1-chris.brandt@renesas.com>
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
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  18 +++
 include/linux/clk/renesas.h                   |   4 +
 3 files changed, 141 insertions(+), 10 deletions(-)

--
2.50.1


