Return-Path: <linux-renesas-soc+bounces-33378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOooFeYMG2q/+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B381A60E06A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F135A30C9372
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A45346784;
	Sat, 30 May 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCLSwizZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCF5340A6F
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157324; cv=none; b=G5ke6Fih8SNv7jlLNF3TxDFkhltFCrZdXIhbtQV8/es6f5BBBCX8Cfsh1a5PHmmPOhlechMlht7UPai3pxrX5+HlVRpmZu+4SNXhR71nOYWkcirx+KGWUnUa5KC8ikCprFEjsJ5Lm8BSZ1/gCDYmhfjiUwhfjdzuCVrD1KfgK9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157324; c=relaxed/simple;
	bh=+Gj+E54kIeR6azwXCnzOrh/r+OqYHYE3BfZBH52pezM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6yhI7zyR8QuUEg53L7OL6ZSbgnM31E1TVOpdXO1kprj/Edtl7JS7jir5OVLD3nI8wlM/ivsZoXmNrl34eJBoy2UXD26UOXezI1m/pOHrWdTWwAdAkneH0/waN3xPmD0cSQD5TbgSA5nXH+Gj8c1Y/XIsCOiyUz+iYeA9OCVtAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCLSwizZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4905e190c71so77590085e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157320; x=1780762120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iODUbMAhX2RQGeC4auc1CdHGKLWe9qHj630NG6jprBo=;
        b=GCLSwizZFbuotUvxmKTCDnCgeaygpNovIc8BISX9CSLdOcHhbAGcXuIvRxwaOZ84t2
         CLTW6IS21Y83arB2DYGkAWRmuipCqEqcGq069XDxpLOiYyHDwS0Qqdm2AUIceElyMnmA
         U7/MVgpLNHo29aVFtqpc2aYYRETmP8fX7sbQsp4ZgPyea89gLW7O3C9s/HN0yhceGX77
         6ycKLAPSIbDln8cvswdjEsxTMfoSdJ1fVViFKkhH0ehtoMt8SggCiFNUh49ZaGwEw1MP
         kctOMvWgOP+7YdW5bsuReu2QxBUOi1czCKjGKR/4JqQWgig0uFYixhx/wkN4hW0I/D8T
         RdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157321; x=1780762121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iODUbMAhX2RQGeC4auc1CdHGKLWe9qHj630NG6jprBo=;
        b=fPoCaEDEFKllw+KDqGTVzCxbEXeGr+i3Mx7x7xg0VrF/qNNp4MN1QDDoGxF2lvzlx/
         JLQBpHP5MewYih6S1mjeXa+yg83nAh8CUVmmAXDSYSKN1q0Ke3GATlegcg2wVoNTL7cv
         45fya8GiHKRz/+/6Gg6BAkHdDhXZyQy75KHwN9XVrZWsHedUZOPbkcMqfAgIG8M1DGcX
         ggmmk7hgP/8Zdzx7EudG5ASFQQnsAawnjSfmGPQzftvACwWpNAtpp8CQxtT7bF31xKhv
         WsAxzYrSyH7hTagsueF6FF5WLp0IXQwk0lcBFk2dj/aQVPLmp+csL2kwv2aDkUKlpA/u
         EJwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8W8qnacLdYstNLxhDt/gQVzW8hsrCqpx252L+dxsLDx7K+nccDnKOcaMsvWWn1sYXPtYlfpEP7In7OWwO3O7vLuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT62v1nhEVbpCZN2AmWIdwsHX22f96UUJXuclNA/p58xlkMzgH
	QWlaLPrG7+URv5z1jsLiI9MDa1Loqitq/d+t/Xb1zf+qIeWTxAsATQ8I
X-Gm-Gg: Acq92OEQ+yiZU4HG1td+EjQAH4ZxKK+dogSEY6T7gO4Bg11csGsc53r0mAPTUtGffah
	dPBrdWz2Ptc6Jgh8A4pktsDGMZNpd7u8tlgijNGZujJFASFsKnnZ6n7xww7u4Jd3LcyTXatjqud
	HBMbO9bNlZ0p5EQNrNLhP3fflh801/wcLLR86zITf9TzwVwtVADJEy8cpyksUvAh9CJe7xNqeRp
	IZ/7o4gwuAjpV0r5fJpiZHwbdcdlXEfSURAmoYywpTGYLVf+BpwSAdu2h4NMP5iH9Kv3zpC0Dsw
	Vy7IxxRlQh80RHOO1eaoYW1DvQgG/mpgA43YO4HoXUXAmW8TW+IiEtn2bmkaPPSnFEnjq2cKhz6
	Ueg5MhdkFzmTf3qzYKJdQVacDvUiHdLtGXpwJjCww5aVnsN4FaqMf0mobPwVkFW1B8rcvEQyPiV
	+LFC82opqA2y+7QHQp2U/7eb4gJV324pAhV6/M4/Unqf19Rtx144BqMAx48NI=
X-Received: by 2002:a05:600c:c108:b0:489:201c:dc46 with SMTP id 5b1f17b1804b1-490a290ec82mr52352825e9.12.1780157320472;
        Sat, 30 May 2026 09:08:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 13/17] mmc: renesas_sdhi: Add RZ/G3L HS400 support
Date: Sat, 30 May 2026 17:08:07 +0100
Message-ID: <20260530160823.130907-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33378-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: B381A60E06A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add HS400 support for RZ/G3L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 17 +++++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 10f634349da9..92b66116f044 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -47,6 +47,7 @@ struct renesas_sdhi_hw_info {
 	/* hardware features */
 	unsigned tuning_delay:1;	/* Has tuning delay */
 	unsigned internal_divider:1;	/* Has internal divider */
+	unsigned scc_hs400_mode2:1;	/* Has scc hs400 mode2 */
 };
 
 struct renesas_sdhi_of_data_with_info {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 974acdf110d3..282107d06114 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -186,8 +186,12 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 
 	clk_set_rate(ref_clk, best_freq);
 
-	if (priv->clkh)
+	if (priv->clkh) {
+		if (priv->info->internal_divider && host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
+			clkh_shift = 1;
+
 		clk_set_rate(priv->clk, (best_freq >> clkh_shift) * priv->divider);
+	}
 
 	return clk_get_rate(priv->clk);
 }
@@ -229,7 +233,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (clock != CLK_CTL_DIV_MASK && clock != 0)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
@@ -275,6 +279,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018 /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C /* R-Car */
+#define RZG3L_SDHI_SCC_HS400MODE2	0x020
 #define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
@@ -308,6 +313,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_TMPPORT_DISABLE_WP_CODE	0xa5000000
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
+#define RZG3L_SDHI_SCC_HS400MODE2_HS400EN2		BIT(0)
 
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
@@ -437,6 +443,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (priv->info->scc_hs400_mode2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
 		       sd_scc_read32(host, priv,
@@ -578,6 +588,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
+	if (priv->info->scc_hs400_mode2)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
+
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
 		renesas_sdhi_adjust_hs400_mode_disable(host);
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index fb8a70d28eed..83d348fb5eeb 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -276,6 +276,7 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg3l = {
 	.max_divider = 2048,
 	.tuning_delay = 1,
 	.internal_divider = 1,
+	.scc_hs400_mode2 = 1,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
-- 
2.43.0


