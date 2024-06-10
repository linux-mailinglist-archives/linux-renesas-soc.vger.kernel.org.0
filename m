Return-Path: <linux-renesas-soc+bounces-5982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE6B901A83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 07:54:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 566621C224AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 05:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E653D1C683;
	Mon, 10 Jun 2024 05:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NymjpM4U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2622261D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2024 05:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998785; cv=none; b=Cybv2w8RZbk6WPu5dKPme1YFgS8iaKRv5X5ybfDEZuQTspLf2Me6GQLQs5CBq2d3+dNzlQ0IbbgVz7Spu63KCfDlmSVjy7nZRKqQQcTQG3fBCzjxdsy6jNyg/cDqE6EP2L77wQxjlfbcmzMj3utFL1z8YvCTcAywzCzm+fUFgII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998785; c=relaxed/simple;
	bh=g5mdZUZrUMXlcBRYIYNK4cYe3M6/JVog4TgGEFMeUSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlW44G8EQ1xHzZYga8//7nbrDr+HkoJ8Ome9ZZ2X2JQ/BSvOTSJ0BmSHNNGnzjKmwJpzXzXI3dV3TO+D97mpLlvfqQoGnWg5wA6zLOswOzPGz6donqSf1d1Sh47qpr9w0KPrncDMcD7gKN2v7xNAaRo4pfAY5XW7XoWYihVvGHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NymjpM4U; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42178999284so14575395e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 09 Jun 2024 22:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998783; x=1718603583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBpGQvFg8ykXSoBtp9fn/QkvirojbeDTL22Ufuj8YOo=;
        b=NymjpM4UsJ8KjfNDxl1+r3rHPHlsQtyI1SHLLr19wAaToWn83M33sOYmRNyfn3cnfq
         IhD9ppuY+sCAQA6bYxGa18AUf8p8lOMeA2cwvX4zvvLDk+hpj6dB6JlcEAv4oLXSQR5M
         UKDKDsbj+x+8UUWb/iP1BYbIriXjZ+mQ4KW3vkXQQ0V6hTrvj8KxV9GyPR1ZovRCyDMl
         Zy6Bm4FUxMIbdIvsx5uygkcn9+YBqmi8/38gUxdxSL4kXxl2pm7Va3xJ7Ygr4D0YEY7r
         VUoEsbWlvr5A1QN42yPsDop9mQk+ObuSHxYUKk+fvOVI7I190KRQaZeLpt5GHNurIOtF
         PO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998783; x=1718603583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBpGQvFg8ykXSoBtp9fn/QkvirojbeDTL22Ufuj8YOo=;
        b=dDNjDtrEMUk1CCDLFw+cvkW5UhZ4ZnunkzxZSVpbkTJ5zc5nHtrctwHOPkbTw8wMqJ
         v516VuBKhPFezBwLr/uUOy3/yStYkm9QDTTOMdy6kc4q2T5zNp7aGpjH59h7IApysnrS
         UlldkoNCEdpNBzhuVy9+yhikZogASlt7e21JOxFNj8PY1Ws5fABzQJ22A2Sx9+jHnHcv
         IWXtrbC+xoKB03m0xF950SGrNNcVdYFFH00hsKIxJCYLWx9j0A0j9QKSKl0hvOx1Pj8E
         TqWXdutdtLvvlc5Rs0PAssuSz4+svCTAfL9F5tZLZJnoxZgMJVREI/wawyI76lhKHXlC
         oH6w==
X-Gm-Message-State: AOJu0YzpkUd0KwJ5oUfaOiNP9IkbPDR/dCjT9pxYa76cIDv/ORhYtj+S
	lNqV34qF2IFSLlCWOn+3dLvSgyQHN7xtlblbOQnuyKXyYlF4fVQJD/33ACgd2oc=
X-Google-Smtp-Source: AGHT+IHUyyB3/3CZx9FiFPSJh4fyT6zXhBVwRwl3kcKY/JezqxEgUTan6ZRmICdNh91x86CjmrgZXg==
X-Received: by 2002:a05:600c:548b:b0:418:2a57:380c with SMTP id 5b1f17b1804b1-42164a2eeaamr65895035e9.26.1717998782821;
        Sun, 09 Jun 2024 22:53:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cc89e055sm25464975e9.13.2024.06.09.22.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:53:02 -0700 (PDT)
Message-ID: <2d4529ba-90a0-4c2b-9da3-affe82fbb08f@tuxon.dev>
Date: Mon, 10 Jun 2024 08:53:01 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] pinctrl: renesas: pinctrl-rzg2l: Allow parsing
 of variable configuration for all architectures
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
 <20240530173857.164073-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable parsing of variable configuration for all architectures. This patch
> is in preparation for adding support for the RZ/V2H SoC, which utilizes the
> ARM64 architecture and features port pins with variable configuration.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Included RB tag
> 
> RFC->v2
> - No change
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 84d5882099a0..89716e842c63 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -317,7 +317,6 @@ struct rzg2l_pinctrl {
>  
>  static const u16 available_ps[] = { 1800, 2500, 3300 };
>  
> -#ifdef CONFIG_RISCV
>  static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>  					      u64 pincfg,
>  					      unsigned int port,
> @@ -336,6 +335,7 @@ static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
>  	return 0;
>  }
>  
> +#ifdef CONFIG_RISCV
>  static const u64 r9a07g043f_variable_pin_cfg[] = {
>  	RZG2L_VARIABLE_PIN_CFG_PACK(20, 0, PIN_CFG_IOLH_B | PIN_CFG_SR | PIN_CFG_PUPD |
>  					   PIN_CFG_FILONOFF | PIN_CFG_FILNUM | PIN_CFG_FILCLKSEL |
> @@ -2219,13 +2219,11 @@ static int rzg2l_pinctrl_register(struct rzg2l_pinctrl *pctrl)
>  		if (i && !(i % RZG2L_PINS_PER_PORT))
>  			j++;
>  		pin_data[i] = pctrl->data->port_pin_configs[j];
> -#ifdef CONFIG_RISCV
>  		if (pin_data[i] & PIN_CFG_VARIABLE)
>  			pin_data[i] = rzg2l_pinctrl_get_variable_pin_cfg(pctrl,
>  									 pin_data[i],
>  									 j,
>  									 i % RZG2L_PINS_PER_PORT);
> -#endif
>  		pins[i].drv_data = &pin_data[i];
>  	}
>  

