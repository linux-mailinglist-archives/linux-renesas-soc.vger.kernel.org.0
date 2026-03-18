Return-Path: <linux-renesas-soc+bounces-29731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBD+LX5lumklWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:42:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E32B8431
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 99A49301A2AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BE73876B9;
	Wed, 18 Mar 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMAtA9W0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC893876B1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823324; cv=none; b=KqO6MBORoTCjSgvybdAMCV97IFqikTQhGbSVM0T6Mpz5HpjwwmfMN40w7e8bPVaibqsEZyFYL7ejO5fU7N+qLaSELfmp2avMh12s+73KDqjXS5dU/t3/DFgsqisdllEe+y7S/zLep2tJDDI/Cak1iHE7THheFdTBxJoisWi/Vl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823324; c=relaxed/simple;
	bh=9UHP8gV6HX8JzqEc/1v9h0KsterRQebADvldIs9vSZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnD2tnVCNEafOT5G/pQTvXEVDE3rtrXpjFl+mCbRvMYQmQT8ofLSaftogBgOdZAXnG+kOGrx8BFSnHNuBpDDpbnN358KRRSDx6cNO385PsrmHhp41MeycRsN0gBvaA3ui2yYl9aQXVNQ8hXk5VOhcI1BHayyWW3ewtC1jR6jp2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMAtA9W0; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso466417f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823317; x=1774428117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdtqrEGcEb8BJ5VTpODAM1xEvDMiU/z6ATTkFh9EIzo=;
        b=PMAtA9W0gWAgK40nyN+P8t8aiLivQnyhzB0Tx/r/WhJJv69Apl49ZasABxb4Va6nq9
         5OAE/tZy3u/NhtN2s296ZuqEPrIT913/o6yRNGmDkrjhQBXtYXJYUD+uipIGgHVzGxAV
         eFXsOB6fC13ZrLW0ItdSaUyk5Ekh9LO9MTYo4ZQiD95J8MMzoJy5MRIk/9edYVjgUM/X
         pZpM2rip+/JDxbaLAQKMu3uchC+/05o+Hy/qigIMUl+35ATlxJK4dM3dvSKKRFp8cwWh
         dpVz4HYpHK3xo5ZJUPtVMFwLR18+cLM3S97Wc8c0rqH5zvR98EZoig7gKLBKBcf+IFu4
         /qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823317; x=1774428117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JdtqrEGcEb8BJ5VTpODAM1xEvDMiU/z6ATTkFh9EIzo=;
        b=Pmc9pP+t7pZQKCJeWHdVVkY8LRAnrjjoe4NLDdt9SfRnUNoopgWmNzju+QL4tWjVFM
         1ygxfYyrLB8WYH8mKC/+j7kMEFLUNcDsmfvASJrlCd21sqSBtYSeX4IJs4Z1rPLc3zS6
         2fy5OI/by7zfqx1TDWMt+KPvFI2v3fYL+U6eNmkpMtHwhK2j2zSsfnxOioZsV8F/IL8x
         thho/C6TPV2UsqVfqoibLspubAYzrJewo9jDwY4GSIOKvlv1Ivdn2Ozx9VQZlx+MgIXJ
         vpF/xzGOUDJ/DpDhj29dzFKdQnxupsy/5B8B7Ybut6kJN/VY4MFmG8Hhvb4lth+mPDD2
         t/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUoh2Zx85/EbDBVf1DWtmH3y0sJuN5VGOmmzNP6s8r1khRlA0uoWBXWBdjmr9b/X8QRTfa2gp6RrllYZ2y1xY6WBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLD34PqY5Ug0ZTKZJNq2or7SSerNT9tYt1xJ5DfvuX8wtiStPc
	7dvEokhwDBsBXZIfS8k2GJprwXztqnzGlcux+kTvL3m/daGXBEE+UE/r
X-Gm-Gg: ATEYQzzbfH8TWdmsObmLfoZR691/n1osVCKZS5uBod9+qay81bvbmQMnkOUY9HuIzPq
	iigQzfImpk1IvY5dV6dHnmqzLTaVnPDS4GzJNMBlUUJHVgn63+a01UGIPL9ci+cL24/ij3o//Av
	eRX2PLjTHr2KcwfgVFpWRdHhwQcRAvba1rb+ukK9DhAbZvAfiA8Pg3MrAQ0af7WA8PsSYqtTMPy
	wGtmVKvOlyuhG1RKVoEDrgtzfk4zQmo1a5QGS2lf0kQkNZn5qUgyYTngq6wnfDwOcSDevnUe7Bd
	dOgXyNK3MkWAW9U++Y17JNkltzi6s45fHnfNWMX0E24cKsw18osIa35+M51gOPtbyW/xLMi23x3
	f9orXea6zHeZyFBKfZ8eR9WZ6/CmE5tBdh26HAB3CiX1YVa85k06utvI2at7L+Is/EDA0cswKLf
	3itUY+StN9TeX+jpomAhxMCT/pLIwUOc4h3lcemjzFgALDBdD6
X-Received: by 2002:a05:6000:144d:b0:439:adc3:f0e7 with SMTP id ffacd0b85a97d-43b4981a37emr12153866f8f.9.1773823317015;
        Wed, 18 Mar 2026 01:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:56 -0700 (PDT)
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
Subject: [PATCH v5 2/9] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Wed, 18 Mar 2026 08:41:37 +0000
Message-ID: <20260318084151.122674-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29731-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 3A9E32B8431
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
v4->v5:
 * No change
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


