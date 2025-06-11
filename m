Return-Path: <linux-renesas-soc+bounces-18104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 878AEAD55E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 14:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03CD0189ACCF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 12:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0894A283132;
	Wed, 11 Jun 2025 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="a20UDsYi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8B113635E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646156; cv=none; b=j4CT7aZaS99xZomK6DP2Co9pWZOVltyMnW3SDFy8jX7QYMmEsVmk4bhMlMudY7FRCYSUvERWKcI9pJeHJEvcM3rpchP3QfHeJYVd+NtQDiMKfMKe1PkoH6N5jbdKJ46YMOJyCC/fvZ+xb8uTEFspdFo+P/iawdpEspajcU+FcVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646156; c=relaxed/simple;
	bh=JEL5rHgZNb7DAsn6xBRypsK6BNQMJX3AEL99ZzoDNpA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fKbnWv1oUwlJPZ4t0eW4QLHSl7bV3PeHS0OhQYEGnyRdxHC4F86Qe6lCiqqKqLm3Xt0KE+AgSPWebWyihehHDIPS/1zQXhgOlIl/4MFWAOCiwpMLCB0ofv8y11k1CcQ7LO5uXHGEDa6X4sWwgdjTDBcWZ2SWHcQQX/x/4FMz2yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=a20UDsYi; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5EA3144708
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 12:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1749646141;
	bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=a20UDsYi2qY6HfKd0ZzRlNFs5q9bSATI67LFDqW7k9VCeo8Pzz1ntvfqvBPk84gNS
	 TtvsigjkOUdlMnT6/2zFeVlbqp8YPC0ErnLHdBpT1VVyMKVajZALtwwN9Go2SlruAD
	 DgXbPSedT/bERJb/w+rtOuqMk1wlf15a5HDBgiVpFCNm9MjO/iX081rDvsNVaCrkI5
	 9/vuR7AWTgVC5l0yKeypcCULMzrnyc61ti6WR/2wm10LSob5BPtWE9Top8UeS9/CSW
	 fedML+7o8c/yamObmkxmytfqHfmYHEGsFDHrLiHDGm0Ke746QC3Y8HXqD1uR6QdQwu
	 sBGB9kituaXMg==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e990e17650so5728915fac.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 05:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646139; x=1750250939;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bELfz3w2j893PNHUaLtbdQ42P6gz+Z983PYtPwmORCE=;
        b=V2OJwe8CHpR043LLIEsvGp3Ej+IyTv+6yaJjq255nj5mJNKtQTOXzTqokwr1AUs67v
         pirX0SseJiOTGuKKwIt7WEKKQXV13BuFQqpbDPweT/CiiZ1M3Y3lqRF7X5WyAxmFHNxJ
         UEoKvsRZrHTSvcLTFgiAFaUIMLaqlaMTbcCEDSh/Ax21b89a6SJslXTAOX8Je7uKQw5N
         WtvtBHQg5960sVMD30HMgSKQ2F7QkcqqYyyUL4hXqHt+WnL4dKg2ELmH4TURcZ7cTMZn
         RNZMt0k5fVilrJgnS88u275/02pe46xpC0KLfzJzGcUml7UzOmJoylQSJ6rV0bWQpKsp
         L/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCV/5Ky5jIzdkKByTFqj8VJZrcb7ilbxKCVfbEjcSZNnSeyYcBurovRsOo4uZazfZgJRFG9OvsPu/xjA0ZmXfRrFrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg/dwuYTm7uMJupHxwEc+lNJP1460Vhg3ZbNMQVU0OHYBIhlyX
	PNK0Kn53rtj5t/bSbCbUwccIsnxFln9HHUjdCHuaez63v/s+eYXZwHlv8thtXQVM/ZqPK3wBDHx
	/TAYMqmKpzOSdcSlQLw+SiWwinTbw5gJe905j/xy2z4U/XExaqZ3CS73LEJ20zwgU5VHxbtWfXL
	Z4g/dRz5SlZNmdzWIB41lGzU7kemr4qffhyXJ40A5uKewzu6JRGzxMxKW9psq7ik8=
X-Gm-Gg: ASbGncvuWikjzmVNw+hLFD/hiu0xYafhRyfrKne+kdpt/wRqfjkC7fVETJaASWAM9bm
	hYK9yC4kJTKE9aKiZN5ex+2h75HLxCuofkEsRXded/THI9JdOlYVTJcJyY9sNmiiRndf8uAyRmy
	Nvbw==
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id 586e51a60fabf-2ea96f18fc2mr1940851fac.30.1749646138960;
        Wed, 11 Jun 2025 05:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzhqyM2kCCDhwaEPz02MLETIROTaGu5WeJENkIMCzCu3hfLe4ldyitgFfsfYyGdI6dZNlApiM1ratiR1ypk/k=
X-Received: by 2002:a05:6871:e803:b0:289:2126:6826 with SMTP id
 586e51a60fabf-2ea96f18fc2mr1940818fac.30.1749646138634; Wed, 11 Jun 2025
 05:48:58 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Jun 2025 07:48:57 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org> <20250611-pinctrl-const-desc-v2-1-b11c1d650384@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 11 Jun 2025 07:48:57 -0500
X-Gm-Features: AX0GCFuz_RtY5rxDREJdwFYXLGRQkyQfytWb3LifI1_It-SfpAfrMZfWta2TVOY
Message-ID: <CAJM55Z9WzsxWGmQYH05hSisigTRaHuKOn8g3AsLJ9h6Womy2dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/17] pinctrl: starfive: Allow compile testing on
 other platforms
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Michal Simek <michal.simek@amd.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com, 
	linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"

Krzysztof Kozlowski wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since its Makefile doesn't build anything if
> no Starfive-specific pin control Kconfig options are enabled.  This
> allows compile testing on other architectures with allyesconfig.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 65dac8e387985ac7f865d13325eb903f64645a2a..de80f3ee52c40f3a817f229a751909c590161594 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -83,7 +83,7 @@ obj-y				+= sophgo/
>  obj-y				+= spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
>  obj-y				+= sprd/
> -obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
> +obj-y				+= starfive/
>  obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
>  obj-y				+= sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
>
> --
> 2.45.2
>

