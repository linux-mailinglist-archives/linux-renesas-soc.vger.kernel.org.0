Return-Path: <linux-renesas-soc+bounces-2523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C489284F00A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 06:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01A741C24C5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 05:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BA956B9C;
	Fri,  9 Feb 2024 05:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cy/0XMGb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B33956B98
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 05:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707458097; cv=none; b=TXYo4ctEVFcOyjMu7a4w1WZOII8E5DTGnkEna8uYyBZJy6do+iQlzH2mmuMozWKg8jwZhMDf9WhXpBFgIhT3fM8EGYAU85VZOrYbbDMOjb5DX0UcxplW6mMq/9faecubrDXxKIjf8ApcDkuW7d4835/uR0PY8tOlmGyi4vZ58PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707458097; c=relaxed/simple;
	bh=6O8nnoLFzLnwrH6TEG7OKKLM/CWovHK2pvgd9GTlM+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBnKaOrAG2UqCHLJwCat5FUNBiCMTx0EYS+4k+4PIBhRho7PJi2McHpK+PkHZ1bYWGEMtwl7+0vYC1kfiNy/3HXIHcXMsW38gJ16UtQdGoopDzJoPpSmwoneVYZ4L8YQC3QqM5QXPw4nP/HZ7/WJMKhoXvqe2cMUZokmdGxkmI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cy/0XMGb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4102f273c46so5249835e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 21:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707458092; x=1708062892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NHy3VGid497O23zJdu4K5s/J5uKQU2yHP46MdF54AZI=;
        b=cy/0XMGbR1xqhphlo5YTxJ73BcLObnVTw5shjcV1fGZnCWhWfO+Mbjjw0mDXld/aHY
         SkpekrfFD7Zr0U0nfZohZC7cIwYd43lDZrZ849xIS2q7Nd1oWdgXpuhdZC8U9wJtC2mb
         mFmr9tI6NZtykrZ0sUEka+HLRvO1UI90e3KJ8UTdTbJU37QlVXbI9jFKOXYC5daGmk3P
         dWZRN7LO9P4hekAc5FvJ5ASCzeaIzOZJ5umesvFVQ4amsgnZgZfh3HvRXMBcodlsHDH4
         sfk3U++xCFe97PE3XswrHjaFEvEF0WUfp853eFx6BQ+/owSLTX1h2OpK7ZJlO78dXeqy
         7iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707458092; x=1708062892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHy3VGid497O23zJdu4K5s/J5uKQU2yHP46MdF54AZI=;
        b=fe8lyFDuCA1tdCyj08fkuUoQCaxHhuua0YYIHqXGibXPR4b6ysBECrjqceoGqSJD3I
         42CpRBIcB11E8xktGIhn1xfK3M0CNTM12EPeUCQx+EVIFjp1Q/2WYBpcp2HZl2f1h15O
         4j42A5zUhffCDMx3MzEbH0VtNpw8KlrPD9f7yYEj1Qr2Xh//ISxeyRVRtboncyNdQqIf
         gF4rCJhWmGf2ASgaFxxp/dfypN58vKnprHnYbKayv3jttETyEsXUtw/6mRvlnLjtjTFF
         93U5NvCVEW6/DbhwIUKjui8qY1lgw4kBtv0k14dff254DrCRf7ZbQTCh3B2SgnjPHoZt
         PdqA==
X-Gm-Message-State: AOJu0YwNqwQjcgwGLeAZr3QmUTc2XK3Auss7axf7hM0LVxAcK00ag0QC
	ILDirsdO8iH2DQv524TfagOAK4raI7KjsEpZ/Vn+M37sVh/na1qchaIeNAfCNgs=
