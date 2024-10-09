Return-Path: <linux-renesas-soc+bounces-9619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C694D996276
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 10:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36BDCB25EDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 08:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7586D188917;
	Wed,  9 Oct 2024 08:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UxfbsvLN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821A6188587
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Oct 2024 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462383; cv=none; b=qrgi2FBQB/kbEYQvx4tHKiW2tlyCBkPyVSEFHcIsPfNUgzKd6VwlDUSXoxKnS6MbdKLTcYTfrVNGn940BK4T5wLsQH2SjiKV3YOYjvTPK39OZeBap6kDil6y7GkXbpNpPYYMI/bYMn6T/vQyjSAAsEZxhlL10QLzz8GZSfWaMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462383; c=relaxed/simple;
	bh=9fL0jA5UZuEXaoQ8UrTPNdxf5TidIiox19GEPWNOBhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PqlfJtLzTc+p+UK94aJ8x1rNai6x0RcA8Z/q65t4YxafOR2bOQimyqpgGCsH/Fe9+AGd7eyFXWQIBsyr6lRiZeCtRJT716Dy5m/auZb9GSRz7a0gDyJZ5C649diNy2skewgpolVzX5AGzHrDJ7hthcQ1sy0Ob+qrn+9MLdSOUXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UxfbsvLN; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so86259821fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Oct 2024 01:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728462380; x=1729067180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLhzHB7jiqaUdp6L8vmJycmlbC4To6/gc8QcXQMUb/E=;
        b=UxfbsvLN53EnuN1lHceImQubd9+Tk4JPDo/eJnU49lonO3YyQz1LCOYQ01IEVWSzdz
         uSLJ12zZExfbAM7txOgAxRdjMsHvXfujkmsuLXLhxAvtCzjF9gwj+/QZAxSgHyK0nWL5
         dZCgmFEyl7ZdxMDIuQJFZGcjoNbdKOH3HeGPkI0dzExpdAKCuva4t7+nsYAJRhuuKDaX
         K5q/QIaEGKX6uTGMpc7HBRaB29RE7CuRPMXbm80mx7r6cIx2XLevC2vgXAniivsTJm09
         /UP8YHM8b6I8JgyNygqIl+lFoPrw2scrOF7BltN5QfO/42EYIJITNXoirZrFhNdPmHsC
         bjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728462380; x=1729067180;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLhzHB7jiqaUdp6L8vmJycmlbC4To6/gc8QcXQMUb/E=;
        b=CIAg/he/dx2GXeDUv5uZCFARMIHGmmWh9S7VAwqUlF63G38TzepfoYuh4W3XLUKyhz
         jwAH132tWQWTICV+TXCudJ0rYxds0wLJwucyuhn2VVUstbSignk3LZjAxtll6+ceyOfZ
         kowgIr9Zsedn8KsqLcPIR72A71noP/pMNvO2im6G0XU24DqOjUI5uRb9sOg+ONrywVUy
         VwKHnRDuiJfqa7aZZ4jecZs3J6CxFJQXSeICInA5h3CVLo4IpnESHpGWRdUUK/Alvv6H
         f6QlB+RvWgcR9XJMK5B5oVzZpygq4f4OlUaZhJeYKlXR8ZkKP+CHlain8nEIDNgxZ7G2
         V9dw==
X-Forwarded-Encrypted: i=1; AJvYcCUynTp6vi8ANrq8mbhYD+dB7rOJno9Tsjt4XX/Si6gdvL6hYNh5TTRvvHLpFjs1qAMpyKLC0kK57AqEergwHAToAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3QJFNs1GpyY+mDj0Pzi28aaSyUIPV3CxkUEgBAvfTKvzz5INH
	KcFrsyBN/a/fCQy6Msl0Hp81aKtCSMxmElHY0mvEGYf+V0dNRsyTGtVll6s3xUU=
