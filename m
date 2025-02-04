Return-Path: <linux-renesas-soc+bounces-12840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DCEA271C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 13:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77363163EB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 12:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF15C20DD7D;
	Tue,  4 Feb 2025 12:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ixySQ/IH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E52F46
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Feb 2025 12:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738671945; cv=none; b=kx/VVCBouJ2W3YaE3TPnDCwEthy5e5MujVEcBCeayN4HPGC4Wzj4Hm3ZRlhwrBLsIvbm5w/r1ODxklTcpajt3GWnMmcqThfVes2wW0le2kyW2bKkQXtNjEDwLN2S0dAJS4cAYQSU5uzBdlm0zjZVaoScWY8pe6f0Q7K3g/FjGM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738671945; c=relaxed/simple;
	bh=UF8GapJmGo29AFZeeR/1BFU1zOCQJ5GoPWEKGnnavmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P2wkgP2EUe/X80ua/QeD/1jLnGfte/OUgaD+xpYt3yeSwkxbQtOAdMJ6U34uOv1lkFnoSaOYQptQFfJ5c9/X4NXnbm/xZxzmoO6LWgK01+ukSi+3i99W4wwFdMm1LIySIj+B4WJsRpHFovax3oKeXMMvr8g5x5HiwkBD1rtWt4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ixySQ/IH; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaef00ab172so889996066b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Feb 2025 04:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738671941; x=1739276741; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vc6R+5OOxcNOuD/zaO6f9SUtDza8IUtwA/z2Z7xjXzA=;
        b=ixySQ/IHU4XHhEuvcXBaJWLj9S6xym1/KbE4KThmfrpW0pyVXtUefQyWJWrPPkrFW2
         v8RywWQE0kdLw5AVaMNrRWK85o1XeZi8R8fo/rZtZhzVjVOK3a0mgyyYVUns3+T3gBe7
         a8tNbeYOzEdGci4PuTVQzNckLEzzwSafZS/kQ3VhJshC2CHbwgHPzVKrDDG6j6S9lJP+
         h04o275FhWFPxN1gwJ21QKk4Cw8HnZ/PFxfHV5ToefHZNhb9dSKL374SYizu0LjVXAro
         fYAey9FFZ40uzyVOh1PReDSMz1s0Uc9+OPdx9XPCjhlif3iexF+J330VioUC63QYxYOw
         wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671941; x=1739276741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc6R+5OOxcNOuD/zaO6f9SUtDza8IUtwA/z2Z7xjXzA=;
        b=uu6MuOvzAZKKXDlPUawdl8+pJOO8Lb23T4iK+zVIFp4L1qhx+2YhVWwunLrzQK0gAZ
         Zaqby56jjYzZkHE2GdpMHUKStH/oxonoHnnvX7fjvTe40rkLZHw6fPC1AeCyi0DVBlrS
         RxbCZi5bNvzQtzIi0hOYxmGf4pMCjSWXpz0+a1KKnitegzZJyL39FejUbJjyq/MRPduK
         OVVRQ6azPm6dkxftT0f21lvvSrqGOFSwl0t/JUMKSGu8AKsDAiUnYuyEuDT+kBkX1sR6
         OAhBxzazxCeOfwC/vJ4w/qxzVaG4GE5kIXtf06L2uoDnZ3wjpI6dMm+9EJsJxBsdzFyJ
         5/tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKeYP22NMG3PM/W1irPwIOkCJeZpy8HnGqjTsU5ZymFMNBfhJVLlxFo/EEvNDGlUW7YtvzJQEV3VCJqfRIclNrdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MoDwjVAvZ2fsFnIq0QBjyPdRpM+42OlwrybRYjnazv26uw4F
	Y0kPyGBgR1GlADYs5PiDr7V5dCnnP2AyJ2PrQtcPaJEW58SPtviJu/+YaSo8XrU=
