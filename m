Return-Path: <linux-renesas-soc+bounces-7316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414A92FDB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 17:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7D1283252
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ADD1741D3;
	Fri, 12 Jul 2024 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cvHB570J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A2172BA8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 15:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798769; cv=none; b=BZwUnXH5W1/YXokAnQl3hIs8j/9Bdgz3GLVQtM9gIsBIQ07VU7toC/eFGFHhf7WWJwhhhEs7wTucBjJWJkd0Mhbz+GRXJ+Hn0FYnZ0MflR0woR10WaBAXHOVqkVJVkTqs3tVL9f2XoXxXySliA+auqOWXhbDWlkeD/rRlr4Q0rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798769; c=relaxed/simple;
	bh=68/kltcLtm3c5q8IqHBsqqo8yQ9MYg9r+nGvbZAb6v8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jEwKYx2GppmT09dVRKPAMUFi9oZu1HVB/h38X07MLewRJDieEV946vYPz9KVityZ3bJXhLeWEbgG1A8iPhX61aP4fJvhcR1Ip9l9OoJ7WnPtbXAWTK27I+ere6kJNTfndfMt/ttcDbR/zpPn7g6/BJT0iYA2IHipFre57snwtew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cvHB570J; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ea5765e75so2551559e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jul 2024 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720798765; x=1721403565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vXS6CNYAdyuDwfj4669MHWReU6UN/YmeD5dTtm16ne4=;
        b=cvHB570JIU/T0Kc4UbAjc+leZuO7yBrsLKr9kziLLcpdaAb+yOvSTdi9rQjd267Nwc
         zvn+ip+ghdBKIVk3WuQZstwnRpZ+GRciPeWD5bVIPNNuV2Nvy8M6mzkMZxhgrY5Bn9VH
         ZDLBBmt2l1VGUfoFvaHNjwA6N75Ec8url3uZL6O8CcN2NFQ9i57o0c6hXG2rSf2FmFvV
         QCeaur1zEnXYLL55W8dE96a6l6hTRvfGpZVMAmPaOFkG7rt/4zGvTm+JWc26LaRJCRrs
         WNfejp1msyGDdUF+UGL9rczvsb0NaX9GY7G3IjGPnIePK9ZUB+HzHfzw2vK6LLXQAZZ4
         2wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720798765; x=1721403565;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vXS6CNYAdyuDwfj4669MHWReU6UN/YmeD5dTtm16ne4=;
        b=PE4Uv4hBSRPBbqCmype3SAGC/i3vQbDi35BWl2ATxI7IA33nSsQ+KjtO+Jq3Jfday7
         OoGhIBS8UIyqOf3jnbtA4QykGo5Iuic7JgZv7QuSOah9vwargguyAGcmGNMstJIMc5Gi
         RZRSKM6Wv14tYyXpCO9ylOOmxQPbVDe1J4XR9A0SRZuZ8RuVpOMARKHbNDzJfgSFSJ1w
         k2WxJ/aRAMVdj1M+53vrgdo8wFm2yhL1+yfOSkrwXipIztSGqpzjrvXovKrAtikYUlN5
         Q1sKP8iLuBZK9nSOpc2xKPbrLY7CDOBLLx8hB0/ts8dHKDHDQVTV38q8kupEp54baABa
         6srA==
X-Forwarded-Encrypted: i=1; AJvYcCWOQweyLH+/YlBdF614ckpDR3gW88LVQyRMqarwnsj6I0xQKPHoylxzVASUaHIgedBlAq8wl9cl0txwMlxiOWL2zd/0ddwRa6YQUGJ6jCRgkII=
X-Gm-Message-State: AOJu0Ywf1c8iF56YzHlesKKJ8r8dFV8YRvy0R6XBNHOdaTPhg0HjpTTB
	IlPmfzr9Ns/ZXVxCWh6A2aLdwh1eFIKMzzS5hQbxPFTkHbTKutcT2kav4gLvrL0=
X-Google-Smtp-Source: AGHT+IFt+v0z4s2SEnUzvpF3XhmKLoMZVPIgAXxpi9rthXghlv3Aylzcme0OH0Wr5YydJX6qYwmksw==
X-Received: by 2002:a05:6512:750:b0:52c:d78b:d0b8 with SMTP id 2adb3069b0e04-52eb99a32c7mr6495989e87.39.1720798764436;
        Fri, 12 Jul 2024 08:39:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2ba545sm26557105e9.34.2024.07.12.08.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 08:39:23 -0700 (PDT)
Message-ID: <7f99cb63-0c6b-460e-934b-4e7e8d84bb3a@tuxon.dev>
Date: Fri, 12 Jul 2024 18:39:22 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] watchdog: rzg2l_wdt: Add support for RZ/G3S
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 geert+renesas@glider.be, magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, watchdog maintainers,

Can you please let me know if there is anything you would like me to
address for this series?

Thank you,
Claudiu Beznea

On 31.05.2024 09:57, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.
> 
> Patches do the following:
> - patch 1/9 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
> - patch 2/9 makes the driver depend on PM
> - patches 3-7/9 adds fixes and cleanups for the watchdog driver
> - patch 8/9 adds suspend to RAM to the watchdog driver (to be used by
>   RZ/G3S)
> - patch 9/9 documents the RZ/G3S support
> 
> Thank you,
> Claudiu Beznea
> 
> Changes in v9:
> - dropped patch "watchdog: rzg2l_wdt: Power on the PM domain in
>   rzg2l_wdt_restart()" until further clarifications; this will not
>   impact any behavior as the RZ/G3S power domain support is not
>   instantiated
> - on patch "watchdog: rzg2l_wdt: Remove reset de-assert from probe"
>   call pm_runtime_put() in case the reset deassert fails
> 
> Changes in v8:
> - added patch 9
> - collected tags
> 
> Changes in v7:
> - updated the dependency on patch 2/9
> 
> Changes in v6:
> - update patch 2/9 description
> - fixed the dependency on COMPILE_TEST previously introduced in patch
>   2/9
> 
> Changes in v5:
> - updated description of patch 2/9
> - simplify the code in patch 2/9 by using on a new line:
>   depends on PM || COMPILE_TEST
> 
> Changes in v4:
> - added patch "watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
>   ARCH_R9A09G011"
> - collected tags
> 
> Changes in v3:
> - make driver depend on PM not select it
> - drop patches already accepted (patches 1, 10, 11 from v2)
> - re-arranged the tags in patch 8/8 as they were messed by b4 am/shazam
> 
> Changes in v2:
> - added patch "watchdog: rzg2l_wdt: Select PM"
> - propagate the return status of rzg2l_wdt_start() to it's callers
>   in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
> - propagate the return status of rzg2l_wdt_stop() to it's callers
>   in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
> - removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
> - s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
> - collected tags
> 
> Claudiu Beznea (9):
>   watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
>     ARCH_R9A09G011
>   watchdog: rzg2l_wdt: Make the driver depend on PM
>   watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
>   watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
>   watchdog: rzg2l_wdt: Remove reset de-assert from probe
>   watchdog: rzg2l_wdt: Remove comparison with zero
>   watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
>   watchdog: rzg2l_wdt: Add suspend/resume support
>   dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
> 
>  .../bindings/watchdog/renesas,wdt.yaml        |   1 +
>  drivers/watchdog/Kconfig                      |   3 +-
>  drivers/watchdog/rzg2l_wdt.c                  | 113 ++++++++++--------
>  3 files changed, 66 insertions(+), 51 deletions(-)
> 

