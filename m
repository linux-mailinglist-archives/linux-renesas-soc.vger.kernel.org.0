Return-Path: <linux-renesas-soc+bounces-29889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKHOInDxu2nkqQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:52:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D72CB606
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2E60302084C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 12:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420A83D349D;
	Thu, 19 Mar 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyTogDT/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930D3D3CE4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924713; cv=none; b=pLWnIF33jP4LGXTkgCFFd9jjPec+b8JH3b1hmiUZHD9WsQcZ7tNDP7xabOZ3x8W7lWfDMN7xol/JHLLQhK+3sBAJEkvm8u8I++4blDC3RpOIt+XAbD+N5J5AiyWHhe0rpJSDgNOy8ysAqeZq1BLZEp/+xqlG2jPV9ZBsKZXH3BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924713; c=relaxed/simple;
	bh=13nlmgKUi2L3SFuhrtpRQP7Xi9vDHvMQ4eDV9H5RuXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDNDG2VrDX/FmfKhB027a92jXpCX3HgHv2RV1K9GIJ8Xfsa/ulDhK7DpDMR/foNcgjWEi92gXiwkkOuTAtgGPS4Rn5zmds85tLgR++WPu1zbmFSam08N75KraTNF7CuikQR51x/kXvvOC9eoAd2X6BTISrTPPevupoMfoQFDd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyTogDT/; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso8211305e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924708; x=1774529508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IJjVj2MnHDjyrhWL7FSsTysjS0+QIuDubq260+aLGQ=;
        b=GyTogDT/gNQG0a+u5ye2DWAdqaF36U1mM28u+WiABcrMMwQbpZFyZSLluaXzybm1oo
         gWWPl8+8WSaSJVjoAqr/SAh+rQIqSKXPuANHeRz38CG6vIGNrhaD9MmqNIbBWm4q159C
         769kO4DjNMsOxoNptGx/uCILMq/OJcoi+LfxDe4t5cnEOnn647WHjczYmphf02eK7llo
         ZGrrKOWoJXO3ogPN7/siNxrOK/zsZlpUD3NkfO3Yi2gHEmXImOmuTu+mUK+4I/G5/Yjc
         vKJszAWr6u49jTyq0NI5spfVJ9vs/RLmJMnCLQCVO20DO1ItHUD0JuCltPSjKuf3BRVe
         dy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924708; x=1774529508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IJjVj2MnHDjyrhWL7FSsTysjS0+QIuDubq260+aLGQ=;
        b=IEBt4tJgJu2/qJ84Ljrw9cQ3VUDtHPsY0mMJXPo7SfVTKr+N2QtDti4+ah8xtwPLjo
         fc7rzR7iKFJ2+tY9t2snNIkJFecUFmWtGXXjjcJ6Wzqnki8/2DVkKFV2NIhEne816jzu
         EXFkCXCkdPYmhIgGLajOxaSKrzwT83v0MI5rmpDOFu9mzjcrobiy0pg1BGu7iFtXN+pI
         S1wOinSy2ceMBywNekRi0ErIzGswSXhqRywU3VodKGiKs41pV0or1fJqkx35LWEEkV3I
         aDUChThxiMBPOP6DfnFOfZ31KD3A4fzUFc4s30c91qI/tT/3kdTuljfCoA9CIByC7jZl
         N9bw==
X-Forwarded-Encrypted: i=1; AJvYcCWOyAlZrBkGgtRCbouw2c7h9v3vvaWYN6cA3NvBIp0meOpYwCXwJ5LoLABkDh9h9rXtvuY98KryvVnWOBb9FR292g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBFxf2/8dQxrVkCmg94rGqls7pVxjfKKNOtM9n2DVWKmanj6z
	L1ZuSMTtH+OqWQvdf7FeqFxJNzQzxK6DFtwrB206SZy+SdajxsRpQhSp
X-Gm-Gg: ATEYQzxvWXV9CCHuUm8bcTN3aL8CoiFl5uvy+na0TzN7GPTEW8Te0rN9sUu4WlNRQdb
	EmC6RTCpewked/OD00qgRmrfHraYLSKUi4EpR2E1iTY39KDiqPaQWZ6hRNfqH60BQmeyQR1prWx
	sy8GljoEMwVndJ7eCY3BqmffA8D75NBDiWS+KJ6077tyRKirOJH9Se5ZBmillYvrTGNDLL1YRDk
	zPadKdH5Lbo1yr3t6ZKOJ7g8oi9hhvdzLywdHj4neKLS3j8OVmCpiaCRTNNVkm0yResV3waec4u
	AILrZpxYSR1PdF7uQ1e93JSoaybuPyday9qDeX9peOduGb6UINb0u8TypW1CG5RXSYZ+F62/IVC
	Ms5wUC9DEDWSA1Ufu5ITkPwiFkZfl5N/R/plPwQywVMh7+iNGy9xjDagqoWD64eKlMyCdSHt9/I
	sm7PeLq9h4P4MAXQMkF9gamUOwcYAGVU8=
X-Received: by 2002:a05:600c:64c5:b0:486:fcdf:c065 with SMTP id 5b1f17b1804b1-486fcdfc16dmr16482005e9.27.1773924707968;
        Thu, 19 Mar 2026 05:51:47 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:47 -0700 (PDT)
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
Subject: [PATCH v6 02/10] clk: renesas: rzg2l-cpg: Add support for critical resets
Date: Thu, 19 Mar 2026 12:51:26 +0000
Message-ID: <20260319125143.230377-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29889-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.696];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 110D72CB606
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Moved loop variable declaration inside for loops in
   __rzg2l_cpg_assert() and rzg2l_cpg_deassert_crit_resets()
 * Collected tag
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/rzg2l-cpg.c | 30 ++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |  7 +++++++
 2 files changed, 37 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..f9e4af7f49d0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1765,6 +1765,13 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
 		assert ? "assert" : "deassert", id, CLK_RST_R(reg));
 
+	if (assert) {
+		for (unsigned int i = 0; i < priv->info->num_crit_resets; i++) {
+			if (id == priv->info->crit_resets[i])
+				return 0;
+		}
+	}
+
 	if (!assert)
 		value |= mask;
 	writel(value, priv->base + CLK_RST_R(reg));
@@ -1802,6 +1809,20 @@ static int rzg2l_cpg_deassert(struct reset_controller_dev *rcdev,
 	return __rzg2l_cpg_assert(rcdev, id, false);
 }
 
+static int rzg2l_cpg_deassert_crit_resets(struct reset_controller_dev *rcdev,
+					  const struct rzg2l_cpg_info *info)
+{
+	int ret;
+
+	for (unsigned int i = 0; i < info->num_crit_resets; i++) {
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
@@ -2051,6 +2072,10 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
+	error = rzg2l_cpg_deassert_crit_resets(&priv->rcdev, info);
+	if (error)
+		return error;
+
 	debugfs_create_file("mstop", 0444, NULL, priv, &rzg2l_mod_clock_mstop_fops);
 	return 0;
 }
@@ -2058,6 +2083,11 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
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


