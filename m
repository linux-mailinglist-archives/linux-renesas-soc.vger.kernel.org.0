Return-Path: <linux-renesas-soc+bounces-18058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D8AD4B39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 08:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F7D189F4D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 06:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1B123370C;
	Wed, 11 Jun 2025 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AMQjxX31"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CE235040
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 06:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622490; cv=none; b=d2k6bPiDCLKJHFP/9NuMltYZ/UhOl2JaXB5uK6h1ZK24IVqH3PaUd5dKM/bipResGa5/TVQlS0NowR/hOprXAgH3pVa7F5LjvGpdivec1kr4X9oocD5y7qhN0LD2JDAWUwfGy6HIVQaucqWepnS5das4PA4CtAGr1QP3FlVFLTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622490; c=relaxed/simple;
	bh=AYNDWesc3V2AvRR7if8AbZFHcfpmPLseFxX/L5QzL90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbiJtt9h2TBfxva1uLhi8lflZ3SeE3wXoVTU96OOM/elTj+iu+B4S9qK3HrKLduZ6QhdTO7O0rw5u2XBfs30PUPSnYjeCxZnlcI17j8z7R90ta+gtqCKeaU5BRQkdRuZ0qu7+9beSRBXiJCtUN0ABkA8WK2gR7jH7jFVrb/Glm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AMQjxX31; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso27920f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 23:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749622486; x=1750227286; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
        b=AMQjxX31DrdUPeCb7KSMoHNTjiHtJfLyk80Fb3FW8u+RRXL/siSXoTOS2l6CG2KH8i
         5q8dLU6AruzBAoIoewA5yE14W+ZANEwxHlF4VfB2HzsBs5EXGqFIDT9Tm+b2aPWcfbJk
         9GZYUwUP3QjgYGO63f4x9vy58Px8RAboudA1Rs20ivyG/Yip2hI0rmLhp4ttXxlw/k7w
         YW03stOvlA/R8HaBTPtHpyKEsWXIf7nZppNmYscJRKwKVHQUszOo/4Rross834KsA5Rk
         y7HvBwM7PLMjdPUkotQqcZtDOTSrosEsxZwNQGL5UeE9K6RZYqjT+L/aF8O66sL2EF8K
         IeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749622486; x=1750227286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xhuOXPN5pzbXggWWg9hnI9xTO7REs2psbwAuBBp5Ivw=;
        b=ZBYCF1/io9yTS6C2YvpAoyYt+xvkeqNKEuY5oveXH6rMjETrgZMQiklOY8Tv9Vk3Za
         pUgQ66/QleLCjyaMjMWNpTYkvs36zvW6UJrszDmuk8eoJZnBO4uDDyxdwe1rUBj5UcJS
         oNo5o9/SndRufwSnRLnKz9gwGmXpXiVt5idbwysDBwbVPOyWsKdP+2s1OIsACWWmwvvz
         uQI0m2XFh3zYXUOqhWaWwlUp6l6MIDL41AFb7g2NcLX32Jpv42LlMI2IVKAfSLwP27wF
         rh2Nyv2BFR7RU/vw9ToT6GXtjNfeWQeYOP3tOk9tWRWudyDyiIiIoxgOSVKd8lPZTK+Y
         GlWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2lMd6/UlJv7spgWJoOyf0qQJCjAz8er2J82wJTXFaieX7O0s3v9mvWEMh4P373I8fw+QsPOfsoMvDp0onuMAU+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFA9BNP6V47g9rnfM5+B5c9q4RQY5X8IOz1LwRd7Jy2Sc4UovI
	y4Rfi3UvH2rvHfYH3fu6Ivsfb1w8qKgQOb72jyoN4h2CcKrLn/erTjiyeluyeuPyDcY=
X-Gm-Gg: ASbGnctYnWqk2cVQpm/FFj3eIdOckGTL0i/vCm5crZrefAWgL2Pz6L8qvo4i5Nz3VJ+
	cvbSHpKmeikq6fwXM3xIImV8+J+oaAIgH1eFFbVED7zKZd0apdAMegRPIpPTIij6r8Zako3TR4g
	WwTdzPhlssnYmONCaLH/xDwSpT4bX31rWZSyQ2umHf3Fwc6eSAyi6J3T2FzmNmhT6IdRzC4/C55
	N/5HcwNqpajvG56Wh5ZyIe25DjueP39e9EL0v1jd2Jfs9lbq9h3kFn3zeQVG1LDwZ/jzaAaumU0
	WyZYne4cRhL3nrjUevBjLLy84CC0+07c3k7jcTsbC9MtBV4xEd+LEsqgPRmBPSKC3TYOhMVm2En
	kcnH0k1Q=
