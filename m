Return-Path: <linux-renesas-soc+bounces-17052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3143DAB58BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72CD63A6751
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71F41DED53;
	Tue, 13 May 2025 15:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="V8x/SrQP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039C227586
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 15:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150602; cv=none; b=JAsFhzUsEoE+wrrMfo0EJq2AuEjJfKjuyqnG/OmEc7K4z/ggqufbDpPw3030QCMpHsMwDhxlamYP1SwLTs5TD57eWaTdzg95vZBK0tFYrKRa44WcW04PmRWHNdOTFjSfGGwwMRGjCRyqCLKdmo0eO8MrjtBjQB2SVk69dU+xv/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150602; c=relaxed/simple;
	bh=g8+164MWQnwm/Yvz9p3c3pVZTgk5x0kJhrCBitVwXJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZmYWtycB3kYHbXTmndIrc+vFAN0rfMJ46OLtWjpr3iAcTrC+mPsqyHxfy9Tn+B2yDxIT2dMHKWVCj98TGOkJZj3/Txdrsze2+a6kFSVaOepxO4aOfdWAeOF1uvmvr7dgq2KL2sECiWWghwwJ6lerRgROMnaUGHSRdhdtvb352I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=V8x/SrQP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so33568385e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 08:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747150599; x=1747755399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L57om844kxS3HDPApKIBPPD4O1jfgBmX7JYFvjM39sM=;
        b=V8x/SrQPZxRnMnsHiB438NwCSZj0RCPgkyzK8+wWjLkWOs9+EtSoiVN9yDdeyOBNgi
         nGuQutR8jC7fhdCuDAF0v1RFiUCzU30tfRMf5+GgMZyuTXRzz7AbYVvnXZbl/2lPHSXQ
         pcKf2KodxzqTJgga+v7AnbYzQhqHAWSc2oy78R7e6jWSzp3nSvVgzXxbKJ2mYbZWkuT3
         Ou224kIHF/mNA244zMJCMu5G/I831oi0mgKBiM2XTGu6JjTQ77EOWSVJFmjO/nmzo/+T
         95qOeL1+RW+s5443TPpLEItNM8wu8RZwXQW5FZtG6Hc9B3l4+FpaPlJTplp0NZwtr3zD
         arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150599; x=1747755399;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L57om844kxS3HDPApKIBPPD4O1jfgBmX7JYFvjM39sM=;
        b=uXGjuKDbhZalyvnLtsSLnqH88eIpzawnn2E3x6lkko5Fw5czO6iDNsYWiU9tY164wD
         t9r1WMaSpRBy4aGjJdYQdVRjA5388Y2V4lPXQvBuMvi/cfk6bwQmnYLKPdrZDW9z/HU9
         UAJrR7a4q+RSgqCUNvkqjms4K5E97YbnxWCulenaGmfwhdF9nmWW8dh2+OsMkF+4pAGK
         /hAmIMkUQIHNzi+RA/a5dgne/hbHsew7wH60EuMdmyzjjWtM+7odt8S1tRn1yeE9IdAT
         J7RlxOfjjkgK/xa1OB9ODs7Yky/5eR7zrx59F2S22X5230GPTaPgcC4rYVZD0vm+eMIx
         gtww==
X-Forwarded-Encrypted: i=1; AJvYcCVT+3d5cyT0VO0C0fCQH0c/oQV4rsJ/qhacHYdTP/GOUe7JYmtPPRoCZbpl4U2yNN/yESEPNMmtDo2Ju3TSaukTvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAT9opfFRoOkszZzQeDmL6x687OQcNQum5Jt8LABMAiJH2CPX
	o/cn0Rv8i3ezSKhxDStH60kB42PwICiTTx9OsFny9F+hBC7tfkNbmetJmB3HxYY=
