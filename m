Return-Path: <linux-renesas-soc+bounces-33239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IRdLx9UF2oPBQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 22:29:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 220C25EA102
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 22:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3704F303C01C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 20:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E993BC69C;
	Wed, 27 May 2026 20:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="No482oI8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E02D3B2FFC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779913418; cv=none; b=uPGqglxmEteTtt52BLt2wPjSZybOmoBapFx+lt3ZeKanX8NB2qgRxffh6Og8ppYBamDpqujKF59kVdBvKAgTt6QR99zHJN5pRK6kKjWtF6n1pGAmBhHn8+7y4ZpacZGW+UCbEDUBLqqgl2xXQINmxGDPVkrbz+wtMy9eVp+gyAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779913418; c=relaxed/simple;
	bh=BSWJULvoBmQ01varBYGhf90UhppUbekoIBkxkLvAH7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W6my958zW36/sxT2vOuJdGQ5pqazKF4ip9iroolYEDUTCvfRXT0qthBYEplayokb7gYmvSWvE5b7uLQaDjUtypEHY5Y+B+p6R/socEKPZPzPbHrwOh2Yd2WUYDc6eZ4mVS/7aEkNKSnfRvgqSAQZ302nCriCK4Uva2jmkRQZWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=No482oI8; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so5427078b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 13:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913415; x=1780518215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn8TgOXEJPkKfmJoKgQlP84ES1byNpZd3Py/qzmBsUY=;
        b=No482oI898s9Z5JPjUgpl2nGRgXiOO88bE7K4NCkfLpS+HuTScs9ryGL+bOAe3meYX
         SGNaS2U03fwmrsQKNKUBfYCuKBY/2tMx1F1VF/hYAHlSFD+MiDBh7eHjunuM0jk75AIY
         PjYiIztNx1UAfSGdGgbkI20vDiVSSnf9p38VUjO7c/YfklxTlcq1V0uyI+JqGziMX4vu
         eZDhr905ks66pjBrhXtvokLl3SLiMYAdgO4Xwqn8OPHlSahAcuWkLrXewzH2lqZW+wnZ
         g0UtWtSKEf62Q7bk+EyuJsw8fKe3qkm4hKl5Px2uWNJBHgBNobGxBEpX3HW5hAlr8V2i
         HekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913415; x=1780518215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cn8TgOXEJPkKfmJoKgQlP84ES1byNpZd3Py/qzmBsUY=;
        b=gVavmGNej6MLkRanL76j48NnAZCn7IFFdTYDPEiZ+IS3vMr/3rJZlNzTnC+gBdVwxc
         7pgFs30z6CXK89arKyoQx1v97Nho1Uu6K45VD/xFbBe/kCdFlNJT7BptoD1RS0jzXEU3
         MYTnJamd6+G5fxLqXiveI4QJPZaruh9/9IpR2hzKD/4yDfoiCd0p3HkuE8C/ZdgCBncu
         bq0K925oO97iyAWLtZNp1+eF0vJdGpk+08pBREH5o4PATiEJ/abPHOz6sn301KgdxX7O
         59o2Im9qLISy7AwwgEVSfvJJGYyIpoAHGoET1LN65HlQF49tMDx4dJXV8EJPzDewdfJX
         fyJQ==
X-Forwarded-Encrypted: i=1; AFNElJ8c9MYAOr38Ngyx+pmbQbqpvFwDqL54BsKOgIzN50dMdT5Lgll90HAyMq1cXAGf7EANoUagXRpzKjD19heA3TAJOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZ7zZnHntg5Lr1I0UkFKacV30t2EU5gFlx16J2XXN046zSxJE
	hxpegikqHjAEMkL92g1VXZhDT3BUGF+xaIpGLQ81pVotEOpgHt5U6ZvpcXCK6Q==
X-Gm-Gg: Acq92OF0r2FZTgWMvmOrBfVnxVUTJbDOnBBuun+Gt+2yjPoABrCjimzeYSd6QsxPJa9
	/Ek85VxG7GbDuM8PuLQr3LSlweERkLrWVCHYDsmcOJiCUPcoFI/n7qRwzfIsU7+6iG1gyzda3GG
	caCor0Ch+lj3BGoDzr25R2+a+eZP3+PVPmOqciiQSkDltHzAgqdrjNwYtIgUJ7NIQckQz6HKdwI
	QIYMxXfUo9ufzSq0ZV69RhsL5N9k5RrTxy2Lpc5zmBA5Vjs6p4XJW6EUB/jwFsl5BvI/mq5ciVg
	PzXrX6kSxhVWYUD/7VziiTq23T2y1++CSPcve8KfPFn1wVp85WnmnVa00pM6atu7s0qLAaYXUmF
	fxGTwT8hov3lDQduzPdJfzyRdd+rIJ3xNMOmqcpRqPWRnrIR5IU46/rGDw1jtH0zorpVONoWueE
	OrPDvuPEFFcyLqrWQqDTXvPUEesOTM0y545Y6jUvGEiidew7zxcqLghhSdszjPWb+cjfyAX/dYq
	eAd6hfcMfFuV1r01JJ15ohyoNiXsR4BaTeSf7JXYeDnEKErVR4I1VLi
