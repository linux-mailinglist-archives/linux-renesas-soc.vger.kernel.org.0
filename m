Return-Path: <linux-renesas-soc+bounces-33481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fM54BAzSH2qmqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:04:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A278A634F7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:04:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PWkCygaV;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33481-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C75A3111D86
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75313FD159;
	Wed,  3 Jun 2026 06:57:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBA7399352
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469868; cv=none; b=BLeiFDArZKtdfT/vXW6WRaQDkpGT/t5yLSges9MAKbQ1GaF4Z9dptzD3d7BbcSAxbizHQFaVXVgzrR5PeDxMGU2YJYVMcTE4Z88GctYkutt8gSifWeup1nULve/LjxEmk1WLtjaZLgcIxQVRK9c3RtWZ8Ex25ANoweKemlBA4Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469868; c=relaxed/simple;
	bh=/XUgWUBY6B1ohl1QhjIW8QVt0puzEknEbTW0T+oOTeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tkahRpzaTfMqH+IaQ5r9CG+e473Tgl6YAzHkcdyrYWn1ysgf1Qv3NveRYL7832M+dMUEtkMi6/m5e0AQCRKSlvoJKyeY/UbuwKu9YaulD7PYkCncLA5laJ9dCO1KFfm7GYjAvm19sdP84MZ3bjGNqYpH1UfMCBbPqw5J6NCL8J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PWkCygaV; arc=none smtp.client-ip=209.85.128.44
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso14225465e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469862; x=1781074662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WieqzBPdghBFVZrZ0ZaJ7mALFstHxFzBU5uesWViT4k=;
        b=PWkCygaVUv6/5+UGMR17rSjgTbnsFCDt9WxpvwlGDjH35cltPqdTAx4GK5N+JEpzDG
         4qIfp3TeCYAT+4qSP9K+sYKn3SHoqTPaQtBcuBa/YOGpkIXTWd2W+cCKqJWvJSidMhO4
         fJPKKm0pzuT5/wLQJEmoyp9kBp9C7AxfELlw8OWGwLYFzlnHjYcLv60ZCkPr6zAKo1Nj
         mjjA6ZlX7PXZdnyYMsc0t9qPJZ1CzSkCQAwcB6fjOzVwUCV6ddF5I5u/45owHf6r8Hj9
         42/kQ5KdUjJdXrniNcC6W9MdOVRfLMNmdPGJCpCj+FPjhCpbxHUWdp180pLtxs1lbqGn
         RvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469862; x=1781074662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WieqzBPdghBFVZrZ0ZaJ7mALFstHxFzBU5uesWViT4k=;
        b=l6YhWoM5+wEF0tpFJ7JBV8g7jzrIng2DgOnQfFHDh/ucJ7W8xGYsHhVlazUIAHflXm
         iq7phwr6W1kdbZAFWh2KWDH3GYEa2OYVJYylVcOxtqrApk4mDnNyBB7yRC+NaBwdO4mb
         t6gZZJHaJAO0+siH+GBSbNfLcfsI5sRxsj3LC24Y9DK/+PNG0cgXAQ/YzrJl3gsXaZ/r
         BJGzjuYOliNCSRORX1rCpvlp/YsVWnEvaHP1rshu1i9rjCDGhX7iBG1bo1c1p9FoRCMR
         mu52GmljGsgt6R/LYuMe/2Avoge4X38lj/wKbkPcoPyTAVw5zfAosF4T3NbOkB8rZJW9
         ZxPg==
X-Forwarded-Encrypted: i=1; AFNElJ/310gB5qY6nbEB526hqL/mcWq0gmU+VgL2tZYTE8bfVA5/RcWZh6q1k9FBRJQzOiGkWSBFPoRkPJacp3SJG8Hsnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+XFZeK2A9JSNWhHaF2eQlGurqgXnuP3TU2rbcCGWXF5P4nzx8
	sfyeibmgoOOgWpG+2lkgRfWSIvoP7LmcURE1DUsH9LtBO7Z5ZA/aZqAX
