Return-Path: <linux-renesas-soc+bounces-29732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UN3EK4llumklWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29732-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:42:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 347B62B8459
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7368E3020EB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E186D38F93A;
	Wed, 18 Mar 2026 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGDNOVRo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2E389447
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823325; cv=none; b=NWBXAlrocdXnIPiJO+yWk9LvnozuCo3b12lfjw4te1sxPeln3+W7spvowZQ+QPqai6KWC15VEq3enh0aIa3GBJqlaC+/EOs4mbUQbfprM/FfxrLcBwJI+smEr3uoABU+TkZ6SsIRla053/y/ZyjpOlhBhxBvRdNcuIG+Z34H5tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823325; c=relaxed/simple;
	bh=pV1aqnTgRdbkKR3+cxXrxVzX6kD09lif4yanDAiAM3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdRMI9a01+sGvAk03dq7kncJzXu/a1T1Bg4mzjx0Al1U9f+mfLnYojdJyZYwoNcwlqiw3ED0EyrCF9lcbwHc0Glke1BAubudeBNX7UZLZ8cYT6i8gQJJl5U7Tz2Jyt0ppDZo0Hj5wHM1/Jm5++qeIrjTJ8FXsYx/0/dPN1LlKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGDNOVRo; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439d8df7620so4846131f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823318; x=1774428118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDGj1POSySNjxI79/aFiLpzdpr0qxiPd0OJ5v0IIHTc=;
        b=AGDNOVRo8So0iTkhw/YxSuqpbyVd7dd/RnJIH8hXqCmWXneIVqnK9pUCz1MZrUfRSE
         aSSpwPR9a0Wzv3zMxiBkKdGEn0rOPNDkaOvnJTSA0DPRr6kUyEvrGWiMl8ex7Xt545cF
         OBS1S8adToIwcpF1e+YTGOveLkhVY9xCVmA2e2VlCaVsPClJ0mzhSiGWM2s6bWQHmym3
         9JWq7ApxxN5XhveIYxpWyMYLkJStCvINEN5yi5zkcrLPDOFFHpO9IO8HLplyiTbfQfEr
         YNAGN695FcFzNAiTZ8mExKYGXtG+tb+8CLWqaHDk99wk7y6vXDkNQOWnGPotHaref5Iu
         Aheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823318; x=1774428118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDGj1POSySNjxI79/aFiLpzdpr0qxiPd0OJ5v0IIHTc=;
        b=pLrEP5BJR3IMT9LbPLKtjdM6+21iOGjviM9wzLY5OowRJRRaFXgsEDzEMqIOwB3zX8
         BqadEdwQ69e0xpgbvNakBLYG3sVByHMMS+sn9sHCaNnsCe2Nj3UPK05hBhN/ZPdW45ps
         0hslDbHjuUw5y9Et7ITgxPCeFmn8mn/XBk3z62EdtbpQX//F2NCUzlsj8Ghm2XVmHuL9
         pHARV5c9AIvaaOqw5rocl38/P09Z2JpHWG8IG2bu4mDheAkHHbPD3wplshdYISDlE4l6
         08CKoNCVk6NB29dT2idgIl6UoUXNYByY8BVsUufpKCJ7fn+g/0td6A271cYtR1Pp2tNA
         zAUg==
X-Forwarded-Encrypted: i=1; AJvYcCVv0lMB+lJAHV/5qQTZL3baT6/F/4yuFxVaigrS6P079yJ7lRjad/MkG/00ZBr0qcOpCK2jmsf6Q1JVe4HACdewFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUl6NAW9HTsYY/+H2L61L/y8hxceR0ReXnZGauBF75Ba0YYpt2
	WlUnMI1c+8UQNyCezUUDaZ3GN/Cqhm0N/c83BvNBsKha4IMtdJmxz5dh
X-Gm-Gg: ATEYQzxp8YADQ9h5a0/HOUJA166XKUhJWB/DXYCv5cct2FHfuj1FZ8jCNNphGeUV3qq
	bXQOGPEz+ajaqDowUB30PiCAmJHcVIrbHCXtL0oOapj7RGkn7u4eVxDJ8kPk/dCAKXg+03VfqFw
	f9Crqoh1R0k1dA3F5lSlVJ8ACxq8xtN5G0AmklOCQ7qMAnaIZmVdU1/VQsFLVrYxpQ8PN9mJv8k
	YjpK/EF+5ZymGMFK7Z3p/QLh4AxbgFDYejXjD2N/e/L6cYzmXSLbrdunBuot/jF2J5aH4nnOTi+
	ay3KHpxbWc5pvDjEPknVR+HOPweJSkzrUNv7BIgZRVtv26tISYlnArcOP8zD0oKWKfCa+T2Jci+
	+5BljMnuu/1BGDEB8zfopLmMPLIn7Q9PTz4RMGiyR6pP6uvYO4j6TvWV6deLj1EOuRR45loNQAy
	5Md1atg7UF3+hCyc6F6jG2i1sGhyHm2trTZPMqUvdrrfAWLU/a
X-Received: by 2002:a05:6000:184f:b0:439:b636:1fa4 with SMTP id ffacd0b85a97d-43b527c9ea5mr3822720f8f.48.1773823317930;
        Wed, 18 Mar 2026 01:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:57 -0700 (PDT)
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
Subject: [PATCH v5 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Wed, 18 Mar 2026 08:41:38 +0000
Message-ID: <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29732-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 347B62B8459
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC family requires DMA resets to be deasserted for routing
some peripheral interrupts to the CPU. Asserting these resets after boot
would silently break interrupt delivery with no driver to restore them.

Mark the DMA resets as critical by adding them to the crit_resets table
in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
ensuring they are deasserted during probe and resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g043-cpg.c |  8 ++++++++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 33e9a1223c72..01d741ed8dc5 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_critical_resets[] = {
+	R9A07G043_DMAC_ARESETN,
+	R9A07G043_DMAC_RST_ASYNC,
+};
+
 #ifdef CONFIG_ARM64
 static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
@@ -420,5 +425,8 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Critical Resets */
+	.crit_resets = r9a07g043_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_critical_resets),
 	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0dd264877b9a..7f1405cab9c3 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g044_critical_resets[] = {
+	R9A07G044_DMAC_ARESETN,
+	R9A07G044_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a07g044_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G044_CRU_SYSCLK,
 	MOD_CLK_BASE + R9A07G044_CRU_VCLK,
@@ -519,6 +524,10 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -548,6 +557,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 79e7b19c7882..87ee43f9fe18 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -361,6 +361,11 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_critical_resets[] = {
+	R9A08G045_DMAC_ARESETN,
+	R9A08G045_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a08g045_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
 };
@@ -389,5 +394,9 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a08g045_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g045_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.43.0


