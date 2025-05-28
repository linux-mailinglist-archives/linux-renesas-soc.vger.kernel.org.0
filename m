Return-Path: <linux-renesas-soc+bounces-17605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363FAC678D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 12:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C8E11BC7378
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 10:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9727C284684;
	Wed, 28 May 2025 10:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luhsUhrd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C0427D77B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 10:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748428942; cv=none; b=qjitib3+LGi35QCDK39owTem+9JlXTxZgqTy1xmg7sF/7E9/eBJPkaCIlaK/kp9QlWOu2MrdonFkntFT8GZasoxHZwQAj8c5IXLnheyjdn7/MVUs6IHze7209Dl35YDRnu3NyFshgQ1IFSdaJXrtas6TvmyrloxS5vrfmYAY1+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748428942; c=relaxed/simple;
	bh=wdAVjz1g2LnOLK8YIe+sx2i+Wtxy0b2lB+2wyeAsJM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGiIwgodELgR2X2RuemOm9C62eLQ9DRyThTh1gkgKzKGyJKkkMuk7NoWwSRpf2OOg/g+izLP9/bnxNntVZFIrt0sIue3rN2XuZ+AVpnB4zxSXf2IZGYjiJBTvKa8eFZr0hsipESliZ1hhwQH7+vPrLNSGYpY28P5oaUlWK+XOrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luhsUhrd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4db4d1bd7so472365f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 May 2025 03:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748428937; x=1749033737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
        b=luhsUhrdBZHFKjCtywDUoZ0jplpNyY/pi+6/XbH32+GQbZIjgOREtT7FVM/xBO1YV6
         Ow6dVD4sN6EdEgqKW6RVMd8tV7N9Q+yf5ScSeYG4SCTk4cQ/GkUuL+WivkLMJEVol+iu
         TPoxgAs7d/xbRlF+JY+wXcL/JueF/8mN35uB+JxfrDgYiUisXdFymMxHSV1t/EBUuFL+
         CCn3bvEXOepWX221Aw9Dq0fvZ3DV+RCtsLV0sAlKYX5T4xa/KnlASzZw6Kk9VF7pgogK
         EVuAoBxEd75RKgG2DTTGiOrgW2cEtsnZ4+DBNh86lOAEJvN6H8QaHxnD7uP1cWYD1cwt
         pbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748428937; x=1749033737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
        b=NiK8nsBoJf1mqStxro5H4SNOq4Ms6CM+GhJZY09TgpymHcRXi2OrDPw1D68c7XzOMS
         TlWUdV6t9TZuMxUKExDvU4RMJBuaqLbvra2PfBxOOJ9zwwrf0dR9Lsn+3mW993bIUGdb
         ehC3R5e9NNCw0hPGyTlqY3kllR+2RFM+nqos8zgdgq7OlWXvXrndN2x9SKhXHQNsjxhL
         +3oNpHXLmaRCR48Y2EwjApBNvTH91IxPkIxJC0ruCznRHYfryENwUohcLmQNAq+l2vw/
         URdfKNyZkqC+15Wqrkqq2JDUjKCNeXGVRZEg/sYRipGfIEUoRsrmhDfENp261ZwpsNFc
         w0cg==
X-Forwarded-Encrypted: i=1; AJvYcCUStrl92FMS+45ux+lSV6LVi+0HJG6Pij4UkEHBqi9F4vsO8p5OmRFm8Od1+wnZVpPzmLoPNwHdIhqJQf/URZ2Qgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUOL3EZQYMbTi4+7EXwiXmPtSIqjuGYnxENwxr8BoOlLO+Vdqe
	yhsqOv7Ris0Une4di1RIh90AHnZrO+0q+zEMHihLN3ZTCOS1H9EYbESDUh9i2MI0ASk=
X-Gm-Gg: ASbGnctzmjqbGTs/XfUFbZ3npp0Dppjk23Kpohqxl5HJTQxFW+Ej9n1Qe4jojJXoJ15
	DWrAIVugRDRuf2HtVu/V9MvbC6QZxzjvfdgedwTzszuHMtvHCBA6sqrBEwShyS1LLzYk8JWgT6u
	83u6csmu3hHJpLePNABUtfGrOfD8r8SdjTjoH/8NPe6QPMNt/H04jiwcqLvHpOeRDUpIIdow5wl
	ULoJ2jw5JIQg+MNP8FHfQO6pGRvimoxjMypAaM/Hof2/F8YLabhAazOl1PaXp7NuKmFWbnruY+5
	ABzJSO1ChrMoKAZATMns8qKZ29LGkDpQmnS6YUCB9Pcp29hE9nf6IzNsVTnhQ0Z65M0iZMQ=
X-Google-Smtp-Source: AGHT+IGUEkMw3AazYidVlvlcKxjjPcFl/fdYDePDntNbpwN9JsZRSDdk3Hds7gIIRpwHgP+c7VnBhQ==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44c91dc9fd0mr51871135e9.1.1748428936730;
        Wed, 28 May 2025 03:42:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 03:42:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:10 +0200
Subject: [PATCH 14/17] pinctrl: renesas: Move fixed assignments to
 'pinctrl_desc' definition
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wdAVjz1g2LnOLK8YIe+sx2i+Wtxy0b2lB+2wyeAsJM8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhVOUmo7glA0KmdvgZw8r0O4XKNab7bHjew6
 T+RsAWcuh+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVQAKCRDBN2bmhouD
 12JBEACByGYIJrWmeVaNuGhfgErqLrs8juvgq1he1oiyCbsIYgTgEq+hkshpq5p167n8sAXxqs+
 6iBVk16DcEYvSI0f8eCwat8zII1LkA4/ev5fMWjxd2Z3FzJswscCWFRIcarUCeBg5Ed+JZ9ZJb/
 sN0DzMJHT590OM6XRyVM/p3h3tnUQvwdzoqV9s5W0m9+2com84VzLAOKGdwYycuo+JYsD5GJuCi
 ueDuDOOW04JWSbUxMO5jxxZLXltdZb9B+y09j/dA+vEAU4rLYngyjux8/zx7evW5JMkCosH02FQ
 s8fr+Qw8tSf0/SeZOU/aJeUXpYvGrvaQefJaFh4YdCEA+bAj6pyNvYMWsIfwWvWaE4uawUoQ5Gp
 TJAyZt161KRilFdsJdPhEEcLzR1oML7mLl8Rx6++k0mb7HwaPoSudr64ZzDrwr/2o40pTX2dALR
 xcX4+WF5UWmuN6JwMHP4Pe92IW5urSZ80lzzkkV0kNpzmkBRmr2RmLNe1hcbRvVAO3T7zQ1Ji2V
 2O21d5pDtSNiPIS3BtOOFEf6m5aKJyk3wg64Ze7CTiqUj3VPHlbpMT0VrAMdmrjlY/4h/Xo8axA
 Zo9kbbNMJl2+zQofVcJ2at2Y4TaN2qo9C6H5+FzFTRhJ9EQpHJdf8J7TMx2fib06ZHvXH+XMnBf
 rJwlspjRton9X2A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2


