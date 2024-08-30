Return-Path: <linux-renesas-soc+bounces-8562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 554F49663B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 16:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4DA41F235CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2024 14:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122A41B1D43;
	Fri, 30 Aug 2024 14:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QHAQMDDh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B81AF4F8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 14:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725026880; cv=none; b=tfml5J74uKx6SjNGd5M+niN1y3D1AQZgfmvY7ZPfNqjDO3Aam9uw4bSZlra+WWGwYpxwi6hs4PIKKf7L+3DOhlLUMDHWsRu6VEIxVqob42QE3/5qYr7z0JFXXyBeSi8BLrSshzgcu/bTY5kDChVM18yrHABI+exEuCo1Jj13HS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725026880; c=relaxed/simple;
	bh=I5aIqy/UEUXMFE8Rh7I4MruLQD76lvWIbdNAtEzLSTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zeuuc+rALjh0LDGrACat7N/oOoHYVaqVGrH4Hf25fSnFXuVKyiajAslMD2L8DN91YpIWB6X2MmmzWUo3Jqtq73dRlHcM1aOvF95+Oys9H30n99E0pF9U0Gix9M+DsfaL7LnY5PHQIUn4BRvZjT0bRjGqlhbTFjm8/IQ3J25oXM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QHAQMDDh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428101fa30aso16994345e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725026876; x=1725631676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUsIK727D/kMhMjVhqwKF/thJUrDUXU728kGFQYDRt0=;
        b=QHAQMDDh9sP7oU/yicPk+N7M9Q/ILeBwyqXHcz5uD30yyveV1zoLC3xDTwet+IgXLh
         rfSxkfrLuGLM7O3Dte4gfXq7eiUh7+by8rtCxXTaaVCYi4HYAEksQwkNXSfZYxokz4XI
         ak0cCHS+8xiBv8zNUWRzGujsw8THsUlNZZFn3GqdZL44C0YBbIXPn3rG6k14Cob0f4iy
         xFpSzE2c/r+Ny2ZV4twSVK+KqPal0fJzXoiaPWRGe7Qa8GOdZHi/2g28ForJVUGmM/I1
         NwqGjqTkWcykGt1+fgMp3IsgGfp3KmgmHWhUu/UTYYadq2kjViOaZ2iq7Ro174RfawUL
         7Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725026876; x=1725631676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUsIK727D/kMhMjVhqwKF/thJUrDUXU728kGFQYDRt0=;
        b=QBuRGFO77mWxVLhGD+aQXbXkRMZIVw17MZfm/FWjk8sNB2GjwQe+9w93LQR/Bz3GFM
         bRvJPuZzHCULB/DN4otN/jHtuTJZ4OtSujjEg0hjx40h8IMuu/C7fgwPPvPZslmM0xop
         wBXLThndsIzPP/yk3q7aIm3jp2gaBW/IbOkIwEvj6Fq1AeGW1yOoptILPfxH83Kf15SG
         qiDPlrpNZ9FwkHUDm97HjsdcvopIgcGtyQLXX3iLVaFlRKE99gdzGxeJhxf3EhFdjooE
         xPdsYSbv/GcwMktT+WpOPf23NMqFGALIKB9PgpZDNKntAdtd6y9UtJn33tdJf8E71ou3
         wvFg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9YrG9mu7LS5O4a3+NvDcEgCK2LqhU1B9aoeliV0fpascGmDfX54T+bNyT8j2XIPrHtBFsrBUtTmu4TSs8NxxYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM+iHPe6mvAM+roX/Q1wbPkzaJiqx1wKUhtbWxVNa5nZ41sCGh
	qrhq3S9YzUwVqIskmmY0GgxZC6Rg/SIp4QgvnyNZdvMePa56L21HiS8GPgnxpeH1tXbtV322+rW
	/
X-Google-Smtp-Source: AGHT+IHsi38bxWb3DH0GTQLefA8NeqM/+Q0cudI7v+QLxZSUlm4s1VrNogfvm84TLbAlA8m3jS0TQA==
X-Received: by 2002:a05:600c:699b:b0:426:5269:9824 with SMTP id 5b1f17b1804b1-42bb0229f05mr55125795e9.0.1725026876131;
        Fri, 30 Aug 2024 07:07:56 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63965dbsm82864085e9.6.2024.08.30.07.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 07:07:55 -0700 (PDT)
Message-ID: <194e87f4-7eab-4bfb-833a-27fabd2d5205@tuxon.dev>
Date: Fri, 30 Aug 2024 17:07:54 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags
 instead of local ones
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
 <20240828140602.1006438-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX+Q99MvQRZcwGbk8F8SiAUzRU_t2QmRuO_6etAqqXskg@mail.gmail.com>
 <8b6fc67d-5e07-4403-ac07-6ad0b9d61882@tuxon.dev>
 <CAMuHMdUqVcojRoPAEuZ8a9Y-iHm4b185StD73FpQoRFsEiZ8oQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUqVcojRoPAEuZ8a9Y-iHm4b185StD73FpQoRFsEiZ8oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 30.08.2024 11:06, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Aug 30, 2024 at 9:46 AM claudiu beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 29.08.2024 15:32, Geert Uytterhoeven wrote:
>>> On Wed, Aug 28, 2024 at 4:06 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> For watchdog PM domain it is necessary to provide GENPD_FLAG_IRQ_SAFE flag
>>>> to be able to power on the watchdog PM domain from atomic context. For
>>>> this, adjust the current infrastructure to be able to provide GENPD_FLAG_*
>>>> for individual PM domains.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> 
>>>
>>>>                 pd->id = info->pm_domains[i].id;
>>>>                 pd->priv = priv;
>>>>
>>>> -               ret = rzg2l_cpg_pd_setup(pd, always_on);
>>>> +               ret = rzg2l_cpg_pd_setup(pd, genpd_flags, always_on);
>>>>                 if (ret)
>>>>                         return ret;
>>>
>>> What about moving the conditional call to rzg2l_cpg_power_on()
>>> below to rzg2l_cpg_pd_setup()? Then this function no longer needs
>>> the always_on flag.
>>
>> That could be done but I think it will involve an extra power on/power off
>> cycle for the unused domains.
> 
> Still only to be done for the always-on domain, of course.
> Anyway, up to you.

I checked your proposal. If unconditional power on is going to be done for
all the registered domains it may happen to register domains for which
there are no enabled nodes in device tree and thus the domains to remain on
(because the driver enables it under the hood and the genpd core doesn't
know about it).

With unconditional power on and the current DTSes the following domains
remain on after booting with r9a08g045s33-smarc.dtb:
- sdhi2
- i2c2
- i2c3

as the domains are registered and powered (while registered) but the nodes
are not enabled in DT.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

