Return-Path: <linux-renesas-soc+bounces-6674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4588914184
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 06:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EC83B20ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 04:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7720A10979;
	Mon, 24 Jun 2024 04:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="krcq+8Gs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA01A1799F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 04:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719205039; cv=none; b=SCoOu+5hYeYG2ypqtG7gBtxSB+rcQ25ruJD9GtyBTDSRZxnUgMWTGrjmVLAOQCNBq/wY2b1XW6WWphw7ZZPW5PqwW0DC6BzIhr8VWDAbt6uooQgdMVHLrXEZKTybz+vfWFNMai7FXlxUA9GbilsVHHLv4g8fUtaWnmbLrGBos6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719205039; c=relaxed/simple;
	bh=RQS/xnRPJYl85/khVKO0/IszCWpI/UWhH+0merh4Jec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eogVUd1RJdFYpz5Qy5pZXHjmCQJ2HP/kQr+EHixv8m4RJM57nNWTbCEqStIRu4esKldc7X3DfunSBahwd3YYHWEEstcVvVHDZV33L5hCpYhaNEcznTJ82+0Rxeaa7mQfijuUt/L+Qkf0ZFClQbQneb98Q+OoLW4g37axr+hik7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=krcq+8Gs; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso4476923a12.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Jun 2024 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719205036; x=1719809836; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohlkAFRMQEfc+goI/NqcWImo6WTjyKLJAJ4QQ/QxOaI=;
        b=krcq+8GsCdbRlWi0qhbpkwCM4WNbbtykJYqSSIIHK+3rKK97U4VTIs9o5aSziS7ksr
         dmWNxLN/pFKxlfGrhHLY6NPcjAE6bfWk/r4ZOh7nS0Xzhgq+coGM95K7qICMT9gRjoI+
         bcdEuHLoagP+0okiS0GFmDoEW0rksqe+wzd7d28eVMw/2DhuSRV8h4D71f1O1e8QpKJn
         DdCJolxUZp2kVgrBArZXRhKWJU/pImz9eybV0SOw/wnVWroK4uUVhD5J5RdOMRRiAsVK
         gBq5l4Z+ZJCgVLW2MA441NvmYCi9xW/V5+CBTAoIwFuLl3SSMEAcJb7grpeGDg85OotP
         nbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719205036; x=1719809836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ohlkAFRMQEfc+goI/NqcWImo6WTjyKLJAJ4QQ/QxOaI=;
        b=WXpV2o/+YwzlPLWKCvNxjnjb0MpbHArFPlNJ3Ul0g0p6ThBBACcXG1jPijNeugdxrY
         I028rjafdBOpt4kfsox2Hvj0hiyAw6t+nOU//RpEc58DQoY+DZYq/5FYAt0KhihDavYy
         tDBR7kg42LjuwWk0+6XGnt8mO7APnSGxzsJFPoQsjKEycEjfaLiiYOb/JeqL2atAETeg
         jDrkmbhN8rCwqkjOuRGH7PRpPYL/tAj+HlWA0MAMEqBE98t7S5VBvbhAUQ73hz4uZ5L4
         us44lCXKtQ4mwgACQpp6Ri9JXvBPQadV7IGuGHQIKU7aVREzBtqdAkDm8353FtmbWNsK
         8aFg==
X-Gm-Message-State: AOJu0Yz6R0++1EuQHvJCzDzjKCKCRnb2eqeDwLy6E1UuGDYQ2nghOfWb
	DnHSQpbVqI3vL/a0sJn+eLJM8Dwea2RgQhI7Wgq/HAFj1jNQUbhZN1b7TBNL0RM=
X-Google-Smtp-Source: AGHT+IE6vgU1QtCbosxprgy3+2vqnzOl54xK/Up6rxm39ABPLyAtmfvPFkFv7O9F9eu23nt8CCSZcQ==
X-Received: by 2002:a50:d703:0:b0:57c:9d54:67cf with SMTP id 4fb4d7f45d1cf-57d4bd79da4mr2599999a12.21.1719205036154;
        Sun, 23 Jun 2024 21:57:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7aecsm4209761a12.20.2024.06.23.21.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 21:57:15 -0700 (PDT)
Message-ID: <65dcadf2-9247-4c65-84fa-ef982bfe79b0@tuxon.dev>
Date: Mon, 24 Jun 2024 07:57:14 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: renesas: rzg2l: Adjust bit masks for
 PIN_CFG_VARIABLE to use BIT(62)
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240618174831.415583-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240618174831.415583-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.06.2024 20:48, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Shift the bit masks for `PIN_CFG_PIN_MAP_MASK` and `PIN_CFG_PIN_REG_MASK`,
> to accommodate `PIN_CFG_VARIABLE` using `BIT(62)`.
> 
> Previously, these bit masks were placed higher up in the bit range, which
> did not leave room for `PIN_CFG_VARIABLE` at `BIT(62)`. By adjusting these
> masks, we ensure that `PIN_CFG_VARIABLE` can occupy `BIT(62)` without any
> conflicts. The updated masks are now:
> - `PIN_CFG_PIN_MAP_MASK`: `GENMASK_ULL(61, 54)` (was `GENMASK_ULL(62, 55)`)
> - `PIN_CFG_PIN_REG_MASK`: `GENMASK_ULL(53, 46)` (was `GENMASK_ULL(54, 47)`)
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index bfaeeb00ac4a..b79dd1ea2616 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -87,8 +87,8 @@
>  					 PIN_CFG_FILNUM | \
>  					 PIN_CFG_FILCLKSEL)
>  
> -#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
> -#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
> +#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(61, 54)
> +#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(53, 46)
>  #define PIN_CFG_MASK			GENMASK_ULL(31, 0)
>  
>  /*

