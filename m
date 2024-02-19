Return-Path: <linux-renesas-soc+bounces-2943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072C859E0B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 09:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10E181F22CDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 08:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8B4210F3;
	Mon, 19 Feb 2024 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PPJiSse4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D055F210E1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708330741; cv=none; b=ekHTUBO95PVSGdmm4ueIAZj/9GNQLG2F53pxlDek13QV3EWeCFZrbgA+guNu4w5tNd5sW+n2NrJNUZ7LiKlTOtWbESnNatIxL1udivkIV5C/mDvR23p7ecGD8Mm+C+pK8lrHX5UeTJJWmSN/Y/dV7tSIg5TR87wM8mKFoKHrW+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708330741; c=relaxed/simple;
	bh=JjU4PsyGlHViCVBExmTpCfyZJAxCvo8baZD3oTE0krQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYoRtkJs4yGIjv5FnXlAVoq2bvy1SJ5T6mRGP907bCY62afmA80bakfRddH8zanyI0hUWJ1SO5u/I+39y79aDXXncVHmZFR6thB+tiSaeEAWOZZwjPzYWjkxPmEFVA8cbMCrRB3QYTfng0EDWCFq7t+tjSorn7FYMixKDVyqzoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PPJiSse4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3394b892691so2229412f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 00:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708330738; x=1708935538; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rZqE/HHr//PEEUJQYqFVl7Gpsy9IQIC8XGSYX55a1oU=;
        b=PPJiSse4NdtlTcWuz+0V8sZn/indVp7Ww2DJrsb94Ba74ZfJu8tyNHsJfqNV7lhS1Z
         3U9ghFOVUY3rGZDaD/Q2Gi1hCOHttc6XEqo14s4B5rMt2fnzd+/aXWbrEoiQZCr2X0Rs
         3E8sPhs46O26sSxscWjZR1F/cO+xAwFGJMHajeIQd9jLKeKGZK0aA60N9FoHhV/dWyO2
         BPbohEjuz0UL3vwhXn7AGaCi/0ntVFh/yFbeYTxi99WTniJOQLmtSjQOWVD74LCMdHr+
         AiIFOpnPHQX84qrHrI909bHl9+cfwQosExEufpO6IFWK5ZFo1+Jc/FTmhjGs40DoUqUD
         UK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708330738; x=1708935538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZqE/HHr//PEEUJQYqFVl7Gpsy9IQIC8XGSYX55a1oU=;
        b=GntdX+ekDY6XjX4FzlJfaxR6Aj2LK4vEDC3x1VQpqiSRzFs+ykC96Mnbi+YVGm6D7q
         ng/d/qoIKddMwE6iAcm/hvcydw69rwy0Kn4XqpC6zZliFN/a0NtTlOGcqk1i6HciIipH
         j9FNe1HfcFXYspuUZ4SL7rHEQpIINhhYSRp1c60y2Q0k6FlnTNad29OzQhdYhnowmEZs
         fY8PscN7cNAvSkshDAHqB9HAbJvuosCYuSFCk1OeTeY54trK9DuIZ9TiqBl0gUCNGNQe
         0GTATIXiK425O9ul+wm2Sg5D1WmY1WDUtn0Fc36cd8KFi08vhEB39DPMcPQRZyXVGrJh
         UCwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH1p8kLhHuVvXsKfDdaW+ORSgMIuJubhsRTCk3dMSJCcxs+lg0+woRTBNZbSED9qEF3R3h5OAWcclqrGFZB8vbI+ZdTghb7HwWdfUm0WVeko0=
X-Gm-Message-State: AOJu0YwfuNlh9IYJDA1BMYOq/+4/BCIhO+h3UuucEFl456WhpsZz+yyQ
	jvL7yvsJjybvH72jf3rF9hYmQhXC+MPoLE3klZ+DuHXakX5AktInSQm3GPuyAQ4=
X-Google-Smtp-Source: AGHT+IEo2sjL3M94rmyLAg41ywsMdua1Wz3r3LifoISXigwzGxyowq3JmstlxxYRObaeFTZ+HdMQAQ==
X-Received: by 2002:adf:e448:0:b0:33c:e728:c88b with SMTP id t8-20020adfe448000000b0033ce728c88bmr9479783wrm.24.1708330738074;
        Mon, 19 Feb 2024 00:18:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c20d500b0041044e130bfsm10433793wmm.33.2024.02.19.00.18.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:18:57 -0800 (PST)
Message-ID: <b4bc7dc8-3631-4cb5-97b9-d38941c6efb2@tuxon.dev>
Date: Mon, 19 Feb 2024 10:18:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/17] dt-bindings: clock: renesas,rzg2l-cpg: Update
 #power-domain-cells = <1>
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
 <20240208124300.2740313-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW2AsXJk_crdeiMjMHzBKq91UO1d=ukwjW0hkCK4DRvTw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdW2AsXJk_crdeiMjMHzBKq91UO1d=ukwjW0hkCK4DRvTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:04, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:43 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The driver will be modified (in the next commits) to be able to specify
>> individual power domain ID for each IP. Update the documentation to cope
>> with this.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
>> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
>> @@ -57,7 +57,7 @@ properties:
>>        can be power-managed through Module Standby should refer to the CPG device
>>        node in their "power-domains" property, as documented by the generic PM
>>        Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
>> -    const: 0
>> +    const: 1
> 
> While the driver will soon support both 0 and 1, we may need to keep 0
> for RZ/V2M for now?  RZ/V2M does not have CPG_BUS_*_MSTOP registers,
> but uses the Internal Power Domain Controller (PMC).

ok

> 
> Please add a link to the power domain numbers in
> <dt-bindings/clock/r9a0*-cpg.h>,
> like is done for #clock-cells.

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

