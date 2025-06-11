Return-Path: <linux-renesas-soc+bounces-18072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC3AD4C94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6F55179672
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 07:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EB4231839;
	Wed, 11 Jun 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vIbWYc+P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0F227BA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 07:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626883; cv=none; b=eLHLMeWjoFDgnf04ZN6zUE+6/K8zEN4a0HRcsvRvr/pPuHXkUe1Sg/JZaeH9hDTLci89KtpVuKFHJjqmGXhfHKdZa6SW7/X1XxiupTNAjCWOi52c0dTNxXfxT1ktoTr0cHV8oX2sbGOuRLiXtE7NMotsziQXpRzYBj+g5JKTv20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626883; c=relaxed/simple;
	bh=+UkZcZhV9av7citUgt9NqSKdFGeoc2sgbcgBT2molbM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q0W5F8DSTX69qmF+J6g2TLijQvl0ynZcyJ931A6ZTzUHbStHTDuI+btW06XKtxBTJqguLArWz0soBFoUQZaU7ZILltSC8WvoryhCz1xSg9gaM2X9BXFyM+sURM7C6wigy977hhfmDsZVgE8f4OQasUx5gZ1Fi32II5pvZZAJO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=vIbWYc+P; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3788443f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626879; x=1750231679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ptGJSBQzqpHt9lR50i5Ue+3VvxjWOQyle69MfvMceYM=;
        b=vIbWYc+PhIvaWmET4AYICbo5s8Eb0LG4N6nr4E9KOQNbaOwVGYxE+45wuuhRpSUO6G
         aPsIYdX8v3A8tde0ytKbJ6K/DtmP2Ugc4M++3UXgiGvkSv5ZV7vQV091gej6NzWBBb7N
         Sm/QfB564HGvtOTYWgnSjj6Ap1G4+4PxnXK+2mIUS1TuyBwJmPMsEklYlbNKdZ8WHmJb
         7Dwrhh383fVWdE/TPV9Z0EFfoAzhEiMiG7eoaHquriYypNn0Qz5Vv4hPTnzkEapm45HM
         wlgoJV5d+FgNjADdwSCoBcf0Er/K0rJKOv67QhrD/sBHJn/lpMcn+avIvChSDSCL6sTS
         pGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626879; x=1750231679;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptGJSBQzqpHt9lR50i5Ue+3VvxjWOQyle69MfvMceYM=;
        b=BNIWlciXg/oY2IZMQBwdk8pEP79ngBRij7qTn333a28iAC6QWAPkBz8vqvlN9MIC6b
         sBxiD/rFz3nrIeIIU8BaciLCOOsM44URsh1Ftaz5atMpci+wkewLz71AixSLM/MhYhot
         mW8q1a6uQ4wePQ03pcPCgn+ei8cB1WNWAAurE4WEfZlUoa+q5SkvkZaVlGufk/wZbQOy
         VYacsBjhGF0vqxdw8rGooKV9jPUNdso/6MnpVCCbEJsRE/k5Bg0ZndWzwKbhsV2ZMPE2
         sEEEZBCDiZVTfk0onZOImyAxlemWnSAkTvxbdaqu6MKV7P+skfUxf989cOL5+QAQGYUA
         u0RA==
X-Gm-Message-State: AOJu0YzEqQqJM+Un+V9U+S4aI/vV+SsJGIk+kkYLi2NivuAYjHWXtqa0
	ISQlz/WK4Ai+w9oKcVL1NnvhDu59Xor1TKGahPiEV7eNxhXeYDHzVNxfeHsSH8jnQboA2kuGKMk
	66lFM
X-Gm-Gg: ASbGncsaMKgxA2l/a4XJ/hiyME8KomVXSJWgRvOxaHK7ikaL+04SXvAXPCqHGlfmW1v
	nyzGogWfmGbj7HAHORMmQ1rYX5OTQbCFBzqtKVBo2tFfiqUa/U2Jdk00RIAgL7NkGmfkXL8BUlk
	Kk/0HU3wRPbCZ7V9ZJKyCT4OBdbNh2Rkir4jXhEkH8nGtUKQ75zkCVwMHyBldNUIDf+YziRx5sP
	s4niHerIdKEU9Gk+ByPtF/qWGKSqD2f4EgBIB4+ppJ1w9DjMYTMWRX+xbCSHTpjoJ2TJ2Qpghue
	xbahK16403MkBb+LiTVw9i8m8avjodGklbf4EBI43eHhJi8CLnjZQYmn
