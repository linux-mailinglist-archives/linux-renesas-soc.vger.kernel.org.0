Return-Path: <linux-renesas-soc+bounces-28956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIXYE97ZqmnmXgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:42:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E20CA221F87
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 14:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C46183014633
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 13:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59940340A6F;
	Fri,  6 Mar 2026 13:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC9Oq7/h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627FC3126C0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804557; cv=none; b=lzc53PX4q3d11RgldReLKZt2PJBKOhrkQSGf6PVaMZKnY5Hl3jaf1hUPMcPkGeKX0JzQVGh++c/AHS3p9blhduiQ8Ru8XCbfJGxWK0l0GP27Ug7Tfn4by95uoJVkogH9MKCHfZGDWjxLOf5H1b7hnIR3DO37vi8dlCR7iUV7A60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804557; c=relaxed/simple;
	bh=nzB4vn1IjWBHrbgZS/e94Dund4pW6w6VdfFOAfcUVCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ia3jKmNXgHowEEg0kDnkfal4T9NCTR19OScWFTxiScitXC29wxUHAjI2EjgF/WVdcwkqZrUYgD6YQ0reyhiGSDzsCbqlYeBdaz1rDNY2u/F9dws5deyecxVrYomDlLOf7QjnCeTsFSnEssrXK+3jy9i1M44JOKzXZ9ec7k6bsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC9Oq7/h; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b94a19fdso5273021f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 05:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804554; x=1773409354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6IrVxXy7CXsl37mE9WFjkK5uiaupuO7eK2CML6ou7w=;
        b=YC9Oq7/hSZsqpVQhhEJcMFvm2hsDb4UFGUcs1Sc5g3V+aK4VkC4bVkV2FISeLXr2Q+
         PN73/ROnpud4snalhBychcaQkjQrX4Ew9jlEDHY/OMH7puONU9YpDqslWSCe6hmbK8fh
         6uNkdWO2Kak/lMqA/cMwTzdPuJSmwrzJHdb9AkgnfAbVZ4RKA5vk30HQQN0v8ViGnwfs
         5rNl4d38UtlKqOun5HqF0Hjp+Jr5WDsmAH7OjCbIzOuzru16dnZcWakUS65bkmwe/qDd
         VFAe6Zb7mb75WItvqhvj3Q9bGQFxiQemG3XjGCRp5y1sfO222xXNZIsGwzmz9+278Irz
         7Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804554; x=1773409354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6IrVxXy7CXsl37mE9WFjkK5uiaupuO7eK2CML6ou7w=;
        b=slgsW1QWA7rmutYTJUR14f9G4iquPX82bepgW5eFXH8ms15nNvwwIJl3bFN1jquSUv
         el92+UXW98XVhLP9wGfQ3OEvQaM+qhqoQisE5RGZq+UUR3OaGAXZMaKyZyc9vWsqQooL
         FvxIjYEZ5BWW2gVLPQgY6JnELh2NeQbJftJjr/wCmxuRYYEic3lUwdH0DZa60gwuREQs
         a2MoUbqkvgOhHu9iQoQ0NBCP//ZvDxRk/Lv0+cRGny/Sc2q87rjpxq8jtlWZOkMcR2+K
         /fD6HfK852adE1mNQjXUA9A0fY6DW+NfEuHpORHe0HXznuB+xIbXUbawhuxG/Qunupy1
         7ETw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1bGBkGMgubSxxP8IpS85g/autUubRczmBggh+XcgjNRu4PflfZ95+brGoljuntq6cBZPY5oGisR9xJDQNC2fHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqFM1hogJoI2HuY/xIrZ/CsSoAntOg4o+mDLrphrp+3vRgF1uU
	XxdX94FcRiRVi8kZYSDwZ+Na9oA593UdpfPT12tpG7cCjh09IJATXLfK
X-Gm-Gg: ATEYQzxKDWB19GDZyFI3gwVp6aZefuE2mJH/a2gXUua0/wF1WezFXiIx9qZTEs5Lk6f
	UuX2fXB6awiQIcM7e7iax+wSbt95OCWiV+rhr9Whe0WDy2jlEM2ez1/7eh1t2m6QSRuIGIo4Cv/
	UkMeuHx+g1+oYA+YpTHwOSblKdVt7geOplT0/SWjK06T6VIfJHGq/pcl9neoQ6FHdjtIBUoqTwZ
	g+ZnuOFgUIg8IZbiBTxRkjXJvJVnr2s8fI8feNB6LWyeTiSEqaIx90oM129ewDa75m8KYvn9nMD
	3UTQgBwo1YxRp/cmwByCwwV4asFGz6euIMtiEIlAgD+sR+Ajf4qAY7rUNZ5BCTJvW2TcASTweyu
	LpUinHCpQxD67zcKKCFyxl7IECosGi55zk6fOpo8L7jGQYr6qYhZrfB2MvDkMpndAorfVMan83i
	EEDA1scsPI8D1oFNBnSH7g668lJV45Xe9WZm9YrO29tmtnbHI=
X-Received: by 2002:a05:6000:430d:b0:439:b82d:3b97 with SMTP id ffacd0b85a97d-439da662378mr3547221f8f.17.1772804553685;
        Fri, 06 Mar 2026 05:42:33 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d0f3:534:36a3:523a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm4223790f8f.17.2026.03.06.05.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:42:33 -0800 (PST)
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
Subject: [PATCH 2/3] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Fri,  6 Mar 2026 13:42:24 +0000
Message-ID: <20260306134228.871815-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E20CA221F87
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-28956-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC family requires DMA resets to be deasserted for routing
some peripheral interrupts to the CPU. Asserting these resets after boot
would silently break interrupt delivery with no driver to restore them.

Mark the DMA resets as critical by adding them to the crit_resets table
in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
r9a08g045, preventing __rzg2l_cpg_assert() from driving them active and
ensuring they are deasserted on probe and resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