X-Gm-Gg: ASbGncvr+6CNAtd0zJFAFcJamfw3N5XOW0muySH7yd4J2l2IKz1vYVpxsAgvbdzuLCG
	v5vKoihzbZX5faADGhCWlNf6bWfyS7DSpXw+TKHVZXZ8h1BdtYjZbQ+qpTHOtgJ8nIn7QCKvhC/
	cTd9uXRPrsM7pcTeChtS1dLZ9weqW8WxOZvafaB3CQKVG1M4A1l8+zTxRdFbkUbs4g/fnfS3YSB
	/0IIa1Y6GcHMmtLas95BWEua+JsW00BO2bMAFoiA2p1z0/ggliXaHYfkshZ2eJOdJx5m/3Y32aM
	RtNPlR8QtGNYqeW/6FqLH+rs
X-Google-Smtp-Source: AGHT+IH8oagarziM8PLmDhoL6DDR+DiVeWD1pSDTDCV03o98SK6xK1MGwh6xnR9MLRXiwKmejmc6UA==
X-Received: by 2002:a05:6402:268d:b0:5dc:740b:3cdb with SMTP id 4fb4d7f45d1cf-5dc740b3efcmr57701205a12.29.1738671940727;
        Tue, 04 Feb 2025 04:25:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31b37sm920440966b.143.2025.02.04.04.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:25:40 -0800 (PST)
Message-ID: <427572c8-72b7-41fa-b065-fcb398a30779@tuxon.dev>
Date: Tue, 4 Feb 2025 14:25:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] iio: adc: rzg2l_adc: Drop devm_pm_runtime_enable()
To: prabhakar.mahadev-lad.rj@bp.renesas.com, jic23@kernel.org,
 lars@metafoo.de, ulf.hansson@linaro.org
Cc: linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250117114540.289248-1-claudiu.beznea.uj@bp.renesas.com>
 <20250117114540.289248-2-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250117114540.289248-2-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan,

On 17.01.2025 13:45, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On all systems where the rzg2l_adc driver is used, the ADC clocks are part
> of a PM domain. The code that implements the PM domains support is in
> drivers/clk/renesas/rzg2l-cpg.c, the functions of interest for this commit
> being rzg2l_cpg_attach_dev() and rzg2l_cpg_deattach_dev(). The PM
> domains support is registered with GENPD_FLAG_PM_CLK which, according to
> the documentation, instructs genpd to use the PM clk framework while
> powering on/off attached devices.
> 
> During probe, the ADC device is attached to the PM domain
> controlling the ADC clocks. Similarly, during removal, the ADC device is
> detached from the PM domain.
> 
> The detachment call stack is as follows:
> 
> device_driver_detach() ->
>   device_release_driver_internal() ->
>     __device_release_driver() ->
>       device_remove() ->
>         platform_remove() ->
>           dev_pm_domain_detach()
> 
> During driver unbind, after the ADC device is detached from its PM domain,
> the device_unbind_cleanup() function is called, which subsequently invokes
> devres_release_all(). This function handles devres resource cleanup.
> 
> If runtime PM is enabled via devm_pm_runtime_enable(), the cleanup process
> triggers the action or reset function for disabling runtime PM. This
> function is pm_runtime_disable_action(), which leads to the following call
> stack of interest when called:
> 
> pm_runtime_disable_action() ->
>   pm_runtime_dont_use_autosuspend() ->
>     __pm_runtime_use_autosuspend() ->
>       update_autosuspend() ->
>         rpm_idle()
> 
> The rpm_idle() function attempts to runtime resume the ADC device. However,
> at the point it is called, the ADC device is no longer part of the PM
> domain (which manages the ADC clocks). Since the rzg2l_adc runtime PM
> APIs directly modifies hardware registers, the
> rzg2l_adc_pm_runtime_resume() function is invoked without the ADC clocks
> being enabled. This is because the PM domain no longer resumes along with
> the ADC device. As a result, this leads to system aborts.
> 
> Drop the devres API for runtime PM enable along with the other devres APIs
> after it (devm_request_irq(), devm_register_iio_device()).
> 
> Fixes: 89ee8174e8c8 ("iio: adc: rzg2l_adc: Simplify the runtime PM code")
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---

As of my understanding, currently there is is no conclusion from the
discussion at [1]. If it's not too early in the discussion, can you please
let me know how would you prefer to go forward for fixing this driver?

Thank you,
Claudiu

[1]
https://lore.kernel.org/all/20250103140042.1619703-2-claudiu.beznea.uj@bp.renesas.com/

