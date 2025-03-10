Return-Path: <linux-renesas-soc+bounces-14206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC48A594C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 13:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EFC8516B222
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Mar 2025 12:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A31322A4FB;
	Mon, 10 Mar 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QE/lHIZv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F7C227B9A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610436; cv=none; b=AjVeVAmyOJco7nUkbrgDLL1k5GEcRsK35oKTxgKLFK2FZaN6jTJqcOo92xPDVVr4VO7r4wpJag65qvgdk/jDhWBIO5Y4Ijw4PtqO0oXv8gjT2lnVp8WvfX+iqpNHWh45JA/0SQet+XsclsuF6RGcrLj+zkRQ9e5UPSN/Cy+rB18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610436; c=relaxed/simple;
	bh=5SP7c9LZmhzTB3Sd70fuAWrzLoIu061KLAW3J8lMM80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTes+b5Hh7m0+Z/OPx9AZUqWj8uTa2waZrsRXC8EJz9Jl9vavNHz1FNO22q1xjd0E9vVkCqqfYk/bWCIlKJIxh02aaAWiXK9/FZweED45vdzFSNChSUzbXy+cFs7UTm2tCnlk8+YZLYhOhr5TT8lqGWq6NQwOeHRIMWrKV52qGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QE/lHIZv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so1920928f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Mar 2025 05:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610432; x=1742215232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9vKM2NqG0d/mIXKZKZnbzuk8clRyDtuK0UmfTRLKjo=;
        b=QE/lHIZv5pC02Jv2yNc/P7+PiE6IPizxU/u1rCDkp04Pypg3M6oqwD3guGuY3A0Hz1
         l4qgfgTsfI+N5qcXHJO3sE9Pyd8R+Owh/7aVfy5WcjF+7lhXyRhbjuOkF6PBSrN9JEH8
         7MJQyd5u9BWnkNc4Z7vKGzQvXVEO5BqMS2HjNmfNFQazxHNeqefRE4JbnTv9pMVQJacN
         W2OQvcd3PAT8RIu2BES7jB7DOQA2z5C1q2847mEKdIoj/O6amI4agOmcX4HKIIsAsFOy
         dUShzHYGqTgCS6UH7bWkAM9CsMEVpGRBL0AzEuRN8vtkQFADdLWK8xdRZQ/iiLdJJnAk
         rRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610432; x=1742215232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9vKM2NqG0d/mIXKZKZnbzuk8clRyDtuK0UmfTRLKjo=;
        b=kHCZb6OKuXFZDeMZMZi2pvSmggi+N0cIAJUAfy1YCEdFr+svT9+4eT+7QaVa+N1kwM
         vFwtJ+Ut6TeGvdPMnLcwGLgCLfccffA0kUGLiEAPIlEs5r9npWMLAT/hIwEnZHGrq3rG
         dkbAd/nG+xuYOfFEae/f6hziI2ydMkMjQfxMA+SBsbHYtYkyyzk1AFKoI/5K1pFmYVWP
         1Yf2AgBd77SrgZFbwgU4u/mE+fxE3dEqNqksGBxPaIWoUsaO/EWYH2zeSgDdY9wbZpAf
         iragVSrWxsfhQPFXe/0YO6CF0+gLFC2qbEvT6sjsL9nngad0KGXFvHEFRYWlBVmB9Tj0
         Yw4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3rHUhaoIMO/mtdX4/qMs8kyMsuorHChg5ypcz1LguMnL5vm7Mp9qH46n2vuxaUPMQzAW8+76vm4Yvte+eLwaRFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXp6dquDqEjvdhUXqDoKspyU3iuTQ3e7BVz+rClmf5dL62EKrA
	PepH972J1KmjMPniu9Pq3EyCdQe6aap0KmHVowgwZjdmtZwDAWY3Dqoq6wzUTOE=
X-Gm-Gg: ASbGncvOdT6rIqmX6LviKdbGPsmm0qU4F2kZY/UzafZTn9bPOgOfB2ysQgFKkYKkpPQ
	TeibNXRNCHPRnddT4x242P4HPhLHbCAMBUt1G64tIyZk4aYgw/JZNdaSQ8rBhTphA6k2UM3fWY7
	EXDM7MwPUC/Ko1KBUi/dslpXp8DSnfUiIZZcdMm76fZiqxujwHiVr1mIlf7G8pm5jLUzZMJ/ntQ
	nNd8GfYDllFCATzOTfpCDJRmRnf/V1Zto4coZyiDvSTgeKBB5qC2C7jcHI4+Y0owhtHG1CRjj+B
	2EbUaZp1OfJPUVhE6IGeZ88BR4vGIK+IIOGE6g==
X-Google-Smtp-Source: AGHT+IHirIBi268WVNrXJb8nSLfBOn2zE3qJRsiRuXXJzWwl/IWx5gRbkFVSetYSD+YqWYxCwV2UmQ==
X-Received: by 2002:a05:6000:1a8e:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39132dc5717mr7516476f8f.41.1741610432227;
        Mon, 10 Mar 2025 05:40:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:20 +0100
Subject: [PATCH 06/15] gpio: bt8xx: allow to build the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-6-03798bb833eb@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=603;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HM+nOzctEfj4SKGt3f/npQjS/nebRuckql5RBo2YHvk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt22XKhxDpceKw9s3GwK38TDwn1P/4/8jyV/1
 op/G4g/1GWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 cgZoD/9Tv1NzmtUetdANt9hTuIv6Cuv0EuAUV1poJeKpLIc2bKENgK14DVlrT5ussU/ndHG5GOh
 FjQrpxS/OFNLpEbOn8II6OeQLjjIcdX6OAFV3vxsNEgEizc+7sqoqUsnToI8ig05A+c0850d2pr
 jFkGEp8bq7y6rsbCZYsPRZZXEUlcmH/uOszR7Lh7TLwgmSnCmMWsTADAdTOuWMVvw9zWHIlySEk
 DInHW1Sy8l92Jss/0SdEaUFqnhYV7rxDShXcfaiNZKdvZ9SnJl+48SrK7xdrwoiHywzhoQ8WJQh
 DnwGuiAmm1RrF4OoS84mGWmL8ymZ2NEBzI+pMT3UhXvkpXV+o4bv0KFbERTa0gPPq6PI7LXKWPG
 pY8ctqXA9X3aDz2fVzPvlZTMZYneUxWvU/VmQlk8davmlvlGGCVAa9SQwYZ5wGilpCfhGJnU6Bj
 CMvAhA0RJh/G/3sBac0nPeuTHE+Ae586tmxAkHMsl9xaf2JwaIt0RrdRcgbJ6MwTG2nJ6g+vsPF
 YBEbgmtXE9znBAWuxTMBCjqmXGV+HXNF4naj/rwsfP+fOaBOr8yXh6KJYE+hNPeq97S63W9ESah
 lNdDWck29TE3hEQHquHLkhvQKeuNZoW03QSYk8dmjeF5HJShhcVaI3JH2C7kri41gqOOh2Wsfzq
 mA9QTEFZVb7hXlA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3e9b174fee84..f2c39bbff83a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1671,7 +1671,7 @@ config GPIO_AMD8111
 
 config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
-	depends on VIDEO_BT848=n
+	depends on VIDEO_BT848=n || COMPILE_TEST
 	help
 	  The BT8xx frame grabber chip has 24 GPIO pins that can be abused
 	  as a cheap PCI GPIO card.

-- 
2.45.2


