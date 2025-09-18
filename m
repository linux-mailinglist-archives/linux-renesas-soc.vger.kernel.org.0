Return-Path: <linux-renesas-soc+bounces-21995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD1CB82B48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 05:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F9D4720986
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 03:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6980216E23;
	Thu, 18 Sep 2025 03:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mu2LoqeI";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EzRvM+bO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654D53D984;
	Thu, 18 Sep 2025 03:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758164769; cv=none; b=Cbz6HR+Dv4IDNRxP4220gV0GPOfYXLyPCeg0+XfxZRoFinaGOPp0hQfJDAjXq8TkFWWuIzbqMvlPDIhssb2lNU5ySRhOnRxxYzLNK6QDrz4G+Ci/aZ10nG4/pX7EYaPVa5+eQjRoDlpgjrihqoe6fFQYhgpRgIOkvcHjC9fS2f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758164769; c=relaxed/simple;
	bh=1ID5dmzkAwZnoMz4LrUvGK8Yig7t3V7KKTbvLXgRwK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Svq8RwqXvNY5KuBZ3jvtBrmaQJjE/ThakVAPSimPQdClDp0YF3tCszxOOkX/+00G64skYMn5LPX8WNCMSEMKEXdKZtTOgPU1agnRNfTaqK4/PxUl/uJEoVbhWIefTMZjyx7sBXEVC7Yjox/yeIPH5fqX591xcIBvC/f8EaL8a6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mu2LoqeI; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EzRvM+bO; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cS0rs2rWXz9tPg;
	Thu, 18 Sep 2025 05:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758164765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPbAbtXIJpucPo8RwMSVvdoy5gHEkvEEZ+5KJJxdzFU=;
	b=mu2LoqeI05DT7VUKEK99UPN2rRuwWSL8YOLbAITVIkJa38ZiDK7XrfbThfpy1p7didXe+N
	INGfX5EwezxTEo3cWe1SUDi63sSyMo68hZhGDnZPG9nrA5Kfx9Wm/n/Q36FdAmeGPFPWqD
	UF13uP42xIxY3ikBep+uroLIr5XIWNoOBJMbkUHp0NGhckyl06ynZ5rsfqGa0IrrKu/yPv
	xmwp1EDnQWFkLU5kJDQusswglUSCj7dECazOOqBzQWeF/wKLtKr8/80P0/yBms+MU8tuJC
	cfV6goYnuHC4dqRkn1u+6mamJ2maEoBanrlvvfodRlWz/Ja/KUGvn9Cwpn38Vw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EzRvM+bO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758164763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bPbAbtXIJpucPo8RwMSVvdoy5gHEkvEEZ+5KJJxdzFU=;
	b=EzRvM+bO2AI0IFbNRH62IH40jGAsw6EwrINRAh08MWSLJuv6Tz4sq0cm55AoEYraV/4TST
	HgOa8dPn/ygM31P4bQ+xL7iTYDXEHdT7ly4ZrGTjDViWVRX9+m7UPhEdz/EciadQAxASNp
	4cfd2csd60Eg/Z79hw+sVI6sCGuLtPJqd6cnZEG+wBXKvNaQuXj9QSJUWA6rawkKyHmBWn
	vC2do1RoeLuM4q/H6bRCVAq4bl2KxlLzsfVNf5RzgHnswf+vSmxtrxGB8pN/0EmsegB1uw
	NAgg8ZZ6qEgTr4KKOxCl4x0QRMBTM++cQ/vbZvnQQe8K/ruPN2ucnO2rXG1ufQ==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
Date: Thu, 18 Sep 2025 05:04:43 +0200
Message-ID: <20250918030552.331389-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s6ofhwsixofofxia5wrkrnnmuyx41ffz
X-MBO-RS-ID: 811c07f5cbd203fba44
X-Rspamd-Queue-Id: 4cS0rs2rWXz9tPg

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

Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index be9f59e6975d..65dfaceea71f 100644
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
+	 * (one cycle of the RCLK clock @ cca. 32 kHz).
+	 */
+	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4)
+		usleep_range(1000, 2000);
+	else
+		usleep_range(35, 1000);
 
 	/* Release module from reset state */
 	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
-- 
2.51.0


