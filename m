Return-Path: <linux-renesas-soc+bounces-24995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C65FFC7AC27
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 574764EE100
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCE735294F;
	Fri, 21 Nov 2025 16:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYecGX1x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F17734FF6B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741343; cv=none; b=NrLzYEnN8w7AZ9zq4dvuzg0MtQD8pX0xZ0P12jMjwFCs9+C/QQaqsmTbKjETCXHp4GyhZ/BAx9VFpQhH10zxG6AENcBLyS+hKorzrwrdxpIXrCSvrY7dMpm+kjJK8O2VlhnTxP/xoslek1lvZUE8mZu8PYfVb0ZDopyXmaWVk24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741343; c=relaxed/simple;
	bh=u1Y+j28vGrv/nUf5bQmYDxuLP8umo9b+fTawAt0kWDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZlmkeVVri80/lEczPKyQWbTsC1gwlcNWWeRmtKyMXq9/LV9Q+bjHTsCK3chMi3TVrKLo9O5HGzOK1dMYIMK/Dw2ewMxRIFCes9gCWgZbt+1IErD3lLpbug4OQ9cumQpTQgFtwEWjszfSGuQkOplm3YpRin1OGQFqb+9JsAxXzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYecGX1x; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so19871945e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741335; x=1764346135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9X2AnPp8ZxXuacTaqkoxA0nNfMzhjfVhZceDnwCyffg=;
        b=NYecGX1xyMX0Qod6vEJUkJxxszL/OMous6VGrwOgx9aSihgg8wxdyG47hUVd9v6f3R
         0BztEVwmmn89AK54u2Dlq/sqR6ahcMsxEoHrCPZZKCV1XpvdP/oLiT18ZyQYgaPnMAlX
         VZ+KPpBcpI2Ga3ohyePODygrrZ78plwOPiurCNrVC20S1XgKzmqLlCllawaLCQwbW4mj
         7tarh6EyAPgn62u8uLB/+ZP9cEb4A1esKUFiln0OA71qjnQeebU25Dl1la3goc/PQc+t
         ck0jcJm6Htfvcr6FEVtwcC7AggsS2YWt9MPn7QwRvyf9dWrl4PZws+okdKxp1jRXGsMX
         Cqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741335; x=1764346135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9X2AnPp8ZxXuacTaqkoxA0nNfMzhjfVhZceDnwCyffg=;
        b=Bxr7c2DJUcQ6TOc0iO3+0GbUvJpXAK6u0fGk5Zk/yUZSaMNwo6TuhQx4j+dXhMm+aR
         Z+TTFcU3uc0LsE6vYgSoseJ8X9TYJLZkVrTuhMB0KDKFtT4XmAlpmdYbavKBMzo2KHzH
         yLHl+V3ciYJwWIRj16EbXFLljKYd5iZoa0zT/zJIDb6Ymm1glzenyT7ytAdJ8Sc26cfJ
         CmmNHBU8cEhwuYTvTkgRMXgXKtI2NhAVBx1hE9E/dgMZeTOautw1tohhK/4QhoK1k9W+
         MhTBNZ8X3v8PcjGjXkmnijcFsJtZzDOKutahxWcTx1rzOObkcl2mlVfru0XEi85UV5fI
         zvvA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ2E5+nCKjpShHENR/BJNxvof76GnM+DqAImawbH0Jq7jbk/QQYSudgjZDoprd76M0+FqrpJb+EVCvciQTjvOuWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxesAMq1fOiKXUFYhdhDCPXBA0bIgO5nM3ZgClAF1Werrz3q00E
	o1LX+a+U5yyILL/QqRQs29kGjT9/UlXC1QYViuQRqHS4SJZaaivBImU9
X-Gm-Gg: ASbGncuFhnPq4yM3L2jMmsJ2DTTjmc5b0aTu1dErEZ5Jzp7x4xE1pdkGbLkgAQz4Ui5
	0ErVcGvT5lR99joROeG8lm1lh4KtR+QnDTkIOJDjY+xB5L6MC3o98hRsLmcM2XkGM7T3RW/9n/o
	VKdFxl1twVEq6OujIA1jOgHxeU7shj1cmxiXrdXfsgp1MXQOIlI2TMSVlYerTiwNbiXdNVYEa/d
	2jHVsDASn097lC4+In114mkH2bCh64lKqqpD6iNedtOsQyS5ze3PNtuVwFN/7jAizt4uvez/uE7
	nyT+ywZySCr5nbpGdfNsQmD1w1AEhhdWNkWI6lH45DYEdxKQGwvCT2oCzbH4PVS5OUydRVoed5d
	+OHzTv6Guw2xNKxQqEY9ofyuKhdz+GdWXuHLvA7bYFTIfAAWLGQGbVpp5RMPtoh1Ju/JqIbApuq
	NGWE2asFx6x63SgaZs9ftZRL/elGfmlartlHqcCKb/cEuA1qAft8F/iWNPCNZKSFTO1VPozxQ=
