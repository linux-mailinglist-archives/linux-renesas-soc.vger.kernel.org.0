Return-Path: <linux-renesas-soc+bounces-33371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPVaM5cLG2qH+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:08:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFE060DE90
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5194E3011073
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37FD3403F9;
	Sat, 30 May 2026 16:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwmPwStJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E709F33FE36
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157321; cv=none; b=GZNwbBf27xa43r+PrSemEVY4A8zjfgnuc9Tk4xAg5dwXvj6UB/Jkma6hBJZasFmLL4Gjat/gWRpg+K+NNYG+YkhEa0z5fisH8hmCcgv/uE7UPGFwFxDBlQhKDS7qnAboQUduvdqIoowkglXx46Am8vpHr7u8ijccwMMwyMRZjhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157321; c=relaxed/simple;
	bh=wvan6W6jwklPW6AfsnqXuduvznpRT1b5qohEMynpRgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqMunzIXznbjikom+DzuQ4Zzm68iEreV0jA4+78cK1dWnAO/p1qUi9WsSDbq8o8wMexG6LjAv3svn+/OP4tiiU8KQkoXNJdfLrjfpd4IJb/XlPNI+SZ7XEDTqYsy7RvfUXV5DIrY3f07VrvC98opQcEKf+k1iOeeBxIQAvoQ3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwmPwStJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4904c1ce4c1so93527225e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157314; x=1780762114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rru3FhAkaruVuAVpt4QFVtG35h6W/HLXeGb3IVFEYFM=;
        b=pwmPwStJXBDkOpZDQ4rKxi+xwR6CjCI7QaKkB7AncyiqIWr9c3acJcFP1y1+Xr1bBR
         7t4Um1ZjowQWtTVvVGp+8EW2S+pV3SNXFVL80qK+AsRXuRPDV51IQ6Jgsg8M9gy+CVN5
         TzYKObzXUckTeGe3lszilAZGf4TesLBc2tS4KCrYm2PzaunJQnQm0T/QHSin4WgVOuzz
         +r3yUf7k2fE97eJMlX1vZJI2wjpSsmewh5xgrXzINiIGxamZfvrEz4sE7c9/KHX370zC
         DbSc+dzjFF02bdeEdeyulpbBUHJoFkjgCEEIWGFglE2ATiUu6wezDqyGDOTheeKtwy8c
         cQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157314; x=1780762114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rru3FhAkaruVuAVpt4QFVtG35h6W/HLXeGb3IVFEYFM=;
        b=I334XOFbahbgRH+6xTlKgEBYzrVyQ4DULMrO/2MfQWi6bRulbApwuee4YPfG0s+eQ0
         WwwjAkIf9yDizRfDcNhMr0DhAGzP+FrR+Apqk2VtWuLE8FuyWL6VUPue48gx2NR7Bq8Q
         WhX5SpYMA1nxMvxfO6ZVJAjaehY9e5Be+XEJRRL7yW4EsLg9yK5g0xWgUW4725CVYH0/
         EBYWTs2HM1yUzMrEjVtOgEq03O5ZWoHmzVRDRJag43m1uOSutYyj1+hHXkAkxMOO1N2Y
         Ejc3G+nc6kqJQUW9hyge1XiBW1ezbUC2R/9WE0r3AMfM3IBDsaN6MnBN9aF5LTyIHiZz
         7w2w==
X-Forwarded-Encrypted: i=1; AFNElJ8BpNmxc+yt+MRiKSA7pwwJgjk1bBOpHO7oX4C1gA5AwtLr+LV+4xFh5PM8fGSup6AGAxxNHgEwGWx//gk5F6OjHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrHm/71seZNRmaQgNXephVjoIfnDh9tyjUgullH58rVXkE74xo
	OVCXiCLWy3MtepYZ69HJMIj+X6vvh4BVksIpqqU533Mef0kwRU5ay40S
X-Gm-Gg: Acq92OE/OIDlARNS9RBnZhkQ73zZfFgfhCUbgEZtT4uXwIhzZSBSlUeWs+Y1EJkaNCt
	vvtBKywUJOTi4LJHIEoi+RZgTDOSJYa6FuUUiZfAVUYUMmSOu9k8pJHDgTw6P1TXTRUdG5cWYsG
	ArgpIlZdWiaRxsCWLPRKsLtnvZ11m9w58uNJSm3Zsz7OIkcg+zmWHVaoYJSqt5WTIUSUBdKqI80
	nOMQ86UiejRTkFPiMmUXujwjkS//9SThawGuJe1xz+WbW9Q0HCRVOJ2t014K+NE2ygVym+/IsIh
	f+1PmJh00B63cZ2UFFUTIqSraFYbB702MfQgJ5ZQZAwfXMa47prA6vcDYlTOfKU41GFl7cJLMT7
	ozo11rDkIPNpXGXnO9Psf5duVqgQ1Qe7YZfWOKt5LE359MDhi8M63OGEkSWS4dOksyVWfJg2dUp
	mlakn2gnTfpkkzZjlYueOEfdVoliQS1YfhwR4/RYCBZY2/egnR53ESMATv2Ak=
X-Received: by 2002:a05:600d:6443:20b0:490:a1be:6b01 with SMTP id 5b1f17b1804b1-490a2923a7cmr57681505e9.4.1780157314269;
        Sat, 30 May 2026 09:08:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:33 -0700 (PDT)
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
Subject: [PATCH 06/17] mmc: renesas_sdhi: Introduce renesas_sdhi_hw_info to abstract clock mask
Date: Sat, 30 May 2026 17:08:00 +0100
Message-ID: <20260530160823.130907-7-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33371-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6DFE060DE90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


