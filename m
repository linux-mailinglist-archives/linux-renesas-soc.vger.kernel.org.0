Return-Path: <linux-renesas-soc+bounces-20101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B33E7B1DBE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 18:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAC66583451
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 16:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10E22701D9;
	Thu,  7 Aug 2025 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUj8qhwI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07335695;
	Thu,  7 Aug 2025 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754585046; cv=none; b=eYun8g7RuGR1/kAveUv9uww7MtwTXI1XoaIqC1iIjE2yaniLqUpRdgffhcsxA81yphZaP8lzj++livhz0x2reA+gqIHCNcP5lhFTKucUJExaapRaknVT5z32lenAxbqJRFFOpj/NEi7EJHe4O9ckkKCB4QlfrWJwWWRhLP+6F1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754585046; c=relaxed/simple;
	bh=aRVTg3NkA2j/+MLhyrI8o9+95qc57OCvEyQf/f9fKbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=runlfIGkNhWTxM6MLUJNEEze8LBudsj1ahAPxlh72u/SJyuBfXnDaFORHgsVhrb0fVeY4GCy+ore/c1ClmebmX2NB+eKt6Ot5a6wejGXvfIfa8SPtLkzd2iYXjGZ8P+iy5H7QJBsmJhamTTi83wQBkcCt4ODWSEcyLgYZwuB+pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VUj8qhwI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so10357145e9.3;
        Thu, 07 Aug 2025 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754585043; x=1755189843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UeFcbpNlz4XFli2IHS15ciDVbC4CdcWNGh3GZoGiWtI=;
        b=VUj8qhwIR4t8/IbDtWAT9QinqO1RMq3wI2e/Z23ZREVLEuZuH9Y0hopPf42dIpl4rE
         tPCX1aeyryPdKaSsg8EbA5KtX1+IpGfUSAdl7YDgfWb6l9E9z3vGnZX07pNd8ZFSp5Ns
         c/40AOovPiUfYZjgXvS5OT4UrYRfQAwUBRBvSDU5bxZLhOwqwPprLPhwFJDpNPRDwnAq
         yTI2eudpXP9Wyc79OxF67JsqoY8O0+wV8W4eQvoKG7Qf+NVrE92NREdsWWDiqhhTPS5v
         wmJmWpCqDTd/0D8qD9L7SQtppxammgtN448PcI1Plnpsnw590PLZ7bZAn+0Rr36U8ycd
         Iw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754585043; x=1755189843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeFcbpNlz4XFli2IHS15ciDVbC4CdcWNGh3GZoGiWtI=;
        b=LgZiqbfevYlDm+iKAbVn8EnlwXYpKt9oCDB+oEJLaBE8ypbPjyhwwI8u8eLddDp8Ei
         +vsaj4/hrL6g/vEhpK5qKMFncfTFKqYZTATVZLGheIhB7R+5Ytivbgk2f4TAHcNV2UiZ
         J+W1WzLIgyrbEL5EYbAB/LNUYOxd8QCjiEjAYUmmXnxVwApaE7UasgwQ48I2XKQXSY+X
         GjiGAIsi9aWHUZ7zhAJ53VRWZXc7JbSemLnH8LRm9T3KDCoTX7WyqQcC17kcF+Vrtev3
         KrV9X2al+HtmgWgBbNnQYY/IiNI26ZAxEh9WNK8HimYaBW/PInYFR5HZ0k22yqYtxQDu
         93Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXE3Jbu4XVNZi4QkDZ4QbQU5AW7tIxvFfSOKvinDiOGTJkoqcK0SmGTZuochf1qeL5GQ+XpcRP2/aU=@vger.kernel.org, AJvYcCXwIOZVayNnoWRtqm8qICt8oywRAcTF4vcfQa3Cw8B/Pax5bcXXG67ZweEOvkhrbTS0VAYR77MdOEqmEB26@vger.kernel.org
X-Gm-Message-State: AOJu0YxKHsy1kWljVD+up5kOlS+P/grv6KWF2gp9FNp1/5yOHidseCh5
	9EDmDB3AtgQb5/dX+klONwC4DSpd5D2yJAUjWe96zf+zBHAGzgU7d6UJ
X-Gm-Gg: ASbGnctT0bWpRDaOas24zlrLilgKEo8h5fUWsZFJNeR2M0TXxTQao5CVWJbjyZhx/2U
	hjPNOwZEuQ1zBL4VWtG71GvMNC+GeEZ5996MEjuuTNi1E3q6nfhNAIG8YGFxkXRHZruitrjqZlj
	Zyo+XkAI4OOia5/+i2NwbootJvJIpHcrWrTN9F+6Z9H9ITeYBEi3sMjcK5AS6KhIShJO4578oT9
	2o8WybI1XOvyghr0TlsHBugsORenYXiWqHWnd3FXeTFaJDXPtfRX5OU/hGwObr3kT5ydo1nDapL
	nVa6FDFUCZ+a6PHziPpdltHrzz8G6b1Ss/BLi/VDW2Oagpt74XSfBFKwAJt/uiHS0IJSRxqrj9P
	Ix4B2IzCJ6nrTgS+jtS51N9HH4pq17jnvhlE/o6fMsHL7hcSFi2a7fG6SvynxufAEmDzNZwWBHg
	==
