Return-Path: <linux-renesas-soc+bounces-2945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40017859E2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 09:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7233F1C217CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 08:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD36F2135A;
	Mon, 19 Feb 2024 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VG2RGTKa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6D421105
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331158; cv=none; b=YiweZaaqmjpeVJh3IKDMyI6A8k4wcmb1MN25/hKmRRnk1EOCWjH1K7eDrIJFN+E2WJSpwYXYKMPrJY8Ye6vms6Ms1QI6y/5rK/AYCCjKlEpUkhI8m/xWxABlk61NBToYvZlm0jcmMmP/CiZYLWIzLgqUPFwOopz77HWNwN4kMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331158; c=relaxed/simple;
	bh=Bo5S8xr0Ve5PB6xmg+OHUlU5Qpa2kehTBcF2IBBqPM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OX1C63Yvmrj5jjJxC0bMkTPAN5wu3kgKqjxlDpUvRoRg/jpdYRDl+8BpMuCaOHzaVJsG21kdK87TPnVe29t0cuiQihNi/4fj7GPwCK/TWp5vDppsNumc0c0vM1JT8Ze+1RqDFQ5bdy/hZNWxtFpggoLZdQPmGTxrcWVdnXt8Fqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VG2RGTKa; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412641511beso5732975e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331154; x=1708935954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THU6glyGzZOjGWrBiKmvVasWAwiX7vB5lqswuej4FLE=;
        b=VG2RGTKag/UlPuTV3qj04CJIbYfZ//y/RdY+Eka01J+XqP4XA7zdp7IEtnuzi9LYQZ
         N7J4jb0HpNZiWuutrqH10MY7q07/ki0VwrQU3eDA8xoIQdpwYxTaNmW8sFJ9xSuKHCK+
         k5mUxuKcnxhbkTTPTyMV4hKSGpO/V+3pVc2i/n9XlC9IytLPZSd4ZctIPiWZtdI1Paqb
         bE0oCsuORhMJNbvxx1wtiZH7qeRGdyrkGmCToXtWIUk+5OkqolYFC7PC8DkPauLpdQYC
         z0KLrW4QL+ZA3we1lLxUyExuZFTCjHiBUPwzFQD10gfe/CiLP2CveVvjLsZhrYf/Jlax
         JdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331154; x=1708935954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THU6glyGzZOjGWrBiKmvVasWAwiX7vB5lqswuej4FLE=;
        b=EHWO1mBh+E4xezRx1LjcbTpT94SRs5RxC4M9BiGuB1JgDtfFk2YoMtVimI9qx/kUnc
         FseMCZk/WvXxHKxGCyJtWjqJ1ra8XdDtqgn0CQZkUUULITO0I/oSxqolOgacIxzlSL1s
         r8qpmO2f6L6li82T4Fh3dyWKF44tuyBDR5X4vzAWafLgqtAowgcYTpobYSKLhVRS3A8g
         aaz8MJ2Fecfz3eloxJrJDvp8Crx4JQjg0uFptFlrH3fJxcwHHCGPltIA3Ai9ztqkRHBq
         ++CojYqqKYaxvvTOgEjl+VklUcgn3Uvwe9aLAUqEr2yxs2F91wI1bC2q8cFNFU2Hx0Wr
         RftA==
X-Forwarded-Encrypted: i=1; AJvYcCX6UO+g9AIoCiFPN7SKIzVwq62HZ3LvM/FDDXm/nVJvVX+ZsyyTvyJL/7NOwid9cDVdRvCaAG5r5OBkJcGusvSVR5WWLeIxid2xcrDszmUVGEg=
X-Gm-Message-State: AOJu0Yy7PG/t3S3Zg6aeVZfFBWaEYM37ruR/TLu18RMcaDxn/Fjckie0
	PMYvCfe6AbgmCiYlTaGcnZ82xHmifvo/nSl3YMx/iC+ct96/aE9B5+07fI3ZIj5qaOXqGNfvVzM
	1
X-Google-Smtp-Source: AGHT+IF9L/CaymxUFdiz527jMYT6eakK5vqvOw31jhwzGW9Ykq8Lf7BMYyEPxr5CsmTss8mE4dWNgQ==
X-Received: by 2002:a05:600c:4f83:b0:411:fbfa:959f with SMTP id n3-20020a05600c4f8300b00411fbfa959fmr8412572wmq.27.1708331154076;
        Mon, 19 Feb 2024 00:25:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b00411d1ce4f9dsm10468796wmi.34.2024.02.19.00.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:25:53 -0800 (PST)
Message-ID: <a71a36fe-d70f-46a4-85fd-edd07c7a5bcb@tuxon.dev>
Date: Mon, 19 Feb 2024 10:25:52 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] clk: renesas: r9a07g043: Add initial support for
 power domains
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:09, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:44 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Instantiate always-on power domain for R9A07G043 SoC. At the moment, all
>> the IPs are part of this domain.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
> As not all IPs are part of the always-on domain, I'd rather defer this
> until all domains are handled in the driver.

ok

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

