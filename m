Return-Path: <linux-renesas-soc+bounces-23392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C46BF7F95
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 19:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 862DD3AB230
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 17:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9EC34D4ED;
	Tue, 21 Oct 2025 17:53:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510553557ED;
	Tue, 21 Oct 2025 17:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069207; cv=none; b=P4t4vMU43t5qxBgJCzgP1TGfay4E2NP7a+DH/RV/KijWKKxD9Sq5LZBGj5M/LR5PxuHvP0hXnT4ZWoFxmAxW+o33FdWpYGCYvRqDr0P8DbWgp37XiApmtpBfH/FzdnFF+AH8InP9e7qT+Ib8e3PmHkhf2G6HBKoeKuGzqT9MKn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069207; c=relaxed/simple;
	bh=TWXOv5Mdy2U7Y72TfpTFWHWBB0MlAP/zZFp/GDplpuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJu1e+gGQqf47cwjfugR7UbdTwSk7cr0AeYf6oP3s/dvTzQzE1NQQO2grBo/+c4VWNEh1ky6jnPOUmr76g3C6TvafuHDV4R/01/KFBOyXsesES4GcubYFVrqYojFJtCN23jTBGJrXV6oW/EFB463AE7uoJjJyagyjGrRnEDDsgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: mYCLAkorRimnIgxsyhB2gA==
X-CSE-MsgGUID: 81K4wOQxQyyQlIVGZETLaw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Oct 2025 02:53:17 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1FA064031FFC;
	Wed, 22 Oct 2025 02:53:12 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 0/4] Add versaclock3 support for RZ/V2H EVK
Date: Tue, 21 Oct 2025 17:53:07 +0000
Message-ID: <20251021175311.19611-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series extends the versaclock3 driver to support the internal
freerunning 32.768 kHz clock, which is used on the RZ/V2H SoC as RTC
counter clock. It also adds the dts node for the RZ/V2H EVK.

Best regards,
Ovidiu

Ovidiu Panait (4):
  clk: versaclock3: Remove unused SE2 clock select macro
  clk: versaclock3: Use clk_parent_data arrays for clk_mux
  clk: versaclock3: Add freerunning 32.768kHz clock support
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
    generator node

 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 ++++
 drivers/clk/clk-versaclock3.c                 | 126 +++++++++++++-----
 2 files changed, 120 insertions(+), 31 deletions(-)

-- 
2.51.0


