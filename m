Return-Path: <linux-renesas-soc+bounces-29996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B+ZG3wmvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDF2D90D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD4A530498C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7091399000;
	Fri, 20 Mar 2026 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUmX/j1O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3C5392C4C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003799; cv=none; b=pbICQIqgO0acP5IZ1OnsnuzACqXQXWtWqk1Mh4v3ppjS0gbP934u09Nhyf0M/DHl3lTf3BdNwYYea/iEzO1eAgF6pGP8TGUohL7TzVXB3dNhdUFomaULlU7WHlR+KehUCYHFb69NZXsNyEM0eKyv79aZPBBD/3J2n6rizEQ1XCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003799; c=relaxed/simple;
	bh=ajpMcqKfNP9HAt82cwjHe9/52zY3oHxoR2gC6/k0qOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtbbjOZ/iaFhUb789lWYCg3uaxknvxb92eCjWJj6y4ZC+KEzO/YxPBxbvT3vBUxfGDDwvWaAW9FdtDocqhbSIEVbAEW1YqUmyKxkUgrBKcNLuskRcEeVrQEEWZlqDGbynTJ8PdXiycHKYm2XJbUBxpSb10w1QCTbgZXET6Ddosg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUmX/j1O; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b467dcf0bso1903583f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003794; x=1774608594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaD0/MOliBcQM28TfUPYVE0y6iDdS5KDXDCppjI2wrU=;
        b=dUmX/j1OlGI7bXannrHmAawXtUGVRMYfUVEkcMe+7yHIRydkSe/8uEyehZm3+LqFlc
         DeDpRJl4JmZ2FeO+5uwn3PfFaT8rYBgYtD90CPG3x36I11vJ8ZHhEODUADLOhJDsOYeA
         f83CpPPNmiLfcQw3UWpy8UWdOlSBU31HQWGqKpDLFolAXUuNcJ9h0lFl6Gj9VW24XhGm
         TwXnJtueRirPSuUtw5j+U/o7lnk0ap3GvTOBnBpSFaNNCl/CEH/8BFlUbAOZzvKLfH0K
         dD20nUDT+s5SFJEe5E9h8H6xXkoaFqIe3E3BYP4LSX5dVhntpDPBEe6oG8Yg2o0W73Wn
         BHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003794; x=1774608594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eaD0/MOliBcQM28TfUPYVE0y6iDdS5KDXDCppjI2wrU=;
        b=ictM1jRCBh/68r2Jg8hue7j44fhMC+Q5GnHiH1PwtCxmiRxa5U8f4uoP8ELL0l9/pW
         u6OHsO9BG5Z5sVgNGt1+jiz94fzYVJJptAZw7/D6LnaMP7ASh6i835dQUEsmdTwxuahM
         ddWD59sszPePhaLct+QeP2flqABej2LGW9xHstuHl8uIXoLcEU/IeQoJhwajlSGGMAMC
         EhBH6Hca+l1ZnkGHlMgQN8MQ/3BSTxcI7NL7wfxb2UzsT2VD9Cr5JpXS5c5MWhmLFcD9
         H8KCncY40dY5RfvKi5me+M8LVRnL8KJ2jN2dNCbbJiqc3CqVaAhRRtb3IzriSXuT3Bq8
         822g==
X-Forwarded-Encrypted: i=1; AJvYcCWJROrK2P+P5H/N1kaENidbv/Ddk619jGHx4LGmyOD9/36P0Dpjxt1qF4BOpEQYq+tmXMkNW/Joc1PzR7k7e084VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlF7Ka8SgTpWFmrQvMwf3ptqw5Nyrw11x57XGldH1o4LF8rwH0
	rCWTW2m9Rx6nDjMMiq3zik/G/eSWWR3TtW9YAJM2gOirLqAbpRUUw3aK
X-Gm-Gg: ATEYQzwhekKXAxVALZc+qPRUy0lUcTDxuQEoxGpiV/wlXfIqUZhsbw2yND27RmdrTjH
	8IJRlhJcQNWcqoYmlWWLSgK71PuZRc5V8YoG8FOTZAdYEXstDfHfsBDh+J10uOXBAoYCyRy3J5Q
	NCX7FoegHXkhNncyWO7yJpVnXTYOfjrwykVT2yOrdCOWBrVp/VA+rt8Cd/9fmOo/2OG857RJzEV
	lJDLsFX0pISpXiC4YZLRbWIXKnUcMZ4vqY9tTRSjV1QyK9qvmibqD27c79H+/M2UM+Ii5QMsVwb
	dg5Q/O6j+VWR4h+uCjiZHC+8J78nHV2pfZ4hBcZGg5DzJ/9ggR6W08tIy89zb1vyujoLi9lMAqe
	+J1ky5o6PvzYu5DOCgbvX3Wvt8egQOW6jLxhVCNGAn2K4qkbgOADMJxO2rp6kv+mbZFz6nc2ZRI
	xilYfQ35NzL2XkxrdgBBlf8Q8Cd/MG0Sw=
X-Received: by 2002:a05:6000:4021:b0:43b:566e:fad2 with SMTP id ffacd0b85a97d-43b64242eb2mr5322361f8f.9.1774003793977;
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:53 -0700 (PDT)
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
Subject: [PATCH v7 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Fri, 20 Mar 2026 10:49:37 +0000
Message-ID: <20260320104950.42220-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29996-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.690];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15EDF2D90D7
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Updated r9a07g043_cpg_info by inserting a blank line before
  .has_clk_mon_regs
 * Replaced r9a07g044_critical_resets->r9a07g044_crit_resets and
   r9a08g045_critical_resets->r9a08g045_crit_resets for consistency
v5->v6:
 * Replaced r9a07g043_critical_resets->r9a07g043_crit_resets for
   consistency
 * Collected tag
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g043-cpg.c |  9 +++++++++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 +++++++++
 3 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 33e9a1223c72..70944ef8c5b8 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_crit_resets[] = {
+	R9A07G043_DMAC_ARESETN,
+	R9A07G043_DMAC_RST_ASYNC,
+};
+
 #ifdef CONFIG_ARM64
 static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
@@ -420,5 +425,9 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Critical Resets */
+	.crit_resets = r9a07g043_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0dd264877b9a..2d3487203bf5 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g044_crit_resets[] = {
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
+	.crit_resets = r9a07g044_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -548,6 +557,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 79e7b19c7882..1232fec913eb 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -361,6 +361,11 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_crit_resets[] = {
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
+	.crit_resets = r9a08g045_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g045_crit_resets),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.43.0


