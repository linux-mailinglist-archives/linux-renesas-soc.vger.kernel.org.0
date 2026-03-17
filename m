Return-Path: <linux-renesas-soc+bounces-29645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sO15BkWvuWkkMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:45:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0472B1A4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16439306F0DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F34346771;
	Tue, 17 Mar 2026 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSL4k57X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C577344DAE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776691; cv=none; b=RYkKruX3UmJb9xtpHySDSjI7S2zomnqvUPCjkhylRCkJzGtSaQVsgUudHPDWsa5K0HG+LVaO6xjVX8vQoF0yO/utZmkJrV66JfWOJb1a7sd8GJzdPerrDCdUGoheIE5RIzHWn3c1Obr6bWYvhAfwsxbflowKw01BX88+vtgeC/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776691; c=relaxed/simple;
	bh=iUjasimP5+ky9qKqqpISytS+Xv3jTe4n2zAFs2FsfCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3pBXgS06HMqYG9U0FrYeM02TUBqLeJQconahWcUrjtneptOlK0csB+pa9zVGQ1YG5GVFxQZb83ObbZY1zWrMydCjJRT9gt7I6beBoOsmM4NtyyLG4Tx2kgzqGKgBtaIuOBmpZS/AIJ5m9ejimTOJ0nmoHDzsMkw3XisTf+6Op0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSL4k57X; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so6010084f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776689; x=1774381489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=hSL4k57X30xYn5Bx8cEntlolE4PY72JXdZm3sAyMmn1XK8YG0BzHPTjoyJvrmS6ght
         dHN0bn4uth9T9CYpTq8DabOSE0BLUmVwvhpaosTOg0bhSeNcajyxp6g2dlvxkTVKXio3
         DFDApIUX1NfaqvhC7dd7yd6y/tt7/Zcd0RGSxfQ8o4ZN7T3QoYbHdKt8nqZ7igr56ond
         zGeZas8DGHXcyzt+WJ/ogEVa11uwoHlF57DSaVBKu6qVt46hNhx+QrHf62mkTEt7Hn2C
         4d+0xBj3hRuhzNY7NYnywR1Md4l+KRd+V62DsLHSCOoMNqjBAEDzWjsCstL3oV2gh4G1
         7sgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776689; x=1774381489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3fwT/mI+98cVYuLBwkfIUddmcoX9bFrR6d/WpZ9rik=;
        b=ozoi/fxlAa+14CoUBHw4i40bbrMqIQPsvGrPjmJNQzrZbYYcdbPOEXWPAfpcQpYDr2
         I9fzLRxejgJGuBHN8/WLVn+8jo0ynRUVAD3qe5HZNws0Zl50MIj+bCmHXT2EJ/1aNiDY
         Dw5q4iW/ldGlQ51tZntEu8kvWSN/o/mRGHIZNyr+HQR8jHZSRq2oBK3tPk5wGr0Ou2WI
         vqH2OPkwGqxb9IHoZHzB6jN2p84R2JN9ekXBLegxyvYDRohC9bFUnH7oJdJnHXV/czra
         pCe/nCP1S0FZMAgWwmAmjuaCEifTiId27ctou7+9prCdZNvUm+HcmASh9C1ZGWBW09wU
         WqOw==
X-Forwarded-Encrypted: i=1; AJvYcCUlQ2CTZuXhBY3O3OAxj0/d9ZAU/USjWj/xdBo5caQLrOUPkeLH06E2Jl97kjlsvCLZJSyRVJVxoDc9o5KMjhSJUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm8CuOfpLYJt+GT4F9OxaItyo3FPehi04Nk85i4thjcMyQOeVX
	ZkoEFmcGW4Vxo2tHkCfry6Tu336VJ0F7eTqPYc/DwgXog+Z4F+lhJAH1
X-Gm-Gg: ATEYQzy5R1Dxx9Gdj+ek56G0uMMMOfsp87ICabIXWGU0KeSnDK65lscNQfpiJs0/AVP
	SwvMLX+tnVYR8RoL4gRWDMotec47TzXW+qu/LBsxTH9bqOW6ZTzkboq5IuYHahmYoEVRRhk3umw
	U0speWiHpDD43s0lq9mNFc0n0OSLP4Is6pw6PqYCjZ0mgSNM9f68Wg+eYKvVDVXj7UA2kZwMsAi
	/r8nQTVCWj/ya9sJEa99vMQmPrzG9ASYFSEQzbPIJrVP0kvTfxNBeoL22dF+plVlqU4+LPArh7v
	HGryvMCKSGSGqYjxoxfHZTU+GJ+t7MkCV/gn2IzRzWskLXdV/0njM++6SpmW5XFuy4I95hZ8RU9
	8GhLQ1EuCMoHwpvbSJBWD0249Gqb9YqY4bkVM1tHS0vwl9sYAuton3STxVUXDcfqK1c70SWkyXz
	n1Jid7Fmql1MkOeTVIdg339aaquLLEjIIucOAaXO+QvV3mm7D0
X-Received: by 2002:a5d:5d0b:0:b0:439:df60:f87a with SMTP id ffacd0b85a97d-43b527c7b4amr846878f8f.46.1773776688697;
        Tue, 17 Mar 2026 12:44:48 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:47 -0700 (PDT)
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
Date: Tue, 17 Mar 2026 19:44:29 +0000
Message-ID: <20260317194442.468147-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29645-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 9F0472B1A4D
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


