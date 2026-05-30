Return-Path: <linux-renesas-soc+bounces-33377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oL/5HvMMG2q/+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D741C60E094
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65A3830C7419
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA30344D8C;
	Sat, 30 May 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4AXTKkM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C669B340403
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157323; cv=none; b=t+ieBn/OXc2yaPKLSzEs96eNCXjaEjjzS20QomsYK1ONGCf/idKJ64K6Ig43s5auHB5ItfI/Zjyor7R60MryzJUdJmt7GWfWNQqDdzchPRN38aYTuY463sjaxSUMvSihv0yDsPRG4SZh2i/0/+VOqaVHmr9K+sqkWRt3atPaY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157323; c=relaxed/simple;
	bh=7h8rrU9JQer3x8kcFtaVys+3g/HtLuERBfs5fKHvZn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojYVXGLGBt5oSuaQ15uHIJpCizn9lNzrYzsccgPFRWSeTAK4Xk6AKQzhNnx+ulhpavJK4DR+z1niOa4HFx6WAmndhjW8Yqha7+NIdxmPGo3s8AoK407SzeeZxHxXSEgPSqmbJ4SQoQkTOIOHhxaWPNBzh45V5GnHCbfE0IhaWWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4AXTKkM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eedc94d37so1254909f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157316; x=1780762116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKSuDJR51XALEnHYzvRWkLQZfNsX2G6ozu9W/h5yoWE=;
        b=c4AXTKkMOv2q9LPnRaF0j7t9flQiPmYQE/hio0UpiYS930cggQcEbdYX7NE8YLKxNr
         cqBLU3kaWlLZZ/2NieYRTjPijuqXsnWwli2mxhptc+7zWRUwTkOSfkUovU675qUoA3fL
         BjsIhhboph9rnUptcSQkVh4PSuYtdaZ/4m3F0oBKFm/17k71LOmPK80MzCA6rwi59iJf
         FANNO4hC+KTKXTYHbF0sJgkCU7L4GaXtyPIS+c2DHBKZObgyKXM42iGQUar9cHqB+bnh
         IzMDYQ00o7yWabqJYHKotg+xu0qZmQidvON8O0sPDgMe8c/1uXWVNCnO46xBAA5CBIHC
         WNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157316; x=1780762116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZKSuDJR51XALEnHYzvRWkLQZfNsX2G6ozu9W/h5yoWE=;
        b=kMmFK5hwBz3m5f60iG1NulccWUaBCHEvMEsQNOw3HVV6P5mB3RUnQAsu+RUUjnYztj
         QpduxWjPCXzDOWvygdVdpdzjNWvBuTJ5vIEEceKPIJjq842DheJ5kSaTIDI2gWB/zcWU
         5/H5Wvr/s8HUHBzZPgKi2oA/SY5UKI8FCKxIz3oIFTcheEVKsTJnDASo8LIFr3oKVT0c
         +8qHPcIz+DjSQS3tw+ueUukCL50Z+ShrygxevHkI7jwET0wo8P07xO4OfKxFp6yzvF/f
         vjUK2r0wm6om1I2OaLafDLP9ON5/RzquQuL4N9UfhG1Qqb5H8EumjSPZw+83pONNwoet
         4FJA==
X-Forwarded-Encrypted: i=1; AFNElJ9/YGR9vvNS6qzN8If6wUxbWOYiSdITkpZHeE02yyaPDCF07Q9YcA8tewJr9sz23xcaIQbPTbtkMtiqVmiXRmOWQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFGtU2vLnsRr4/lUGFP1YG6JhZhb49cc5oNewx4jVKVmK9NAXY
	MIr9M1WoZEnf5nDcCq1EkV9P3NWB2roaMyBC3/kATVVYCYWGykcinTAk
X-Gm-Gg: Acq92OEybeiP8ppM6pXh33+U8iN/8+3Us9ttDlXafTO4BmdH5PdebeTpYQz1aq693bi
	Hc1myDnPD0zeE1XstITYP7g1NuehtuSs6g+dyWR15EhoUcbMjQ6xLJjQR07NFVxuhqE65DvIGdb
	3aDRJ1QMZ6qBTrn2hJnnWZYj97KE6WHBaAmMBUeHWshJ2SEuJtrZWLCFCW9naNmVGOAb4xrF+kK
	IFdPud/guctmN/MuDpg/cIZ9gjXwGiG6fTFJtjVO7deJihhhcOi4e2m2gEnHttmGeC2iPPtR3+l
	TCB3h9YJqfmQD4b53f5Cw3YlIWE1XP72STYQslT81ZooPgv0JA5rIZbIn15q87IaGVhja0igfXD
	uhpJqBLZp8/KoT+gJUvS7BuQbRowfCM2dJ2oCw2PPfmiHS6N0iUkUs7opi27hB47dPxj6p+LIa4
	X4RDDu1JIqBcoJqFS95LzQXDEv7UOpPI5N5he8GEUBjvk39X75P1p8+l9CPAY=
