Return-Path: <linux-renesas-soc+bounces-7146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5860929B6F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 07:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834591F21570
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 05:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF44EB662;
	Mon,  8 Jul 2024 05:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fHl0yuG2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66003B658
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 05:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720415629; cv=none; b=PO2qUC5kroJop0WxdCNd/bNI6Q1T/rtCtEYaEweHT1xoZWgd9HcZHH5bAbE54riA+6O2QECi08Z9u30i8rAQlyH+H3BrXLHwKGf/JnfZv27I4WZtGxRyOES/ywS9/+k9VThfOa7CLUAalFfRC8U+kIAenk9hBaGvjK31Rc4jdSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720415629; c=relaxed/simple;
	bh=wRFbwZCq6fW6VzKrR2D+pZJuBoE0qYdTiZYmsY+SkVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r9fBr6anDZkpPoLwPNSUcou9vyZHL0pWXWtd63FHx4dso06pWHLx1/ur7ddheNWYRCtzrSiwR8z0ezYBiGqN23E06fvUP4WzYcxYQo2ZRph6LF71NQ/ckhV1NVdGDCSoCyOaDLyWT4D3+hUX0ymVy2LDt14s9XTmaSaeyJ/thLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fHl0yuG2; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so37068691fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Jul 2024 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720415625; x=1721020425; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz7wWMAmp35kfVIWuAo+lyRhJVw4zZS6mIxOLkavesk=;
        b=fHl0yuG2ZDSE0q3bihnJP3u1s51SrFuMYERyIIzOzxQrrkUyao9hRfzD7dja8QU20P
         tg1HQUaj3Jz/lmpP33MfzBbZZXHp3RVrSBRaXSkGhwO+KhUbT2MeMzQd+5N4iUfBX3r3
         6N0HM2KkUFuq79bnZmCjYqGojiO8i1pN5ipG+Ob+7BUKj6OmvjqwCBRbis1DnwFmjOq1
         Fik9F/0Mc/YMXdQc0ApVXK+cAebcLDf9VLozTlNkbcsrdGguH9ZaWr0wz832+nnMqLXd
         dW4v1McBu+vKMGn9tGZldJSB6kk03XsDtqKkZqMvfbhTGT6suh7Q94yxGh57XVXH/Az7
         6d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720415625; x=1721020425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz7wWMAmp35kfVIWuAo+lyRhJVw4zZS6mIxOLkavesk=;
        b=ZKDpIpVsae7Y5w9Exz0sokuja/B31k3vjPz3pNSWoPAt2CnJicOFGUkKTZtHq+1bL1
         1SpjMcqWVB6qnoIQN1oFQjJJSM+Kg2t96wnqsDvHbQEJXIfGJwymD5So2KpQgarfYgOJ
         1WcC70XhrmJsfVmDbd4Tzk/2hldcczreHPj2VzavIN0wYhn0YpQk6WL8PxOAp/drxDUr
         RluMLYTHVqe8Tmv/ZF4CWsHE1AHcPNPj3yvUE1GXIv/hbAs9VqHQ0qjAvpDvz+7FqaSE
         18t4G786yLhPfnA3jOXEumGoRhCPcuab5wDEythFnGyQGvr8D6Xr1gh+DzI7V1AihzcD
         VhLw==
X-Forwarded-Encrypted: i=1; AJvYcCURENSmvVG1eB/bJInaAWqOXMipLQzVHf63k9EWrtZdICkGZ4WZUBcpYlGl/jy0hsqLdfT20Xo/kJvZXlFBZ3FHc2OTMonWWKC79EnuRvztM9k=
X-Gm-Message-State: AOJu0YwrIB3R8wTjBE2Br3EZrozRcPojiNm/ukpiN+8lv4xZrwHekUat
	7h8WXUAj5SNaoNcJIt1wQD1CZBWYRRp4n/G16Y7Wzqwt92KzryggywCHmrvKLbs=
X-Google-Smtp-Source: AGHT+IFISF4UwewGpBvBho0EppedjUfcSuAVkq8b8GaHaZZCaF0Hi57425EYZnXMa6pjbT4HHeqobA==
X-Received: by 2002:a2e:9953:0:b0:2ec:7300:d02f with SMTP id 38308e7fff4ca-2ee8edd7b73mr65514061fa.49.1720415625292;
        Sun, 07 Jul 2024 22:13:45 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a40a6d4bsm8433845f8f.51.2024.07.07.22.13.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 22:13:44 -0700 (PDT)
Message-ID: <b487595b-d215-4e7e-8e61-71cd6dbf7db6@tuxon.dev>
Date: Mon, 8 Jul 2024 08:13:42 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/12] i2c: riic: Use temporary variable for struct
 device
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-3-claudiu.beznea.uj@bp.renesas.com>
 <mzuqdxb2dthfg6xa5jhodj6d54b6zlcnby35hmxe4jvfw3oghm@uunqpeg5wcdd>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <mzuqdxb2dthfg6xa5jhodj6d54b6zlcnby35hmxe4jvfw3oghm@uunqpeg5wcdd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Andi,

On 05.07.2024 01:30, Andi Shyti wrote:
> Hi Claudiu,
> 
> ...
> 
>> Use a temporary variable for the struct device pointers to avoid
>> dereferencing.
> 
> So far just refactoring...
> 
>> While at it, replace riic->adapter.dev argument of
>> dev_err() from riic_init_hw() with the temporary variable (pointing to
>> riic->adapter.dev.parent).
> 
> This is the real change in this patch and you are not explaining
> why you did it.
> 
> ...
> 
>> @@ -303,11 +304,12 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
>>  	int ret = 0;
>>  	unsigned long rate;
>>  	int total_ticks, cks, brl, brh;
>> +	struct device *dev = riic->adapter.dev.parent;
>>  
>> -	pm_runtime_get_sync(riic->adapter.dev.parent);
>> +	pm_runtime_get_sync(dev);
>>  
>>  	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
>> -		dev_err(&riic->adapter.dev,
>> +		dev_err(dev,
>>  			"unsupported bus speed (%dHz). %d max\n",
>>  			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
> 
> I personally prefer the reference to the current device, it's
> more traceable. If you think it's not providing enough

OK, I'll keep it as it was initially.

Thank you,
Claudiu Beznea

> information, then you can improve it, but I wouldn't like to lose
> reference to this driver in the log.
> 
> Andi

