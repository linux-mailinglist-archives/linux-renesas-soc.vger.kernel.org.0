Return-Path: <linux-renesas-soc+bounces-34328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /mmTFG5bOWo0rAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 369466B0E83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=p+mUw95J;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 990D9302CD88
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51C63CF95A;
	Mon, 22 Jun 2026 15:56:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E93CAA52
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143788; cv=none; b=SIxCvMxhtIn0qH/pntGq66jo0ACEQDCOPBg4iXrDkMjIndHR0q/uoCSmGNM16CTqsoZ/wbDBqyjpIFco6eWpb3XpaxtrvwbhLozaZ51qorEs33NsOgQjcqZgGJTULciBWImf3uVSOntaXZlCDsGvcbJwnx7Qra9O5ZhJLFiAUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143788; c=relaxed/simple;
	bh=Ltb9VlbT1WZlakF565+04Nm4z1r6jpFx89YmjQPEVcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h8i71CJGGvjimD5VWPYVfQnEUeAg8BwQz3PS8ZczZG/NnNLGGfr1bjpgRm43yxt4EzOPBGGDVjAmWkrw3ZTLynTExr7UPK7WLSJoY9y5JsSgkMcJwjhFxskbsRyRUjGrJbB9pu3GlltU/X5mvHSFnYK8Unu6HmMJG6UrdrK9yAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+mUw95J; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b9318997so31339215e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143782; x=1782748582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmVHBO44uP/RO9dJvydXdxFgZjsqSR6kPniiCK1ezVg=;
        b=p+mUw95Ju2UwO366lzHVqBytvVHlrMFgMCxeTN4k8gwOJYVV3burvUmhJB7etrh6ju
         UTvZ9ZchJXLQcnllBdJ4QavF0/yHeDOn6TKFMKcMDMTI8Vfv894NJl1F7N1CbrxNUXOy
         gel6QuSu5RKZZ6owwN0OTqDAAwXlSCbCj6kLLmMkEiKw/XT+ag/yep0uTcusP3yVtrot
         xwa/4QvHVVJuqcxokfRKilbMTw+HrEvZ0VE3ovZ31fvpXSFfLvobHKLKEAkp974ws8qo
         d6bfUDbx0KnUgH7xvHTKHOeZCb6B1lnMg3vJkgxrlLJ4S06oJacSdL5L5p1a84H0X8F9
         QI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143782; x=1782748582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmVHBO44uP/RO9dJvydXdxFgZjsqSR6kPniiCK1ezVg=;
        b=IP95Cj6HcrbUJYI1SochRiVHO9QhuQAPPu8uVQCfyVFF41bI9LQRvnHl7m6NKTg6vB
         Rlw0+gG7H+OZDFXTC404PN0rr8VMrbkn96MvkHQrJPQZlCSoCFPAn+3Bel1CbNuZYGy8
         Ru7MW76tcb2IpMdKCE0fQqMOawGuqY1lFjUnD+jcIv6kKS7zVx8OMa7M/Nu/22VTOOEC
         5juCuwQbfkcdZ8v+p5Plkwh7Y7DxOU2/hNMBgfSLUMzY847GydCGDTrQkOqizxRJySp4
         pFeWgBps9Vo1U4Fx9YWTY1fuWLbfxxibL02jB5lmrJiaqCi8xz3uzf+TIiRptdlwM9ZQ
         4M5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8IhxuyP0UYKGA5tyY43/7Mlh+fvLuPAP/flndJ67y4WYQqk3x1g6TH5U/zb9BvikWlrffUNxiunWXJhpuRlBaHfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAgoMVO8Zea2mo8/XFOx87SQMG/vsdBM/6uBTJoj3SYwOXiyV
	Dk+7malkwYjbYmty1uZamRH0tvidVaBvKd3nnKNQ+hmTQvuQ5XrR1rhj
X-Gm-Gg: AfdE7cnkeXnFBg+4FLAull5dgNeSxMvGakQSYfGrCWhXQDgeZ/oHOTKZmpXMOxnquMk
	EKBqLnCb+EcVKrnd271W3eFC0Ksu9QwpxLI1G7baX/DgW1NITHMQz+OL6U7ms68/rBD12aY/HGO
	a2jlkFzGc/0cZv+YfCOQ3DjRe9q+smECLIixj0geDvF/rZ/GEoTYEnIDmcKinWUkU/j+9xpGGGQ
	g3W78obBqxVHrFKpa7pwYnK13FJAfNzRuuG7LigQTRZS99DMZUvakukrZ5MEXvcFL4J9LE7xnBS
	ZSduFnkJ80ii8VOxEl3XbqCzyHCxFi11ju35RkQEpj1fNfdm+TYCfOR4Amqf3Q6UZKQzzgQoSxp
	SmmXHCudmy5STm9/X/XGYWGfMW+H/CY3dmkV2ySXciN3U/pKWa5/I/GP1ZgvLaZnrSkVfBSUfi1
	gma4T5ho7HKWY+eyOlTSmbnH9LTkNCrm6wOI5mtg==
X-Received: by 2002:a05:600c:1389:b0:492:1eed:3e67 with SMTP id 5b1f17b1804b1-4923f5829aamr242605845e9.26.1782143782209;
        Mon, 22 Jun 2026 08:56:22 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:21 -0700 (PDT)
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
Subject: [PATCH v18 07/12] mmc: renesas_sdhi: Add optional axis/axim reset controls
Date: Mon, 22 Jun 2026 16:55:58 +0100
Message-ID: <20260622155610.184271-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34328-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 369466B0E83

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
v17->v18:
 * Fixed ordering of reset in renesas_sdhi_reset().
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 6f6b41fbe91e..9ac5cb25ee98 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -100,6 +100,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 8890859d0777..f3ce29cb3053 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -614,6 +614,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axim);
+			reset_control_reset(priv->rstc_axis);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1128,6 +1130,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
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
@@ -1360,13 +1370,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc_axis },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1378,15 +1393,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc_axis },
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


