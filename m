Return-Path: <linux-renesas-soc+bounces-5979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F10B901A79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 07:54:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93CFC1F22FFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 05:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820C612E48;
	Mon, 10 Jun 2024 05:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="q1qeIBRm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FFF9E8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998736; cv=none; b=S+Zxfg15ymFP/YkpKxqcgGT49x9nMev9IX9SQu2jXdyA+qp+iRiZtiF8vXrFBQzytHItvLz2NmZTTdn2k7YFdsgM1sKBoIASZATH/2C/SdG8kcpi8a/qCoLNJ0eLkzW/MHvSW5Pm+AA555NqawFuBSgalWd6jift7yxGbh+Q6BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998736; c=relaxed/simple;
	bh=tEJxMcM+9LsI3fPhwfesCOt0sMgwAzDck8CgZrCSzgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enPBOBUFkuGqZAM6X3W2+aRVKOhVlvkx6u2JS8tPQULwqxkU4yeFObF8ACn+HZX+fPSG3M63fjOHo5Cx69Ztv8PX/9pjBg45HUgcP384dJqvxw97ffjhCIyqKvCRAFlVNFxkynlFL0ipph6/PksQxI37JtfNLzDuzz5vTWN5HQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=q1qeIBRm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42178999284so14570625e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2024 22:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998731; x=1718603531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ulf+Zjzfa5s1kwopkqk/sw8N1ZWmHS8sAwU7zWlXXq4=;
        b=q1qeIBRmV2xg2Sroqt/zEst9c4FYVpLF+etXkV0mAg1/I2pf7YDiFHI0gtzp7F9q9F
         oCIRFqqA9RQUJtKG292L8/c8YzFaIvUOIXljISLroC+o8Z6xBnQYkNx1D9sT3nRAGBic
         I+XO9Yw0TixFw0sYu0DfgB8pG45KiqxCKHoMV+89tdbHMjxW3YbdUvhI1qlazTYnXrhU
         z0AbRYEyMsUdlOLJzifiUz6eectfHiWmgTFZVWP6XpCyw+SxfEWiKY+mKpT1CmqzkU4E
         bXlucYzsNoTGoV2PjQO8Bb+PYkWf3npRGsPgU+ejwyPyHtImyvIPaLJ1+Tk4tRZHus7K
         RF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998731; x=1718603531;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulf+Zjzfa5s1kwopkqk/sw8N1ZWmHS8sAwU7zWlXXq4=;
        b=lz3SFTHe+wG9uw9q7TClMYLKfVlWoNVtwqfHrICr8AeOIOWnJ3uUHz49bBTGg7hQCE
         tMvZ9cm7e4UNzQlSgYoSu3ybTLhUNFkySZZ/kCwez9NlzdE9jl5n/yHJPGJFBQcWqldl
         BiAENIQAqgeYT52dAy08TkBdLEm/hJ/Ca0I5Un+z1o5xt2C4pDjgD/0TiG3+E2iZkKdm
         2yFY7bAFu8zAz0pjvGHsnZ4GvumHlWv/4eq2jQFrz6sEqEnnfKD7RW1+8m8hunggTJqB
         3Dt+no3y+IicukWoORS5nwGzF4xNzIwXyB81DmYxBZ/DBHO5jW2xARmVEZR+fXdlrJEh
         PzGw==
X-Gm-Message-State: AOJu0Yx61YM+OFscBULaeINLfcwsuMgRSmTfloaAxwHDxey6CzJ3tJ95
	d54cVJd+CY6pCR7ktxMrLHpXk2BpxdtTaOZyAb/7N2INmwASHFKy04IjFKKj8YI=
X-Google-Smtp-Source: AGHT+IEr8LsxGh5AtfyyS0a/VJvNay3v21KtD4xp8rzGfwrFFB2jCTneu+QwIAFkZhP6LQiVmKRkuQ==
X-Received: by 2002:a05:600c:470f:b0:41b:d8ef:8dcd with SMTP id 5b1f17b1804b1-42164a2e9fcmr53880555e9.28.1717998731427;
        Sun, 09 Jun 2024 22:52:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cc89e055sm25464975e9.13.2024.06.09.22.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:52:09 -0700 (PDT)
Message-ID: <0c8f65e0-866d-4858-9acb-521003198c5e@tuxon.dev>
Date: Mon, 10 Jun 2024 08:52:07 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/15] pinctrl: renesas: pinctrl-rzg2l: Rename B0WI to
 BOWI
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Fix the typo B0WI -> BOWI to match with the RZ/G2L HW manual.
> 
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - New patch
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index f784169abf11..169986022a73 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -131,7 +131,7 @@
>  #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
>  #define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
>  
> -#define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
> +#define PWPR_BOWI		BIT(7)	/* Bit Write Disable */
>  #define PWPR_PFCWE		BIT(6)	/* PFC Register Write Enable */
>  
>  #define PM_MASK			0x03
> @@ -478,8 +478,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>  	writeb(reg & ~BIT(pin), pctrl->base + PMC(off));
>  
>  	/* Set the PWPR register to allow PFC register to write */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
> -	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* B0WI=0, PFCWE=1 */
> +	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> +	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
>  
>  	/* Select Pin function mode with PFC register */
>  	reg = readl(pctrl->base + PFC(off));
> @@ -487,8 +487,8 @@ static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>  	writel(reg | (func << (pin * 4)), pctrl->base + PFC(off));
>  
>  	/* Set the PWPR register to be write-protected */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
> -	writel(PWPR_B0WI, pctrl->base + regs->pwpr);	/* B0WI=1, PFCWE=0 */
> +	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> +	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
>  
>  	/* Switch to Peripheral pin function with PMC register */
>  	reg = readb(pctrl->base + PMC(off));
> @@ -2520,8 +2520,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  	const struct rzg2l_register_offsets *regs = &hwcfg->regs;
>  
>  	/* Set the PWPR register to allow PFC register to write. */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
> -	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* B0WI=0, PFCWE=1 */
> +	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> +	writel(PWPR_PFCWE, pctrl->base + regs->pwpr);	/* BOWI=0, PFCWE=1 */
>  
>  	/* Restore port registers. */
>  	for (u32 port = 0; port < nports; port++) {
> @@ -2565,8 +2565,8 @@ static void rzg2l_pinctrl_pm_setup_pfc(struct rzg2l_pinctrl *pctrl)
>  	}
>  
>  	/* Set the PWPR register to be write-protected. */
> -	writel(0x0, pctrl->base + regs->pwpr);		/* B0WI=0, PFCWE=0 */
> -	writel(PWPR_B0WI, pctrl->base + regs->pwpr);	/* B0WI=1, PFCWE=0 */
> +	writel(0x0, pctrl->base + regs->pwpr);		/* BOWI=0, PFCWE=0 */
> +	writel(PWPR_BOWI, pctrl->base + regs->pwpr);	/* BOWI=1, PFCWE=0 */
>  }
>  
>  static int rzg2l_pinctrl_suspend_noirq(struct device *dev)

