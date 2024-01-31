Return-Path: <linux-renesas-soc+bounces-2151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B698D8443BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 17:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC62F29021C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 16:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF8E12AADE;
	Wed, 31 Jan 2024 16:10:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04287BAF6;
	Wed, 31 Jan 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706717405; cv=none; b=gP+r2CneeZmnz9x84+wMPBSUxic2FP8mo/q9sBhXXTtgaWn9WfKoxZPXpp9bGBZEQ3m4VdD0jk3DycMZLYYXEC77//4aNDCg7aEidJjQY1tzWT28yV1d7RZlLxmpZvB8A+ksg5LUan3PjW9Nh6iX8iw/N4IeGIB4D7iAKpq3yUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706717405; c=relaxed/simple;
	bh=wfZbABjM6ffoj/xE+W20JzOuK2YWdPNXUfTx4omHDuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CW39J4gEmP48mdyFkxFLW6ATqfKXZKfn3TfBAuwAt9rvnQ7c8iIMQSkMpGf1MjJDW/NWCpY1fnM2YQBd1zhbN51sfyIKJFGWrvHuYaYk34D0w0l7yDvAuYIaQABBYx+aO/4VhmOQ3JUcOuoybPpAPxXRYpkOg/67e2tDf2gy/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,231,1701097200"; 
   d="scan'208";a="196312860"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Feb 2024 01:10:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A52FD40180CD;
	Thu,  1 Feb 2024 01:09:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH RFC 2/3] clk: renesas: rzg2l: Add disable_sync() callback
Date: Wed, 31 Jan 2024 16:09:46 +0000
Message-Id: <20240131160947.96171-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131160947.96171-1-biju.das.jz@bp.renesas.com>
References: <20240131160947.96171-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add disable_sync() callback to synchronize clk gating operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3d2daa4ba2a4..7baf0d7217e2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1277,6 +1277,28 @@ static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 	rzg2l_mod_clock_endisable(hw, false);
 }
 
+static void rzg2l_mod_clock_disable_sync(struct clk_hw *hw)
+{
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	struct device *dev = priv->dev;
+	unsigned int reg = clock->off;
+	u32 bitmask = BIT(clock->bit);
+	u32 value;
+	int error;
+
+	rzg2l_mod_clock_disable(hw);
+
+	if (!priv->info->has_clk_mon_regs)
+		return;
+
+	error = readl_poll_timeout_atomic(priv->base + CLK_MON_R(reg), value,
+					  !(value & bitmask), 0, 10);
+	if (error)
+		dev_err(dev, "Failed to disable CLK %p\n",
+			priv->base + CLK_ON_R(reg));
+}
+
 static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 {
 	struct mstp_clock *clock = to_mod_clock(hw);
@@ -1303,6 +1325,7 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 static const struct clk_ops rzg2l_mod_clock_ops = {
 	.enable = rzg2l_mod_clock_enable,
 	.disable = rzg2l_mod_clock_disable,
+	.disable_sync = rzg2l_mod_clock_disable_sync,
 	.is_enabled = rzg2l_mod_clock_is_enabled,
 };
 
-- 
2.25.1


