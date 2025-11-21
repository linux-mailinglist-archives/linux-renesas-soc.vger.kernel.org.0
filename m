Return-Path: <linux-renesas-soc+bounces-24994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB9FC7AC15
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 458D23682AF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E90351FC9;
	Fri, 21 Nov 2025 16:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwte5jL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700EE34F487
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741340; cv=none; b=FiKmpnQUu6TFFtrfXzEw1cnfcFMjGB684VBPUP+yvmKD9ioNUISKFLAc6+dLOwAuQ1SJ1YIKGlX0CRreqY03wRnCE5UvSxqx4QRYhSwji0c2P6ae7C/F3iOzpM2fOjJW5ExRgBnfNYHdI+vHhp9fkzK+M9KZDiTSFgpocqkBBjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741340; c=relaxed/simple;
	bh=Iw6l252MZl0FeFc+DclTkJ87JJ+JB7I8jUGzUzGqMrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQalY3Eo07CUvIA7jkOFg1yHCbjjkMG8VzZqNGgCpvo+hI2SDWVnEkX9lAwAdy/bM7FHkGKSRH4hyCtpQ0FxUrGDFi3+YXvQ17GIwbYNpJg7/aJwMa3Y0GIuHjzm84Un9V+i5iPfpFJMiqgggv5WlsAWXtaRAcx50obqasgrZpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dwte5jL5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso10204775e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741334; x=1764346134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/ScgVps3JYSEsrwjx9vO4q3JpMQ/hA7wm9emPNcXcw=;
        b=Dwte5jL5WgsbA6mJwHBF0j41UHbBL09KBnlTcoD3pL8LcI+092Jye4KUya7fQKE6t5
         1gpeSHMcY84fmvYYEi57Tupktfg0I4BUPvCvXJcdrXMhx6LR93o1DZovXaBemB3e43KP
         awKYDx5bS8iPTYNaBnmHeZwwZ5qZ1le/7QlwfFA0U/1nMVS7BWBTBPYIL2rhYjX0D3h6
         zvpSXZR1OeI85/+AcEvfrZNj0hVMowkd6iy1J+lmHHBlXD6MUXkLzi7F/WxH5hehbSsn
         9o7KZyyEhg+stJ5s6nT4KjEjT/1+3tNNc8xurLZnm4vtFWndGI50djBVXjaSoS+2ALG5
         0IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741334; x=1764346134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/ScgVps3JYSEsrwjx9vO4q3JpMQ/hA7wm9emPNcXcw=;
        b=Bcq5OPFozm9uPqCP1fJ1rh52icOI72nLQ80LQzVTYrpl4TVNtWOHNt6pKP8aZMUYBe
         jqnhlaH0uCt58h89eKF8IzvPCDRilPovZQBkDpW+qipi2P+7qw0G+W9bjUaCZGfIlyKc
         0t6Tfzc7UfBa5ZCjSvkvD7JfX29AaLQSZiHUL8Q4gctnWpNcErMp+SAIrUhlC/qvD4mr
         Ga4YUosbIielwaTRM8IprxcCdJs+YzVxxNRvLQ1SLQ5wNwDIZbUKgyuY0zD3nGm8c4jd
         NnOFa32HsAW+C8xMBHfnIUHEAMvzPWfzSdW3geXaTUbKIp/DUD5R/Y4R9LwJmFlhzsM1
         Kduw==
X-Forwarded-Encrypted: i=1; AJvYcCWMIJlL2xcixI6HagR0IC2awk2A7rw7SjzCBZB2621waAOHAXA+72euSvtlxH2vo9CM3OgWoPYgSiiamwGTAtovEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjC0vzcVn/8JVR2aDb6Nzz9wD/YNZaMk1q1X1a3HwgBJL/ib3f
	zYusXwp8/YkP8rU3nS4usDrH1ewq2XvMs/LTeXBEaY93+2hyiOL1/07o
