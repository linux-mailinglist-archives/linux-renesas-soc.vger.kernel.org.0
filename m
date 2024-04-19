Return-Path: <linux-renesas-soc+bounces-4722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894F8AA80F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 07:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25C30B249DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 05:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DBCB669;
	Fri, 19 Apr 2024 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oT3ULVD9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674178F4A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 05:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713505717; cv=none; b=agtPhYBc8LBX4Z69QnyCpZlkIL/nHeFCVEefzzNML5xU4E9Kvj5s/O8GRlyQbcWyW+SxwvUCQ1m5k87b/hEpzWSAPG7dnVMBWyCJLt/d8S2nSUQ6vOvSnvMM29Ts6r7pZB5cqvPVt2jB3MGjbO2StEKD6PnsVoepOr8pjuSuPXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713505717; c=relaxed/simple;
	bh=gMy6cw3DboCqmYxhdSgZUroOrhCMb6yIgY4xhy8AcRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B249H2q1PImPP83CpIP54YcNeRb8WUA0HNNee/uf679A8NFCOrQRugeWyDbUeYKnIBbPfmiUZJsp4I11BTljjTzdq6vl9OZeV3GnQFQ+gF7peDbzxvCZor1SigRRLBTRRaQgj+td3lR6mLJ9PYIfrON1hO0DKquRbrqNpOYrlao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oT3ULVD9; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-516f2e0edb7so2150526e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Apr 2024 22:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713505713; x=1714110513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUWUrX+7Up17uccVitcI8TMuldwzT9oiXZZdOg/1/xo=;
        b=oT3ULVD9x5mC2+ZcPo14nswAR7JK8M7L7d98bRiF+zPA5+ReXUmVyS9rGdRxne6LaC
         PAi8pqrjNghCJtYSBEahF522k9Wc5yTQ1ODit2dLWx/phcjbOcPJwND4K9QWF9x5AJLp
         OsjZ3fxfJ3O0DxeSKteeK+fLsTW3w9bclykUvxJZrCLXhRl5HGuzv+hS+QTESSpnj1jt
         s8daAtFtrVeQFWCGvHu4VMQ3tfLDfRg6oI1kFRQ+hS5VmOKSo+tLA+zIbl9Ykyx1ujo4
         ISdGS7G2pFJWHmyOs77C+xmTVqvrwMLTKX4aWeiaSr3T9byh0Pq852C9KPMgCVAtvxFj
         WGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713505713; x=1714110513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUWUrX+7Up17uccVitcI8TMuldwzT9oiXZZdOg/1/xo=;
        b=n4aFMYovTDsoUKElERL24SJMdcmeyr9i7wlHZ7EIzv2YQcrloWw4n6cnTTcuCvpgyi
         ux6QVvK3XzHRa4iVzs2mov5LhK0pJ8cJ84YpF9TcRj/Uo6xYvlEqG4+JXZXWrHOUCCAu
         PvFfBG9i/rUhAy08pyVRSwtCjdzFxO6jXbgO0hg6Bf40VpOzybucPUy1drG75aN0ec0C
         nqAVOmFT2NsKTIC6eg2ocBE6gbJcz9QYnLIYCb27iRHQcjnU8dYmSxI97UD6IoUHpJZB
         ZNCpQlBwl3fEVttwqsW+F7StxNc5g8Wm7U0X+DCFz94HwvkzVj1LTLlpMZ3jD/5CMFF+
         l1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE3QQgLyaDoKddMF2lYV/nBbsEn85FNK8PKAQB3lIFa6GQ0Ib2YKaKjPJoIe7jLN79eI2kxPJima4qtAMI78CyMVkGPXPqEYxP5LHOkQDjCVs=
X-Gm-Message-State: AOJu0YwUi8F4jQT4LXf4OQwxIvpuiL98Rq2bS7kulUMoZ9Fijiwwlh3U
	gCElPFmYN+VUWNhfMueLoO1yS4cv1DwNVWL8qnjRSURIvvA4VTUZC39j3E4PLw4=
X-Google-Smtp-Source: AGHT+IGGFhdm24fRbZbASPVJ5Uk1/4VA+Pl0auWkqMpLjHkM4OYbghllVrdt80G8vUK8NW1HumU/Pg==
X-Received: by 2002:a19:4316:0:b0:516:d029:b51e with SMTP id q22-20020a194316000000b00516d029b51emr601805lfa.60.1713505713141;
        Thu, 18 Apr 2024 22:48:33 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.185])
        by smtp.gmail.com with ESMTPSA id br20-20020a170906d15400b00a52241b823esm1749562ejb.109.2024.04.18.22.48.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 22:48:32 -0700 (PDT)
Message-ID: <7593a5ef-7235-4d3a-a52d-90a7b1aeae0f@tuxon.dev>
Date: Fri, 19 Apr 2024 08:48:30 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] pinctrl: renesas: rzg2l: Configure the interrupt
 type on resume
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linus.walleij@linaro.org, tglx@linutronix.de, biju.das.jz@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com>
 <20240320104230.446400-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXescaJ-V0iuXsxo=X-7RYTBR1W5+EXZCw_2VPHEFGzdA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXescaJ-V0iuXsxo=X-7RYTBR1W5+EXZCw_2VPHEFGzdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 18.04.2024 17:07, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Mar 20, 2024 at 11:43 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Commit dce0919c83c3 ("irqchip/renesas-rzg2l: Do not set TIEN and TINT
>> source at the same time") removed the setup of TINT from
>> rzg2l_irqc_irq_enable(). To address the spourious interrupt issue the setup
>> of TINT has been moved in rzg2l_tint_set_edge() though
>> rzg2l_disable_tint_and_set_tint_source(). With this, the interrupts are
>> not properly re-configured after a suspend-to-RAM cycle. To address
>> this issue and avoid spurious interrupts while resumming set the
>> interrupt type before enabling it.
>>
>> Fixes: dce0919c83c3 ("irqchip/renesas-rzg2l: Do not set TIEN and TINT source at the same time")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
>> @@ -2045,7 +2045,9 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>
>>         for (unsigned int i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
>>                 struct irq_data *data;
>> +               unsigned long flags;
>>                 unsigned int virq;
>> +               int ret;
>>
>>                 if (!pctrl->hwirq[i])
>>                         continue;
>> @@ -2063,17 +2065,17 @@ static void rzg2l_gpio_irq_restore(struct rzg2l_pinctrl *pctrl)
>>                         continue;
>>                 }
>>
>> -               if (!irqd_irq_disabled(data)) {
>> -                       unsigned long flags;
>> -
>> -                       /*
>> -                        * This has to be atomically executed to protect against a concurrent
>> -                        * interrupt.
>> -                        */
>> -                       raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
>> +               /*
>> +                * This has to be atomically executed to protect against a concurrent
>> +                * interrupt.
>> +                */
>> +               raw_spin_lock_irqsave(&pctrl->lock.rlock, flags);
>> +               ret = rzg2l_gpio_irq_set_type(data, irqd_get_trigger_type(data));
>> +               if (ret)
>> +                       dev_crit(pctrl->dev, "Failed to set IRQ type for virq=%u\n", virq);
>> +               else if (!irqd_irq_disabled(data))
>>                         rzg2l_gpio_irq_enable(data);
>> -                       raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
>> -               }
>> +               raw_spin_unlock_irqrestore(&pctrl->lock.rlock, flags);
>>         }
>>  }
> 
> LGTM, but I'd rather move the dev_crit() outside (i.e. after) the
> critical section.

I was in balance about having it as proposed. I'll send an update to move
it outside.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

