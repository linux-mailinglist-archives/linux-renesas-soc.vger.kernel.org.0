Return-Path: <linux-renesas-soc+bounces-18029-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF400AD3724
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 14:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B33E1749FA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 12:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7993529A9D3;
	Tue, 10 Jun 2025 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YE2MenPW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19929A323
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559137; cv=none; b=bLiUM+uccngoqmBElGaLitj/yCVK8EBWLkZL6+yz7f4F2kI8IVOEXYvVpD9XyXymGOIQ1+UOS6jCuo9ceusC7YkSk7FsIjW1YPk52kv/JwyA5AZpavCTo3q7d85CDZH3TSkZACT5mXwAqFiA0Cvq3PX+zGkNp6bvmIskPTPrqOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559137; c=relaxed/simple;
	bh=fJvfqPGsk3/oi1EB4KGgWDOO8aIhXAMLc2SDMVUtdGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIPc7e/xGqU7fafQKUNsZ1UaH9rfaH6FdmYn4X9y7RZoWlKucyO/g/Yn4F8Y7FoRaC33WCj+kIfxAT9JmJ2Sk6cxmHh2nGa55R40HrNn1YCpbUMDz3FcpjoIGpYvIy5LGQ2U0swugTmBgithCsqO2MTl+VQDAwHffNsaBop51qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YE2MenPW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a5123c1533so3056648f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559134; x=1750163934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
        b=YE2MenPWkoolJzaY74YR8NHJPuBKSdtkmva7d6gCnAlJ6xi62zbUS4sLVSxHWsxwpo
         8jdqJt1/hmrxBNksOJ1bAjb+v/xiTyeqXU02j2rVWw5XXl594fXDDw9Ini16wiEi9OuY
         cCmMW9Yo/jqvd1zffDVc0AACqgejB8FJ1a9lAHsR3mieLb24OqY3YX3TRibEDGYqafpb
         LQuQtC8fdQIgQv1Hwl2mvNcZqIIm3lRbAoMHNC48xugevSoRGQqEntTPB5KNG/aGcdqY
         lergnu2ZclMBXRyDO2XCOmG5kI9gtYNLFJml7VB7F0Jv657lvKjb4DsL5B0GKdv7PILm
         2dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559134; x=1750163934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqgCDDArZ572FHUpAzhS/HBREsxxOZb3IuEva34YUxA=;
        b=XLAt2/wKSgrvmMeQ4Q3ikR9SXYPvbt795ld3il0wHYmT5bz3XE2wHqCho/ZMaTeSZf
         S2HCevSqZCrKX9hWy69q/qpvJ652ODd7myG8O+v5u0cb6kmPIWlPvd3H4kEt2NLoE2ev
         owT3lHVdsb5wFMh4jE67YIlr+rTOOv1FrqNZfSJCrZne+Dno4Yz2k0dhgJbywlOzPiVk
         651qxZV/yrGt4fmf1h8xtmY+figcEf9u1Sz4d/hPMuEuM9VIcwPpXBPZlD9pXruFN7Tf
         MpGd0xu4FvyLYvc9P1U4sDzjV9WBAEehqWtHPYxYXCT0P4uL9vCk8xL9dzmSFU7evRQk
         4M0g==
X-Forwarded-Encrypted: i=1; AJvYcCU3Jg8GY9wAcNXCY9kYQsgLw0S+WmehjqQVdlRz/YWiKCaC96/ExfGn4tpC8+pYu7AQxxyjfpi1817Na1ldbRAgZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQkCv1cZSHgqbXBIdTY6lTzSaOeoTU6wyvBluzVgF4CYnxO5x
	wrMdzR4t9TUzJQj7O9gQafd25CkX/5Xx/zDbpihLjEYxlD9BrUWt1UcGp6DeRh9NqEg=
X-Gm-Gg: ASbGnctBJkN7+QIY8RT9eYEYDXfElTnUZZo2eXX+LOjxKqc9v1EzfOuHKMKk1JdcYFy
	A5MQftsszzSHW3IeR9qxUKTYZwssatmXSNyiEQmgYfR+67FBywffG6QYrSyu5LBqRkYzQ950Zcd
	B0TT16r7kI+F4PbyP52wg/+hc7qd6IgHbZ9YKD/cmZ4QgjrBfHUpe/Yknk3d6U2S0xqNuBYdexv
	4lqe5f8WVBCKNhtv/RtOZV0nMrBgRNEApxOcmxlgLAurA655bbTii8yWasb/9nkPjd7BGUo3svN
	d0yppmRP5Lak4b8nYbZmxxuidkrl/+V7di8NccwlH7LnC2gAYfn/
