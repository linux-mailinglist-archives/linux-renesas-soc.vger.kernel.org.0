Return-Path: <linux-renesas-soc+bounces-3782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68B87BE9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 15:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 339EB1F239ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 14:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89AA258ACF;
	Thu, 14 Mar 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Bm2kzMFt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D16EB4B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710425468; cv=none; b=Me6TBHWhfUYNG7VFZVrRR+zHX58u5Lv1Qik7xOahrGYM6B1qpjY6WXISPgrD7Qorp3k4kNdo0F9mWt5AD62J+6Howeg1iinZzSNEvcEyr9C4TGJiG9ahC7jK0oNZ+1P+Iv0M+mPRtqVoFmNEn6C2vYbUpevk2AIvkB+JXDVKQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710425468; c=relaxed/simple;
	bh=EP0L4/as9nxE0lKi4we9oY73zQPhQ4YRmDCQOtvHWlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ji28weQx775uaEyslhF6ubCsSDn+kYO0jei3Xt6gCIltlgaiv/PeifFohcTaP9zKJ10q6UrSPIkmXg9qnjAy6Gk4nJhc+KE6wiYm9xWE8r1iHvrtqUWv6/svzDE51D15r46If497mAEp1/nwScWovpzG4FwjQQDADHFMPxgg564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Bm2kzMFt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d220e39907so14051461fa.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710425464; x=1711030264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+jPZL+farhsuUuOhDhbQjn1BkC3HvW75LXDKYJuhfZE=;
        b=Bm2kzMFtkeX5MsH0cZFT1Q6A91s6nnffNUuMonwpsHo6jcvtCAvqk+bTZW6iTjmVIz
         I3A8JU08wzPAze+v/oN0To2oa0OHdHvwi4M3gU2Qs4Sl2U12PW2Jkq3zaYbKlneTnn8Z
         T0hoVFwatRr180E2bvXHB+btWsYYE2g0iSzYHGdUkgol5MyruDu/PRXwUFC6n+GImhCU
         uwnMZOqGe7TzvWPd6iBY0p4xV1N3LMG9350qit7ZA4fv2PW1P/6H3tRPEC/F3oaPDPVL
         TAvkgH6v64z96b1GOcRZeBf8j20cDbl0IjYamJkMzolNdDl/z035Ir3XAzTr1qHZbtzu
         8R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425464; x=1711030264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+jPZL+farhsuUuOhDhbQjn1BkC3HvW75LXDKYJuhfZE=;
        b=RMbHMzdOrYaHoEZirMKhwiB8zY9QJUK6xcKZRbKuE0qiptcuON+WzRRZP42uT00X/k
         4zaF3HoLZx7p0+n28Vbjkb3Nu/rgfyCru7HCQ+W3qsux1Ifq9VbvllYDn7dv1mlr1151
         FDqK5bSDPtC58D9NhCM4LfF+b5o9w4bUcQrZttQXHPURqtFz2lKRAIZqanoQPLbEcm7e
         r1wE5vFQ8DFwK7Ls74PBCB5MkT3njcT3IlEELZAHtGxod5eLy2Cw+rs2XivG1oCQw65W
         cMRdPRYuE0T8pBcNRNrkD75VyYClOFIav/29cjUVSNvgXWMhSZxDvJrzMqSIM9D1hR5S
         6WTA==
X-Forwarded-Encrypted: i=1; AJvYcCXF1W+2L3bDRYS/68roXxy+TUUX2bs5sgp/ae6XpoaWo2EbztPwBmNQhcy05NhqiatgXIwKCzx53xh1T5MUri8Dv5PCgqj70XSZqv4/FvNonxc=
X-Gm-Message-State: AOJu0Yx37VvFkBtYjBmBr6xjWL8s9MuQNCAtC6x85xZL5UF7DBGkUUPq
	DFaCST2NH9fultlijrGrOhgJ6z5E9gYm+bVdiXcONYHFUE7VPbFfJGDxpuxBcOQ=
X-Google-Smtp-Source: AGHT+IHVfiIeAXikc9Ks7N3k/GJ46m7UIH56BHraaOQrJfI3Qn0+cQH3BrQvR/CW4f5cmuQuvMQYqg==
X-Received: by 2002:a2e:a716:0:b0:2d4:727c:94bf with SMTP id s22-20020a2ea716000000b002d4727c94bfmr1206970lje.31.1710425463910;
        Thu, 14 Mar 2024 07:11:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id c19-20020aa7d613000000b005686037bc12sm749129edr.29.2024.03.14.07.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:11:03 -0700 (PDT)
Message-ID: <da48838c-5043-4fff-99aa-2f75f0755609@tuxon.dev>
Date: Thu, 14 Mar 2024 16:11:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Execute atomically the interrupt
 configuration
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240307112452.74220-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWwbfem71Q9FE40jqHM2pXWJW9u+w-+NKy3OffFkzu5SQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWwbfem71Q9FE40jqHM2pXWJW9u+w-+NKy3OffFkzu5SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 14.03.2024 15:21, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> Thanks for your patch!
> 
> On Thu, Mar 7, 2024 at 12:25 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Lockdep detects a possible deadlock as listed below. This is because it
>> detects the IA55 interrupt controller .irq_eoi() API is called from
>> interrupt context while configuration-specific API (e.g., .irq_enable())
>> could be called from process context on resume path (by calling
>> rzg2l_gpio_irq_restore()). To avoid this, protect the call of
>> rzg2l_gpio_irq_enable() with spin_lock_irqsave()/spin_unlock_irqrestore().
>> With this the same approach that is available in __setup_irq() is mimicked
>> to pinctrl IRQ resume function.
> 
> You mean __setup_irq() in kernel/irq/manage.c?

Yes!

> That one uses the raw spinlock methods?

Yes! Would you prefer to have raw spinlock here, too?

Thank you,
Claudiu Beznea

> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -2063,8 +2063,17 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>                         continue;
>>                 }
>>
>> -               if (!irqd_irq_disabled(data))
>> +               if (!irqd_irq_disabled(data)) {
>> +                       unsigned long flags;
>> +
>> +                       /*
>> +                        * This has to be atomically executed to protect against a concurrent
>> +                        * interrupt.
>> +                        */
>> +                       spin_lock_irqsave(&pctrl->lock, flags);
>>                         rzg2l_gpio_irq_enable(data);
>> +                       spin_unlock_irqrestore(&pctrl->lock, flags);
>> +               }
>>         }
>>  }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