X-Google-Smtp-Source: AGHT+IECwquztc5SDa5khaaQXBkSkMjoGXF+/YXZtyWMOkWs1onDNY2dNBzakxpW7WCrmqB0Ej/WGQ==
X-Received: by 2002:a05:6512:3d22:b0:52e:936e:a237 with SMTP id 2adb3069b0e04-539c4899783mr1251682e87.16.1728462379592;
        Wed, 09 Oct 2024 01:26:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9960ba14cfsm285051066b.187.2024.10.09.01.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:26:19 -0700 (PDT)
Message-ID: <61842083-32c1-49d7-a1f5-de1fff0c9655@tuxon.dev>
Date: Wed, 9 Oct 2024 11:26:17 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] soc: renesas: sysc: Move RZ/G3S SoC detection on
 SYSC driver
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
 ulf.hansson@linaro.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
 <20240822152801.602318-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU_kyPb9VAosStrwmQg9vOMgyogQu==u1XQEBWFQLbSdQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdU_kyPb9VAosStrwmQg9vOMgyogQu==u1XQEBWFQLbSdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 08.10.2024 16:23, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Aug 22, 2024 at 5:28 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Now that we have a driver for SYSC driver for RZ/G3S move the SoC detection
>> for RZ/G3S in SYSC driver.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/soc/renesas/rzg3s-sysc.c
>> +++ b/drivers/soc/renesas/rzg3s-sysc.c
>> @@ -85,6 +97,39 @@ static int rzg3s_sysc_probe(struct platform_device *pdev)
>>         sysc->dev = dev;
>>         spin_lock_init(&sysc->lock);
>>
>> +       compatible = of_get_property(dev->of_node, "compatible", NULL);
>> +       if (!compatible)
>> +               return -ENODEV;
> 
> Please use of_match_device() and of_device_id.compatible instead.

OK.

> 
>> +
>> +       soc_id_start = strchr(compatible, ',') + 1;
>> +       soc_id_end = strchr(compatible, '-');
>> +       size = soc_id_end - soc_id_start;
>> +       if (size > 32)
>> +               size = 32;
>> +       strscpy(soc_id, soc_id_start, size);
>> +
>> +       soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
>> +       if (!soc_dev_attr)
>> +               return -ENOMEM;
>> +
>> +       soc_dev_attr->family = "RZ/G3S";
>> +       soc_dev_attr->soc_id = devm_kstrdup(dev, soc_id, GFP_KERNEL);
>> +       if (!soc_dev_attr->soc_id)
>> +               return -ENOMEM;
>> +
>> +       devid = readl(sysc->base + RZG3S_SYS_LSI_DEVID);
>> +       revision = FIELD_GET(RZG3S_SYS_LSI_DEVID_REV, devid);
>> +       soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%u", revision);
>> +       if (!soc_dev_attr->revision)
>> +               return -ENOMEM;
>> +
>> +       dev_info(dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
>> +                soc_dev_attr->soc_id, soc_dev_attr->revision);
>> +
>> +       soc_dev = soc_device_register(soc_dev_attr);
>> +       if (IS_ERR(soc_dev))
>> +               return PTR_ERR(soc_dev);
>> +
>>         return rzg3s_sysc_reset_probe(sysc, "reset", 0);
>>  }
> 
> My first thought was "oh no, now this is handled/duplicated in two
> places", but if you later migrate the chip identification support for
> the rest of RZ/G2L devices to here, it may start to look better ;-)

Yes, this is how I see it going forward.

> 
> One caveat is that soc_device_match() can be called quite early in
> the boot process, hence renesas_soc_init() is an early_initcall().
> So registering the soc_device from a platform_driver might be too late,
> especially since fw_devlinks won't help you in this particular case.
> However, I think all real early calls to soc_device_match() are gone
> since the removal of the support for R-Car H3 ES1.x, and all remaining
> calls impact only R-Car and RZ/Gx (not G2L) SoCs.

That is good to know. I get that we should be safe going forward with this
approach.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

