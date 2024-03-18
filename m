Return-Path: <linux-renesas-soc+bounces-3851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB6287E984
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 13:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC241F23315
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 12:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972D2FE0F;
	Mon, 18 Mar 2024 12:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="clt9CshJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4F383B2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710765844; cv=none; b=CPSqoiQz9qVpm5ACJidOYL84KxVHuGeBEhRpgInrTzRqYDshUvHagd9KD3rsEyRPq/2qSXI3XW8De9dqLXwRd//rI/DsMkQLN/PpIqAAIE6XIL6en1BH8RD5pzSSZhKkyvJ4k0T53whJUeZ1hDW6DGlQ7TVOMe7GPNWOtDg/MHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710765844; c=relaxed/simple;
	bh=I/StjgYxY54i3qrqizFVS+ZVZGXO7voYj+tMDs/VK+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSXYkU417d17cmZwnUkkXYKd3KvIT9GmqEuIt+MpEKAaghZZatpKi+Eg85TgX0P8Y3MMiX1/1yVoyC8JUK6WmPqZrsiKyGVBOHSt62dN0oacnl0Pr4AohKvXnBvLGD1VLuyGU/I/aUfCytHxuHQNAZm8AxZdCbKd42g3vmIDWNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=clt9CshJ; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3668cdfc771so18648595ab.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Mar 2024 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710765841; x=1711370641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z9/R+AwvLdTfbyPtGNAFf8lwxhBDbcyxnP7XTzrdj8M=;
        b=clt9CshJB75qoEf/uqU5JZJYzaJG/PeZ/OckxeFOHhmDZs4msWv4Xamu2mV8h5V2dQ
         qCpj7zxMG79UqTreVYiTanTrXRTTiLNU0az3ONnFJWpG7Luivm5Slf3RaCu0jvOzUJQT
         A5hZ95rNYCWYfP5+QFOMBLxVaHH5BekxMCtIOQZ99m54lz5jipBDJBuhg1NuPh20B693
         VwJ6Ujif4RYJIzC5OLE/EOyn0D1GBquM4Yt/QbGrXpfkfhCdjJPLBtuvaIRrF/pb7816
         IlttZ0fzVILd2dxtKmBFlj4i2xYTmS2W3q9SWGDXstTyB9v0BMlvBGOvqf57bXSmYc6I
         P93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710765841; x=1711370641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9/R+AwvLdTfbyPtGNAFf8lwxhBDbcyxnP7XTzrdj8M=;
        b=HT3YGiAJEJIMtfgmAQ3w/c7EWm5fAfrKwuAXw0lkxX316TKd4U1D+0Di5rAj6bJPXy
         N8tYeLCeEWWJlJMBugrKDtTAfqvBgIv8hWXtHYQ1Ahx6UuTzWxqg1hjcY5uPNdvMmZIo
         jrKGyQVPGlTWp8/ykKnumPgM5nNIGF0C53gORNktVaiPqLXXbUH2CUHUvWKFJGbdaAAR
         UjPmUmFbQDC1YXBotl65QwlCMlS1JGNp2yUP3nhfArErG2/CjysQam9yA4Ts5QTyjw+U
         4Xfr/pKQ4+zsYu33CqYWN+2tFCMZE/5Nfc6j7ZPp8y/u3Sh4swu+UhzpN8fmqq7Tzdcd
         OY6w==
X-Forwarded-Encrypted: i=1; AJvYcCWxLMj6bieuuSHyXZ80pXQhFwnKdx7fdO6ucVPme5EklNoru0jtWMtbNc5+PU6LXx7elDFbGWaFNHntym8sjl6aa4LTXp17QLK4Zwg39plFXz8=
X-Gm-Message-State: AOJu0YzDaGsERD2eftD6hlpB7n4vP1IUBAFOpoecpMZ/qGBz8wIv1qwQ
	cUH0xl+nSjZW8T9i6pt4uiu1zjqScnCAO8lXgrUj2UlF+vcVeQ5vJ1qRly/lVnQ=
X-Google-Smtp-Source: AGHT+IFd/VLWRtpMUVSANFKMQW/VYdSJwvCjT+iIGGkS0+WNUO9K+meWeto7Xra2Cy2akuW+w8wS+Q==
X-Received: by 2002:a92:d391:0:b0:366:94aa:ec24 with SMTP id o17-20020a92d391000000b0036694aaec24mr10865222ilo.10.1710765840962;
        Mon, 18 Mar 2024 05:44:00 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id e4-20020a926904000000b00363c0669450sm2285889ilc.19.2024.03.18.05.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 05:44:00 -0700 (PDT)
Message-ID: <352ced93-ae80-44b3-8bc2-050dc195ac37@tuxon.dev>
Date: Mon, 18 Mar 2024 14:43:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] watchdog: rzg2l_wdt: Add support for RZ/G3S
Content-Language: en-US
To: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, geert+renesas@glider.be, magnus.damm@gmail.com,
 biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Gentle ping!

Thank you,
Claudiu Beznea

On 28.02.2024 10:32, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.
> 
> Patches do the following:
> - patch 1/10 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
> - patch 2/10 makes the driver depend on PM
> - patches 3-7/10 adds fixes and cleanups for the watchdog driver
> - patch 8/10 adds suspend to RAM to the watchdog driver (to be used by
>   RZ/G3S)
> - patch 9/10 adapt for power domain support
> - patch 10/10 documents the RZ/G3S support
> 
> Thank you,
> Claudiu Beznea
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
> 
> Claudiu Beznea (10):
>   watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
>     ARCH_R9A09G011
>   watchdog: rzg2l_wdt: Make the driver depend on PM
>   watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
>   watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
>   watchdog: rzg2l_wdt: Remove reset de-assert from probe
>   watchdog: rzg2l_wdt: Remove comparison with zero
>   watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
>   watchdog: rzg2l_wdt: Add suspend/resume support
>   watchdog: rzg2l_wdt: Power on the PM domain in rzg2l_wdt_restart()
>   dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
> 
>  .../bindings/watchdog/renesas,wdt.yaml        |   1 +
>  drivers/watchdog/Kconfig                      |   3 +-
>  drivers/watchdog/rzg2l_wdt.c                  | 123 +++++++++++-------
>  3 files changed, 76 insertions(+), 51 deletions(-)
> 