X-Gm-Gg: Acq92OGCOSYZix4ue76nCM+aZ+Sl4Tc6h+SnGpNsWRUWM9pLwUAJ8ukp2abbDob6Bmd
	ZNqn0GDTzHrax3JZ+RrRD3Y9bpO8akMVwGDDacME42BzeSHamYfb3rvXVS9C++62C01C2o3kQyv
	PPAGdI6AbiBKCnnQzBR682Vqx4+fZ9YYinQ2teyAqbIQRSZJqCajyaSZpUDZ/3ZWXpMYhfG5lLp
	uZ2RcjgWHPaGHWkyZf6fwkLNzLijkIRKSysgsR4974ONtFDRr31ViI24cxcB+Z3MLzNnR1hiYxr
	r1UE8BmuWNBeHMmJTtona/mGH9g84EFyvLBZFlEESA0u9LZNZ/PEMhm7tjmuYl9YwLkearAxwTi
	TtY8UtGNsMhv4G4RTJ8c+qG/zpLWIHRnP8Yr94soQllS6aI6gSyINbi9+WbdBrdgr3MAStVtUH3
	NL9er8CC35jkExVdC8gthDKm+GmQ12FJcyIe4rbCVx+YECdwUprrWHpP6A5RI=
X-Received: by 2002:a05:600c:c10e:b0:490:51e2:bc86 with SMTP id 5b1f17b1804b1-490b5fe81a2mr22583455e9.23.1780469862303;
        Tue, 02 Jun 2026 23:57:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:41 -0700 (PDT)
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
Subject: [PATCH v17 06/17] mmc: renesas_sdhi: Introduce renesas_sdhi_hw_info to abstract clock mask
Date: Wed,  3 Jun 2026 07:57:06 +0100
Message-ID: <20260603065731.93243-7-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33481-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A278A634F7A

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has 11 divider bits and requires a different clock mask in
renesas_sdhi_set_clock().

Add a new renesas_sdhi_hw_info struct to hold hardware-specific
parameters, starting with clk_mask. This replaces the hardcoded constant
in renesas_sdhi_set_clock() with a value sourced from the per-device
hw_info, and widens the clk variable from u32 to u64 accordingly, as
clk_mask for RZ/G3L exceeds 32 bits.

Wire hw_info through renesas_sdhi_of_data_with_quirks (internalDMAC path)
and a new renesas_sdhi_of_data_with_info wrapper (sysDMAC path), and plumb
it into renesas_sdhi_probe() so it is stored in the per-instance
renesas_sdhi struct.

All existing users are assigned sdhi_hw_info_generic, preserving current
behaviour. No functional change.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h               | 12 ++++
 drivers/mmc/host/renesas_sdhi_core.c          |  7 +-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 16 ++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 66 ++++++++++++++-----
 4 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 09bf9b24a8c3..a7fc525b7218 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -41,6 +41,15 @@ struct renesas_sdhi_of_data {
 
 #define SDHI_CALIB_TABLE_MAX 32
 
+struct renesas_sdhi_hw_info {
+	u64 clk_mask;
+};
+
+struct renesas_sdhi_of_data_with_info {
+	const struct renesas_sdhi_of_data *of_data;
+	const struct renesas_sdhi_hw_info *info;
+};
+
 #define sdhi_has_quirk(p, q) ((p)->quirks && (p)->quirks->q)
 
 struct renesas_sdhi_quirks {
@@ -57,6 +66,7 @@ struct renesas_sdhi_quirks {
 struct renesas_sdhi_of_data_with_quirks {
 	const struct renesas_sdhi_of_data *of_data;
 	const struct renesas_sdhi_quirks *quirks;
+	const struct renesas_sdhi_hw_info *info;
 };
 
 /* We want both end_flags to be set before we mark DMA as finished */
@@ -79,6 +89,7 @@ struct renesas_sdhi {
 	struct tmio_mmc_data mmc_data;
 	struct renesas_sdhi_dma dma_priv;
 	const struct renesas_sdhi_quirks *quirks;
+	const struct renesas_sdhi_hw_info *info;
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *pins_default, *pins_uhs;
 	void __iomem *scc_ctl;
@@ -106,6 +117,7 @@ struct renesas_sdhi {
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops,
 		       const struct renesas_sdhi_of_data *of_data,
+		       const struct renesas_sdhi_hw_info *info,
 		       const struct renesas_sdhi_quirks *quirks);
 void renesas_sdhi_remove(struct platform_device *pdev);
 int renesas_sdhi_suspend(struct device *dev);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f9ec78d699f4..2ff40950f209 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -193,8 +193,9 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
+	struct renesas_sdhi *priv = host_to_priv(host);
 	unsigned int clk_margin;
-	u32 clk = 0, clock;
+	u64 clk = 0, clock;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -213,7 +214,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	 * provided for actual_clock in renesas_sdhi_clk_update().
 	 */
 	clk_margin = new_clock >> 10;
-	for (clk = 0x80000080; new_clock + clk_margin >= (clock << 1); clk >>= 1)
+	for (clk = priv->info->clk_mask; new_clock + clk_margin >= (clock << 1); clk >>= 1)
 		clock <<= 1;
 
 	/* 1/1 clock is option */
@@ -1055,6 +1056,7 @@ static const struct regulator_desc renesas_sdhi_vqmmc_regulator = {
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops,
 		       const struct renesas_sdhi_of_data *of_data,
+		       const struct renesas_sdhi_hw_info *info,
 		       const struct renesas_sdhi_quirks *quirks)
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
@@ -1079,6 +1081,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = info;
 	priv->quirks = quirks;
 	mmc_data = &priv->mmc_data;
 	dma_priv = &priv->dma_priv;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 08cf1604ef1d..512ed70b3779 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -232,48 +232,61 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ /* Sentinel. */ }
 };
 
+static const struct renesas_sdhi_hw_info sdhi_hw_info_generic = {
+	.clk_mask = 0x80000080,
+};
+
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_bad_taps2367,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a77961_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_bad_taps1357,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_r8a77965,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a77970_compatible = {
 	.of_data = &of_data_rcar_gen3_no_sdh_fallback,
 	.quirks = &sdhi_quirks_nohs400,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_r8a77990,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_rzg2l,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
 	.of_data = &of_data_rcar_gen3,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_nohs400_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_nohs400,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
 	.of_data = &of_data_rza2,
 	.quirks = &sdhi_quirks_fixed_addr,
+	.info = &sdhi_hw_info_generic,
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
@@ -599,7 +612,8 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 	dma_set_max_seg_size(dev, 0xffffffff);
 
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops,
-				  of_data_quirks->of_data, quirks);
+				  of_data_quirks->of_data, of_data_quirks->info,
+				  quirks);
 }
 
 static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 9215600f03a2..1291970c2810 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -73,23 +73,51 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 };
 