X-Google-Smtp-Source: AGHT+IEuUxs9lAPfJ/sLN4UiG4fjRtUUI244mYYOE5/0j1dk6EM85cWi7PJgaar6+vsAy8WACWYalA==
X-Received: by 2002:a5d:610e:0:b0:33b:6073:335 with SMTP id v14-20020a5d610e000000b0033b60730335mr308406wrt.55.1707458092359;
        Thu, 08 Feb 2024 21:54:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1LTGYuUHSatTm8Me5EcYa9WUXtVNfzARxigi860VQ5Rq7gIsMBnx0vA+gwoeJNxbCkKIxdaGe+FscX6cDei8pfhGg7XfsgCIywQVrSdywbTCUMDb2xrxHYGGLzCMRAzUg1LIIqcfEAlw4XSWGsOOr+w0R69BTgdEIymGST8Y23aGlmGpqevfwINrzDxfUTaqepBaglGKG2wBO5Z52fgsiVfghIrsb4OewvS19Hw3QqhzB3tGlu7Uw8jbL7F8zBPM5oW3iYhDp9PD6uCSvddmB2gOpNEi/KZdixLLOAAcsKdg3A47oYlXExfiV8z03wsUNQZsYy/2vLJn5pMgpLNUjIGeIDY9NPC5GXjc5Pwy8pPiE3Kj2ijYLa46VzwO+DccNT791McPS9Bwo5XrnpI/QJCExCGFDYmPGmA==
Received: from [192.168.50.4] ([82.78.167.124])
        by smtp.gmail.com with ESMTPSA id bv28-20020a0560001f1c00b0033b4335dce5sm921517wrb.85.2024.02.08.21.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 21:54:52 -0800 (PST)
Message-ID: <b16a15fb-bf7b-42db-a54b-795caac8a3f1@tuxon.dev>
Date: Fri, 9 Feb 2024 07:54:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: renesas: rzg2l: Add suspend/resume support
Content-Language: en-US
To: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208135629.2840932-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208135629.2840932-2-claudiu.beznea.uj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240208135629.2840932-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.02.2024 15:56, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> pinctrl-rzg2l driver is used on RZ/G3S which support deep sleep states
> where power to most of the SoC components is turned off.
> 
> For this add suspend/resume support. This involves saving and restoring
> configured registers along with disabling clock in case there is no pin
> configured as wakeup sources.
> 
> To save/restore registers 2 caches were allocated: one for GPIO pins and
> one for dedicated pins.
> 
> On suspend path the pin controller registers are saved and if none of the
> pins are configured as wakeup sources the pinctrl clock is disabled.
> Otherwise it remains on.
> 
> On resume path the configuration is done as follows:
> 1/ setup PFCs by writing to registers on pin based accesses
> 2/ setup GPIOs by writing to registers on port based accesses and
>    following configuration steps specified in hardware manual
> 3/ setup dedicated pins by writing to registers on port based accesses
> 4/ setup interrupts.
> 
> Because interrupt signals are routed to IA55 interrupt controller and
> IA55 interrupt controller resumes before pin controller, patch restores
> also the configured interrupts just after pin settings are restored to
> avoid invalid interrupts while resuming.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
[ ... ]

>  
> +/**
> + * struct rzg2l_pinctrl_reg_cache - register cache structure (to be used in suspend/resume)
> + * @p: P registers cache
> + * @pm: PM registers cache
> + * @pmc: PMC registers cache
> + * @pfc: PFC registers cache
> + * @iolh: IOLH registers cache
> + * @ien: IEN registers cache
> + * @sd_ch: SD_CH registers cache
> + * @eth_poc: ET_POC registers cache
> + * @eth_mode: ETH_MODE register cache
> + * @qspi: QSPI registers cache
> + */
> +struct rzg2l_pinctrl_reg_cache {
> +	u8	*p;
> +	u16	*pm;
> +	u8	*pmc;
> +	u32	*pfc;
> +	u32	*iolh[2];
> +	u32	*ien[2];


> +	u32	sd_ch[2];
> +	u32	eth_poc[2];
> +	u32	eth_mode;
> +	u32	qspi;

I missed it, u8 should be enough for these.

[ ... ]

