Return-Path: <linux-renesas-soc+bounces-5985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67281901A92
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 07:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC8D1C22CC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 05:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5BA4D9EA;
	Mon, 10 Jun 2024 05:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="gxyiArkK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC6B44C6C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998827; cv=none; b=VEJQavMeKFcsXrVCN60lmSh+9Euk6uKMWC6Yl0pI267LMdSJRLcvdqyZ07rNuxY3TF/K5gqj2qDWJ1rHMVbpAhxK5oGLtP2dzCRTWR5jIGXWsfXt6Iz1jDkiQ9f4Lxw1bG+nDtyxPXabBsj+7fsUAM8GxT0wVEMATINBngiZn6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998827; c=relaxed/simple;
	bh=rlzPxKCF35BLy/EvK8WajE0xggMD+S4uBmgIx2v4/cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHDt2e0R2PdFx14vM3Bg2TAJLj+mww7q5pZYTqWOmk2FI/Mh6S4YtciPsY84LpBPXe8vUb1gNiJBz2bK8NALUrcQuMm9lLN0w1/sQqRgjo4pBs4Ild8dGx+EqVx5xFgc+1TT7VN3I1nEg/pYHgksDziV1vk12IY9WDd9j66YaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=gxyiArkK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f275c7286so217185f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2024 22:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998823; x=1718603623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ao1GXS/PE32LTpN5hbrvustoBzJ2OXW5VN8wfJSWxiM=;
        b=gxyiArkKbBbTUgnm3iEx6nzC/twQWxy8iZpj1a3we9TDg5Cz2MhHK09XlmfuHZ76EO
         lBCa9ferSTQMxmHvkbG3HkiJs+wuGF421YMBkjCdwiThhgumXktaUf83RIZtGlh2BAHB
         3wYqD5rRJoQRWWwRwISauDpvynJBofKcLaS2MkT4qDxlVndluml3WYeQSuV1y6TUCNkm
         fbGICqZ29C4mDrg7QZc451YH+xUJU+0UQ5nMzqZaCWOWXfmvl2jZhadpf83cMxHYCxex
         HKejF166TSphXrfhpWAWlrefZ6odLilIPpXwdI2cfTtIWphxnml+suixKRA5Bzq1MWNi
         dt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998823; x=1718603623;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ao1GXS/PE32LTpN5hbrvustoBzJ2OXW5VN8wfJSWxiM=;
        b=bqDQXMdqBb4kAieqQZFzVFtjSiQ8DpmWotWuRPycW1U7/d0wy3uNXG50xKr+wFe+bR
         Nd3ds9dxZe00fdmZThVoGw3CC8OEqOPs+7A/366IO8lRG+CYRWO5H08k1LXy+OZGlkLT
         kU8EW5uyyd4yrsiit6o14LpbRWonZa0WcjZaUS6IGe6igNA/SiJv3+9PQp2wDoeH0DdE
         fflJoZw37mHT+rZGHhVpoCdNREhfDz15jaYJOzYQgzvZaLXAl6qXpvnzPWShsJjkPjYI
         fnlLvG/j3c4CkF9CG9RxW3PmhnoEzmNlwB8O4ioWmpi25Vw21Nh4fjUip30ifWjeta0C
         c+/g==
X-Gm-Message-State: AOJu0YylCA0CAQ0LZN3vsi98WkWxICQRsFk1+mZ0h0DsCeHiMb8nf1Ou
	RpYD41BgFiC90PwiuQO04avy96Og5d2hsfAkQdmIKGqE6eoVRfsHYcMLkxeWOw0=
X-Google-Smtp-Source: AGHT+IGk1cvV2qBxDHR3NohOMCUt0+mvLoUONcZ+rYFVjUtGVf3AKy5gKwuFcfNUlPLCUE2+n/MOKQ==
X-Received: by 2002:a05:6000:104d:b0:356:a46b:7369 with SMTP id ffacd0b85a97d-35efed3f8c3mr5790669f8f.24.1717998823097;
        Sun, 09 Jun 2024 22:53:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0dbc6919sm6465662f8f.82.2024.06.09.22.53.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:53:42 -0700 (PDT)
