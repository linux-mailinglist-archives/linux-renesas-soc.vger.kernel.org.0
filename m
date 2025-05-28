Return-Path: <linux-renesas-soc+bounces-17603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF38AC6789
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 955451BC6C92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 10:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32FF283C86;
	Wed, 28 May 2025 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F6+4NYfu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F0283682
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428935; cv=none; b=PIXdonsn6q0lKe+U9LJZ/lsZ2x4yxy3grKunC6pFEPVWRMDLl9i7YxFP1+wUSjZK62jdedFHOqgdW8yRmShfcAu5mXV1kWNsCARg7ymzZjl1gJ7TZ4MIGS96+eCPfzX9r1KX92c71Dj2OWBGzyjV16HuXYZ5NKfplJNaFgyNzHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428935; c=relaxed/simple;
	bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tfZLjKsg/uTN4nq6pIFf0A1yPvMYsoF9u5K8i2yzxlhOdhu/152WvlZCFtTi5rDSh/R3e08IL4mh4qgpzekR3AzAf0A+uPIXqlCt47RX3pDumMoMc+f04xAc7tqhohZwk3vANOJKnS7HLR9FSc4SZOWOLp5FS8K+KCKl9UGBiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F6+4NYfu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so5846915e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 03:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428931; x=1749033731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=F6+4NYfuriHoKe6R1qFQs8lZBUxyevcww/9Qiqn3VhH9ldruZf9cSzYsvSs0Pr6qSY
         CQKV8ZTRYF0G9pw9E+2WEDQMCPgQGWb/NiVkiqx5+DtAcncTthz5Y+e1vl9XHqAqu0GS
         4hV6wV0zRAskE0mlt/xzodZQHrWrigaeHvX0qQrAHTn77VNHsYC9+AE9n7LjZMbOpOPL
         HxgcV6odM93DnsVb5qEOk4V4EP5w7gAU49y59oHEiAD0aG2JxANQQheEkErze/83wq0z
         dzUfrIgc+c62ZJjg2uqbKSwtJy5zY3fhP8srpYX+hLlU373CSbsbhDQojZCEXM1OuGWz
         lLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428931; x=1749033731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdA/ig8nlywJbkEyEpBGSWcEGO8vU+oGS07oZJY25lE=;
        b=m3GWTgLCbI2QF+ah7FTyj7DcjeiPxESwPJmJGBGPOsG1udID4LCzbrRCtBPIDHLoEu
         HK+ZR5FRrxprdOucVjWuxLJSjrZyVkgtUGhoZZBX5/SINR4y/15HYXmCvjdMNnsd7muc
         r6IoCRsFJnpX/ICXTKMwFXjm50QMif7rx4fHe1Pk4UnbNDZdAN7BAIE9F9tv1XqfQt8G
         gMfLVGDE7nzXQmC0eOjbA4ZkFPtOlyz50ixb45yDguR5UeruNsxJSrSvM5FSaAjT/yit
         41OoudO9oXPYPqhyA6eY+gAsPTRvad6xkCEapqv8VrigmJKtP2bkYsN6OrLSIOr8PuSB
         DnfA==
X-Forwarded-Encrypted: i=1; AJvYcCUL66NIw+oNJgYWFEt1OP5ktoFDJPth44f3kcjYe/cnhR7dR8ZoPRFAmF6hUnOjNZ9o6tcrBLj5DyIMIOTaKoMhYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5G7gw6FIIqq7jFEiEMplInDyHMb8eG8fD8/l9BMm1Y2b5Kgg
	o04z71/q/F0iRs4UsgdyUC76WkZ6nBmY17hb4W94lt5TezLf9VyVbxsjDpn3Um5icH0=
X-Gm-Gg: ASbGncvEualUNnO6t5YuRbN0IRRLf/efH8IjN36ylVGvJF7EmGj6WZ9nUK67ITRUHpX
	xA92y6tkQPFYGKiRLpndeUh7zNVNDyXbu3RrLhE7M7ArNbMJXGPEa43XOkOAj7jC1C4odP5DBI7
	5NIod8Q7OlXR24xPjYeK6iRHM+NgLjEVj1letVqBq22pBbYj09gze8MytmWJqqmHmm1jI30Z4BM
	2cc2vvj9rQBPb70ApgrLQ/qLWG05MLpVg/6a5VkROD8JFZNJHGrtcH2rlb+IvWYEJ37UBLlu+BO
	uuwruWfH+7qxafWWE8p/poPoIYr8IKkNH9XVjmrPUGGUyTSve1SmBAYqIt6Gd2e7R+wutK8fSip
	W3C980w==
