Return-Path: <linux-renesas-soc+bounces-21767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19942B53383
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 15:20:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36ECC5865BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Sep 2025 13:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB45326D57;
	Thu, 11 Sep 2025 13:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Pm1mlMlL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E697F2E6CA6
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596786; cv=none; b=LQxsXDVA/Ohew0qd5b0b0cwmsdFGx3/zOJHwCVW9QbF+Hm5pIRQLsIY7m5bMI7SpJdyJ+xITSEZTuFzIsqObZOEfPWZKYYh9aic3hffnM7v8Zdzt8q7/J+erSRsYemt3bMrQuKMhHn7vpaZwDWH9UPMOZwQaXeXhfFdWkqIsyQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596786; c=relaxed/simple;
	bh=ePzqisO6Qaumrt2qktaPC5KlyCzzYBDYymDXyVRUeNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyNLHRGt3kREBaslqzTGO0mhetboDbPRLPtLyyLsvGH8RigkErJk2F47RNiDHhMbW1MrN+ZZ3e9O6dTGetqn/G15ObCZpdFwKYRKwkQXp1m3DL+Xaou2yEjP97uIzxrJl8gcoPznKATTZE009OSMR1Ygorc38Q5X/O6ZavPdTNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Pm1mlMlL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e751508f21so553969f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Sep 2025 06:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757596781; x=1758201581; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8u8fybT/8WnDYZHmGoTAq5zebxzVXyJlNWKbAi8sGg=;
        b=Pm1mlMlLvtLgUfONiQFgDeyoXP/qjF9kPKgQb6v8/CrrRtxgGn27xzhY6Cg/Otm2mL
         Edvwe8vQRoza/1L2soKv5A+5KFKyU/OrbzVi3sbHPGRctqYZej8ee02+auFmQOnsakYe
         /SMfjvIeywRiGmar7CUpe6JMA5XYW9AMxhKvzVbNGIphFtW6Gd+AsaOArUPjI3VNhA/d
         QWYX8N5aOHKW33QkDdqzY9OcPMTnkiyeCOnlC4VPlt04VybyZ5jHukBrtiP1FfqQapom
         DioGbk/K/ewWJBspmLJV4f1iWBb73BL2Emb3CIFNMoRWRKwJsbVaXZngfRXCpqoJzif/
         XjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757596781; x=1758201581;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8u8fybT/8WnDYZHmGoTAq5zebxzVXyJlNWKbAi8sGg=;
        b=GUP3zh+QavidSpbhAqDYi4WZAQBSG4NlgvLVEFLAkAaKZM6oYdY71vDrLvUCDjhwol
         IdSRrUYefikvTJ1nrZtKrGtJKMxKzMOxj6f5yHUS09B9M7mAxk7PYkXXTg7yFgPJwL28
         R0uu689+lHiccvX8J/6bcfKgM1wJele2fVUHwfj77R11gurvkMB6y/l6rC01ryFfTyc0
         rdsdeKPHts/JJS0vCXneAh0dXVLa4AmrNBzPK7cqveFdTysk1ka258XDHoD4Br8Z369f
         /HK5Plr+BCCNl4y6Gf0y7MEOvQHiIFjv5WVTSvNxWXuzUj+8YpPN+y2Yd2uy4LJRsKbp
         ddaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSOY4NRpd9PqciYWfZuR48F/KI2p2KTeW7adimAkCNp8EN4BwTQbS5Ksu5LFVElUBRyUBYFgcW8Dlq4VUe7D9Bvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV5OFPZWNUKGIO1ITPpUu+hX54WSF+FDDNrFKFSpP73qw7jMYr
	rl/gKTQcI8EXBjijoXuhrDOQlYryKaQjKFHbmt1qkb9CWpukp8cxtermEF1qVXHdw5k=
