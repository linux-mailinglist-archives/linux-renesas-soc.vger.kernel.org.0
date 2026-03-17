Return-Path: <linux-renesas-soc+bounces-29646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLMJIlevuWkkMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:45:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 491482B1A83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D35483044346
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45467347BC7;
	Tue, 17 Mar 2026 19:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr+OuwYG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E97345721
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776693; cv=none; b=PhXPEo4p4+oV5yWZpEsipykYfvawDTSSby4s0vBCx1/4lUxp+xjlx8sVjPQhIh/D+okbpvB4V0m05L78yIUd1Z24lJA8cWCTtUBQdW49g96FwewREf376mkDuIWn9dMOgax/frSWPZQ1Ajy86azvRfOpryftpZsAT1B3OOlSBZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776693; c=relaxed/simple;
	bh=rvcl8x70hBsjnab9fTtTkQT29M7rkPtwI3LOdVMcKIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udxl4UE5Tr63goDr4DOKLsJA5kEans/HTYQMygDNwFJL3bjiK+Fx9m29EdPfGHcIp602tLyvF/t9LD3l11da5+m06LHFWKulY/cJ+gYqX3rQWDOT+jPzJxsfNUlCh+2ixqxlI7R3gwhkrNKy1uclIsFnGgNL3yJHlEUjQrlP2bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr+OuwYG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b611274bso3831100f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776690; x=1774381490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeK06cR2Nyk++6NOuplshRyefztocvFnw4c5j63Tkko=;
        b=cr+OuwYGYXSq7s7cpYwDDwPfA0pvA5l4opZAy7JKds1qTc4oMwzcBDK2/8xUrbsodl
         gCt58gODJN/4eg7snPWgCr7StU/UwgbmGHrPqEZ4JsTcIQBwDxyHFrZ0weZJ04xh7Apv
         N9rL6IY9Rk9KiawD0glwgc8xooHlV0JWhEd5Uy6mgSoiPmWgQN0u4Y/cckTf7Jful7NN
         bIRWFs3VdmM8AV0VC1JDvujj+O551IvlQBpMVrfIBTsnZMImCK6cD2VuIsB5eqE9+JYp
         P4dSOBL8/c64+puBCM3DMsTzeXoQv7Fib5hECqNx0NR/4eZVrITJ/msyhcrdmVSuefMd
         cEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776690; x=1774381490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jeK06cR2Nyk++6NOuplshRyefztocvFnw4c5j63Tkko=;
        b=cOhfawlqeHjTt7Rc3sHt9XgH9vSbU5sxfLJrEjwaIgaXFupUeCxvLi/8uBF1ozutPH
         UuolGmi2sGhL3F9ekpoIcYtgOyuTB8J+znjZd776LQ7qq+YKlkZpKmF4I6+d0GT7ZPkX
         pDpRMkbD8ALrIrr9eGwHnNgY9m3oje+tLpxStf7FE0zEoeJJd7mhr2Jpi7hwVtEQOSu5
         EQi4KGrhXU7oYMspSZ9qM0jbwsSYOV178TpSuFNJIW1oyw456wNJdpxTjXsNdBPtdUO1
         v6SlDpY1U9Izh7I/GkRWBR2Zn/4ElQYTuktxuHPJiSLKMDKxLu/244hJ6BJcER8wP0mH
         CTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHdUL45V+gNXFFqAdG/MSwlIyT3pJDwvOTGfUxaGayde6NZi8EZFigYmr3c0rKVxpn1X/HR12BVdjPU19Nvc3s8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1OWm4WuNHa27Q6zXCDDBimFoqO1uL1aqPAJMLBexcXe5Md2k3
	d7tWJipetEF3xNkRNkv29051XknqA37yxNglzqNkdNopzCw3JpSWDqiu
X-Gm-Gg: ATEYQzw2OIUms+4Z0vA97GDak9PKTLOS0sdVr9uUT6Cx3VQaNSVtRhJa1k9dd2DtDKh
	IiWK1lprWH3PAj1FnxfZkOafwfoc5DQi9C0Zcyt82bQRJyGEimTy5605pJSv3myMrc//6cGCbSM
	3h25/Z3kxwtsUi0QJk1Iti2PELQMLNRDEyPYurJZ2k1BOsy7RWng52kk95e4wfK8d6zemjeZyMl
	7l66QiCLob1svgDdpWteluMFnKq5xVnhwj+My7JtRIGOrw6vMpkvDhbdXY6MLZqD3rDUB/hLbOz
	KXM1Hv7r/Q5n7bFrnwDuMDp7VTzZhKen25Hkf5mLLVujaWxc4ID/lxKcmMKdqjYZVpw21OSkSOL
	d/VWEDuQdeLqtsh3SugzJOr0PcZJUGgvROtuzF866QO89qI2g1e1cltrc+2shbPlwaeWczHlWek
	VMcwrusVSnKCLiyqltbHo2f3JD+aH1GIy02TGwnfcLllzwAXYbd74/6pqFXa4=
X-Received: by 2002:a05:6000:420a:b0:43b:514a:ec78 with SMTP id ffacd0b85a97d-43b5279c925mr926507f8f.1.1773776689847;
        Tue, 17 Mar 2026 12:44:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:49 -0700 (PDT)
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
Subject: [PATCH v4 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Tue, 17 Mar 2026 19:44:30 +0000
Message-ID: <20260317194442.468147-4-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29646-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 491482B1A83
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


