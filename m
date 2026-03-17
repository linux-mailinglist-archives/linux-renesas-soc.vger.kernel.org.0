Return-Path: <linux-renesas-soc+bounces-29656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8D8UIEiyuWmDMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:58:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B3B2B1DCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:57:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8760B3040A8D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6640F347505;
	Tue, 17 Mar 2026 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VE/WTXvO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACAC3491F5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777419; cv=none; b=hLX17TwL39qoahPAoCDT/7/NvByemK2KtQ8+OGCo5sgwCTfX+lGFDpOtfjhlMaXemVpXTtdQ7UmGbKxY/NfPfX2+rHC0gbjbIPImKE8VbWYjpYdKVTByEwpqs/jI72Tj9BUTpNFQHkQ1wSO7b97wJUattSuMaFmS2jCUfA9ddTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777419; c=relaxed/simple;
	bh=iUjasimP5+ky9qKqqpISytS+Xv3jTe4n2zAFs2FsfCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NPRgJFlk4ojqumoMAr7vg13G7SMZnPEZ0Frfq09aihClBKHCI4glZFNU/jPO3P0rziikT/XMNGREY2ihFgGPtzY8dCzDPND8VLPRvpxjqVKJjzqezPRHpNt87NV0ZHQ26jSXomEYP/80vH5SXVP2piFaL9ZxpOHKevkDyuDSAjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VE/WTXvO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b4121c40aso28031f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777416; x=1774382216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=VE/WTXvODx4CouvcYCbH8ZSY8bzT0hBU57AaLfm9wVD6BQZhRVSAtaq7OnlVOvfWl4
         mIFIyiQz2F1i+3dUBX7Zt8prkZ6H+sDaaQ7Wi4TMiWL7TmxAUswBmcEYgVbqfdNQXNoD
         XPzT0nEtW6CDuu/HjEtITsmxGlpPeKiS2c043IG2BF1jb958sXFByb98o2u5E2TLuwiV
         lk9FYBlGBDSLmVrYG7HVpHFAVeKf7J6MGL/Xd89x8lV5rpwyVf62j8mYMZd0tVY3WfOl
         5lpdu/UQztcWnSCmVmNsgiPlUlObCWQNGGl5MzlFg/nkQhbQwnLSc9H+EzohXPhMogcP
         zB3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777416; x=1774382216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=FAmldytOzI/jqIUYKim2cvpTc6r/RIQNmcEDAu8b8HdwuWpbsGwl3dMcIMpocc0QGG
         Yp7++oxCW+XiKCj2KVFNsuoYhdVnGMiEgTWCzv7Z3NZdCF8+rMYhkV/EJ2u8jrxEaDiY
         Nq3XKHh6rW/9AMmBdTNUj0kb8Wq+MtojKzEAowiZ9xUj2AbfHSXrmOzQRxANfMKBrVJ8
         zgO/TM9cSk1u787WJU8dtWUbm/MD4Uv0Bs0kSnlQfh/mYGrhz3qMW43yxDKUuYHVOzG2
         z7pQ8EJJVRRnvy8UfnpiaZSHkAQo2erht4xgEBPJ6Fzs6e18EoZX7OoArdmn7AViPhYq
         3ibQ==
X-Forwarded-Encrypted: i=1; AJvYcCXakVwLFPO26Su8hFXTnar1BBIcaBdjd7YIVBGhDfFzIAc3a9bxAyBj+7rYhCKyX0p5CIUz1fDCDtarcjvhyRAI/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWIqUcF+7B+O4U0ZNv9iD8d2tHib9D3ig+83ap14DI/aYtQ1J
	xw+Gwqj60C/rO3XKRK7b9bjf85dJ19UL4RB9+HEkVRBz5EeiK6imO+IF
