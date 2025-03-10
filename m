Return-Path: <linux-renesas-soc+bounces-14200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3F6A594B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3BCF18876EC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 12:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCE82253E6;
	Mon, 10 Mar 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pe8FyqFG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9ED226CE6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610429; cv=none; b=MVkI3vtP+QTeoMfxhpfy2NsmlkLrifEvH9vS4jB06qeyg93IDAMTPkl9ipD9P6Gu/xbcS6b7CRuxio/AOcRk4wL+Z3L7FS9/WNezY/RLQMLgMVdN0XS5Wvqux+9jWtp4XzLuqytrO6zFmP1MSPA8C5IP6g+5xubq9W2fPWad2LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610429; c=relaxed/simple;
	bh=/8NjX3rOzGTLQ756Q1j66Bv/y8E0Nf+JlzA4oIcsVvo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JG1n7q74Y5I7psmbd6NAPk3sGKQLh2mv6H1HsEFWQpccAG8DWCwTlE/k9HCFoARJG16iiZc0Gvahey18BfgQaoNTSIoK/a6xWcNla5Tq05peHMt4AnuiMZgLpqtKY384OoF27hMq9PnCHZODAupHuJUnQv6k4nIxtRYLSDY5dl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pe8FyqFG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bc63876f1so35424245e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610426; x=1742215226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0SW/193dSmdJ4hIuDLKeGIYpk3++UwLKAQ2QPtDVJE=;
        b=Pe8FyqFGEP4HfUQAB2aUsgL2DnXxbIRKLmPaf9zHD3XGYLK29nhrn+NddKP/dIqT2q
         spks4Wjnn+6HepcSzotBcyIhQuJz2K0Dq+8vaBdsWjm250njkAdmwrKyc0EZwsi6bU/H
         08gWJBBSa4oRftYIGioOZH70fDnjmmG2I3y0GTGB+0D1AgXboFefXtdrJqLalDgS7TH2
         dXVwwZ9Yocp0wq4zwt33y+m4FCFfdiUhel+4Xv04DF8J2AFn54ceOR/sTFlrYBfkxyyB
         PN5BYcpSg/14FbVE+SDGdydWC+fTc3CgoHBvvs1mUpWi/q56jCG5VSqD5//yu4mggInf
         oKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610426; x=1742215226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0SW/193dSmdJ4hIuDLKeGIYpk3++UwLKAQ2QPtDVJE=;
        b=wLRo4rxENpI/VCcjK9UJ3F0TL8B3XajFlFERjjM6stFu5gJ1iNlNDUWB6jtyFWzd4r
         p4dTCqhT5OEPjPyh1EbgsRMI0OJAyZZ8IT5xLDfWpwRxyu0ra6MBAya3U0jqzTiNlXtu
         BOZbIfYpGqSWFN5MRPuM2DRbmOxTTZ91OOLjt1He2aoOsRqI4gAtra3YpdEQmDda7Mdw
         X9g1pxG2dXXZ0vwQpXiEA6rjtXEu3V+DOruHuXrRD1KFmhitPveewshw2urLLOWhWQJt
         t/NBuohc2kMn1CeHLZNC5Ocu66Vq/H1dIkebytVYMPAYhnK4dVw9FwCPTNNY8tELp3Vr
         Yy4g==
X-Forwarded-Encrypted: i=1; AJvYcCWdJ9xWNupFTg752IyYqBO5fE8xwRNGrSqMz+oUl6UgOLnNFTFlDe6jmnGR+Gmwne5u5pQ+UdXESA6T1T3VWIC20A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBYyIKdhrFd/GGePvRO4iwUDQ9hBbsNFbh51ORw6gEdFzkgx6
	8an0yTfEw4iJz1kekB3/6zyx1F85sBpw/b5yRjkijueRUsk5dDAlKh85X0owrCqyAdZ0WVg0QNb
	r
X-Gm-Gg: ASbGncthhiRhy6xsXDzUqQAp9AMf0tOW5l6+aC78SjfPvx7kwMfV4fFEtQxR+B1HauE
	wwprpK3CovJo8/Cor2FiihEy21rG4EdBLAEcBqCvN3HeYtRSaZdVnrTOkD2tQz4idVSnNbcClQ+
	g/JplpiMCr4RwUKf/uEZUWZs3aMpesqJ34in0KObht+w3PxaSV+a0Oo4J2/GGerOn07GAGvH2iW
	ZBHBXmyCDQj3vAfQIA6LwOA6gj5F90DaDw8+heBaNVKSIi1dszFoLSi7OENhE9lFlhEnRfME1JK
	eqqItdyDWY4g0kwC4Gz3QWaxKpk87DpCtDLLVw==