X-Google-Smtp-Source: AGHT+IFoBfGugxgH7Y07c+Z7PgO6Vu533wPz1tMcs2kNav8PQm9ojUKm/KoAc5pG4XQWm3sCZWL/JA==
X-Received: by 2002:a05:6000:2313:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a55881f23fmr555424f8f.12.1749622486357;
        Tue, 10 Jun 2025 23:14:46 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm14142791f8f.74.2025.06.10.23.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:14:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 11 Jun 2025 08:13:42 +0200
Subject: [PATCH v2 10/17] pinctrl: bcm: cygnus-nsp: Move fixed assignments
 to 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-pinctrl-const-desc-v2-10-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
In-Reply-To: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
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
 Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AYNDWesc3V2AvRR7if8AbZFHcfpmPLseFxX/L5QzL90=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSR6nF3fg9hKfOe+Hbr9Tehw6sIfTcg/RPRBf+
 O4vW+xehwiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEkepwAKCRDBN2bmhouD
 1/2lD/42/A7ac2PRGbwiBHKKG8B4x10B4zm84oj9tWoEWjIiNCrieIBnYPrCLjlrhWxBPvOs7vh
 Q+lrPGp0oUPIrfP1V9v1nbsikUqnMGkq/mMlW7Q8ed6lorVeDOnQKirV3EiRcQ32H0rW7hw9XV0
 EAuunpaOtZ2aQWFCsRIIOx9yNCEeluYhDhc8/FTu/ClVL42hwnYs1rT6agYiCKJU0S5qaiWH2gu
 dkuBiRRqX8NsoB4SnSOq8bFtFUyJI2nYBN0mN3kYMQ1TPpCeLty1DLRJZ0aYp7D292HAEPoIAQR
 8Kf9CyOMbUTu/l9PRBhbAq5DbZSxCYgy9Dp4kt2QCKfde38bfmcW0AWiirTSVrWKGxx5UtsJ3O/
 8rA5oBpKlaNI1+mVgQCnfLYKT+oYmTbPpR4BY6mvvkKuql/22PkuV0MyS/aDwaAqPU0svNbfCI+
 0XED91LrVnXbYLt8vWAPYfCuGGPHnG9tOCVRg/T60Rl65gbUXK9h+JVq7sJOhh6pmdSAvpP9P7z
 e5Gk0qCav+Rue6poBOqkCRWFVxO9RgxbxL5ETGIhR2Kmi51H5EBpXIV7rmaI/+6ZZ9Kad+v3rJu
 kCoBZ8gkIVyWqNjLG0L+3huLO43lOyPvxGJycogdWphLagnUoCjJ6JG/UmGNsifVdYPSrAjzJD4
 dcQEUA3glGNzmJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .npins member in definition to make clear
that number of pins is fixed and have less code in the probe.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
index eb6298507c1d1873f9d5a90ec724b36af6d4da48..9b716c0d2b9456b9e64ca1094375effefdf4817c 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
@@ -525,6 +525,7 @@ static struct pinctrl_desc nsp_pinctrl_desc = {
 	.name = "nsp-pinmux",
 	.pctlops = &nsp_pinctrl_ops,
 	.pmxops = &nsp_pinmux_ops,
+	.npins = ARRAY_SIZE(nsp_pins),
 };
 
 static int nsp_mux_log_init(struct nsp_pinctrl *pinctrl)
@@ -556,7 +557,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	struct resource *res;
 	int i, ret;
 	struct pinctrl_pin_desc *pins;
-	unsigned int num_pins = ARRAY_SIZE(nsp_pins);
 
 	pinctrl = devm_kzalloc(&pdev->dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
@@ -589,11 +589,12 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	pins = devm_kcalloc(&pdev->dev, num_pins, sizeof(*pins), GFP_KERNEL);
+	pins = devm_kcalloc(&pdev->dev, ARRAY_SIZE(nsp_pins), sizeof(*pins),
+			    GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-	for (i = 0; i < num_pins; i++) {
+	for (i = 0; i < ARRAY_SIZE(nsp_pins); i++) {
 		pins[i].number = nsp_pins[i].pin;
 		pins[i].name = nsp_pins[i].name;
 		pins[i].drv_data = &nsp_pins[i].gpio_select;
@@ -604,7 +605,6 @@ static int nsp_pinmux_probe(struct platform_device *pdev)
 	pinctrl->functions = nsp_pin_functions;
 	pinctrl->num_functions = ARRAY_SIZE(nsp_pin_functions);
 	nsp_pinctrl_desc.pins = pins;
-	nsp_pinctrl_desc.npins = num_pins;
 
 	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &nsp_pinctrl_desc,
 					 pinctrl);

-- 
2.45.2