X-Received: by 2002:a05:6000:1a54:b0:454:a12c:6cdb with SMTP id ffacd0b85a97d-45ef6aea780mr6273419f8f.2.1780157316062;
        Sat, 30 May 2026 09:08:36 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:35 -0700 (PDT)
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
Subject: [PATCH 08/17] mmc: renesas_sdhi: Add tuning_delay hw_info flag
Date: Sat, 30 May 2026 17:08:02 +0100
Message-ID: <20260530160823.130907-9-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33377-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D741C60E094
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the RZ/G2L hardware manual, the TMPOUT bit field in the SCC_TMPPORT
register needs to be set to 0 when transferring at 3.3V, and to 1 when
transferring at 1.8V.

Add a tuning_delay bitfield to renesas_sdhi_hw_info to indicate hardware
that requires an adjustment when the signal voltage changes.

Add sdhi_hw_info_rzg2l with tuning_delay = 1 and assign it to
of_rzg2l_compatible, enabling the adjustment for RZ/G2L. All other
platforms retain sdhi_hw_info_generic with tuning_delay = 0 and
are unaffected.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h               |  2 +
 drivers/mmc/host/renesas_sdhi_core.c          | 83 +++++++++++--------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 +-
 3 files changed, 58 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index a42934e6d49d..a3c5fa368242 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -44,6 +44,8 @@ struct renesas_sdhi_of_data {
 struct renesas_sdhi_hw_info {
 	u64 clk_mask;
 	unsigned int max_divider;
+	/* hardware features */
+	unsigned tuning_delay:1;	/* Has tuning delay */
 };
 
 struct renesas_sdhi_of_data_with_info {
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 16ed6fd8470d..868ba6a6919e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -257,40 +257,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 		 TMIO_STAT_DAT0);
 }
 
-static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
-						    struct mmc_ios *ios)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-	struct renesas_sdhi *priv = host_to_priv(host);
-	struct pinctrl_state *pin_state;
-	int ret;
-
-	switch (ios->signal_voltage) {
-	case MMC_SIGNAL_VOLTAGE_330:
-		pin_state = priv->pins_default;
-		break;
-	case MMC_SIGNAL_VOLTAGE_180:
-		pin_state = priv->pins_uhs;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/*
-	 * If anything is missing, assume signal voltage is fixed at
-	 * 3.3V and succeed/fail accordingly.
-	 */
-	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
-		return ios->signal_voltage ==
-			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
-
-	ret = mmc_regulator_set_vqmmc(host->mmc, ios);
-	if (ret < 0)
-		return ret;
-
-	return pinctrl_select_state(priv->pinctrl, pin_state);
-}
-
 /* SCC registers */
 #define SH_MOBILE_SDHI_SCC_DTCNTL	0x000
 #define SH_MOBILE_SDHI_SCC_TAPSET	0x002
@@ -351,6 +317,55 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 	writel(val, priv->scc_ctl + (addr << host->bus_shift));
 }
 
+static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host)
+{
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	if (!priv->info->tuning_delay)
+		return;
+
+	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
+	else
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
+}
+
+static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
+						    struct mmc_ios *ios)
+{
+	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+	struct pinctrl_state *pin_state;
+	int ret;
+
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		pin_state = priv->pins_default;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		pin_state = priv->pins_uhs;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If anything is missing, assume signal voltage is fixed at
+	 * 3.3V and succeed/fail accordingly.
+	 */
+	if (IS_ERR(priv->pinctrl) || IS_ERR(pin_state))
+		return ios->signal_voltage ==
+			MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
+
+	ret = mmc_regulator_set_vqmmc(host->mmc, ios);
+	if (ret < 0)
+		return ret;
+
+	renesas_sdhi_set_hw_adjustment_delay(host);
+
+	return pinctrl_select_state(priv->pinctrl, pin_state);
+}
+
 static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 84b1b38ca465..d056c3586e6f 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -237,6 +237,12 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info_generic = {
 	.max_divider = 512,
 };
 
+static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg2l = {
+	.clk_mask = 0x80000080,
+	.max_divider = 512,
+	.tuning_delay = 1,
+};
+
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_bad_taps2367,
@@ -270,7 +276,7 @@ static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
 static const struct renesas_sdhi_of_data_with_quirks of_rzg2l_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_rzg2l,
-	.info = &sdhi_hw_info_generic,
+	.info = &sdhi_hw_info_rzg2l,
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
-- 
2.43.0


