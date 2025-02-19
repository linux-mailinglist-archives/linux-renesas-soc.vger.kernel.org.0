Return-Path: <linux-renesas-soc+bounces-13375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95780A3C4A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 17:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4AFE7A3EDE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2025 16:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A4F1FDE02;
	Wed, 19 Feb 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NoKy3zm0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523B11E8331
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981755; cv=none; b=RrSLgSAamUFW6I76O/iPa7cCaUN4h36E6zHdpoXhiH/fSnnddCl1RVJs4PJyQlSLazer57k7pL+RM9a15H08hJfkGnoLYtNMjU8+A33ylsJ2m0NfvGEeroDOD/szw8pl1HrkTbjKxZV4bw9NbA4Fg85AFZN1g1tv16C7NdYZPAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981755; c=relaxed/simple;
	bh=jYP3oUxOykgszQEZALo7cXOu9zDyqHi75sgn9lMVd8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnkZin0leUwpmgxP3EoOy0VrF9IzI/J482bTgQR55OFkpmAKmkEwhSVWeNmaz3+rDJcrfoLPh+CiCFWISK+hqm1/kcCggPcujKCIqF+rq6snS+0fziCHu7OIz4pWy/y/EOEugW223A6EMWxNMtw6eguJpay5qJ1RtBiSeRlbeUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NoKy3zm0; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abbac134a19so1397966b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Feb 2025 08:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981751; x=1740586551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h89HTe/tN0B10+LNl92cdXHG46JoxeywocoM5Bh9DWc=;
        b=NoKy3zm0rYeRNrEmxrEpvL7/Q9TuUVep2la9SgPOmI/Y3pL+UFWSjFFJkbctCscZJ2
         S5ocIMHUqwBHky9gWoGfF3BI+GU1QdVEY9zuJuFWiAS9s8bVUi4TI65qZGvNqjfVnMsI
         sk0x8YXtG0x+ebmMKcbTGSAzLD3nl71LiyLX7QNY1IaIwL1Go8RYNvFXQm7T/VKpN3OY
         E45Z2ZYvDnUil2f1LWSa8DQSdBx+kIZtzfmwHKQiDfO51X1sYXI8hs810QEt1dLMP8iG
         Yq+TiuorteRTMHX9ZXsSLSkara+0jJgngdaIlFiu+fE6L3du9g320oAUy7nVl9e2wQog
         tiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981751; x=1740586551;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h89HTe/tN0B10+LNl92cdXHG46JoxeywocoM5Bh9DWc=;
        b=tYJp3lwGRgPbE2JSflwOidDOo11iYJrvWRC+BSof10sym3erfXDemlUiTO+9mmMtq5
         jR5i4hsA9WsrkuagJdIc1XyiAGzl3P/yGGCo/NOmCgEPd3sCsWegWuSjIgoEYadlzZG6
         Ugr6UZRGw4uIiMT5uikvxOs4vkJCs2N0c92Ry0Xf2ex30iQAtcHuUNpeg8DzNqkqLcyq
         2L1ff9BJktNPes4Wdkgz5AFeohjNrEwDSjNEQMzoatSEIzmRwhe56Ydh0Y+CbquhK3vN
         xp3nBKXeplK/QAUDlPQganLnQYsIcsJoz0/Yj2tojc35dQoYwaaM2q9v4Voljsq26H3b
         yZ0w==
X-Gm-Message-State: AOJu0Yzb6pd/gYPKEPvNN8TBrsCkiqSXzgGNHMyZRFEG2yxhvZws2LIF
	cLmJZrZlTJ+OdlmeRNSY9InqKvJKyAUEHDjU/mCLBBETkBq/MJ9C/B3PeZ5appc=
X-Gm-Gg: ASbGnctx/p452ZqIgR/aB2fsjEWm56pUY5ByWeXgD2hJS4I2MamNOcLzYqkhy9Lz+Nx
	50McE/wJbmAvkH8f/ZWxSu2PASiWlDOozBJlrS3ejCH/a7qtmT9FqW4LLGCeP8APNp62GzQ++IK
	F2bLBcgr6q5TIuA44zUxsZQgOZwx6ugOQ+NdYbZsY+ALTmJzaJPtLIr23F7YtWrV0hxgzWi/9uD
	W0hs6bOk65wcaYf1wAB6zNrwnqFriZqe6hZl0SuGjT9CeYGvrVJh9+eVpApr83qDZ1R8HSpPCce
	hWpjOg3xHYmq7+ofk4JZ5jI=
X-Google-Smtp-Source: AGHT+IFiFYqo71zXgrKVNjvpkw6kSC58U3/FltEHaZdAEiHjs1T3I77KF/UZNliKfKxYH2d2UsL+vA==
X-Received: by 2002:a17:906:3118:b0:ab7:da56:af9f with SMTP id a640c23a62f3a-abb711c3de7mr1770699866b.49.1739981751230;
        Wed, 19 Feb 2025 08:15:51 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb94e4d0adsm687953066b.56.2025.02.19.08.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 08:15:50 -0800 (PST)
Message-ID: <b9b14a25-675e-4e3f-afcc-e82d5ed740a7@tuxon.dev>
Date: Wed, 19 Feb 2025 18:15:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas
 RZ/G3S
To: yoshihiro.shimoda.uh@renesas.com, vkoul@kernel.org, kishon@kernel.org,
 horms+renesas@verge.net.au, fabrizio.castro@bp.renesas.com, robh@kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250219160749.1750797-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Adding reference to the missing series (see below).

On 19.02.2025 18:07, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series add fixes for the Renesas USB2 PHY driver identified while
> working on the Renesas RZ/G3S USB support. These changes are
> needed for the upcomming RZ/G3S USB support (especially for the
> power management support).
> 
> Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
> unbind/bind and data transfer tests before/after the unbind/bind.
> 
> The unbind/bind was also tested on the devices with the following
> device trees but w/o checking the data transfer (as I only had
> remote access w/o USB devices connected):
> - r8a7742-iwg21d-q7.dts
> - r8a7743-iwg20d-q7.dts
> - r8a7744-iwg20d-q7.dts
> - r8a7745-iwg22d-sodimm.dts
> - r8a77470-iwg23s-sbc.dts
> - r8a774a1-hihope-rzg2m-ex.dts
> - r8a774b1-hihope-rzg2n-ex.dts
> - r8a774e1-hihope-rzg2h-ex.dts
> - r9a07g043u11-smarc.dts
> - r9a07g044c2-smarc.dts
> - r9a07g044l2-smarc.dts
> - r9a07g054l2-smarc.dts
> - r9a07g043f01-smarc.dts
> 
> Please give it a try also on your devices with [1] on top as well.
> 
> Thank you,
> Claudiu Beznea

[1]
https://lore.kernel.org/all/20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com

> 
> Claudiu Beznea (5):
>   phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
>   phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
>   phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
>     driver data
>   phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
>   phy: renesas: rcar-gen3-usb2: Set timing registers only once
> 
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c | 134 +++++++++++++----------
>  1 file changed, 74 insertions(+), 60 deletions(-)
> 