X-Google-Smtp-Source: AGHT+IFdUGDVUhzEKPiwAAiM3uKkMg/yNhgZucNvNM8JWBuzLF6Yj/qFVOOU3tdSxtoFNOsY6csCRA==
X-Received: by 2002:a05:600c:3553:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-477c016bfffmr30193435e9.1.1763741334552;
        Fri, 21 Nov 2025 08:08:54 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:54 -0800 (PST)
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
Subject: [DO NOT APPLY PATCH v8 14/15] pinctrl: renesas: rzg2l-poeg: output-disable request from GPT on dead time error
Date: Fri, 21 Nov 2025 16:08:21 +0000
Message-ID: <20251121160842.371922-15-biju.das.jz@bp.renesas.com>
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

Add support for output disable request from gpt, when dead time
error occurred.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/poeg/rzg2l-poeg.c | 19 +++++++++++++++++++
 include/linux/pinctrl/rzg2l-poeg.h        |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
index f66f69c5b1f7..d59e18832adf 100644
--- a/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
+++ b/drivers/pinctrl/renesas/poeg/rzg2l-poeg.c
@@ -92,6 +92,9 @@ static void rzg2l_poeg_config_irq(struct rzg2l_poeg_chip *chip)
 
 	if (test_bit(RZG2L_GPT_OABLF, chip->gpt_irq))
 		rzg2l_gpt_poeg_disable_req_both_low(chip->gpt_dev, chip->index, true);
+
+	if (test_bit(RZG2L_GPT_DTEF, chip->gpt_irq))
+		rzg2l_gpt_poeg_disable_req_deadtime_error(chip->gpt_dev, chip->index, true);
 }
 
 static irqreturn_t rzg2l_poeg_irq(int irq, void *ptr)
@@ -353,6 +356,9 @@ static int rzg2l_poeg_probe(struct platform_device *pdev)
 	case POEG_GPT_BOTH_LOW:
 		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
 		break;
+	case POEG_GPT_DEAD_TIME:
+		assign_bit(RZG2L_GPT_DTEF, chip->gpt_irq, true);
+		break;
 	case POEG_EXT_PIN_CTRL:
 		rzg2l_poeg_write(chip, POEGG_PIDE);
 		break;
@@ -360,6 +366,19 @@ static int rzg2l_poeg_probe(struct platform_device *pdev)
 		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
 		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
 		break;
+	case POEG_GPT_BOTH_HIGH_DEAD_TIME:
+		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
+		assign_bit(RZG2L_GPT_DTEF, chip->gpt_irq, true);
+		break;
+	case POEG_GPT_BOTH_LOW_DEAD_TIME:
+		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
+		assign_bit(RZG2L_GPT_DTEF, chip->gpt_irq, true);
+		break;
+	case POEG_GPT_ALL:
+		assign_bit(RZG2L_GPT_OABHF, chip->gpt_irq, true);
+		assign_bit(RZG2L_GPT_OABLF, chip->gpt_irq, true);
+		assign_bit(RZG2L_GPT_DTEF, chip->gpt_irq, true);
+		break;
 	default:
 		ret = -EINVAL;
 		goto err_pm;
diff --git a/include/linux/pinctrl/rzg2l-poeg.h b/include/linux/pinctrl/rzg2l-poeg.h
index ed3e08f10834..5edf719c155d 100644
--- a/include/linux/pinctrl/rzg2l-poeg.h
+++ b/include/linux/pinctrl/rzg2l-poeg.h
@@ -9,6 +9,7 @@
 #define RZG2L_POEG_GPT_CFG_IRQ_CMD			2
 #define RZG2L_POEG_GPT_FAULT_CLR_CMD			3
 
+#define RZG2L_GPT_DTEF	0
 #define RZG2L_GPT_OABHF	1
 #define RZG2L_GPT_OABLF	2
 
-- 
2.43.0