X-Gm-Gg: ASbGnctyWZMJ3KCKbtO4YvCes8xLjh7VgkACi4wQdRkrqtMe/qjXPUK7ePMWfIH7iFc
	+VkazRyUzbvEyHd6CcJn4baxalOlFF2dWRA4CjUGPcD2RytrVC6mRVL0P9yVopxooh2W/qZL7WC
	pYq0m2IDds8km5IWQqTO0oMvX/Nv7/IGo1dK7RGym0aDaeJknp0CoRUPppqyXHxF7dVAu35ry/V
	3/tPJCt9X3pS0+Eym5D5dhxr1Fgynf58lh4zl6w1VZMYoZ2CmCp8DrglN11fXVJY4o4+vI0Awvm
	WTqtNwKTAfCb7DxkFXuM7JZPjxUCqDaTJfGlNEYYk5BJThso8VPLr9EK0Avphavt9AE=
X-Google-Smtp-Source: AGHT+IFml+AzNYNXdPMsjKRnKr8SIqb9NPuxRgmuQY6V1E11Gk6Rx5OhkWkHEuPN0PEic9EHObJEdA==
X-Received: by 2002:a05:600c:a44:b0:43c:ec4c:25b1 with SMTP id 5b1f17b1804b1-442d6dc5328mr136024405e9.23.1747150598818;
        Tue, 13 May 2025 08:36:38 -0700 (PDT)
