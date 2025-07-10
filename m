Return-Path: <linux-renesas-soc+bounces-19472-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7CAFFCB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 10:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5AA716C7AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 08:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6619B28DEE4;
	Thu, 10 Jul 2025 08:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Of3GEVXW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952C328D8EF;
	Thu, 10 Jul 2025 08:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137104; cv=none; b=LPiJ08lCBPsuTzoH24WcXvCXkl7rqY9s3AtWyikrudDn9iVSCRYBHkbIiIsF/NdUQ/DS6nqP1eNmbgwWLPiIM/rUE3WXTynGuP8XH002arwwR2/AfKdCkwMWHCDoKqTDFdd5mTFPGDL8ZqAQhIjXadN8e0Swgyn8lafTakA80f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137104; c=relaxed/simple;
	bh=VyUdqDDHtFWaZqNMT0+hw3JqolGscqJoMY6YMyPAOaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NGQjfKP0q0dJ6VzcTU6s2qVB2oWy425aQEP7Xwff0mOLH33a2HtCGGfjPRV/GwThwBlcekH50uXOVfCWT5D3e9YgssZhM2hdQUYDU3RkAkK8aR3Ny70T2GWyJKs+RV2mmoXv4yiqfXV1WN1SBNYldLiTFKmncbNaAo52eXxutuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Of3GEVXW; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5561d41fc96so776412e87.1;
        Thu, 10 Jul 2025 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752137101; x=1752741901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKdgn7tzsSWNEcaz5ZCKVyQCaGiMlPWSiLSm5o0J6RA=;
        b=Of3GEVXWs858iv/ZEwxFpakeIYIjOpCDch1XUAwxgIW/wX0CAMmlqIF07CVa8Awewp
         EnsCwVFbjK/PZVP3DyrkV2kr6uKvvPI1UEgybnfCdQClOE0Y8tq8tZVuN9NLNxDLaKwe
         C4fKezFD3tss6g+5DPSHSUclExeIwU0gTjPU25mi+D+UnsP4AjghQTjsRiDpCwZxBQ2K
         L1kLpDr7EQP1l4tM9OOnwMBWWVRVsz1CwFTa/JaR16k7YidUMAdKx9vCumrZjFNsolmH
         cdWOoLkmUmak6T4Qp1hq/yYwuCBdKgn0ModYoacxjtkOChXAC3iYIjvT4dNr7SYGoPJk
         B9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752137101; x=1752741901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fKdgn7tzsSWNEcaz5ZCKVyQCaGiMlPWSiLSm5o0J6RA=;
        b=FHgFfvq+ZKnWgGzQGXyjPwUjFNASrOsNx9kGb4qrSxvpJ0a9STKAABm3a//+dzHPC8
         BP4k/1/4ZEl8tPShY8vZeL0kvYlZWhZ3lI3llxIcoe6mesdeGPkgreCs+TSzjNJQrTU0
         /NfEfKuyU7jWin5rbUPej+o56o89le/Zfl32WYH6daAWLxoEM2pujMrMLPwAsxY6O38X
         jqn5jFx6wKk1IoYcifPiAKY+sLg/P9WPQ7pJWmEQ5E++16YKNyAzqFwErBlgmelnh3yV
         wPLzgVjyOhlNKTxlIsIwPrj+mhlsDAkdon1MZ5pPMEInRFrtSm8ywfTqlBPkFEExvjcD
         I52g==
X-Forwarded-Encrypted: i=1; AJvYcCXJINlAoJQasGdRT1R7M8aRClEK1opyzehSeIyOtZ9XxLiOJpeHj3DdBh7laDAnjQUbSesVklO6PqI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Wazvu8yMys4IsKmE1dSl178E2vWElyTWjor7imfDfMeMqSVt
	uhi8O45jS9VVH/Z3qglRYKd4CGKtCBiGWNpFjWQCk9ID5xHyYwL7U3BW
X-Gm-Gg: ASbGncvUjdh3B6LG2xcG0ENZEF206UKO/QtaauLxNduC6KOjSTRzbgN2Zi4p0OXAAOJ
	UXACRGacaHfkA3CaUqkaeqAac7vy31dukvQXoAKyd+RHKghfMtYqeqzUVswtS587NyYWQ8Y3vBQ
	4ddZmxAFoFmzOtPJB6kdyCXwkwV8UacSuiMicUnTBZ7ZXmDmZluvxnAY5vLg0Qd3TPCyBlmeOeN
	mAduORXYdLuD+Ej0SP82zWVlKCUghILvCmCHgCq1sYFntspi1nOR0l8xKv8DhyKxT5P+ARktkEP
	HXq+Zh2kPSt0wCbFcX67xaxiOO9z2Yfva9H3fxVb5EMpIY7hpV2UJDsu/3hY/5QsVZRJoXKyukm
	k/b3q1N+1wTDJcnPYm7FPm0MfC5H+jx2d5SHIW90jSbkCfQyHQ7/KZQ==
X-Google-Smtp-Source: AGHT+IHCpBc1171VY6lUvPoWG4vrSAtb9/OKExB5VZfZ0Hf6igfxd/hFTtzwqncaXe8j8hN1gV5DIA==
X-Received: by 2002:a05:6512:10c1:b0:558:f7fc:87c4 with SMTP id 2adb3069b0e04-5592e3e0f5dmr646988e87.32.1752137100272;
        Thu, 10 Jul 2025 01:45:00 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4464:423a:5ae9:509e:a65e:81f5? ([2a00:1fa0:4464:423a:5ae9:509e:a65e:81f5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d0942sm278431e87.138.2025.07.10.01.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 01:44:59 -0700 (PDT)
Message-ID: <924e885c-dc19-49f7-9991-58b6e248b208@gmail.com>
Date: Thu, 10 Jul 2025 11:44:58 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: renesas: rz-du: Set DSI divider based on target
 MIPI device
To: Chris Brandt <chris.brandt@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>,
 Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-3-chris.brandt@renesas.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250709205532.747596-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/25 11:55 PM, Chris Brandt wrote:

> Before the MIPI DSI clock source can be configured, the target divide
> ratio needs to be known.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 4ad0be03a5b4..a8796df43f75 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
[...]
> @@ -666,6 +667,22 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	drm_bridge_add(&dsi->bridge);
>  
> +	/* Report required division ratio setting for the MIPI clock dividers

   /* should be on a line of its own (unless you do a networking patch)...

> +	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
> +	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
> +	 *
> +	 * pllclk/2 = vclk * DSI divider

   Why no spaces around / while there are spaces around *?

[...]

MBR, Sergey


