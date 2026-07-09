Return-Path: <linux-renesas-soc+bounces-34926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wcriD21dT2oLfQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:35:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEA72E5AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:35:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bgeQxJEn;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4477309D4E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB0F3F1AC6;
	Thu,  9 Jul 2026 08:31:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4546A3F0ABB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585876; cv=none; b=bGIooLH4BAB2fVwH9edLh6czKe70FXmdsGH8jZyaH6LxyMdc8GXM3yVeZfJgJyRvRhXMMplPS8BB4dIVyvvpNDusOQd5WJHkOIB1hPizPnBs4UAAFPVA9sVuW7qv+UoFwjOLThaqrWzoTrRUwCVZ/V1SwC29IjjdHIHIu8/meHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585876; c=relaxed/simple;
	bh=2MMxWbPszC0S6KhHRa2BrMjl0CdF/Q8StHztnsq5LM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPhKC6UcBoRQIFcH5ygeG74+JEvr6Q0MY2o+maboLkhOueywxjZV8ftFd/3VMF7eN+kT0f5j+RLnP8YbLgkYNE5T14BIzvSBg8cc899+Dtq/vXqzoVS8wBGmRcXTDJbgKvX9QlTe2uBnlJnoletP4yM/LAwKV69dVaZpvxQMZao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgeQxJEn; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47df4e62d2bso300310f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585872; x=1784190672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oR250ETbvKwqMu4wJ/ziZT2HjmaHS/gf8rAo2HoZtc=;
        b=bgeQxJEnEJLjoZyU7zEyvyIirkxScteXLcmQEYVwaQRD+VGhW1+NIehXyEPcwuCmc2
         XSq14y57c6r+dapBUo2qRXtochby9rPT6mQxf/oOI+LZ301fDgZxfYkc3I5463fCjsqL
         hqKa89qolPu1nuPt6BM1gobPg6cPLlitnfnS2gVoxaLoKpca9LqKiAr8/e9jW7ysoKQS
         m0hv229EHiftv/etWPJvFHnKQtl6LTjAyn4qU2ECkGl3wQJm2++E8I7HzT65lA0QW+GP
         fUuI05Thyt4sCeU9neboP3PuGdEfyB6vamTR+pL3UpZmCblmGZQS9IX7L+7q7Dt1SF2y
         wpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585872; x=1784190672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2oR250ETbvKwqMu4wJ/ziZT2HjmaHS/gf8rAo2HoZtc=;
        b=DP5RXRfHNwfurrs0EGnl7LWJRG8wCVXi4oxQFWkL0Rvf9qXx8Zm04MtxqffHIocsqc
         Eul0Kc1sZsq4Sq8tOKGVXXtabD4CWJLkBSFi9QCfQNGd4JsZTjFf3PUeQMdJsL130HdS
         tWsA5wvM+Qp8DTW6ridSgtcI8CeNwqm0dygsu44lj5Lk5/F+6BduiRZ4UwARcNQ2N+a+
         mgZVpKDjNiSaAe4VwCgWHprkfoP0CmIUq13JzpDvxl2MQ7I4JJNBcDm+pAAvs7aEX9+R
         E9Cg0uCicA/Tbroe1OGcxgE9jMSZauRFDrKXrxAOHbKKzeREosrd5aQadgxmQ0DsGo90
         ygrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro71VUMdIafF55f89nFLN6OQZxjPuLlk3QxU2z98W+ziVGqrWM0w5TvvxReVL4LYdvkPZpXTHie1xbiLCZmU0LZEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJEDIMiHcCpko/IkkzN8fHCroAj5pRps/AQgYqk2ZQjczs7Zyd
	xZ+N6NZtkHWHxO2NRYnagm06CxT/D8YCn78n8HN4c7Z8Z6OkPgGpZzvy
X-Gm-Gg: AfdE7ckcf951hA2+JtEkogXgIkGDIIz7ZBdMTxNLXBGHQS6S6fu2rQPlyRdMq7ok/23
	OQYSdpCFpgatYv7MP03k3WYaQph7BdjPDogtXYFjBNXIlgpfylqCh5OQooS0LUVYHzIPFBBdDHt
	ruZ/J1QsQV8ky1V/co1h1F48xd8L4dkM4yCVJql9j1NGbGELkkBjQTeEy/qA64TFYHw78lzCnNK
	MHQOtg0gi0D3rjbcdMsd5kSbmIL/6AXsy/HSljPFL4cV5EhP/P5TZknSpPseBQdxSMjkO5sseaK
	KhYGeNmDQAoWAXGGPJnpi8zSeOF6haJQI0f2NohKmO2V+T1MqJJyal939a7VhPuat5yy002gb6t
	0SRnOt3euTUFxfvooM5yYfNtcZK/AJFAUJ8Doi32AvliIr9wfLqJlkytL5a/PyI6u64H/HrSIHL
	hFcnTH8qqy8l4Fd/abM2AU
X-Received: by 2002:a5d:6f04:0:b0:46f:558:a43f with SMTP id ffacd0b85a97d-47df071565dmr5781461f8f.4.1783585872358;
        Thu, 09 Jul 2026 01:31:12 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/9] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Thu,  9 Jul 2026 09:30:55 +0100
Message-ID: <20260709083108.108370-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34926-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:broonie@kernel.org,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,glider.be,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3FEA72E5AE

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.
The new struct currently carries a pwrrdy boolean. The probe function
now retrieves this struct via device_get_match_data() and
conditionally calls rzg2l_usbphy_ctrl_pwrrdy_init() based on the
pwrrdy flag, removing the previous integer cast approach.

This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
which requires a different regulator configuration with two per-port
VBUS regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated the commit description.
 * Moved the handling of regulator_driver_name to patch #3
   in preparation for id_table match.
v2->v3:
  No change.
v1->v2:
 * Updated commit description.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 32 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3b..84e745e49240 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -41,6 +41,10 @@ struct rzg2l_usbphy_ctrl_priv {
 	spinlock_t lock;
 };
 
+struct rzg2l_usbphy_ctrl_info {
+	bool pwrrdy;
+};
+
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
@@ -106,14 +110,15 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-#define RZG2L_USBPHY_CTRL_PWRRDY	1
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.pwrrdy = true,
+};
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
-	{
-		.compatible = "renesas,r9a08g045-usbphy-ctrl",
-		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
-	},
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,14 +158,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 {
 	struct reg_field field;
 	struct regmap *regmap;
-	const int *data;
 	u32 args[2];
 	int ret;
 
-	data = device_get_match_data(dev);
-	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
-		return 0;
-
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
 						      ARRAY_SIZE(args), args);
@@ -188,6 +188,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
+	const struct rzg2l_usbphy_ctrl_info *info;
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
@@ -206,9 +207,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
-	if (error)
-		return error;
+	info = device_get_match_data(dev);
+	if (info->pwrrdy) {
+		error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+		if (error)
+			return error;
+	}
 
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
-- 
2.43.0


