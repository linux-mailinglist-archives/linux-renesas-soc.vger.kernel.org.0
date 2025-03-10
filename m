Return-Path: <linux-renesas-soc+bounces-14204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7DA594C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D9F218889B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 12:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E4C229B38;
	Mon, 10 Mar 2025 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jyqig6gZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B44224B07
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610433; cv=none; b=EvJ+lFG6GroVX9z5t5/VQhecChapLjqpd9M12upVI9mrJA9VzZM4dtNpXZVdgK20Ii8Q1viFc6SFtRyjrpC5Z82/+am3xhp/REU1KH6FUrBishAEpEIcNmjX/lTR10PkdylKszwDBHHRN8C5csWOVx45GWfNCISfr/Xp64U2cCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610433; c=relaxed/simple;
	bh=br0qgCwXR6IILS/HJMnJoxXyosKeHcCMyBKnZ2REJ5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZQuvLQoehlOT9GA5CrM0u7UqLRICE8D4XQDSTnN9sns8xrcJhmH/dHqUl5WIhG2zZA90tIi8taXrBNWJHbp7dOsNdzGHXgp6KRDZtZH/74Z5WbDKr+OoBwvvjrOqElg3RcCnxqYQsDST/ZbzCvuCrix2/xmjDUsH/dnumS+5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jyqig6gZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so3446885e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610429; x=1742215229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExDJc9PeCSc2zmT6lc+tq6m+jvUQwjNZ5eNvB72f2YY=;
        b=jyqig6gZQ0nCiULpAf3nGzcp79wfbJKx/fEKbwNCUttgwl+rt4Dnmt6dweGSNQbign
         DvMHem/0toB4npvftOAD1wU+fQO0nPpL+Aj9y+BsPYkh3H/FoX87oEq+HtVPp0GC3Ykx
         poZKpMlEGs1YtkmInF7FAgEzg7+mD5xgMxjkmXapVKEkrEi8xUWzGPD8NW8uoqF8XcBg
         sYVlOFWdVBnemu85711Km36qWuKA0oLA2mZuwnzNV5qpYw24lRaYFpcn4XENfI7tfyLL
         yETXjzkRUawY5VSVGYVQxnzwF54+qEqU1PLnpoq9hhlREd1lR+rat2Tm9Ld4SpeeTpFA
         PzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610429; x=1742215229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExDJc9PeCSc2zmT6lc+tq6m+jvUQwjNZ5eNvB72f2YY=;
        b=GyvsMcWuqKuHI3mZf9PhqIQTbc36FZtnWjhJNHiqYn+pSE/0XAMzKfRGxIjzsstwQD
         PuC4G1Bkn3N9Dg0E8PctYWYGS6FqHEy3UhzF/8nTfh1frZexInbxf+oQUPcaEUWBcpOe
         oA8OAkC1GcK5CSNpAOFekeSyFnH/61kZl1KqIoOn4nXzAYs7rCr8ArPuHxn0+I0EYmit
         YP9ft4TKJ27jaiyX4EtVjKfL/2occqk1qEo7WZhxVZZ8CEU9f2TUJsi1L0ZA/W0ZAqje
         tmeskUDdACg4bzpxFngjNzD8Yz0FrQL5GwD9VT7DtisC5Efs4r839p/rpPZ1RuEB3Kww
         vGqA==
X-Forwarded-Encrypted: i=1; AJvYcCVrg/2xiYoe2xSQs1HnbcSHfnmDiKmcwAnlhd+JaBnPiC83fZlexl+Mdg5h9oBHl2XBdvDrW5lrqr9gWQ1NFn9e2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyptjRqajDMI2MmVgHf6XcdbJpLRY6h3m2qOIX8I4AH445xtAaT
	YZENtOPIeggMjz2XGIRLWKpiOmpdffa0MAxPPjqBfD/ErItOvISALWohzn/TriE=
X-Gm-Gg: ASbGncuHJynI8TnYeLT6k4sMdSZZaa0ZtLJfRS8ynzgXYJDk+o/t3KDBhfClhfxtZfd
	W1Q7Hteg1YKrJrsWQPGjJg+NkqvSApvmCGX05PBBk4+rry8q+630y2fmL/gwHrd/dT8GrC1dZbo
	c8Jrgyti2NaCgPG7rTwLFpViA6H1dbmhGDoVQ/RIlHiB+85s4i1NUeyL38PKfKswkmb9YLfglsp
	qzhb2uwaH7yxUhI9tTnZ1lGV5vRuzAQkPMIEv6scVKQWgKgynwNWpUIQVNmpg/GrYgt3pOssRb3
	owJhglponB3qwQ6AH0ncEsyfTkK4EZz1WKEE6FcIGJZuonS2
