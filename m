Return-Path: <linux-renesas-soc+bounces-11283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEC89F0C74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 13:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2142D16A826
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6951DF975;
	Fri, 13 Dec 2024 12:36:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19701DF97A;
	Fri, 13 Dec 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093367; cv=none; b=Wi37wj8CKNanRX9E9pnEWNnZvYZGmQGShlVNm4nZSm7J5J2S8p/GAE0+5bcBCkylV9c5YIfMy5xF9vr7V8KDj2EQl4cPr5KaBp1snZtEuaMRGePXgsUH+/srmauZaq80ycrOHqNCM3QsKAL0FyfpcpbmxvgrPJVBxF7TqwWoStY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093367; c=relaxed/simple;
	bh=M2GpTEfMJXAlzRZjiSHmR785Bpy4LVWyJtCgl1HarVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZeFhR3tn7wFIGUEyru4OMySHjGn+tMAI/RvBl0nxCh2FEX5U9Rdpf3sXVFxTJKn01yzzcPxRT4G0xv+Dqc1q6Tw1GhvVsUeUQETspCrpOb8L8rKAHCGDwTH0Hhq19/2ueSu/LNA+3PHQpbmPVAZmuMHp+aVEPB/MgoIc2QZY9LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: jXvzOPJ/SHa+Fq+O+Dx1qg==
X-CSE-MsgGUID: RKShXgl8TvG4ycgkb4b36g==
X-IronPort-AV: E=Sophos;i="6.12,231,1728918000"; 
   d="scan'208";a="231760514"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 13 Dec 2024 21:35:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B9AC74239280;
	Fri, 13 Dec 2024 21:35:52 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/3] Add clock driver support for Renesas RZ/G3E SoC
Date: Fri, 13 Dec 2024 12:35:39 +0000
Message-ID: <20241213123550.289193-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds clock driver support for RZ/G3E. Also add
MSTOP support for RZ/V2H.

This patch series is tested on renesas-devel and next.

v2->v3:
 * Updated commit header and description for this series as all the
   patches accepted except clock.
 * Updated commit description for patch#1 as adding MSTOP support
   for RZ/V2H first will ease backporting.
 * Added missing MSTOP data for SD{0,1,2}
 * Replaced BUS_MSTOP_NO_DATA->BUS_MSTOP_NONE
 * Added idx, mask variable to struct rzv2h_mstop to simplify
   the code.
 * Started setting initial value of refcount with the correct value
   based on the clock's current state.
 * Collected tags.
v1->v2:
 * Collected tags.
 * Fixed typo "CORE_CLK*"->"CORECLK*" to match with hardware manual in the
   clk bindings.
 * Added MSTOP data for RZ/V2H CRU IP.
 * Fixed typo clock->clk in error path of rzv2h_cpg_register_mod_clk().
 * Added OPP table support for frequency scaling.

Biju Das (3):
  clk: renesas: rzv2h-cpg: Add MSTOP support
  clk: renesas: rzv2h-cpg: Add support for RZ/G3E SoC
  clk: renesas: r9a09g047: Add CA55 core clocks

 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c | 116 +++++++++++++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 153 ++++++++++++++++++----------
 drivers/clk/renesas/rzv2h-cpg.c     | 105 ++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     |  24 +++--
 6 files changed, 344 insertions(+), 62 deletions(-)
 create mode 100644 drivers/clk/renesas/r9a09g047-cpg.c

-- 
2.43.0