X-Google-Smtp-Source: AGHT+IHdcQ9yFIlwP3zJEBCO4eEnwvHp4vt7sag5E+m0p9zZBnLpwpM4OjjEhLuG3z+TywmxNPkmLg==
X-Received: by 2002:a05:600c:4f0c:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-44ff407200bmr6539815e9.5.1748428930677;
        Wed, 28 May 2025 03:42:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:08 +0200
Subject: [PATCH 12/17] pinctrl: max77620: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-12-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vXeTXdr0B9QOQoZjEzmtipvrdS/pdMRjTxQFNr/h+bw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhT4xTFSLShiMHGrzurn8k/RWLwBOEg/kTfX
 2gUx5kqw3WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboUwAKCRDBN2bmhouD
 119uEACKrgBEySfxytMKjgXas+UOwi3IzZ36tTWGAtahy8quwEaS8yKLMXGH3UR5R/xfiE/qxgT
 K0j8KZQkSSoxJgxu/1dPpRloEO6KFrgMS1JNvrxc535yglaGGAF6dztV4S0X8Zw47lxNkSI3oCf
 kmg6Jop17f+7Kjbsu3oNHrrdaoyBSECGDQxfjPrG1OK1828Xa1Gs20NH8vBU0CQOtNFmjAg4W1q
 rCrbcRJkrSV7L68wgkZcewjkW+uCHpp8xfiuky/X+XA3LrnVkt3ZWvvtx5EVrBotsW3c605oGMm
 aIh39HoF2i+U+c1KA9+kRRkUESeOM0m/NNik+1C01XMxfvb6mtTvGtL474OCtItf1zazpXvoj9T
 ygvQC/oprYke1uID4uognq5UNn/OdoNvQJk6tbxBkAwR2epz1lboNXHXIe1MMdo+aFjl0220apS
 E2bXflnrkOr9/PrUbwkSiJxaLcUHqAJCywLcj/t0mPNa791g/BPtMYNr8rDFfZ7XmZyrEPbEJKp
 5XT8mZQD9JIEGYwbw0cQH/vz9kgOs7p47hN4UApEPGZ0HzG/37d9kmNp+Q9mNDbTUfAr5OPTT0V
 Bv9d8JMKPn9VoDFIrtdM3+11ONR/OmTdCfKgP1pqzLvz0HwoQl9QvT6II0t/70s7GaWP8Umrwo8
 X7EdXcYJodX39FA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .pins, .npins and other members in
definition to make clear that number of pins is fixed and have less code
in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/pinctrl-max77620.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index d236daa7c13ebbcaf7c4a8d1a8bed751aa111c0f..acb945a2574368b2e34659a902c34df8aad193d7 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -543,6 +543,10 @@ static struct pinctrl_desc max77620_pinctrl_desc = {
 	.pctlops = &max77620_pinctrl_ops,
 	.pmxops = &max77620_pinmux_ops,
 	.confops = &max77620_pinconf_ops,
+	.pins = max77620_pins_desc,
+	.npins = ARRAY_SIZE(max77620_pins_desc),
+	.num_custom_params = ARRAY_SIZE(max77620_cfg_params),
+	.custom_params = max77620_cfg_params,
 };
 
 static int max77620_pinctrl_probe(struct platform_device *pdev)
@@ -569,11 +573,6 @@ static int max77620_pinctrl_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mpci);
 
 	max77620_pinctrl_desc.name = dev_name(&pdev->dev);
-	max77620_pinctrl_desc.pins = max77620_pins_desc;
-	max77620_pinctrl_desc.npins = ARRAY_SIZE(max77620_pins_desc);
-	max77620_pinctrl_desc.num_custom_params =
-				ARRAY_SIZE(max77620_cfg_params);
-	max77620_pinctrl_desc.custom_params = max77620_cfg_params;
 
 	for (i = 0; i < MAX77620_PIN_NUM; ++i) {
 		mpci->fps_config[i].active_fps_src = -1;

-- 
2.45.2


