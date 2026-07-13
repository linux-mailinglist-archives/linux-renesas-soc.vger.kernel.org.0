Return-Path: <linux-renesas-soc+bounces-35159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K6p5IuIlVWoGkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:52:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5174E29F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:52:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nQQsV0S4;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E8ABF300BCAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406DF353A75;
	Mon, 13 Jul 2026 17:52:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94927352018
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 17:52:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965133; cv=none; b=L+So9yglIReDWztdGzJYeelj1PlTxId4KFdpDiQL/Wgi2j9Dk199O4E2yY64uA3N+9aUt4sm33lMk3MzoabrKALjL83nggNnE9QgrT8ofYzBvHzgHOH1X/BdQAgDaAhWmEpU2cJR+kYmcgnwk3v4hxUM2bWLbG6DAc44hT2nZro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965133; c=relaxed/simple;
	bh=W77L0VNCoY7Tvzw4PzFSS4Ekd35/93E+qrb/dKg4lzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEA1rXM9OaPp2YlJClSRBVTf5mP4fttIVhT1VbRRReqsQrqIijTc+dTJROFH9ujf8or7m/IsET2pMywd5iryBqfdfHybmuwqJ3JW1vcjaB9cAHJjz3H6Tlo0OuON7n2WSCYM7YcITt+J233ABuh20cWIgZ9qiViyijKKtkSjROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQQsV0S4; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so123884f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965129; x=1784569929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz4lXMnM+3qHjXu6Jdn8WbXR2CI+PL9asho50kScHBI=;
        b=nQQsV0S4yUBJb8pllmY63rXs6m3/WwviqZehzg1alQFt7CWvhosYHY5iuPVBSVjFBz
         qVk702jyjG0Mhx/wyrrypKCqRukaPS5JS0W82zRRUVPS2woq4mP96MBeay1LlCWk4FQq
         FWqg/gbdS0HI9tW4nQkVP9+a2f5Fxi63sLdTO/OKHr9Gh5h/BROIfBqACJ2KDkj9gmU5
         pH9SK4X1+sMs4uc/OlGO+E23lsIOXxbDZpTAlOACsyDSomyRlSpl1zd/EHCN/OdAsaVw
         Ba8CZ8g1sd1Aqm4dAT+KEfz5acIhn/1MyJSHKmeoP6QmeHtZkxP9NK0l6IzKICfAVdz7
         AzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965129; x=1784569929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nz4lXMnM+3qHjXu6Jdn8WbXR2CI+PL9asho50kScHBI=;
        b=doKM70vTNLSLIsYutadhWDk5wENgHhh3zWR4B1/yBd2XduxUNvliYUYvXgMC/9Q5Hj
         0MhagtMFqLgq1ubUSHA498DlZJ/zyDD0f0CgtbvN33lsNX8WUo9V+WsxcjlkD8pCNvNA
         +BpCmeMrZ//OjDgAwOpijDjMxqZ2Cr+/q7Z1Ubz28PUo2tzJWPxbxUddC8A9hYjRfwUN
         4hQK6ANR/kQcKwURuRrrI9xHj0uwhbhRVwy4MvPM4dPrWZgcAN71V2aBopsjDRTJiU1Z
         VU1mF5T93wbZz+v0ZO6Pp+IMgCUSelZjaF9LNt4qO/C8HFYuzCWufhJMcJl5pgx6iKMB
         5Q6g==
X-Forwarded-Encrypted: i=1; AHgh+Ro69fyP0S6//2H6IqeEGszLeeOy3ndhnwUjgwomd6veGRrncJqpCY3jxvVk/q2W5Oxmn61wmnuD5fyDzL3ozDzNBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9mb7i7PsHm8rpUdokH+/XyNjMksBLk3j0ZVNNvkWVtnqEzror
	wX482vcCRwMtqHR47rBp2sqwTuFbKlJgPMREnOh7k/lfGWSNLyfSOZ3S
X-Gm-Gg: AfdE7cmQiymj/+k6McBTpeljIQZSFgq6MAnlXYmqgcE/FPmL2FASBb5+SfRoMlKuChR
	pXx2UTHixWgzOcqVk4ADev495gCnPbO+NlGGWuxAQDPR6qw1aOm2XP/ntKvsiVLsTV2KHTRu2XH
	guUVl5Zj6+LEtIfcwcYEtuOMMZ6b9TvY0C16HyA2w76mgK5JEd+4o08Jw4kiDNE2GvFoS8fNulU
	cIvfdKbGAufcBBQsYoiGRveOY1USsLVCdIpaUKS2qaG/RzkN4xm0iJuvKv4x7M+HlmJobn6mn8M
	zLAUHuN9OOgvHq+vq1vX2N5SR2P8F4rW1f/kHVJHmTetxu2uPY/ChgsA4DmMcVmga5CxcDmsZqC
	FPdfgK23ZqANgy59Pq6AxRkswQjJs03fjYadUSp6zA0T7/5r0IGWujAk0EglulW1zTPHgvGYiEz
	VjC8Vyp1hmfvqAbLWyXmWKUtBhdbvEgUc2JFfAfifz7WWWw2zg
X-Received: by 2002:a05:6000:612:b0:478:65a8:262d with SMTP id ffacd0b85a97d-47f2dcd1a6cmr11891993f8f.9.1783965128698;
        Mon, 13 Jul 2026 10:52:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c899:4fec:2bdb:b719])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464d6fa7sm1011037f8f.37.2026.07.13.10.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:52:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v20 07/12] mmc: renesas_sdhi: Add optional axis/axim reset controls
Date: Mon, 13 Jul 2026 18:51:48 +0100
Message-ID: <20260713175159.138334-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-35159-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1C5174E29F

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v19->v20:
 * Fixed the ordering of resets in suspend/resume paths.
V18->v19:
 * No change.
v17->v18:
 * Fixed ordering of reset in renesas_sdhi_reset().
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 438b2a7afe76..d46598190004 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -100,6 +100,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index d3f6d459fdc7..a4e822f141e8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -623,6 +623,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axim);
+			reset_control_reset(priv->rstc_axis);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1137,6 +1139,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1363,13 +1373,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1381,15 +1396,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }
-- 
2.43.0