Message-ID: <60438bdd-c2a9-430a-9d0c-9b867ffcf85e@tuxon.dev>
Date: Mon, 10 Jun 2024 08:53:41 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] pinctrl: renesas: pinctrl-rzg2l: Add function
 pointer for writing to PMC register
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
 <20240530173857.164073-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduces pmc_writeb() function pointer, in the struct rzg2l_pinctrl_data
> to facilitate writing to the PMC register. On the RZ/V2H(P) SoC, unlocking
> the PWPR.REGWE_A bit before writing to PMC registers is required, whereas
> this is not the case for the existing RZ/G2L family. This addition enables
> the reuse of existing code for RZ/V2H(P). Additionally, this patch
> populates this function pointer with appropriate data for existing SoCs.
> 
> Note that this functionality is only handled in rzg2l_gpio_request(), as
> PMC unlock/lock during PFC setup will be taken care of in the
> pwpr_pfc_lock_unlock() function pointer.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Now passing offset to pmc_writeb() instead of virtual address
> 
> RFC->v2
> - No change
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index a3fd14b95c5a..f8a1a1f2eebe 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -254,6 +254,7 @@ struct rzg2l_pinctrl_data {
>  	const u64 *variable_pin_cfg;
>  	unsigned int n_variable_pin_cfg;
>  	void (*pwpr_pfc_lock_unlock)(struct rzg2l_pinctrl *pctrl, bool lock);
> +	void (*pmc_writeb)(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset);
>  };
>  
>  /**
> @@ -383,6 +384,11 @@ static const u64 r9a07g043f_variable_pin_cfg[] = {
>  };
>  #endif
>  
> +static void rzg2l_pmc_writeb(struct rzg2l_pinctrl *pctrl, u8 val, u16 offset)
> +{
> +	writeb(val, pctrl->base + offset);
> +}
> +
>  static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
>  				       u8 pin, u8 off, u8 func)
>  {
> @@ -1329,7 +1335,7 @@ static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
>  	/* Select GPIO mode in PMC Register */
>  	reg8 = readb(pctrl->base + PMC(off));
>  	reg8 &= ~BIT(bit);
> -	writeb(reg8, pctrl->base + PMC(off));
> +	pctrl->data->pmc_writeb(pctrl, reg8, PMC(off));
>  
>  	spin_unlock_irqrestore(&pctrl->lock, flags);
>  
> @@ -2616,6 +2622,7 @@ static struct rzg2l_pinctrl_data r9a07g043_data = {
>  	.n_variable_pin_cfg = ARRAY_SIZE(r9a07g043f_variable_pin_cfg),
>  #endif
>  	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
> +	.pmc_writeb = &rzg2l_pmc_writeb,
>  };
>  
>  static struct rzg2l_pinctrl_data r9a07g044_data = {
> @@ -2628,6 +2635,7 @@ static struct rzg2l_pinctrl_data r9a07g044_data = {
>  		ARRAY_SIZE(rzg2l_dedicated_pins.rzg2l_pins),
>  	.hwcfg = &rzg2l_hwcfg,
>  	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
> +	.pmc_writeb = &rzg2l_pmc_writeb,
>  };
>  
>  static struct rzg2l_pinctrl_data r9a08g045_data = {
> @@ -2639,6 +2647,7 @@ static struct rzg2l_pinctrl_data r9a08g045_data = {
>  	.n_dedicated_pins = ARRAY_SIZE(rzg3s_dedicated_pins),
>  	.hwcfg = &rzg3s_hwcfg,
>  	.pwpr_pfc_lock_unlock = &rzg2l_pwpr_pfc_lock_unlock,
> +	.pmc_writeb = &rzg2l_pmc_writeb,
>  };
>  
>  static const struct of_device_id rzg2l_pinctrl_of_table[] = {

