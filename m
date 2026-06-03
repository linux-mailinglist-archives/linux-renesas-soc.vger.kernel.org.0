Return-Path: <linux-renesas-soc+bounces-33488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lRM1AOHQH2oyqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:59:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD9634E8F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 08:59:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="JqmY/N3K";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0CB5C305E2AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4993FF1B4;
	Wed,  3 Jun 2026 06:57:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4859F3FC5DF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469875; cv=none; b=i2Gvjzw8nhnEw0ZOwaqFEsjZWtF2TmGu/LMt3nQZSxGIoApYoNUeEDzw7FPHnu8a8VDtQXQeE/iqrECm7qfM60qol0+CkRF+D3W45HA40tnxM1kxBmkQ5WtY3al8ofhx7cPLYeOt/QQ23U9dGnCYzthUmYWPvb9/49G23no3aEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469875; c=relaxed/simple;
	bh=6qJpZhXyYCBf57vMMkgWvPXgE1xKgVP7wRIY8jD34Nk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SG0bPBMnR7fgzvKu5VmTChzIXVSOYUF+SyUSdQQx6IyzSugNdRTy2kP9Cnbc+F4sRnCOMtFnHosb7XIAjnPnMQqC3z2Qzmh4hfNmGyMfYkYFiMtV1kwZFmHjxRh6zS/vCr8B2o9gm3kWqJIyuIArUUlEx74X07hQJQTAdx8roc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqmY/N3K; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eee266c6cso4628636f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469869; x=1781074669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeWYYBg948WaEc/rhznTVtqdM3wH6i2nY9UUNG9eJ2w=;
        b=JqmY/N3KQXI4IP7XO0LiGqfEzOUl4Q7i09f/gduT36Xsxd+dxqxcGfmiPtkmFfB7Yh
         RJejeBBfWgICUhaOf45QtI4iw3A/qerbBT007IwUb8yNMdhW+ZxjgLKzwCm0ZhFjU4G9
         9gD+8LJZWl4Cs8Yibp+zM6oJ7+iyBZqPXkOefUSRsnNEy9VS23DsQtund5/mGnNlNkDB
         Qhvp961hBIG1zcoMGRTZXb5Tva223xc/wZ8dWXACdz+DtddfpmSK2vc9h0ixev0zOW9B
         17Oqt4TuFILrAMVHctIu/clSgOnoG9WhMEwB5HUxX9dF09nf+lwdnHlM29ItDr1w9Mbz
         iK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469869; x=1781074669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WeWYYBg948WaEc/rhznTVtqdM3wH6i2nY9UUNG9eJ2w=;
        b=DuC3vHYMFmcYoze2Xc7oXM9fEa4o3hqihujOT7eWr5ZZ/6gcLC28vbaKvJtqvhM6xs
         W7Q8XYCW2wADG3X2pSsitPpfEnV8M1OTGtY9BAIa7o3oMvleXqxLZQyH1dQF31tF/uyS
         w6aO1JbT2nUPELNJOzFeV8fc8PrHbwZCaAv5AhfRfijTdLGRq10Tkbc7L/fFe34MNJqv
         1najJZbm4FPSLTCILejhjkAOVMgJgvT80th6ZIcoHlRPXuTQmqQNnPyf+zg4M7zwQwAK
         8vWimyHGu0H8RIvBkxIAhD4zaUgnsZkp3Sh1NFwr92Hwl1/OsAK5wf7pEbzEMKFUGTyl
         uwUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cklc+rXTy3lUbCJBZjqm+VcMo/cWyzhWqtv96v+ly/PSONbKMKJ2LyeG0gz0wuPfD2M66/cbtzR/jMMgAKy7tLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj928pRDp5t+IBH/f7uaXqDPaavlJkcDyxPSnOc2HlslsxLPRW
	ywhhtFyLphnwSvH0fFz64LfoSRm41ZuxTlvkLv4gmRzag20+OGoTrRoC
X-Gm-Gg: Acq92OEe6Vw+LWd0mXLF4CH1qbJLU5hn3/89/IfSFVKvVMjFtesDmbfBv9yOXTEOkCJ
	UgteCfejrKG+Ddi1JcXpuToRvQCPtbPJ8fuXB0vqULdUm5+CbXq9tOtYoIEDW/mgXa+NqaSm2LE
	XCy0f9zWosSFQ5hIDJFirlBXB9NLX1wVcdw/VgwKOBfkcLfaqDYRJYNnn5L/LDBFgDMBt0Ue0ZN
	UP3q5q2KymzYyu3ePUVp1/AfF7DYAwESUyzBdXk143HU62BeNMlRELkvJzU9jKYNFaFlel4QbdK
	c5AMaGYXEQSC/FQjzh1QcbOHgF+EiO+7mOWFptLT9sEmzM8Ba/QqQy8I79RnYCeGROBvS2PtRMx
	iKG4fdCCMeZqP9ZF9JNQoclNbNIXlPDj3NqXj+YBLxpv+H5fiqseOxFFtXw39MLRZ8rD6okSgDr
	NNPCED+SpRaMaZuRyAtE6Pe4DaMZJANk2unwOYby+R/+SWgPe5U/KtozmZ2/hOOylAss523w==