Received: from [192.168.157.194] ([213.233.104.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d5cf5d6bsm176202005e9.1.2025.05.13.08.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:36:38 -0700 (PDT)
Message-ID: <433f188f-054d-4f22-86bf-74b8c38f11f5@tuxon.dev>
Date: Tue, 13 May 2025 18:36:35 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
 <e77c85de-4542-44e1-af2e-f63f72602ff8@tuxon.dev>
 <CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com>
 <53999471-277b-4621-abfd-b4c25761b3da@tuxon.dev>
 <CAMuHMdWa_GuHmw0wRjMJi8ydcn-YTapruWKfoX96FBZHhveQHg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWa_GuHmw0wRjMJi8ydcn-YTapruWKfoX96FBZHhveQHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 13.05.2025 17:07, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, 13 May 2025 at 14:34, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 09.05.2025 15:34, Geert Uytterhoeven wrote:
>>> On Fri, 9 May 2025 at 12:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 07.05.2025 18:42, Geert Uytterhoeven wrote:
>>>>> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>>>>>> module has one or more MSTOP bits associated with it, and these bits need
>>>>>> to be configured along with the module clocks. Setting the MSTOP bits
>>>>>> switches the module between normal and standby states.
>>>>>>
>>>>>> Previously, MSTOP support was abstracted through power domains
>>>>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>>>>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>>>>>
>>>>>> Previous Order:
>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>> 1/ Clear module MSTOP bits
>>>>>> 2/ Set module CLKON bits
>>>>>>
>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>> 1/ Clear CLKON bits
>>>>>> 2/ Set MSTOP bits
>>>>>>
>>>>>> However, in some cases (when the clock is disabled through devres), the
>>>>>> order may have been (due to the issue described in link section):
>>>>>>
>>>>>> 1/ Set MSTOP bits
>>>>>> 2/ Clear CLKON bits
>>>>>>
>>>>>> Recently, the hardware team has suggested that the correct order to set
>>>>>> the MSTOP and CLKON bits is:
>>>>>>
>>>>>> Updated Order:
>>>>>> A/ Switching to Normal State (e.g., during probe):
>>>>>> 1/ Set CLKON bits
>>>>>> 2/ Clear MSTOP bits
>>>>>>
>>>>>> B/ Switching to Standby State (e.g., during remove):
>>>>>> 1/ Set MSTOP bits
>>>>>> 2/ Clear CLKON bits
>>>>>>
>>>>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
>>>>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
>>>>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
>>>>>> from the RZ/G3S HW manual.
>>>>>>
>>>>>> Additionally, since multiple clocks of a single module may be mapped to a
>>>>>> single MSTOP bit, MSTOP setup is reference-counted.
>>>>>>
>>>>>> Furthermore, as all modules start in the normal state after reset, if the
>>>>>> module clocks are disabled, the module state is switched to standby. This
>>>>>> prevents keeping the module in an invalid state, as recommended by the
>>>>>> hardware team.
>>>>>>
>>>>>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>>>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>>>
>>>>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
>>>>>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
>>>>>> +                                            bool standby)
>>>>>> +{
>>>>>> +       struct rzg2l_cpg_priv *priv = clock->priv;
>>>>>> +       struct mstop *mstop = clock->mstop;
>>>>>> +       bool update = false;
>>>>>> +       u32 value;
>>>>>> +
>>>>>> +       if (!mstop)
>>>>>> +               return;
>>>>>> +
>>>>>> +       value = MSTOP_MASK(mstop->conf) << 16;
>>>>>> +
>>>>>> +       if (standby) {
>>>>>> +               unsigned int criticals = 0;
>>>>>> +
>>>>>> +               for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
>>>>>
>>>>> unsigned int
>>>>>
>>>>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
>>>>>> +
>>>>>> +                       if (clk->critical)
>>>>>> +                               criticals++;
>>>>>> +               }
>>>>>> +
>>>>>> +               /* Increment if clock is critical, too. */
>>>>>> +               if (clock->critical)
>>>>>> +                       criticals++;
>>>>>
>>>>> If clock->shared_mstop_clks[] would include the current clock, then
>>>>> (a) this test would not be needed, and
>>>>
>>>> Agree!
>>>>
>>>>> (b) all clocks sharing the same mstop could share a single
>>>>>     clock->shared_mstop_clks[] array.
>>>>
>>>> I'll look into this but I'm not sure how should I do it w/o extra
>>>> processing at the end of registering all the clocks. FWICT, that would
>>>> involve freeing some shared_mstop_clks arrays and using a single reference
>>>> as the shared_mstop_clks[] is updated after every clock is registered. Can
>>>> you please let me know if this what you are thinking about?
>>>
>>> Currently, when detecting two clocks share the same mstop,
>>> you (re)allocate each clock's shared_mstop_clks[], and add the
>>> other clock:
>>>
>>>     rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
>>>     rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);
>>>
>>> Instead, call rzg2l_cpg_add_shared_mstop_clock() once, and modify
>>> rzg2l_cpg_add_shared_mstop_clock() to not only realloc the target's
>>> shared_mstop_clks[], but also loop over all its existing entries,
>>> and update their shared_mstop_clks[] pointers.
>> I tried this approach but w/o complicated further the code I can't keep
>> track of whether the "to be updated" (not reallocated) shared_mstop_clks[]
>> pointers were previously updated pointers or devm_krealloc()'ed ones. I
>> need this to properly free the unused arrays. Calling devm_kfree() on a
>> non-devres resource triggers a WARN_ON() for each call.
>>
>> Because of this I prepared a new version where the duplicated lists are
>> freed after all the mod clocks were initialized. I'll publish it soon.
> 
> What about using in rzg2l_cpg_update_shared_mstop_clocks():
> 
>     for (i = 0; i < priv->num_mod_clks; i++) {
>         clk = ...[i];
> 
>         if (clk->mstop != clock->mstop)
>                 continue;
> 
>         n = clk->num_shared_mstop_clks;
>         if (!n) {
>             new_clks = devm_kmalloc(dev, 2 * sizeof(...), GFP_KERNEL);
>             new_clks[n++] = clk;
>         } else {
>             new_clks = devm_krealloc(dev, clk->shared_mstop_clks,
>                                      (n + 1) * sizeof(...), GFP_KERNEL);
>         }
>         new_clks[n++] = clock;
> 
>         /* update all matching clocks */
>         for (j = 0; j < n; j++) {
>             priv->clks[new_clks[j]]->shared_mstop_clks = new_clks;
>             priv->clks[new_clks[j]]->num_shared_mstop_clks = n;
>         }
> 
>         break;
>     }
> 
> The above is an oversimplification, as it does not take care of
> converting between mstp_clock and clk_hw pointers where needed.
> 
> Does that make sense?

I see it now. It make sense. Thank you for sharing.

Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


