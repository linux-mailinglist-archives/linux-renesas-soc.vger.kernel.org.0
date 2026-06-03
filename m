Return-Path: <linux-renesas-soc+bounces-33482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jLErJQrSH2qlqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:04:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9C3634F77
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:04:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=eGlQvCFt;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A4C53118D7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36093FE356;
	Wed,  3 Jun 2026 06:57:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2993FC5BD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469869; cv=none; b=bEkSkwp9IYXs/BKh9C8ycu+CdblSqCcDvP0SM1dRjllZZNAHR6A0CMXmdqzlSm+XTM5aIrcnjAVMZXS4149oHeb4O7iFvI7qNk/kF0trlxs6nw8bfPJKdTyYSFsZ+S3e5fgwWL6OE8BgaRIgAbVPyG2JD4BzQ1pCHfdZcCd6pqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469869; c=relaxed/simple;
	bh=qR2v2X5KmKY1aOmqZhoUA64DfOH2jrnAkTyGU5BQy/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8egv8EVMxH14+iGjZw8UjSHQbYBq7zaoYc2C7+DdtCkdOJPDvtIJlD8S/u86+OjvBWu6eo1ljHZpQnJntXDgBnGHfSfB2WoKiVPO6vyMwXlz2cI06Grhj6ksvW09jRtQJVWig3TN392oLZ7iSITE6lvwp2VxS3bS6ZKkiEIYQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGlQvCFt; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso6972955e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469864; x=1781074664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98XchVxz6Y7TKT8XXQBfVOUPIBeQByRw1PfGZS6iWGk=;
        b=eGlQvCFtUJBTxSLjeJmF9N+O3KpT6sH6Uq3tbFdwqvrCq/AKT2sxwjutQ6Yk5Lt+sH
         D0kAaBqpPmiWxoszEV83NvbnjK4YpzQh3B7GewLhO10UhQ0+zVq4pBx59WvWdT2jG3Go
         6TqUtLgqnkjbNJzy+NoOLQPnKyd09d4idNO+LBNmEXbuIn/9Ojij9gHWO2IN+yLfukVy
         nXM4tdTM7/31r4vDZFnfHDZE7RcSCAsVY4u2kT7SK9sHPUeftOEHYmsv/aushQ3eK8pW
         eux8mwS8NDRp5QZeZy1MM/uQybvM+0qmM3ZHpGuZHJbV4Vop+m6FzKbVkMLTE1jwAXl7
         lquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469864; x=1781074664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=98XchVxz6Y7TKT8XXQBfVOUPIBeQByRw1PfGZS6iWGk=;
        b=lr9CMymtYq/x5QLWZPyvE5PF6ADi5Sr8POlXr0rZDNLK2YcboBy/b/sARI85ZzCfvO
         JJR12pNz4VoA5csexqkCkURV/a3vwozBmKyDqyBr2ASJFVC58d+ZzIBzg9QFlhu59Ioe
         imI4IyNqKkOquL/mDqiYAW08VXlYBIECk0f7tctZCYM7FS/ZHDBXGkQLy7e0N1MrtTnl
         1Tt5RJPK+ZJiLjuyse7yhdcz/8nB3wh8m2OKwOplbhTByuZj/52ZDZffWMg4uIonFByL
         wjIxeuquYR5Kxs5dPGLWmGyF5qBUWzmShLNu27bBnLzfE+0F1njnSX9i+B2DgxQzYqRZ
         ynRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sPh2Y3J3p7RpecuoYk+ADLNy16lxptHTwGLCi00NkbdlCGdj5eIx0n7W9R/EknVB9hFnekSrb3sYB+NZRvEwR6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0iTEKQ69jXAQGEKYwWlzHl63zOvUEGqQTLn0W2tsu8jJ17dE
	PHfJ7kHSL2++/hzGjbASA+usCmHtIz9Afa/FDYZ72XpaWK5gWBW+tpUk
X-Gm-Gg: Acq92OGeFbUFqnlbY5obuQS9EyIdw+cALaDIZzSkVKsTZdUyiknClvOZ5CaB+dmuX4m
	Rr0vqT25Q6HYsy8tJ3ptTnHpkBTTSMf1DWmy9HPBvqvJz0NX0FiASlZOpKw2v3nMfC6Dj5qQ1/1
	xGB9RYtne/SCgqOYzvihjv7LG5Fiyu0p/wJO3f8qMz1Q/Z3+LdRlzROIkIqA53FQ+BoLWNpmEgT
	BbNzIKk8CCiBqmRJtrrIz4u2mrUdcAFa1wSkLVumuuX3eMHfGswB6t9Oj2Y/Vr9Q6iLu2AhfTCO
	lOqWksLQvLPIPIe9CXfnohh944RdRHP8MlYnsbMPo3QQTSttH+6wAQDRtqP2ousjqyNw+kessX9
	VXVoHSMm1oE/p6TjUR1Cd1tcF7Zr4g09QfrtcQoQnoZS8E2EeggaaFiAYZ2GVZzlFzf45sZExGv
	uBlcloUCi/CSox09V2neZr6Zt4/7744eaIwRq08+Gm2a4f48mWuMSEGZVoLYA=
X-Received: by 2002:a05:600c:1d09:b0:490:3f7a:108b with SMTP id 5b1f17b1804b1-490b5e51a49mr32472725e9.16.1780469863954;
        Tue, 02 Jun 2026 23:57:43 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:43 -0700 (PDT)
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
Subject: [PATCH v17 08/17] mmc: renesas_sdhi: Add tuning_delay hw_info flag
Date: Wed,  3 Jun 2026 07:57:08 +0100
Message-ID: <20260603065731.93243-9-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-33482-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: EC9C3634F77

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
v1->v2:
 * No change.
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