X-Received: by 2002:a05:600c:4712:b0:490:ab8b:1bb3 with SMTP id 5b1f17b1804b1-490b5ec4258mr30130165e9.18.1780469869397;
        Tue, 02 Jun 2026 23:57:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:49 -0700 (PDT)
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
Subject: [PATCH v17 14/17] mmc: renesas_sdhi: Add HS400 enhanced strobe support for RZ/G3L
Date: Wed,  3 Jun 2026 07:57:14 +0100
Message-ID: <20260603065731.93243-15-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33488-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92BD9634E8F

From: Biju Das <biju.das.jz@bp.renesas.com>

Add an hs400_es bitfield to renesas_sdhi_hw_info and implement
renesas_sdhi_hs400_enhanced_strobe(), registered as
host->ops.hs400_enhanced_strobe for all SCC-capable controllers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 53 ++++++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  1 +
 3 files changed, 49 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 92b66116f044..1a837d0c9479 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -48,6 +48,7 @@ struct renesas_sdhi_hw_info {
 	unsigned tuning_delay:1;	/* Has tuning delay */
 	unsigned internal_divider:1;	/* Has internal divider */
 	unsigned scc_hs400_mode2:1;	/* Has scc hs400 mode2 */
+	unsigned hs400_es:1;		/* Has hs400 enhanced strobe */
 };
 
 struct renesas_sdhi_of_data_with_info {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 282107d06114..2a70a2e64b9c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -274,7 +274,7 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
 #define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
 #define RZG3L_SDHI_SCC_HWADJ2		0x010
-#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
+#define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014 /* G3L: SDm_SCC_HWADJ3 */
 #define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016 /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018 /* R-Car */
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A /* R-Car */
@@ -298,8 +298,9 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
+#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL		BIT(4)
+#define SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE	BIT(30)
+#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN		BIT(31)
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
 #define SH_MOBILE_SDHI_SCC_TMPPORT4_DLL_ACC_START	BIT(0)
@@ -574,6 +575,8 @@ static void renesas_sdhi_adjust_hs400_mode_disable(struct tmio_mmc_host *host)
 static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 					  struct renesas_sdhi *priv)
 {
+	unsigned long val;
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -583,10 +586,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	val = ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN | SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL);
+	if (priv->info->hs400_es)
+		val &= ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
+
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
-		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
-			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
+		       val & sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (priv->info->scc_hs400_mode2)
 		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2, 0x0);
@@ -783,6 +788,41 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	return ret;
 }
 
+static void renesas_sdhi_hs400_enhanced_strobe(struct mmc_host *mmc,
+					       struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	u32 val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2);
+
+	if (!priv->info->hs400_es)
+		return;
+
+	if (ios->enhanced_strobe) {
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
+			       ~SH_MOBILE_SDHI_SCC_CKSEL_DTSEL &
+			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL));
+
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
+			       ~SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN &
+			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL));
+
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT3, BIT(8) | BIT(9));
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0xFF);
+		sd_ctrl_write16(host, CTL_SDIF_MODE, SDIF_MODE_HS400 |
+				sd_ctrl_read16(host, CTL_SDIF_MODE));
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HS400MODE2,
+			       RZG3L_SDHI_SCC_HS400MODE2_HS400EN2);
+
+		val |= SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
+		       SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
+	} else {
+		val &= ~SH_MOBILE_SDHI_SCC_HS400MODE1_ENHANCED_STROBE;
+	}
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, val);
+}
+
 static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
@@ -1333,6 +1373,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
 		host->ops.hs400_downgrade = renesas_sdhi_disable_scc;
 		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
+		host->ops.hs400_enhanced_strobe = renesas_sdhi_hs400_enhanced_strobe;
 	}
 
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 83d348fb5eeb..a021ebb46070 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -277,6 +277,7 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg3l = {
 	.tuning_delay = 1,
 	.internal_divider = 1,
 	.scc_hs400_mode2 = 1,
+	.hs400_es = 1,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
-- 
2.43.0