+static const struct renesas_sdhi_hw_info sdhi_hw_info_generic = {
+	.clk_mask = 0x80000080,
+};
+
+static const struct renesas_sdhi_of_data_with_info of_default_cfg_info = {
+	.of_data = &of_default_cfg,
+	.info = &sdhi_hw_info_generic,
+};
+
+static const struct renesas_sdhi_of_data_with_info of_rz_compatible_info = {
+	.of_data = &of_rz_compatible,
+	.info = &sdhi_hw_info_generic,
+};
+
+static const struct renesas_sdhi_of_data_with_info of_rcar_gen1_compatible_info = {
+	.of_data = &of_rcar_gen1_compatible,
+	.info = &sdhi_hw_info_generic,
+};
+
+static const struct renesas_sdhi_of_data_with_info of_rcar_gen2_compatible_info = {
+	.of_data = &of_rcar_gen2_compatible,
+	.info = &sdhi_hw_info_generic,
+};
+
+static const struct renesas_sdhi_of_data_with_info of_shmobile_info = {
+	.info = &sdhi_hw_info_generic,
+};
+
 static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
-	{ .compatible = "renesas,sdhi-sh73a0", .data = &of_default_cfg, },
-	{ .compatible = "renesas,sdhi-r8a73a4", .data = &of_default_cfg, },
-	{ .compatible = "renesas,sdhi-r8a7740", .data = &of_default_cfg, },
-	{ .compatible = "renesas,sdhi-r7s72100", .data = &of_rz_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7778", .data = &of_rcar_gen1_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7779", .data = &of_rcar_gen1_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7743", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7745", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7790", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7791", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
-	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-shmobile" },
+	{ .compatible = "renesas,sdhi-sh73a0", .data = &of_default_cfg_info, },
+	{ .compatible = "renesas,sdhi-r8a73a4", .data = &of_default_cfg_info, },
+	{ .compatible = "renesas,sdhi-r8a7740", .data = &of_default_cfg_info, },
+	{ .compatible = "renesas,sdhi-r7s72100", .data = &of_rz_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7778", .data = &of_rcar_gen1_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7779", .data = &of_rcar_gen1_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7743", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7745", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7790", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7791", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible_info, },
+	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible_info, },
+	{ .compatible = "renesas,sdhi-shmobile", .data = &of_shmobile_info,  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, renesas_sdhi_sys_dmac_of_match);
@@ -452,8 +480,12 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_sys_dmac_dma_ops = {
 
 static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
 {
+	const struct renesas_sdhi_of_data_with_info *of_data_info;
+
+	of_data_info = of_device_get_match_data(&pdev->dev);
+
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops,
-				  of_device_get_match_data(&pdev->dev), NULL);
+				  of_data_info->of_data, of_data_info->info, NULL);
 }
 
 static DEFINE_RUNTIME_DEV_PM_OPS(renesas_sdhi_sys_dmac_dev_pm_ops,
-- 
2.43.0


