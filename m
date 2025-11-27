Return-Path: <linux-renesas-soc+bounces-25282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC70C8EFD2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 15:59:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23EAE343FC4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 14:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8F733468E;
	Thu, 27 Nov 2025 14:58:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A5E6334397;
	Thu, 27 Nov 2025 14:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764255501; cv=none; b=q5Eai/OjlKN0+po0o/gHZAjM/QcK8bEmUspkpkHaKpw+N2NnpS0s1JNlBo4muCY7zcn4+1MLYtdA07oM8TZwGnU0APJCfgcoCzsRGX2ZrH7/juIf3aPejZmRgqUakHuaYsm0uheC5fEI3UaQc9K3Jmb80ts+nh5HpEd23LO2jKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764255501; c=relaxed/simple;
	bh=BKA1v7yry+bsdic5aHVfiNJkEkNByit3s3iod0k7Yik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7wyEgCT4ue7nCiIkfai34UAphcRs7GHdslI9UJMOb2UHRUtYtv4f4enzqAy9CtT5gxx7B9bcgoIChaJUByE+V54Pv2KgXzoQN3fddzQJAazXUQkE6kaklIy4wuVdQh2YFrL4xgsccfXv30mRJciEDDvmkjVf6i/ZdVstSki/4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 2RiyD0KKSKeKO8QaA4eJYA==
X-CSE-MsgGUID: JEqXlduRSTK/1uuslFQEXw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Nov 2025 23:58:10 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.189])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 16BCC40108F6;
	Thu, 27 Nov 2025 23:58:07 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 1/2] clk: renesas: cpg-mssr: simplify pointer math in cpg_rzt2h_mstp_read()
Date: Thu, 27 Nov 2025 16:56:53 +0200
Message-ID: <20251127145654.3253992-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251127145654.3253992-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Private state is available in all places where cpg_rzt2h_mstp_read() is
called, remove the extra pointer math used to find it from clk_hw.

While at it, put these statements on a single line as they do not exceed
the 80 columns limit.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7f9b7aa39790..031e4b125f2d 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -237,20 +237,16 @@ struct mstp_clock {
 
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
-static u32 cpg_rzt2h_mstp_read(struct clk_hw *hw, u16 offset)
+static u32 cpg_rzt2h_mstp_read(struct cpg_mssr_priv *priv, u16 offset)
 {
-	struct mstp_clock *clock = to_mstp_clock(hw);
-	struct cpg_mssr_priv *priv = clock->priv;
 	void __iomem *base =
 		RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
 
 	return readl(base + RZT2H_MSTPCR_OFFSET(offset));
 }
 
-static void cpg_rzt2h_mstp_write(struct clk_hw *hw, u16 offset, u32 value)
+static void cpg_rzt2h_mstp_write(struct cpg_mssr_priv *priv, u16 offset, u32 value)
 {
-	struct mstp_clock *clock = to_mstp_clock(hw);
-	struct cpg_mssr_priv *priv = clock->priv;
 	void __iomem *base =
 		RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
 
@@ -286,17 +282,14 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		barrier_data(priv->pub.base0 + priv->control_regs[reg]);
 
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
-		value = cpg_rzt2h_mstp_read(hw,
-					    priv->control_regs[reg]);
+		value = cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
 
 		if (enable)
 			value &= ~bitmask;
 		else
 			value |= bitmask;
 
-		cpg_rzt2h_mstp_write(hw,
-				     priv->control_regs[reg],
-				     value);
+		cpg_rzt2h_mstp_write(priv, priv->control_regs[reg], value);
 	} else {
 		value = readl(priv->pub.base0 + priv->control_regs[reg]);
 		if (enable)
@@ -318,7 +311,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		 * the IP at least seven times. Instead of memory-mapping the IP
 		 * register, we simply add a delay after the read operation.
 		 */
-		cpg_rzt2h_mstp_read(hw, priv->control_regs[reg]);
+		cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
 		udelay(10);
 		return 0;
 	}
@@ -352,8 +345,7 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		value = readb(priv->pub.base0 + priv->control_regs[reg]);
 	else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
-		value = cpg_rzt2h_mstp_read(hw,
-					    priv->control_regs[reg]);
+		value = cpg_rzt2h_mstp_read(priv, priv->control_regs[reg]);
 	else
 		value = readl(priv->pub.base0 + priv->status_regs[reg]);
 
-- 
2.52.0

