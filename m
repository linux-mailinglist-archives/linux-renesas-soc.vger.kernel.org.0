Return-Path: <linux-renesas-soc+bounces-8070-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4845E95BB38
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 18:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066432853C7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 16:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A0D1CCB2D;
	Thu, 22 Aug 2024 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WHqj/wdl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2392D1CC17E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 16:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724342466; cv=none; b=oZr/EcQhYG21n7pjzRylWssfO/TXtH+cfkWie0PlWTFJNdDeATh4X0IwIkZ9NtLUGkEYgUZuNqc++CBS6sM1sCI0fdcmcSeudP2K7xIoNIhvfeqhQoNtG2ZUekHqmf12JqNix1e9BR3smxR0+pdxy6S5XiNqZjkFbPwL9ELdAk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724342466; c=relaxed/simple;
	bh=MclSXkOnOLTupbtg+RVJZ2pqMTD2zQzObzGTwq335G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YluKfk3HQGABuh6KD5UGoVlqjKfZyJecHYE86Aev2YcD2DtGipyRwodGy39ibcHNRwRb3LvQjIqQQrAQIjOwDhGDRxnBs4cnG4SfnGbJ/qtZB2yMLhOXOXYKmmlhfl4qCm0ClXPvMbekiPqDDlal2LW3gBUCZcJ7/QpRisEpCOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WHqj/wdl; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8696e9bd24so72708366b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724342463; x=1724947263; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GnuBeHZrfqyuSlw2s4S9P4UlMr865U+LGI9hzvnRLuQ=;
        b=WHqj/wdlydUcJQ3ec9OPcfdfscp4yYjQ0SdpgZm3HjMksmPBmeSQ5na6r0xQIZUFU6
         riYsf3huUlbnvmgO2XBriLTXZy/vN37MgSWvoAtlk2QPFoXZ4XL5mD6fzUgx1h73s4li
         Q3/XiLXBlb5wUuQ1FC0ogbn0Z+/Ep8QZ2wyz1xMxXTZnbB/973Wk4a6QNV0WtUWGaurK
         Ah8clkkaF29ZbHR9JzMQ+cSaKu+F4vhT+oNNnodR6UoY7JPihuqgPyRbz9UUAmLP/UN2
         Ut14wPsuBFA6FSqAHvomAhKgWBo5ugPYA0lw5/8Kv7zKDac9/F+p/apIzXkBW3b3lHYZ
         31Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724342463; x=1724947263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GnuBeHZrfqyuSlw2s4S9P4UlMr865U+LGI9hzvnRLuQ=;
        b=VGxvMBoQNRvsDjNFj2AxLooi1yGtK4IoWJnJyDA+vnkxqDkxKbmvfLsI1fV6EcUenQ
         h9mTsNHAHr5ZIjjwxOWSoA8y2W96f/sItBsYxdvqgCZoRw8z8QmdBTotyjQdFB/U79Fh
         BGsuG6lFee+KiVUdxdpvSID7sKm6cNtrfqy+l6HRUL12+HfVolUvbaJO1z1PwTWwbKgn
         DNxjqckEPnP2YzxJ8NbUbvKmHQOrof0df2wEHvd57GeZ/bIIXSOTqJY9m579nYNW6czo
         kPnXStWezC1HA8N8jN0XEnfnacEj3qwseUxKAKrHxUQ0Ci4LiJXD63T05ykHfzhEcCO/
         5dlg==
X-Forwarded-Encrypted: i=1; AJvYcCVKmJksbB8DXl7/zsK5IjQ5td+2t7JZBpU5zsbOdHKmt19yEefEGzbl/PPUGeRvugthSa8EbC+E9Rl1MJ4c0wrYSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/5nYW3FEn3l2zVExpgK6iS6z6Gy3GD3FveJNYYIIozfhVobb
	VUNkATQuQkhNhqbU7al3N1/y26I0UKodj3Y7eEkub2XyvKUorJwhMnqv78AcPpo=
X-Google-Smtp-Source: AGHT+IFmKsPnikBSvZwZHhHC4xxZMreb+EUxNzzV6xe+96SGsynHYu6THV9fmm8arTYP4of1spf7Nw==
X-Received: by 2002:a17:907:72c5:b0:a7a:ab8a:38a with SMTP id a640c23a62f3a-a866f2b1458mr485782466b.27.1724342463358;
        Thu, 22 Aug 2024 09:01:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f47c584sm136021266b.157.2024.08.22.09.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 09:01:02 -0700 (PDT)
Message-ID: <1bca08ff-f3b5-4ab3-9bed-553acf13d54a@tuxon.dev>
Date: Thu, 22 Aug 2024 19:01:01 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: riic: Simplify unsupported bus speed handling
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Chris Brandt <chris.brandt@renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <dc6b10a56be9c90f580c50c55d829766fe2956a7.1724337807.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.08.2024 17:45, Geert Uytterhoeven wrote:
> Simplify checking for unsupported bus speeds and reporting errors by
> factoring out the calculation of the maximum bus speed, and by using the
> dev_err_probe() helper.
> 
> While at it, use "%u" for u32, and improve the error message.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
>  drivers/i2c/busses/i2c-riic.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index a6996f3c17110dd7..c7f3a4c02470238c 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -316,16 +316,13 @@ static int riic_init_hw(struct riic_dev *riic)
>  	struct i2c_timings *t = &riic->i2c_t;
>  	struct device *dev = riic->adapter.dev.parent;
>  	bool fast_mode_plus = riic->info->fast_mode_plus;
> +	u32 max_freq = fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ
> +				      : I2C_MAX_FAST_MODE_FREQ;
>  
> -	if ((!fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) ||
> -	    (fast_mode_plus && t->bus_freq_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)) {
> -		dev_err(&riic->adapter.dev,
> -			"unsupported bus speed (%dHz). %d max\n",
> -			t->bus_freq_hz,
> -			fast_mode_plus ? I2C_MAX_FAST_MODE_PLUS_FREQ :
> -					 I2C_MAX_FAST_MODE_FREQ);
> -		return -EINVAL;
> -	}
> +	if (t->bus_freq_hz > max_freq)
> +		return dev_err_probe(&riic->adapter.dev, -EINVAL,
> +				     "unsupported bus speed %uHz (%u max)\n",
> +				     t->bus_freq_hz, max_freq);
>  
>  	rate = clk_get_rate(riic->clk);
>  

