Return-Path: <linux-renesas-soc+bounces-2940-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C7E859D15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 08:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF092811B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 07:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F1120B28;
	Mon, 19 Feb 2024 07:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OviAPIbL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AE820B11
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 07:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708328222; cv=none; b=YLECd8u3YjB+4OtPxlwBQqbk86B1f3HiJ/e80zSV6qBcUz4WHmIDUuorWPIfbyenT4ySF6GjazhK7+3xZM7j6rA6ejB99qiebrFbhi/av2t8GqlYq6MRTEKRQQv2NGE33q8MZUZJ3y7uCnPxJsd/rmPdwg4ssU+2Hhz3Jjl/A4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708328222; c=relaxed/simple;
	bh=30e0PiSWhXN+1/mrmwX+jgY2/XnTypbZ+oimDofzoCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HIpJJu7GBxCy+xo6JAmijZDojL/LIdeaY9FonyHAcLMPlGBXTd73C8Fl3f9Q9l+/TKjo1UU6rNnlvhbVZRLUiroRiG7OvEvgJh6EX4unpO72O01KyDQxNGbONdhisSfjJSyZL/QDcMzIOVUCeLF9zeBZh+nw5vuorFN+EbZyVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OviAPIbL; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-512b3b04995so369282e87.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Feb 2024 23:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328219; x=1708933019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZKyFQ6cSp7LJWXpDL9YbFwutlq73FoMYcAlibyNYzc=;
        b=OviAPIbLmXSlM9YjuT+VzRzlP4mwg0TfmipdZj/nXQF7NBtC6SMyBA5na7KScCUN1I
         FTKCe9fGdh9x4zhskWXZ/CxbzTv3A4a7JyIYs6VeUJuoOTx2B5iWHZgWPuYBSKR+qvfO
         ixoIw985pggih160UhJwQa0TTCJQw5FUpXs//XOn2JfYkEl07e56zLAjmOwnxIwElRKO
         KURvitS32qjV6TrfrxtB73XNEL+qmRXfOw9hgs3aKxt3zom7KNzRw9ie2uFv0PTKXCnD
         sQhoo0EKnfvQ2UnUrx3lZXTRShHGRp4pElDDLPHGs9CDKVLbe+McOVxh9bVD9ccT/XxE
         veQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328219; x=1708933019;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZKyFQ6cSp7LJWXpDL9YbFwutlq73FoMYcAlibyNYzc=;
        b=RASBq6d43XiuqjoRgTy23JNhDw909riHE53ONq2L1UQCPZ3ckiHS5D3oS9Ks40+1dH
         dFNE5YRFl+M7/4U65S6n5wXw8oD4DLld74c429+sG2+QW0IkZSCMzD74OCtuM/Hngy0h
         rjhOUuRi/sq/xrE8a5XGSjoxTnwxDBft4RVkJnAnwuHhns2QBlzWwvNMSxeZBWzZhOGa
         hpVo8zpsvgKLURNyEMUrJvgaSJB/7AUfEnML9FLgyPZizcCbzmnZdwWn0R5MZbOKGr72
         VcDfouB5nljhF1zgJ+BO2fDuQk4wJbP60E3HC/q4qd5+34X9O7fB+pt17Z8R4vrUakkI
         jDwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKr+J6oL7MS4jqDb1ceyGdMpJ6IaYysKbQgPySKcwSZ5AmjEHQZXo9o8X8hFm9CVZHLE/BUY1k5Rt5CZLDghFEJyC3ACYMc/f9CGeriwd/i3M=
X-Gm-Message-State: AOJu0YyXn4wFzBdT02d4QR45jd4vFpfQ2sTOTV58viQONBbKhMGliy4x
	IjXdr9ywNEGUTLEzaD2QE0ZiS0scYnvE/tb46xEfrOy+o8pHnS0Lv14Tpr6/pUO1hK1r6rM0daa
	x
X-Google-Smtp-Source: AGHT+IGLlnSbXEfT/nz2ZRTz3Bukdz93vaxjL6h+T1orH0nNTKmUP+vrTRlindEMbWk6USyL3b+mLQ==
X-Received: by 2002:a05:6512:6d4:b0:511:e296:e563 with SMTP id u20-20020a05651206d400b00511e296e563mr8756725lff.2.1708328218821;
        Sun, 18 Feb 2024 23:36:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l20-20020a05600c1d1400b0041256ab5becsm7617445wms.26.2024.02.18.23.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:36:58 -0800 (PST)
