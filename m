Return-Path: <linux-renesas-soc+bounces-2941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B004C859D28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 08:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34619B20992
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 07:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13AC08F5A;
	Mon, 19 Feb 2024 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QDMMKoUZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC531EA99
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 07:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328379; cv=none; b=MtiBNOl7ChnoboQn3CIpp3SUcXRLq1bZV5cgZucmn/vsTa/pKxitmiS1R/2rHOUPueQQWtwHunUqDQwYnXtVmX4uhx1caKLq7RCNUroe819LtCBeKFTCJY3zzJkPjtmaJutgy/5FZOBgfjCvzLYJF3vjGKPC+dtSY9qrvJ9ZUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328379; c=relaxed/simple;
	bh=TJbq3thR54sD0Wi77iVig095+YH5xo0jhAJ9BMhF3rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcTxuYu9GgmigQOaxue7JeDR5orSvIZz11QuifVhoNvx9m9rs72SP4DaVFWL8nsPNALnKfSzgX+0hm/10fUSS/in/1gfvFu3139XnSvEoj1ZAAurqFPWzpXMsKWYvX92UN1dAcSI1py6Lh6wwd+/8/Gi37g/nfVULRyumjXmfvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QDMMKoUZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41264195d5cso6448595e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Feb 2024 23:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328376; x=1708933176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ztvukbsw2DpPqYv6GrnPegXCQAC9j1Oi6plVvewLB6I=;
        b=QDMMKoUZTVRK0dilXQCZcu+/FjOvoyjuTFVl0cqo4krhYmz+4zNEl+kXDY0QtwCKrw
         o0eQG4YLZcZ2/kbOf2LGjAfqH9GFb764//2dZeNd+sBGM4y6Q+dhbNIUbdtyGbYi7RD+
         YXACWNMoXqB40ERO74m0IKZ0PIRb18e5ezWgyN+EnDg5C+dk1UGCMFxsfe1/SQGL7fqT
         +ZjLKX3dARp/EAvTz1oPYdmi2ck+2X3HyD+zBvODEMnVHIqPDq0faUhF+QygVcMfrHnl
         o9XZjpmmuPMnjXUrMaAWKTS2H57XukCPPPS4pvj1e6VNj4TzoCB9t8OAQBE6MtMugRp1
         2THQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328376; x=1708933176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztvukbsw2DpPqYv6GrnPegXCQAC9j1Oi6plVvewLB6I=;
        b=Ti5rIs/Y20NJiKHi3ISAOt3G3vjcxgLlslt+m6kFNBGS8ExREEPoE2L3eOFKoocU9U
         2zx6DDy51kYA3yt4cVogPblTpfWnBp7Z+RKjVSb3DeZmy8fs1vZTCYYeD5RDO5uXf8r5
         AxmnFqneE5tWIvXVK3Mt0lTrZV7JufCykVB/kLU8D8NcT5K8NVDkTMgko59YpYwjw1o1
         5/xBTqYGOfQ/7y0lascdW/vonnpNzPGFS7EdS3HWmGEz6W5pQujhjWAKAkxCmBMeb14a
         n2oOr//YSqgmmopV9Q9Kx9tLWxDS45QF2+b0N02lfCRHgGnRQO6+xR2YZGdxfapRSy0M
         MmRg==
X-Forwarded-Encrypted: i=1; AJvYcCUJgREw2bcNDNYCZDJVW8xGzXEX+p+vPmpe24yaB/qZGmpClKcI0n+chmbvPTsywwUCPXYDi8zwmuXuGU+RkVmqsQEaMMSlHLMbPM2rpNiKcxw=
X-Gm-Message-State: AOJu0YwmV3z28MISyiTBlQHw/F9Es73uyc8SNfxD0koK/8QxJiatt/Nq
	K1r995q+d/cfI0dsr9RjzlKqmeIuFGaH2cHuIKZWaLTbT8Tw+hg5VaU9YZBGIUI=
X-Google-Smtp-Source: AGHT+IHzTk4jAkU4Cb4x2j5R1eZYxapWDSX9BdPNE/TAg6w2jAWj8XsoaKg0OzZkL2HOPDbGsXDXjw==
X-Received: by 2002:a05:600c:354a:b0:412:5b86:2f2c with SMTP id i10-20020a05600c354a00b004125b862f2cmr3647927wmq.14.1708328375766;
        Sun, 18 Feb 2024 23:39:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id k35-20020a05600c1ca300b00412393ddac2sm10715749wms.6.2024.02.18.23.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:39:35 -0800 (PST)
Message-ID: <c6bea32e-5169-4181-ab42-a8f7f35594b2@tuxon.dev>
Date: Mon, 19 Feb 2024 09:39:33 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] dt-bindings: clock: r9a09g011-cpg: Add always-on
 power domain IDs
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
 <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:03, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:43 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add always-on power domain ID for RZ/V2M (R9A09G011) SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/include/dt-bindings/clock/r9a09g011-cpg.h
>> +++ b/include/dt-bindings/clock/r9a09g011-cpg.h
>> @@ -349,4 +349,7 @@
>>  #define R9A09G011_DDI_RESET            93
>>  #define R9A09G011_DDI_RESETN_APB       94
>>
>> +/* Power domain IDs. */
>> +#define R9A09G011_PD_ALWAYS_ON         0
> 
> RZ/V2M has many more power domains, but they are not controlled through
> CPG_BUS_*_MSTOP registers, but by the Internal Power Domain Controller
> (PMC).

I wasn't aware of that. I'll be checking it.

> 
>> +
>>  #endif /* __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__ */
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