X-Google-Smtp-Source: AGHT+IGEFVrZIHBFz1SqE1EP/EGMs6loGv7reHq2wYK21ptKTC6U8N2Q6UlW57yhMvsjjqsxC6WtfA==
X-Received: by 2002:a05:6000:18a2:b0:3a4:ef0d:e614 with SMTP id ffacd0b85a97d-3a558af41demr1484750f8f.33.1749626878558;
        Wed, 11 Jun 2025 00:27:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:27:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/5] pinctrl: renesas: use new GPIO line value setter
 callbacks
Date: Wed, 11 Jun 2025 09:27:51 +0200
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcvSWgC/x3NMQrDMAxG4asEzRXIhnroVUoH4/x1BMUxUgiFk
 LvHZPyW9w5ymMLpNR1k2NV1bQPhMVFZcqtgnYcpSnxKCsK161oW7ezY2Hbu2spmPzY0eHZOgiL
 Ic0RINCrd8NX/fXh/zvMC8mJxunEAAAA=
X-Change-ID: 20250610-gpiochip-set-rv-pinctrl-renesas-60ec0ead2e16
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=+UkZcZhV9av7citUgt9NqSKdFGeoc2sgbcgBT2molbM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/8IFIdCAbaI8xIHgBY1gbOBNw9R28sE/jtp
 7apTdGqe7+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/AAKCRARpy6gFHHX
 crIFD/4msYeUKgE2xWhYmkVCjr4yqjwa4yLC47mAaEKL3tEc3c2Gnw8VZVESpTfWBbqYJ1x60hr
 3YSR1oBUlGbsv+WlfQkoJWEQHg+fqD1w91K6jtFUkhtPn8qiT4s85Emd4Cu3HlNRoQJ+retCowr
 7Thy0B6YazXpg6FH4kNsYD6M2Zf6LZaDabLz9crqlFqK8rMMZq3SCjPLIIScHzkBu3uOh6WkSJl
 0EMaJIJqNkZZnOoBD1XxyrruRoJEWPPyQoinBVvTfG32sVFlaX3oAnnw0s0BFWA+eLHI4foBc14
 TIKtOZsinU2QVOLp1pdAmkqJe3jzgzgJSSu7dSNYV2waYbwjG6h3aYols5oCd0H7Mhucw0QS01p
 U+DHhz2ucoIVJ+o+IANDuBTNAdUoIK++0//lbcDxXVu7XEx97R2p+IkU2fp2US5QVt8hHUf3LU7
 4z1c5dAQG2mMbshjyYATIG8RkDbqUpgmMttAeIWnkZx6S08OW5qYDwut7Z2iSZBfoLWX4aZQbmS
 SmO6FyL0NMdOArjtfvjiiN2lXCOakqK2g+Mbn2oObToAo82Uxs0FCMVOjc/GpQ3C5OL+vlD0ItM
 dArOOzuyQLRfz4AnF3iMr7qviFz8eNZNegveRnWT0dvGV1Yf76wmoLU3kzhGTFf1x9oSZCgflnW
 Ml+ZF40h/u2bGvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips in renesas pin control drivers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (5):
      pinctrl: renesas: use new GPIO line value setter callbacks
      pinctrl: rzg2l: use new GPIO line value setter callbacks
      pinctrl: rza1: use new GPIO line value setter callbacks
      pinctrl: rzv2m: use new GPIO line value setter callbacks
      pinctrl: rza2: use new GPIO line value setter callbacks

 drivers/pinctrl/renesas/gpio.c          | 6 ++++--
 drivers/pinctrl/renesas/pinctrl-rza1.c  | 8 +++++---
 drivers/pinctrl/renesas/pinctrl-rza2.c  | 8 +++++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 8 +++++---
 drivers/pinctrl/renesas/pinctrl-rzv2m.c | 8 +++++---
 5 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250610-gpiochip-set-rv-pinctrl-renesas-60ec0ead2e16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