X-Received: by 2002:a05:6a00:a92:b0:83b:b0c2:17ea with SMTP id d2e1a72fcca58-8415f544febmr23916071b3a.37.1779913415482;
        Wed, 27 May 2026 13:23:35 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d6e80269sm3330540b3a.4.2026.05.27.13.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:23:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-renesas-soc@vger.kernel.org (open list:PIN CONTROLLER - RENESAS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] pinctrl: rza2: embed pins in the priv struct
Date: Wed, 27 May 2026 13:23:17 -0700
Message-ID: <20260527202317.5347-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33239-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 220C25EA102
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Turn the separately allocated pinctrl_pin_desc array into a flexible
array member of struct rza2_pinctrl_priv, annotated with
__counted_by(npins). The pin count is now computed before allocation so
struct_size() can size the combined object, collapsing two allocations
into one.

Change npins to unsigned int to avoid potential overflow/underflow
errors.

Assisted-by: Claude:Opus-4.7
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use unsigned inr
 drivers/pinctrl/renesas/pinctrl-rza2.c | 28 ++++++++++++--------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza2.c b/drivers/pinctrl/renesas/pinctrl-rza2.c
index 8618f32ed26a..15ae5a88d705 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza2.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza2.c
@@ -44,12 +44,12 @@ struct rza2_pinctrl_priv {
 	struct device *dev;
 	void __iomem *base;

-	struct pinctrl_pin_desc *pins;
 	struct pinctrl_desc desc;
 	struct pinctrl_dev *pctl;
 	struct pinctrl_gpio_range gpio_range;
-	int npins;
+	unsigned int npins;
 	struct mutex mutex; /* serialize adding groups and functions */
+	struct pinctrl_pin_desc pins[] __counted_by(npins);
 };

 #define RZA2_PDR(port)		(0x0000 + (port) * 2)	/* Direction 16-bit */
@@ -289,21 +289,17 @@ static int rza2_gpio_register(struct rza2_pinctrl_priv *priv)

 static int rza2_pinctrl_register(struct rza2_pinctrl_priv *priv)
 {
-	struct pinctrl_pin_desc *pins;
+	struct pinctrl_pin_desc *pin;
 	unsigned int i;
 	int ret;

-	pins = devm_kcalloc(priv->dev, priv->npins, sizeof(*pins), GFP_KERNEL);
-	if (!pins)
-		return -ENOMEM;
-
-	priv->pins = pins;
-	priv->desc.pins = pins;
+	priv->desc.pins = priv->pins;
 	priv->desc.npins = priv->npins;

 	for (i = 0; i < priv->npins; i++) {
-		pins[i].number = i;
-		pins[i].name = rza2_gpio_names[i];
+		pin = &priv->pins[i];
+		pin->number = i;
+		pin->name = rza2_gpio_names[i];
 	}

 	ret = devm_pinctrl_register_and_init(priv->dev, &priv->desc, priv,
@@ -482,12 +478,17 @@ static const struct pinmux_ops rza2_pinmux_ops = {
 static int rza2_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rza2_pinctrl_priv *priv;
+	unsigned int npins;
 	int ret;

-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	npins = (uintptr_t)of_device_get_match_data(&pdev->dev) *
+		      RZA2_PINS_PER_PORT;
+
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pins, npins), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;

+	priv->npins = npins;
 	priv->dev = &pdev->dev;

 	priv->base = devm_platform_ioremap_resource(pdev, 0);
@@ -498,9 +499,6 @@ static int rza2_pinctrl_probe(struct platform_device *pdev)

 	platform_set_drvdata(pdev, priv);

-	priv->npins = (int)(uintptr_t)of_device_get_match_data(&pdev->dev) *
-		      RZA2_PINS_PER_PORT;
-
 	priv->desc.name		= DRIVER_NAME;
 	priv->desc.pctlops	= &rza2_pinctrl_ops;
 	priv->desc.pmxops	= &rza2_pinmux_ops;
--
2.54.0