Message-ID: <e7a6a1c9-ba29-4103-a2f7-310c1cee1f17@tuxon.dev>
Date: Mon, 19 Feb 2024 09:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] dt-bindings: clock: r9a07g043-cpg: Add power domain
 IDs
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
 <20240208124300.2740313-2-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUCB3GQxGPxG35rebN2yrKYBnZDzORaEEOuZb3aMgrf6g@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUCB3GQxGPxG35rebN2yrKYBnZDzORaEEOuZb3aMgrf6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 16.02.2024 16:01, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:43 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add power domain IDs for RZ/G2UL (R9A07G043) SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/include/dt-bindings/clock/r9a07g043-cpg.h
>> +++ b/include/dt-bindings/clock/r9a07g043-cpg.h
>> @@ -200,5 +200,53 @@
>>  #define R9A07G043_AX45MP_CORE0_RESETN  78      /* RZ/Five Only */
>>  #define R9A07G043_IAX45_RESETN         79      /* RZ/Five Only */
>>
>> +/* Power domain IDs. */
>> +#define R9A07G043_PD_ALWAYS_ON         0
>> +#define R9A07G043_PD_GIC               1
> 
> As this file is shared between RZ/G2UL and RZ/Five, R9A07G043_PD_GIC
> needs an "/* RZ/G2UL Only */" comment

Ok. I'll re-checked it and update. Likewise for the rest of your below points.

> 
>> +#define R9A07G043_PD_IA55              2
>> +#define R9A07G043_PD_MHU               3
>> +#define R9A07G043_PD_CORESIGHT         4
>> +#define R9A07G043_PD_SYC               5
> 
> Likewise for the four above.
> 
>> +#define R9A07G043_PD_DMAC              6
>> +#define R9A07G043_PD_GTM0              7
>> +#define R9A07G043_PD_GTM1              8
>> +#define R9A07G043_PD_GTM2              9
>> +#define R9A07G043_PD_MTU               10
>> +#define R9A07G043_PD_POE3              11
>> +#define R9A07G043_PD_WDT0              12
>> +#define R9A07G043_PD_SPI               13
>> +#define R9A07G043_PD_SDHI0             14
>> +#define R9A07G043_PD_SDHI1             15
>> +#define R9A07G043_PD_ISU               16
>> +#define R9A07G043_PD_CRU               17
>> +#define R9A07G043_PD_LCDC              18
> 
> Likewise for the three above.
> 
>> +#define R9A07G043_PD_SSI0              19
>> +#define R9A07G043_PD_SSI1              20
>> +#define R9A07G043_PD_SSI2              21
>> +#define R9A07G043_PD_SSI3              22
>> +#define R9A07G043_PD_SRC               23
>> +#define R9A07G043_PD_USB0              24
>> +#define R9A07G043_PD_USB1              25
>> +#define R9A07G043_PD_USB_PHY           26
>> +#define R9A07G043_PD_ETHER0            27
>> +#define R9A07G043_PD_ETHER1            28
>> +#define R9A07G043_PD_I2C0              29
>> +#define R9A07G043_PD_I2C1              30
>> +#define R9A07G043_PD_I2C2              31
>> +#define R9A07G043_PD_I2C3              32
>> +#define R9A07G043_PD_SCIF0             33
>> +#define R9A07G043_PD_SCIF1             34
>> +#define R9A07G043_PD_SCIF2             35
>> +#define R9A07G043_PD_SCIF3             36
>> +#define R9A07G043_PD_SCIF4             37
>> +#define R9A07G043_PD_SCI0              38
>> +#define R9A07G043_PD_SCI1              39
>> +#define R9A07G043_PD_IRDA              40
>> +#define R9A07G043_PD_RSPI0             41
>> +#define R9A07G043_PD_RSPI1             42
>> +#define R9A07G043_PD_RSPI2             43
>> +#define R9A07G043_PD_CANFD             44
>> +#define R9A07G043_PD_ADC               45
>> +#define R9A07G043_PD_TSU               46
>>
>>  #endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
> 
> In addition, you need definitions for the modules that are only
> present on RZ/Five, e.g.
> 
>     #define R9A07G043_PD_PLIC               47    /* RZ/Five Only */
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