X-Google-Smtp-Source: AGHT+IFR4eU8W3pLo7eGZme/v2IPUi8jYvj7XNPiJwIbpKFova8nZ7EiLJqrg7eufMPKCGOAKDZk6Q==
X-Received: by 2002:a05:600c:3411:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43ce8a50bcfmr55669035e9.16.1741610428892;
        Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:17 +0100
Subject: [PATCH 03/15] gpio: bd71815: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-3-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1712;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6eI9oSEZvQ/zRQ9ewG5oMx4x49O1IBi4OsEUA4Kgf+A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt21t5hg45JOHH4FIQC8J2+lEXuZA+Eo1vWQx
 d7HdKIRoXiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtQAKCRARpy6gFHHX
 cjyGD/0SGk000FmhJu2Sr6c1Cl9SGsiT2TcHqvF8b8i+n0CVrJ5B3pRnyj2DXREnxyRGCrbyhdm
 DcBI/oty8LNJzRcjkVoZBhikYQACHOVwlQYKr+GeX8vGSyAQ+4tCMtu3Bpoqo3lLqq6NY0Cwvyv
 w3X0l0mIFjjCcqEHUhqAImv1/mQEa/kJlU4FT2E6vm1q2/YkhlMJQsQMbVXHY55eu/pVt3wAY7R
 /j/tEAbkjIPVTg5WqmjQUCD+M+4m6qG1E+Ike1bmFBz+LnLhHMzo4tLKPSc6CAxKQASkLBeWXeq
 AZGJuKNwBjV7BN3goJZXXpSVTugCcxaIA2aAghnJFbW73kYWSOGtRRaUIoP4JamtEj6PnNvwEqu
 eNTyMvYRx5AJoqcZIuK8H0X72khuVADHxwB90dObjOBFrQNXmjxc9lVDhcrGjdEoaMDLefa0m2E
 fnM2TdI5IhfI9mjcwIV7XVtlj0UpDBbqRt4ICb+kZclM9ezI0sl9d9MRvRQ4yvarBAyzNpuh5iP
 WJgkdZFlzHQzvlH5/zyVbtVj6fhF8iGV/BYVD+m2En4UHERaTpmYiKXKCKk240LGxUV2spZY3qR
 Oy3L+kB6vnM7MTvQYIWn3HStDtNQlc0gxQchDSn4+4sHsFN5BpMguhDL/i4oclpLN/HaAFDMn/S
 XDIX5SDT+taWgng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-bd71815.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-bd71815.c b/drivers/gpio/gpio-bd71815.c
index 08ff2857256f..36701500925e 100644
--- a/drivers/gpio/gpio-bd71815.c
+++ b/drivers/gpio/gpio-bd71815.c
@@ -37,21 +37,18 @@ static int bd71815gpo_get(struct gpio_chip *chip, unsigned int offset)
 	return (val >> offset) & 1;
 }
 
-static void bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
-			   int value)
+static int bd71815gpo_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct bd71815_gpio *bd71815 = gpiochip_get_data(chip);
-	int ret, bit;
+	int bit;
 
 	bit = BIT(offset);
 
 	if (value)
-		ret = regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
-	else
-		ret = regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
+		return regmap_set_bits(bd71815->regmap, BD71815_REG_GPO, bit);
 
-	if (ret)
-		dev_warn(bd71815->dev, "failed to toggle GPO\n");
+	return regmap_clear_bits(bd71815->regmap, BD71815_REG_GPO, bit);
 }
 
 static int bd71815_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -88,7 +85,7 @@ static const struct gpio_chip bd71815gpo_chip = {
 	.owner			= THIS_MODULE,
 	.get			= bd71815gpo_get,
 	.get_direction		= bd71815gpo_direction_get,
-	.set			= bd71815gpo_set,
+	.set_rv			= bd71815gpo_set,
 	.set_config		= bd71815_gpio_set_config,
 	.can_sleep		= true,
 };

-- 
2.45.2