X-Gm-Gg: ATEYQzwX70+1aY7b4KN2e3Wau0UEjO5aEI9SJgqjarWF3MwXrW2lU79PLHiWVttQh7i
	4iTkCe4BCooVhoQSjaMELPWPTZdZ1kjeckSkJqboXj1GOAv56r+A10CLxPuXWDm4tWmzC8rouJY
	bCVu6K1FamOf7g21gtA/P1a0xOt5Pu1HCOSCcjE0WuLfrJ2Wr2MeM/gUIxVjx85PoQ19Tv0YEnY
	5DbA8KgrImfAJS4/TbHxTOnkEaKCQxUOMfYyv4qLd9ZRsB8yWPKWPAVqFjH4mYV7uJKMvHDqPsm
	mD2tY8BT4aLBr5ylobdVLtdTSQ3MGDLyIB14f+yDZfc+ZlUyMElTfGrcxdn0VMIeX5gVpnmL2NV
	YzR8K45W6RqYK2WGjq1czKpnm5vv9zH/X9YeNTa4Jt2V8hTVSuYZdjU4TpPhC/i52RB6sl08HpT
	MvHIuXacyoEbJQgOZA8zRZGzGbHYsPG+XnYw3dnZm+Cj8RBh0s
X-Received: by 2002:a05:6000:24c3:b0:439:df03:f300 with SMTP id ffacd0b85a97d-43b527c8a49mr786234f8f.40.1773777415878;
        Tue, 17 Mar 2026 12:56:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:56:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/9] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Tue, 17 Mar 2026 19:56:31 +0000
Message-ID: <20260317195650.468330-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29656-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 97B3B2B1DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Some reset lines must remain deasserted at all times after boot, as
asserting them would disable critical system functionality with no owning
driver to restore them. This mirrors the existing crit_mod_clks mechanism
which protects critical module clocks from being disabled.

On RZ/G2L family SoCs, the DMA reset must be remain deasserted for routing
some peripheral interrupts to CPU.

Add crit_resets and num_crit_resets fields to struct rzg2l_cpg_info to
allow SoC-specific data tables to declare reset IDs that must never be
asserted.

Introduce rzg2l_cpg_deassert_crit_resets() to iterate over all critical
resets and deassert them. Call it both at probe time and during resume to
ensure critical peripherals are held out of reset after power-on and
suspend/resume cycles.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 33 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  7 +++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..8165c163143a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1765,6 +1765,15 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, CLK_RST_R(reg));
 
+	if (assert) {
+		unsigned int i;
+
+		for (i = 0; i < priv->info->num_crit_resets; i++) {
+			if (id == priv->info->crit_resets[i])
+				return 0;
+		}
+	}
+
 	if (!assert)
 		value |= mask;
 	writel(value, priv->base + CLK_RST_R(reg));
@@ -1802,6 +1811,21 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	return __rzg2l_cpg_assert(rcdev, id, false);
 }
 
+static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
+					  const struct rzg2l_cpg_info *info)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < info->num_crit_resets; i++) {
+		ret = rzg2l_cpg_deassert(rcdev, info->crit_resets[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int rzg2l_cpg_reset(struct reset_controller_dev *rcdev,
 			   unsigned long id)
 {
@@ -2051,6 +2075,10 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, info);
+	if (error)
+		return error;
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
@@ -2058,6 +2086,11 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 static int rzg2l_cpg_resume(struct device *dev)
 {
 	struct rzg2l_cpg_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	ret = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, priv->info);
+	if (ret)
+		return ret;
 
 	rzg2l_mod_clock_init_mstop(priv);
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 55e815be16c8..af0a003d93f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -276,6 +276,9 @@ struct rzg2l_reset {
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @crit_resets: Array with Reset IDs of critical resets that should not be
+ *               asserted without a knowledgeable driver
+ * @num_crit_resets: Number of entries in crit_resets[]
  * @has_clk_mon_regs: Flag indicating whether the SoC has CLK_MON registers
  */
 struct rzg2l_cpg_info {
@@ -302,6 +305,10 @@ struct rzg2l_cpg_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Critical Resets that should not be asserted */
+	const unsigned int *crit_resets;
+	unsigned int num_crit_resets;
+
 	bool has_clk_mon_regs;
 };
 
-- 
2.43.0