X-Gm-Gg: ASbGncsZvTRxA+f4DtKR6kSOYI2b0t0VuPbcXIJtQZ+MLse01BX3ZnE5qmVI3s8p85d
	P9k89ipjAJCXRw4r6xon3xzMnzP5tPtIqyrj05yVTg+vWvAwXbdGWzWlshPpU0BkG9PrfhYnXFR
	GfiXdr36pwo0tJFdo0ehyaqlfxu866EcGpzF8wzpBQhB8wZ5KOJuH3gXhi/RuZJrsVuQwktZZw/
	IysOhFEsCuRTQ5odPQbls/9UHeGlcuha/ttgF1hlMVvsLhZ6ddp2YbwLs4+5+9TmW+RCDLFBG10
	jjSgB7d99j1a6oCi36QwrZazoVkR6dhHgcbspKT91hUOJsYaQwvZHBWo1KpXqb/moBh/Nev/BO0
	RVVuOX6j39G6ieSUpKh2hqCU1O871ZK4=
X-Google-Smtp-Source: AGHT+IGS+e3rDa8fueFMFZrNNPBXI9wawcGCyt+UegFi2IhP29bW3Js2e9o7EOACRR+TFLON2p8asg==
X-Received: by 2002:a05:6000:2681:b0:3e4:74dc:a3bb with SMTP id ffacd0b85a97d-3e64bde9298mr18368153f8f.40.1757596781068;
        Thu, 11 Sep 2025 06:19:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0156d206sm27297545e9.5.2025.09.11.06.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 06:19:40 -0700 (PDT)
Message-ID: <a44f590e-8c4d-498c-be7a-6c6fd6c43da8@tuxon.dev>
Date: Thu, 11 Sep 2025 16:19:39 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: renesas: rzg2l: Fix ISEL restore on resume
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20250908144250.1269294-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVVWTAvEMgv2NVg0-2f4Cs4oXp4yBM1tQYUUbMKH6EiGQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdVVWTAvEMgv2NVg0-2f4Cs4oXp4yBM1tQYUUbMKH6EiGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/11/25 12:53, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Mon, 8 Sept 2025 at 16:42, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in
>> gpio_irq_{en,dis}able*()") dropped the configuration of ISEL from
>> rzg2l_gpio_irq_enable()/rzg2l_gpio_irq_disable() and moved it to
>> rzg2l_gpio_child_to_parent_hwirq()/rzg2l_gpio_irq_domain_free() to fix
>> spurious IRQs.
>>
>> The resume code used rzg2l_gpio_irq_enable() (called from
>> rzg2l_gpio_irq_restore()) to reconfigure the wakeup interrupts. Some
>> drivers (e.g. Ethernet) may also reconfigure interrupts in their own code,
>> eventually calling rzg2l_gpio_irq_enable(), when these are not wakeup
>> interrupts.
>>
>> After commit 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL
>> in gpio_irq_{en,dis}able*()"), ISEL was no longer configured properly after
>> resume.
>>
>> Fix this by adding rzg2l_gpio_irq_endisable() back into
>> rzg2l_gpio_irq_enable(), and by using its unlocked variant in
>> rzg2l_gpio_irq_restore(). Having IRQs enable in rzg2l_gpio_irq_enable()
> 
> enabled
> 
>> should be safe with respect to spurious IRQs, as in the probe case IRQs are
>> enabled anyway in rzg2l_gpio_child_to_parent_hwirq(). No spurious IRQs
>> were detected on suspend/resume tests (executed on RZ/G3S).
>>
>> Fixes: 1d2da79708cb ("pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able*(")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
> I have to admit I don't fully understand what is going on...

Sorry about that. Basically, ISEL is not properly configured as a result of
removing rzg2l_gpio_irq_endisable() from rzg2l_gpio_irq_enable() which was
previously called on interrupt reconfiguration path.

> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -2428,7 +2428,7 @@ static int rzg2l_gpio_get_gpioint(unsigned int virq, struct rzg2l_pinctrl *pctrl
>>  }
>>
>>  static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
>> -                                    unsigned int hwirq, bool enable)
>> +                                    unsigned int hwirq, bool enable, bool lock)
>>  {
>>         const struct pinctrl_pin_desc *pin_desc = &pctrl->desc.pins[hwirq];
>>         u64 *pin_data = pin_desc->drv_data;
>> @@ -2443,12 +2443,16 @@ static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
>>                 addr += 4;
>>         }
>>
>> -       spin_lock_irqsave(&pctrl->lock, flags);
>> +       if (lock)
>> +               spin_lock_irqsave(&pctrl->lock, flags);
>> +
>>         if (enable)
>>                 writel(readl(addr) | BIT(bit * 8), addr);
>>         else
>>                 writel(readl(addr) & ~BIT(bit * 8), addr);
>> -       spin_unlock_irqrestore(&pctrl->lock, flags);
>> +
>> +       if (lock)
>> +               spin_unlock_irqrestore(&pctrl->lock, flags);
>>  }
> 
> I am not so fond of these "if (lock) ..."-constructs, especially as
> the function now takes two bool parameters, which is error-prone.
> 
> What about renaming rzg2l_gpio_irq_endisable() to
> __rzg2l_gpio_irq_endisable(), and moving the locking to a wrapper
> rzg2l_gpio_irq_endisable()?

That was my other option but, if I remember correctly, it generated
duplicated code, thus I ended up with this.

> 
>     static void __rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
>                                          unsigned int hwirq, bool enable)
>     {
>             /* old functionality without locking */
>             ...
>     }
> 
>     static void rzg2l_gpio_irq_endisable(struct rzg2l_pinctrl *pctrl,
>                                         unsigned int hwirq, bool enable)
>     {
>             unsigned long flags;
> 
>             spin_lock_irqsave(&pctrl->lock, flags);
>             __rzg2l_gpio_irq_endisable(pctrl, hwirq, enable);
>             spin_unlock_irqrestore(&pctrl->lock, flags);
>     }
> 
> Then no existing callers of rzg2l_gpio_irq_endisable() need to be
> changed.
> 
>> @@ -2460,15 +2464,22 @@ static void rzg2l_gpio_irq_disable(struct irq_data *d)
>>         gpiochip_disable_irq(gc, hwirq);
>>  }
>>
>> -static void rzg2l_gpio_irq_enable(struct irq_data *d)
>> +static void rzg2l_gpio_irq_enable_helper(struct irq_data *d, bool lock)
> 
> Here we can't do without the "lock" parameter, unless duplicating the
> full body, so this is fine.  I'd rename it to __rzg2l_gpio_irq_enable(),
> though.
> 
>>  {
>>         struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +       struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
>>         unsigned int hwirq = irqd_to_hwirq(d);
>>
>>         gpiochip_enable_irq(gc, hwirq);
>> +       rzg2l_gpio_irq_endisable(pctrl, hwirq, true, lock);
> 
> if (lock)
>     rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
> else
>     __rzg2l_gpio_irq_endisable(pctrl, hwirq, true);
> 
>>         irq_chip_enable_parent(d);
>>  }
>>
>> +static void rzg2l_gpio_irq_enable(struct irq_data *d)
>> +{
>> +       rzg2l_gpio_irq_enable_helper(d, true);
> 
> __rzg2l_gpio_irq_enable(d, true);
> 
>> +}
>> +
>>  static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>>  {
>>         return irq_chip_set_type_parent(d, type);
>> @@ -2617,7 +2628,7 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>                 spin_lock_irqsave(&pctrl->lock, flags);
>>                 ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
>>                 if (!ret && !irqd_irq_disabled(data))
>> -                       rzg2l_gpio_irq_enable(data);
>> +                       rzg2l_gpio_irq_enable_helper(data, false);
> 
> __rzg2l_gpio_irq_enable(data, false);
> 
> Before, the lock was taken again, while it was already held.
> Didn't this cause a deadlock?

The only locking issue I've seen around this code was fixed by commit
a39741d38c04 ("pinctrl: renesas: rzg2l: Use
spin_{lock,unlock}_irq{save,restore}"

I'll use the approach proposed by you in the next version.

Thank you for your review,
Claudiu

> 
>>                 spin_unlock_irqrestore(&pctrl->lock, flags);
>>
>>                 if (ret)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