X-Google-Smtp-Source: AGHT+IHlB1y0ZjbgeXpz76d2couim3mNJe1/2Uc3w3RVGOP5uqdDS0LfEGFNGp3xL5kvkO0RqpYjEA==
X-Received: by 2002:a05:6000:2408:b0:3a4:ef30:a4c8 with SMTP id ffacd0b85a97d-3a5319ba543mr14280976f8f.10.1749559134071;
        Tue, 10 Jun 2025 05:38:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229de7csm12374676f8f.14.2025.06.10.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:38:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:38:51 +0200
Subject: [PATCH 2/2] soc: renesas: pwc-rzv2m: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=w/R5FPd0nERo4YQWYIn9uu2U38SBTYgN/a3aiLLK2Ck=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCdbhUtX31m+OVwib9APVcYmsABA0x2/6gKsR
 TJYlbULcYuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgnWwAKCRARpy6gFHHX
 cgTtD/4kqsZtwhCB7vQ7MmMqpUwLdHHDM6gFISObV14Szp9iMSMPUAyuo0Z78c9gILfz4rL1An8
 Neap+Q/me8JIAApLU4droApbvrB0ktvlH7jGqcjAmn/VEinrHo0ykIA/j1Qgaibsuk+1JlxuBSj
 5iNN3lDlp47ccDM+4EUZ9dK2rty+L1cDfepGeIn0tMSgR6lr6c75u6aoApy9C3H/pAY+ArmWwqw
 eStPNXUmtMGQ7ljd1E0SzkuD8fawtnS6fxAArCS3tUGWvE7ZwFhbC27Yw914vQ2qs3peHTjeFp7
 gMoJx9pLB1GGYC6kGjCcB+tLtkp8Eqe+eXt+IR/HO5EBfyZvrYzb1+GmTcn1i4I4T5XrXkSMOqR
 IrBgs8MJkCFVXP+ayhvNg6r66aicYjl/YNQx20/x44kiOFq5f5uYYafWo4IOvJebQ+SM7xmqj/n
 zeGsPxUFwnlMiVZnrIOfcqxrduv7SCGzKDo1cbgsv3Qo0lL3tpy+YTUhjSLKa+oE+FAd8A7ImkM
 2MsGkCOaAwB7dQpOjoRGsYPDgidCskOeBaFplQqCCuhH04Q17iEzNkhqo/QMnAeLW3vINUrHGKf
 kjzMUw+07BnrOkdsmPPCVGOiBRD2lzYCAhrZZ+U1VYdWMMNqENHqs2JwXT7sJ36zZAWQQA6Cv4n
 Qout1IT46h7Aujw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/soc/renesas/pwc-rzv2m.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/renesas/pwc-rzv2m.c b/drivers/soc/renesas/pwc-rzv2m.c
index 452cee8d68bee7d04e7acbee6bd90dab457c77c3..4dbcb3d4a90ccd2796e26d6250aa246b32b09285 100644
--- a/drivers/soc/renesas/pwc-rzv2m.c
+++ b/drivers/soc/renesas/pwc-rzv2m.c
@@ -24,8 +24,8 @@ struct rzv2m_pwc_priv {
 	DECLARE_BITMAP(ch_en_bits, 2);
 };
 
-static void rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			       int value)
+static int rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			      int value)
 {
 	struct rzv2m_pwc_priv *priv = gpiochip_get_data(chip);
 	u32 reg;
@@ -38,6 +38,8 @@ static void rzv2m_pwc_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	writel(reg, priv->base + PWC_GPIO);
 
 	assign_bit(offset, priv->ch_en_bits, value);
+
+	return 0;
 }
 
 static int rzv2m_pwc_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -62,7 +64,7 @@ static const struct gpio_chip rzv2m_pwc_gc = {
 	.label = "gpio_rzv2m_pwc",
 	.owner = THIS_MODULE,
 	.get = rzv2m_pwc_gpio_get,
-	.set = rzv2m_pwc_gpio_set,
+	.set_rv = rzv2m_pwc_gpio_set,
 	.direction_output = rzv2m_pwc_gpio_direction_output,
 	.can_sleep = false,
 	.ngpio = 2,

-- 
2.48.1