X-Google-Smtp-Source: AGHT+IG6Kiu2mNQJUtBj2vCOU6NxM356lFEZdStFI5+TwQwAFVXc5X/Hdkuj1V92HQMigv3a08Q2KA==
X-Received: by 2002:a05:600c:4706:b0:459:d667:1842 with SMTP id 5b1f17b1804b1-459e744f6bfmr64869875e9.12.1754585042290;
        Thu, 07 Aug 2025 09:44:02 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9074sm26786942f8f.17.2025.08.07.09.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 09:44:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
Date: Thu,  7 Aug 2025 17:43:53 +0100
Message-ID: <20250807164353.1543461-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
Registers (MRCR) where both reset and deassert actions are done via
read-modify-write (RMW) to the same register.

Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assign
it to both reset_regs and reset_clear_regs. For RZ/T2H, set
rcdev.nr_resets based on the number of MRCR registers rather than the
number of module clocks.

Update the reset/assert/deassert/status operations to perform RMW when
handling RZ/T2H-specific layout. This enables proper reset sequencing for
modules on RZ/T2H without affecting the behavior of other supported SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 40 ++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5ff6ee1f7d4b..d299c2bb6100 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -137,6 +137,22 @@ static const u16 srcr_for_gen4[] = {
 	0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
 };
 
+static const u16 mrcr_for_rzt2h[] = {
+	0x240,	/* MRCTLA */
+	0x244,	/* Reserved */
+	0x248,	/* Reserved */
+	0x24C,	/* Reserved */
+	0x250,	/* MRCTLE */
+	0x254,	/* Reserved */
+	0x258,	/* Reserved */
+	0x25C,	/* Reserved */
+	0x260,	/* MRCTLI */
+	0x264,	/* Reserved */
+	0x268,	/* Reserved */
+	0x26C,	/* Reserved */
+	0x270,	/* MRCTLM */
+};
+
 /*
  * Software Reset Clearing Register offsets
  */
@@ -686,12 +702,16 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 
 	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
 
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+		bitmask = readl(priv->pub.base0 + priv->reset_regs[reg]) | bitmask;
 	/* Reset module */
 	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
 
 	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
 	udelay(35);
 
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+		bitmask = readl(priv->pub.base0 + priv->reset_clear_regs[reg]) & ~bitmask;
 	/* Release module from reset state */
 	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
 
@@ -707,6 +727,8 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 
 	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
 
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+		bitmask = readl(priv->pub.base0 + priv->reset_regs[reg]) | bitmask;
 	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
 	return 0;
 }
@@ -721,6 +743,8 @@ static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
 
 	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
 
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+		bitmask = readl(priv->pub.base0 + priv->reset_regs[reg]) & ~bitmask;
 	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
 	return 0;
 }
@@ -764,7 +788,16 @@ static int cpg_mssr_reset_controller_register(struct cpg_mssr_priv *priv)
 	priv->rcdev.of_node = priv->dev->of_node;
 	priv->rcdev.of_reset_n_cells = 1;
 	priv->rcdev.of_xlate = cpg_mssr_reset_xlate;
-	priv->rcdev.nr_resets = priv->num_mod_clks;
+
+	/*
+	 * RZ/T2H (and family) has the Module Reset Control Registers
+	 * which allows control resets of certain modules.
+	 * The number of resets is not equal to the number of module clocks.
+	 */
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+		priv->rcdev.nr_resets = ARRAY_SIZE(mrcr_for_rzt2h) * 32;
+	else
+		priv->rcdev.nr_resets = priv->num_mod_clks;
 	return devm_reset_controller_register(priv->dev, &priv->rcdev);
 }
 
@@ -1166,6 +1199,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->control_regs = stbcr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
 		priv->control_regs = mstpcr_for_rzt2h;
+		priv->reset_regs = mrcr_for_rzt2h;
+		priv->reset_clear_regs = mrcr_for_rzt2h;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
 		priv->status_regs = mstpsr_for_gen4;
 		priv->control_regs = mstpcr_for_gen4;
@@ -1262,8 +1297,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 		goto reserve_exit;
 
 	/* Reset Controller not supported for Standby Control SoCs */
-	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
-	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		goto reserve_exit;
 
 	error = cpg_mssr_reset_controller_register(priv);
-- 
2.50.1


