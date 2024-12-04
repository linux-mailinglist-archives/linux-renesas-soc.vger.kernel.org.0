Return-Path: <linux-renesas-soc+bounces-10893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C89E3574
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 09:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B335B30D69
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 08:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A32A195F04;
	Wed,  4 Dec 2024 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SDAJlXbc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04B18E368
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301104; cv=none; b=lB7ftSPTEvtghW62Yzcgzd68hg+4N0PdiqdKFkVWk6b4WTPPsOCqtuxv1splvgl75hEsxwFX4q64yAOeFvnAv0WweU6YpP7ei5k1JOUpbgdT0levqhcAVkEso7REbSuSJKQorecMJfdREDX5xvnpcBBC9n3NLWb5okEJsfnQQpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301104; c=relaxed/simple;
	bh=xabGMu3fdt5kFURE8R2vOsZrTXZ3kgYgaYfP0f8Lock=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9wX0RcH6J6bYQc92vkSJAuFXUAX8bXcSuf3Sj1ARM6T4f0J7P5KG3zlQqKAOVnPy4V0Xc7UdSmO5RSnEpsW0L0XZMwogNM3PkOLp145u7I9Afk9+8BqLCMAGLHsV7qN5tPx35DlYkAD+eKyobnnVfFEe/Osean0Ec3MiI20aeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SDAJlXbc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434aa472617so53301225e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 00:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733301099; x=1733905899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuEPwyIkCadZaJxdWvgGbzvWeURHvA2orRW9IhLBR4k=;
        b=SDAJlXbc+dFNvAZtCEL9z4dO7tpL1NCIZbOIMTllgcn+Hwx9qKKFR3MICdDaB7bOwf
         pO/4C10NFE7PdQillzmvinuobHqVhIoVjmqfwPD2lsIW9GHKmEb12ZUCaejQDVk1c8tL
         93ilif2dimOKq5EgwBXMsGHqCZjPdYJGLC91roJR//vrsZX7LtJ7bAkXSusmh4i4QI4Q
         C4jQ2sjcNvYMsAntI4UN16oJaVBGP00bTrS8SUcstQvlhgeb3EuU/gMbhYSS0Rf3ZKxn
         MWo9tCtk0N6mFFMsteUj/0NdjyPfWB8FmHwF+bIlqSTQ57CuUy1o0Kj8j/8geIMbdCiM
         bf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733301099; x=1733905899;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuEPwyIkCadZaJxdWvgGbzvWeURHvA2orRW9IhLBR4k=;
        b=XjOLaCBOJ78NtGYaVzlhgUgMYMfEbKVJ6UZIj43fKKJJmkk70i4sK7ltiFxEaztNj+
         HTsStncgBa41N7X3dpAjpnFaPQ0P4J2Ohz2eecJgJDV+Gc0JcRl3tn+brjozswHC4tTQ
         zX2JrJDFBKNoHZN4HsmCszGDOtoz45epeJg3YHjHtIXkAUzics6D0YaaI0W8PkzxMiHG
         3b8Xuuqp+Jzz5Lm2DUARm3RmrxWxY0pZKLDwfXlMegixN+Ft/ZE0/clpjUfNTHIbuvxp
         j2xEkVnHFHlm8OflpKI7vWtS/fTkETdy/26cl9wa8F6O27EV06xl2sFuGRTJ6Q/tPYL5
         jNFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwh75rluMkDtE0PX0s/b6gaccc/Djh9PCbxfLZLNmJOv5hPLs4Iagsb0k/Ms3CMXSYFB2W29LE1siH7hNm4t+I3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJddNgKf2iNJotDnQH+kq3qtKciVSODgFna6jw9tZZwvhXEnV7
	gSNV795LM+j6qrlJfVHEilW6nLYpJmfVgBqzkhFCrGW3fEg3uNJXHgNLXqkJI04=