X-Google-Smtp-Source: AGHT+IGvPu/1nOs92AdzRzoEoUE+KHkXYbFS1CNbXKzN17IWobEMq+YxPKwtrL34br0uOwNd+vwAKg==
X-Received: by 2002:a05:6000:18a3:b0:391:29f:4f70 with SMTP id ffacd0b85a97d-39132d308dcmr8761092f8f.3.1741610425580;
        Mon, 10 Mar 2025 05:40:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 00/15] gpio: more gpio_chip setter conversions
Date: Mon, 10 Mar 2025 13:40:14 +0100
Message-Id: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7dzmcC/x3MSwqAIBRG4a3EHXfBHha0lWgQ9lt3oqIRgbT3r
 OEZfCdTQhQkmqpMEZck8a5EU1dkjtXtYNlKU6tarbpG8R7Em0MCJ5xsvLsQP8O9wQg9bFZrS0W
 HCCv3f56X53kB7YYVe2kAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/8NjX3rOzGTLQ756Q1j66Bv/y8E0Nf+JlzA4oIcsVvo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt2xSm4P2dQUEH6/WXgLwh0Og3Dk1vWZ8fyc9
 3DxKuhoy8uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dsQAKCRARpy6gFHHX
 cu4DEACMU/mbub1Wl/BAjiWgnjjXiGBySayfhIbiMgAGkBuRBylXg8baXdUi0i2sV6iwqrGE9OI
 s6HWytFr0Toai6HD8p6ilSac1y+EANFTsA6dyxH0lmGfeZr3JEtUtPhcp7tPrqkXV9EQEZa13qa
 LOiKYFy+5ZAonelieCiU1V6gPkjvE3EefjjB/xtCgJtrXlC55s3e5eCNj/OZ/MsAeGNbsDF5GDR
 SoKvCr86OQkk5NcO3hJ0FUAeodmCwwAv7jOyPRCtgNLFYelkMXXD4elNoIkAvGkQFVd0GLSZ8gz
 DZPIHGl00Z3yc4ciDQ6a5eq1daOl2SjjXiIqOwKn+OTTuhuNHNv5u3BxGUF/58kgHQDfjvs8KU9
 EAHspWUutD4i2GQnQMP6aklZMkvLmR3kukhKE4NKUmw2YLm9T5C1Y4h/S92YhtYNJV6EDJk2Yqf
 VNnmDw2qQi+gsxBKpBgV8AQl2hOSJQd0Q+tPHpFqNccUWqmAlMplHA41zSVrRdGf3Ho+8OCO0RC
 VogMfrduLhGTtcvOEdVtWCkNHCJo9pHHKmY9nN4TcC5N1fqAyZJdpWv7TDCSnfBD647CtXn9WuL
 sgprAl0gX46CqLn65AdKb5Pbb18qBNjd6rzy//bZgue1kaepXWwTgDIx/tCvXy2xm95Vly5eTq1
 nq3itWNk4h69CVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

This is another round of GPIO driver conversions to using the
int-returning value setter callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (15):
      gpio: bcm-kona: use lock guards
      gpio: bcm-kona: use new line value setter callbacks
      gpio: bd71815: use new line value setter callbacks
      gpio: bd71828: use new line value setter callbacks
      gpio: bd9571mwv: use new line value setter callbacks
      gpio: bt8xx: allow to build the module with COMPILE_TEST=y
      gpio: bt8xx: use lock guards
      gpio: bt8xx: use new line value setter callbacks
      gpio: cgbc: use new line value setter callbacks
      gpio: creg-snps: use new line value setter callbacks
      gpio: cros-ec: use new line value setter callbacks
      gpio: crystalcove: use new line value setter callbacks
      gpio: cs5535: use new line value setter callbacks
      gpio: da9052: use new line value setter callbacks
      gpio: da9055: use new line value setter callbacks

 drivers/gpio/Kconfig            |  2 +-
 drivers/gpio/gpio-bcm-kona.c    | 69 +++++++++++++----------------------------
 drivers/gpio/gpio-bd71815.c     | 15 ++++-----
 drivers/gpio/gpio-bd71828.c     | 15 ++++-----
 drivers/gpio/gpio-bd9571mwv.c   |  8 ++---
 drivers/gpio/gpio-bt8xx.c       | 48 ++++++++++------------------
 drivers/gpio/gpio-cgbc.c        | 24 ++++++++------
 drivers/gpio/gpio-creg-snps.c   | 10 +++---
 drivers/gpio/gpio-cros-ec.c     | 13 +++-----
 drivers/gpio/gpio-crystalcove.c | 12 +++----
 drivers/gpio/gpio-cs5535.c      |  6 ++--
 drivers/gpio/gpio-da9052.c      | 34 +++++++-------------
 drivers/gpio/gpio-da9055.c      | 14 +++------
 13 files changed, 107 insertions(+), 163 deletions(-)
---
base-commit: 21c853ad93097619c7966542e838c54c37f57c90
change-id: 20250310-gpiochip-set-conversion-4ce7e56df55f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


