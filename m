Return-Path: <linux-renesas-soc+bounces-22663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46DBB971D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 15:17:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AE35189AA6A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 13:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DD015530C;
	Sun,  5 Oct 2025 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uWEmBS/q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="deT7MJKw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218041FDD;
	Sun,  5 Oct 2025 13:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759670151; cv=none; b=O1SLGS9de4D61alLpm7QPPiQmzgRLAUqxgKZZEi8fPZtkCiCC0bHdYsi3mmsKjsg5i2jNVUTNO9XBFERDmIyS/helt8slv+ozCrZB9gV2urDmMJmmkC5FnjbIBk6jntzEtGjSQ7z1obRIfS3FYE5JFeX4WyG25CySO2Mn1Dt9tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759670151; c=relaxed/simple;
	bh=KTfT+eT4i4+R+oarvqoxCKWaIKGPJp4+2vMhXJ7ucUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p4PnR+byVvmppGXeAimrGCElQF6Z//d0GxR9fSyb15kAQO6d1QRSEFyrfr1HQ44XBRDfs24CjbfSm6xg3xX6WJN3tplox+XFGpnzGTvlaYzv7PSyqDa/gkIhcD+4zJHJbYU2gcVxgA6f5ZvankvRoK5mW7+G2YZZ5frzlo/MEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uWEmBS/q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=deT7MJKw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cfjZV0CBcz9v4g;
	Sun,  5 Oct 2025 15:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759670146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yWVWlxlcGCTqfFI44iTTOmmzmjwWQHXqiEBT9CAlZUQ=;
	b=uWEmBS/qB5IetLoIaJNLQkFVm6o/phWNuEwxQ2eEzSAvkuILNK7iXjyPPNxAg3IszYZH95
	y/ow8GI18eOdxFuV3cdKSrJL6WsbcJeA/akrneXqeL+PEa+mC8wxRcDZbG97q7CoKM7TLi
	X0w6M5QGhqkpGyVfZfelDGSCGCSTDTFEi4Kxi/llf+ca7e3XMSIRx8k1u63NNqDdoNCg7Z
	Ml+Rzx7+8KDfHIFHs1a4hwZ0Vr/Q13wmADqZ6HWijSJneckVDhLXB/xQHT1B4QEDGWUWB6
	+jDVuTTfc4IIDrQDF09/Xi+E2HYnq2Y19m5edkHTpHSr85jlPbjlRQOf3jcAsA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759670144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yWVWlxlcGCTqfFI44iTTOmmzmjwWQHXqiEBT9CAlZUQ=;
	b=deT7MJKw2tDAHmoqly5JERAzHEb20U16Oh2qx3QAVZ+m32BBg0g0yNUwHeQ+bSbJ/1CzFk
	o6Eg64WgIMCyVEhgwUYTgg48HZDQvql6tBFHMnr+HJ1ORzODgKnz+9Wk/Eru96eCXHaJp4
	plttZNPHmAGdl17cIsGR4DIDtw2p9sPLTNPmYkceRIXZlNnz/uPWJAcIL/NXQ6Vq79YOQI
	YszMlikzGy3V5N+tPoCJaoj7fSjtA83b3XmsREjDiS06D0D265hMPzavsyKPoVBrT2UhBd
	i+G4Y7yTiluuIU1rSxlnseQ3jAT2bU5IPYSIwQdao5+pKR3v4qAwV9BNZM6MPg==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
Date: Sun,  5 Oct 2025 15:14:58 +0200
Message-ID: <20251005131524.16745-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eyone158zu5sk5xhdntf5mhizpye4t6a
X-MBO-RS-ID: e23315404fbe247a0b1

R-Car V4H Reference Manual R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 page 583
Figure 9.3.1(a) Software Reset flow (A) as well as flow (B) / (C) indicate
after reset has been asserted by writing a matching reset bit into register
SRCR, it is mandatory to wait 1ms.

This 1ms delay is documented on R-Car V4H and V4M, it is currently unclear
whether S4 is affected as well. This patch does apply the extra delay on
R-Car S4 as well.

Fix the reset driver to respect the additional delay when toggling resets.
Drivers which use separate reset_control_(de)assert() must assure matching
delay in their driver code.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add RB from Geert
    - Use ca. as abbreviation for circa (cca.)
    - Switch back to udelay(), risp triggers this code from atomic context
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index be9f59e6975d7..ddc234942a85a 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -689,8 +689,15 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 	/* Reset module */
 	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
 
-	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
-	udelay(35);
+	/*
+	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
+	 * On older SoCs, delay after SRCR has been written is 35us
+	 * (one cycle of the RCLK clock @ ca. 32 kHz).
+	 */
+	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
+		udelay(1000);
+	else
+		udelay(35);
 
 	/* Release module from reset state */
 	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
-- 
2.51.0