X-Gm-Gg: ASbGncs1OOsY34kCJ7SVQ1w7BwwcU3VaIxjoGOIjN8v6aOagLNIX13SxGiA5tjtVSxf
	JqwDzPJytgdQOLX3o0xCAzCdLIG/n6k24SWDboYitv5z+ILKoDkbTRLX+Wc6jLiOMdk0bGFajSr
	NvIxOM9PTEbjS1yr295ZO3GS8UEMdw0cVAY8UNvWkP/2xJ9rfNZLsf0sZvE/CAs/xHZnnojOrAT
	DRcUhoXQwWzqT6Ls92PDJck2sma+H5SuTKtDQW4DyvEWBf7mL1nKoSwlmjpEmx5boYcfA3/K03a
	KyklImDZudI+RV9tNd1RG3D4cJX+OCOrFrfcjKWO8CtD8ZigODA/MahlyUuy1pBOUpmp46Z8kp5
	8nPC63fy4jEugxWJalINopiePfXpJswLA6hcQ4kgGW44zBNKpQLxibUFwiU+mGrlcXBpnh6e/Te
	5zQpeuZasvJKxwm524OSC/rEbLRdgfNhpdA54sTkH0LP5ftRi4OcchO1KfF+Q1Iup/NMN3elw=
X-Google-Smtp-Source: AGHT+IFkkMDNDqVwLmiqVKk/voVeyLEFueEAgcn0XcYCXcVY+pFazy+U4WRItnCC6JMVveasHarPjA==
X-Received: by 2002:a05:600c:1ca0:b0:477:75eb:a643 with SMTP id 5b1f17b1804b1-477c0165b4emr37258095e9.4.1763741333994;
        Fri, 21 Nov 2025 08:08:53 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 13/15] pinctrl: renesas: rzg2l-poeg: output-disable request from GPT when both outputs are low
Date: Fri, 21 Nov 2025 16:08:20 +0000
Message-ID: <20251121160842.371922-14-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch adds support for output-disable requests from GPT, when both
outputs are low.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c | 10 ++++++++++
 include/linux/pinctrl/rzg2l-poeg.h        |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
index 3dd8bc3465b1..f66f69c5b1f7 100644
--- a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
+++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
@@ -89,6 +89,9 @@ static void rzg2l_poeg_config_irq(struct rzg2l_poeg_chip *chip)
 {
 	if (test_bit(RZG2L_GPT_OABHF, chip->gpt_irq))
 		rzg2l_gpt_poeg_disable_req_both_high(chip->gpt_dev, chip->index, true);
+
+	if (test_bit(RZG2L_GPT_OABLF, chip->gpt_irq))
+		rzg2l_gpt_poeg_disable_req_both_low(chip->gpt_dev, chip->index, true);
 }
 
 static irqreturn_t rzg2l_poeg_irq(int irq, void *ptr)
@@ -347,9 +350,16 @@ static int rzg2l_poeg_probe(struct platform_device *pdev)
 	case POEG_GPT_BOTH_HIGH:
 		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
 		break;
+	case POEG_GPT_BOTH_LOW:
+		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
+		break;
 	case POEG_EXT_PIN_CTRL:
 		rzg2l_poeg_write(chip, POEGG_PIDE);
 		break;
+	case POEG_GPT_BOTH_HIGH_LOW:
+		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
+		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
+		break;
 	default:
 		ret = -EINVAL;
 		goto err_pm;
diff --git a/include/linux/pinctrl/rzg2l-poeg.h b/include/linux/pinctrl/rzg2l-poeg.h
index 311405b0137e..ed3e08f10834 100644
--- a/include/linux/pinctrl/rzg2l-poeg.h
+++ b/include/linux/pinctrl/rzg2l-poeg.h
@@ -10,6 +10,7 @@
 #define RZG2L_POEG_GPT_FAULT_CLR_CMD			3
 
 #define RZG2L_GPT_OABHF	1
+#define RZG2L_GPT_OABLF	2
 
 struct poeg_event {
 	__u32 gpt_disable_irq_status;
-- 
2.43.0


