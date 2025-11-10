Return-Path: <linux-renesas-soc+bounces-24407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B348C46E64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B667D3B66B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4323101DC;
	Mon, 10 Nov 2025 13:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LB5621Lb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6CD3101D3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781247; cv=none; b=tJ6tS1HErHDJ7DU6PIr8zecdJyz4duIExl1sYwEQ4xcywBmqmuf3GU6vObPGyBdkFI3EBSW2drgE0XmaqQczjfQ6RUkn5DT1bvWu4tTx6Bc1Oybbik3LRY2hjrokYrq7/ZKvhrS0nuyImQTek1G3nVybFSfYhZRklNKM3FlpJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781247; c=relaxed/simple;
	bh=IIDuvIHOQMTTGnrfyStRhncgP5pNPZi9zbkhUN5IVBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NWJ1NPRYcxqJVZ9S01qyzOo/mbDWwB/LXMetJn54exfdJtdHTpPZP6S9O1kgBdWm1ey+drJvgJU/BRVzXmdmTnDvjcn1HcqS4HUv1dX22tRLAsI4s66dtPnyYK/n1fkVthCMDxXKYhjOFqZ2lsleQ1Kc4+GwOymJ5ctZ20SYnjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LB5621Lb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso13310765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762781243; x=1763386043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zONaySYMEiPNqUd9TkBEU3WH4GqP1i4c3+qu1BbIJh4=;
        b=LB5621LbtkT1Nj5ut9g4V0TjfmEUgPtLS1GSLRSveqA5ls8kYA4N7IegQXaXpvZe/X
         3JxZlmn3UhjZXohgFFbPDw4bKDwkeXLW1rT3tY1+RWrsePsXSo5e3kyOldxrT3ePQnIF
         XfwHiiyByVOc+G5u9i81gLqUq0FT1VeWw4udLd4E3k3pH2Rb8cpQ83y49YRjT/X6y8GB
         2Gt36bU1VEbGl0BKutvYMRh0DJtdOn6n6YFTV+bUc8ZRgRFXv+QtggCk0LVoN2pYxFuz
         c3UZd6kVTawJBDkmA+GdjdCLZAMwYNYUDX/u6NJVPrmAH88yEnyIOobisU3VG3NdQG7H
         gkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781243; x=1763386043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zONaySYMEiPNqUd9TkBEU3WH4GqP1i4c3+qu1BbIJh4=;
        b=a3Cz6sSGofate39c5nFmK9ULvtNKG3748LHfvuEggMvMLWAs1WCfHd6hSrjdhk6D57
         pn+CAFgDVGagamNUy0MYaoHoLEbstLtS9dfy/Fu3EysrwzYe7dfZquuw7E4OPgj+BNuN
         1IX4hty6TG6WY4NPItaWU6w6EZKKA20dmqAgscWp0MMknWP3kmUCJ4mhpN0mgdBAoxuI
         q8N5uj/+snuslyWbo4NQxyG7xrLGcpMJnWO6tyBcbW5giRFb/wIzcSws+DegcEYWw2XC
         nnbs+hA67GCy06gNYHpiWAU6hqEtuXxMe1Ij/0Dj1HTD3tw+PNQGgcymoYFpo6QN0GHv
         IcDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGDSmcvx2OGH5Dlp6O1Plh7c4M6mmujmTZePpAoLVaAL6T2qG6goV+/aMvg6OadQexuc16DXFKxEvS8QGA8MFY7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRc3AUdbTL02GjiEsJPSNwktIZkNGNJUgItqc5s85btjnUUDj0
	uxSuDTEbs3huCSZ2ZrcbH1TXsueJtwzAOzpum84i40xoIWPau1KW0AGgvAar9yN/Rhs=
X-Gm-Gg: ASbGnctwmycvJzQ6IpIDyc/W0zhKqg/J10T2E9tdwLPCp0k/t7DigFNejkA/B9Lbdon
	J66HfEVH4grqTlIVYcVss8f95xKrpS8Nf3UPj6aulmzuRb04LpehSV2CQOVynEhrkyjqQLz9V7E
	LhjfaYECIMxHnughu9HkPPruvU2WQysGdMkVr+b6xm4QVVnjo3qQntvdZCDnHsn3mYyy+hfc8lD
	zPqVHBPtNheTqN2uGC6ujhW6eyhAm10dsHMW1d3dXMKpZO3di1Vo5zIYoCEI8cBFAmOXIxlPfYq
	FR/Dv3rWmKEwLM5LsxkU82iyVubFRa8SSOxuEfPHs7K+UiobjIFOXVRt7wHgS8IaOiCVxuV1Jsc
	reEoCAu5DLE6zCKL/1CvH2m3bfirarnfstwg9aNcEk1VRdGCtBiKInYl7XhbyetRVCKrMEdZR+7
	EXOf/gx2lYtPcOHLb0Z+lGlkducqDgTiKfvjRBpXq5
X-Google-Smtp-Source: AGHT+IGRjW5jYXUQs3FMSK3rF2Zk8OgQrLJjOb7vJvXyAistMoH7ZmxUoheJZm9Vj55JPADLzlThSw==
X-Received: by 2002:a05:600c:37c6:b0:477:78db:19ca with SMTP id 5b1f17b1804b1-47778db1ceamr53254255e9.3.1762781243335;
        Mon, 10 Nov 2025 05:27:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47778daf2c3sm94207025e9.10.2025.11.10.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:27:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/2] reset: rzg2l-usbphy-ctrl: Propagate the return value of regmap_field_update_bits()
Date: Mon, 10 Nov 2025 15:27:14 +0200
Message-ID: <20251110132715.724084-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Propagate the return value of regmap_field_update_bits() to avoid losing
any possible error. With this, the return type of
rzg2l_usbphy_ctrl_set_pwrrdy() was updated accordingly.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 4ecb9acb2641..9ce0c1f5d465 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -117,13 +117,13 @@ static const struct regmap_config rzg2l_usb_regconf = {
 	.max_register = 1,
 };
 
-static void rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
-					 bool power_on)
+static int rzg2l_usbphy_ctrl_set_pwrrdy(struct regmap_field *pwrrdy,
+					bool power_on)
 {
 	u32 val = power_on ? 0 : 1;
 
 	/* The initialization path guarantees that the mask is 1 bit long. */
-	regmap_field_update_bits(pwrrdy, 1, val);
+	return regmap_field_update_bits(pwrrdy, 1, val);
 }
 
 static void rzg2l_usbphy_ctrl_pwrrdy_off(void *data)
@@ -138,6 +138,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	struct regmap *regmap;
 	const int *data;
 	u32 args[2];
+	int ret;
 
 	data = device_get_match_data(dev);
 	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
@@ -161,7 +162,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev)
 	if (IS_ERR(pwrrdy))
 		return PTR_ERR(pwrrdy);
 
-	rzg2l_usbphy_ctrl_set_pwrrdy(pwrrdy, true);
+	ret = rzg2l_usbphy_ctrl_set_pwrrdy(priv->pwrrdy, true);
+	if (ret)
+		return ret;
 
 	return devm_add_action_or_reset(dev, rzg2l_usbphy_ctrl_pwrrdy_off, pwrrdy);
 }
-- 
2.43.0