X-Gm-Gg: ASbGncuvKFv3k0lcmF8+pE8PfI/Q56zj4KjmOHYkyVMPa6l9TIHxtD2j32JT+YhZS/G
	O1MAVEV3fs4V6aqBAbn831KuN8AdkwFPbW4OGq/qNoM9q+0/42ew92h+OfNVl5eP5PXBqqa/Q1X
	xqPbxaxrrFHPJgNmdyy+nmZzoCtw/yRkwExVzfSak19eZ3QCSQc4NIl4hKxLtGJ3gAdtyg4v7g9
	lo50LE9e3FfpaKXqKYP0snpEjiIwMIFzV21+w7LRCcVMVtctnxE4+o2N+M=
X-Google-Smtp-Source: AGHT+IHQNqpt+GIB9xF7p8MXDoapzcemzg5VBTJ4EDGzEYyaHfuVToI8Mqv94RLzyinN5pW25vh12w==
X-Received: by 2002:a05:600c:5117:b0:431:6060:8b16 with SMTP id 5b1f17b1804b1-434d0a1d63dmr53758325e9.30.1733301098852;
        Wed, 04 Dec 2024 00:31:38 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52723b6sm16489015e9.6.2024.12.04.00.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 00:31:38 -0800 (PST)
Message-ID: <e05191b0-eb3b-472f-bd8f-9d9a28100d0a@tuxon.dev>
Date: Wed, 4 Dec 2024 10:31:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] iio: adc: rzg2l_adc: Enable runtime PM autosuspend
 support
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
 <20241203111314.2420473-8-claudiu.beznea.uj@bp.renesas.com>
 <20241203200046.0dfb784a@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20241203200046.0dfb784a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan,

On 03.12.2024 22:00, Jonathan Cameron wrote:
> On Tue,  3 Dec 2024 13:13:07 +0200
> Claudiu <claudiu.beznea@tuxon.dev> wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Enable runtime PM autosuspend support for the rzg2l_adc driver. With this
>> change, consecutive conversion requests will no longer cause the device to
>> be runtime-enabled/disabled after each request. Instead, the device will
>> transition based on the delay configured by the user.
>>
>> This approach reduces the frequency of hardware register access during
>> runtime PM suspend/resume cycles, thereby saving CPU cycles. The default
>> autosuspend delay is set to zero to maintain the previous driver behavior.
> 
> Unless you have a weird user who is polling slow enough to not trigger
> autosuspend with a non zero period, but is still saving power I'm not convinced
> anyone will notice if you just enable this for a sensible autosuspend delay.
> There will of course be a small increase in power usage for each read but
> hopefully that is trivial.
> 
> So I'd not go with a default of 0, though what value makes sense depends
> on the likely usecase + how much power is saved by going to sleep.
> 
> If you really want to keep 0 I don't mind that much, just seems odd!

I agree with you. I chose it like this as I got internal request (on other
drivers enabling autosuspend support) to keep the previous behavior in place.

Thank you for your review,
Claudiu

> 
> Jonathan
> 
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  drivers/iio/adc/rzg2l_adc.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
>> index eed2944bd98d..fda8b42ded81 100644
>> --- a/drivers/iio/adc/rzg2l_adc.c
>> +++ b/drivers/iio/adc/rzg2l_adc.c
>> @@ -207,7 +207,8 @@ static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc
>>  	rzg2l_adc_start_stop(adc, false);
>>  
>>  rpm_put:
>> -	pm_runtime_put_sync(dev);
>> +	pm_runtime_mark_last_busy(dev);
>> +	pm_runtime_put_autosuspend(dev);
>>  	return ret;
>>  }
>>  
>> @@ -372,7 +373,8 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
>>  	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
>>  
>>  exit_hw_init:
>> -	pm_runtime_put_sync(dev);
>> +	pm_runtime_mark_last_busy(dev);
>> +	pm_runtime_put_autosuspend(dev);
>>  	return ret;
>>  }
>>  
>> @@ -412,6 +414,9 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
>>  		return PTR_ERR(adc->presetn);
>>  	}
>>  
>> +	/* Default 0 for power saving. Can be overridden via sysfs. */
>> +	pm_runtime_set_autosuspend_delay(dev, 0);
>> +	pm_runtime_use_autosuspend(dev);
>>  	ret = devm_pm_runtime_enable(dev);
>>  	if (ret)
>>  		return ret;
> 

