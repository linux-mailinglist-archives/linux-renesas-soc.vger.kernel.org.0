Return-Path: <linux-renesas-soc+bounces-17051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9512AB56BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 16:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C88133B743C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 14:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7E5298CDC;
	Tue, 13 May 2025 14:07:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5FB1F1932;
	Tue, 13 May 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145275; cv=none; b=VGgCCMc4ro4eVMLJoHSgdPKmyBSHocJlm5QznEpIG3Upgq4HF2IpC/8rIfIMiyis9w0gLMiBmdMgX+xGybCrS74BRE0PUY9+CBIe7zz+JtBMaUi1MHXe0LDPAzP+lapYiO18i2tRMIIX0am5lkcPKil/Riq8RsxHJjtgLJtGEmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145275; c=relaxed/simple;
	bh=Y0R8zrmgzpWWjxszm02PWYa21+mRJwa+bzQvXj+zal4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjdzEMCAzNXJG+pSq6cqOmh6v/tIxqmE6ummQuLPILqcJERnKZ41yICVwC5kRlE4w9eTmvpLW/7gmrJtYVCV4nHzdEhlSk8EE3aB5LSIR2ETcdxFR/180/PYk0FcVeZjEnucJY2qUP2W0ZpDcS5Na781WcNXoQ6PNSmp7eaLBkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2cc82edcf49so1741915fac.1;
        Tue, 13 May 2025 07:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145271; x=1747750071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYqxdxbIjCdwWH5ihAeDKp0gn6eCqGD1GEfsuB3zWFc=;
        b=riokf8S451/8FVjfJkqyqsPSPvFxK8wokQ1jXtB1YJzy7W7khgr0Gj7lbZCNJDYUyb
         jR1VzJaqfz9775LJGFXH1iS6d/AJeEj3g5fUG/VjXtBIs0Mwa1TKPKwviHmDd5r8Z3CZ
         NeU0jDWWvj5OpIwihP3iCqrnCMYK9jVFOVH0bSTQMZOBxj59Tknl9em0a/2xU0F+k0bO
         iQEaZnwIRauOuCCpuJjsRqnHe/jlK/v1mGBRvLTAGVZylGkzuUo9jP1ZaEKmPgPMBXgD
         n/tpknesMStUcbUoMJNKm0iFyNpczM+uMQzoRBCFMSzC4cjfJJsA3xnDdLCLODJXhD2W
         F2Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUc+y+S6dyuI0S5P2pG7w2892tVfFGbuxDtjwRONAnBQAXQxwkoaNeMvADY9Ua3W8otnUk999lBmM+fbL6qz72WXmI=@vger.kernel.org, AJvYcCVT6WRQNQmxfDw9HUKEVqdE2KwtDyUalm/QlCEN9ejuXZpFH/drQnCAFU1KXj4xG/e7WfNA1elNj6A4@vger.kernel.org, AJvYcCWc2+rzMk2z202xU17weronTQLzc5HEBoA0F55coAXOgyIvju2/LclzWeMFaSNQIQqtlhZCbO8NiR4R@vger.kernel.org, AJvYcCWpjAWBbU6PrWEGYCV+Rqc8rQjqNJwW1HJJ4+/NyI6Wz5vcqRYGOTwrAz8iXjBT5rvGFNpZVMvd/3hgbuu8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/nGrjec645a8SXOKyzF1PwOwekAfE8EEkUbQMNwVi4HA3xSgE
	fsgHAlcQYfICi086fDp5ne/d8yF+sWuhiBSxpJW1/ioNmkEL2/N6vwYlF9kd
X-Gm-Gg: ASbGnctA3biY/dIJJdFlJr94wF3mGAocJqCEw0F0Lr9O78B/uvCm2RTaUqJUT+gPPGi
	QtojCUnwSt2RnWaXY/x/MuCtnTzXm7RKHEi9ZuEJVHZ1BvMxq5qZrkk8Gwo8UPJrWTajxOciglU
	ZmRPdy4a1X1+wDXPTIsEK9pdkWtYNvKGkhJfV7rNorThQFqi0QKi8h9aqPyK6RVtwQbctO0Pn9y
	BlZW6VRUdM0ZXRBNCSp6aXnG+9RuZqXza4gMzlNil0rkkwh7DuMfGmka99g1c1XiYvsdOd2WezC
	t9mJnWiukt/2g67QtLuuH8hq6wG1IhWsKTfwUNGuRjcsQOOHh1vejasisTOtLy716JHVUPi6S/f
	HWHmgReXKuOFVsA==
X-Google-Smtp-Source: AGHT+IFnxXt5TsANawVmDqJQFDRGfBAW/RPxA38VXN7MTAdhB+g2UguiBsitq/Tr66TF2i20eKNtjQ==
X-Received: by 2002:a05:6870:d109:b0:2c2:27c8:5865 with SMTP id 586e51a60fabf-2dba42af8e7mr10912727fac.9.1747145270932;
        Tue, 13 May 2025 07:07:50 -0700 (PDT)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com. [209.85.210.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba0625c93sm2368812fac.8.2025.05.13.07.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:07:50 -0700 (PDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c14138668so1442404a34.2;
        Tue, 13 May 2025 07:07:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGdsB7htxkAgGrg8P8UZy2TpFmUO4p/dwhjiWjwOtI25YejH7zBwtqFy3VgtiSY2bu6a930LdwUnnskhZvO3PTUbI=@vger.kernel.org, AJvYcCVGNlcJqkSu/56AHF+23SB/fRl8HVZme48D1HHES/4ATjd5M9ytmkKnfrL11hMinFm0cLF9qdVUQx/Q@vger.kernel.org, AJvYcCW7bXvaZxw7UjzE5Usl04qq+gjGHgYjTAiraQF3+5y5iJAYY3R4EKL1P9FvAI67zPIkttuAI773W4XD@vger.kernel.org, AJvYcCXB59VCuEYdFkmF2rMbsdXRMG+oIKpQZXFyMcU4Uzf1VtHmSyq8K+TrME+eyvG/Y7TwU+Q1fxMX4gdyo0Zx@vger.kernel.org
X-Received: by 2002:a05:6808:16ab:b0:403:25bd:ca71 with SMTP id
 5614622812f47-4037fe18118mr10017457b6e.15.1747145270050; Tue, 13 May 2025
 07:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
 <e77c85de-4542-44e1-af2e-f63f72602ff8@tuxon.dev> <CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com>
 <53999471-277b-4621-abfd-b4c25761b3da@tuxon.dev>
In-Reply-To: <53999471-277b-4621-abfd-b4c25761b3da@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 16:07:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa_GuHmw0wRjMJi8ydcn-YTapruWKfoX96FBZHhveQHg@mail.gmail.com>
X-Gm-Features: AX0GCFuvvs_u6X3OsMowifJ8QCT1uXjQ3Gy261l152Z0TBBHmvFKxAJ7R79hdjw
Message-ID: <CAMuHMdWa_GuHmw0wRjMJi8ydcn-YTapruWKfoX96FBZHhveQHg@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 13 May 2025 at 14:34, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 09.05.2025 15:34, Geert Uytterhoeven wrote:
> > On Fri, 9 May 2025 at 12:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >> On 07.05.2025 18:42, Geert Uytterhoeven wrote:
> >>> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>
> >>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> >>>> module has one or more MSTOP bits associated with it, and these bits need
> >>>> to be configured along with the module clocks. Setting the MSTOP bits
> >>>> switches the module between normal and standby states.
> >>>>
> >>>> Previously, MSTOP support was abstracted through power domains
> >>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> >>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
> >>>>
> >>>> Previous Order:
> >>>> A/ Switching to Normal State (e.g., during probe):
> >>>> 1/ Clear module MSTOP bits
> >>>> 2/ Set module CLKON bits
> >>>>
> >>>> B/ Switching to Standby State (e.g., during remove):
> >>>> 1/ Clear CLKON bits
> >>>> 2/ Set MSTOP bits
> >>>>
> >>>> However, in some cases (when the clock is disabled through devres), the
> >>>> order may have been (due to the issue described in link section):
> >>>>
> >>>> 1/ Set MSTOP bits
> >>>> 2/ Clear CLKON bits
> >>>>
> >>>> Recently, the hardware team has suggested that the correct order to set
> >>>> the MSTOP and CLKON bits is:
> >>>>
> >>>> Updated Order:
> >>>> A/ Switching to Normal State (e.g., during probe):
> >>>> 1/ Set CLKON bits
> >>>> 2/ Clear MSTOP bits
> >>>>
> >>>> B/ Switching to Standby State (e.g., during remove):
> >>>> 1/ Set MSTOP bits
> >>>> 2/ Clear CLKON bits
> >>>>
> >>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
> >>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> >>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> >>>> from the RZ/G3S HW manual.
> >>>>
> >>>> Additionally, since multiple clocks of a single module may be mapped to a
> >>>> single MSTOP bit, MSTOP setup is reference-counted.
> >>>>
> >>>> Furthermore, as all modules start in the normal state after reset, if the
> >>>> module clocks are disabled, the module state is switched to standby. This
> >>>> prevents keeping the module in an invalid state, as recommended by the
> >>>> hardware team.
> >>>>
> >>>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> >>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>
> >>> Thanks for your patch!
> >>>
> >>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
> >>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> >
> >>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
> >>>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
> >>>> +                                            bool standby)
> >>>> +{
> >>>> +       struct rzg2l_cpg_priv *priv = clock->priv;
> >>>> +       struct mstop *mstop = clock->mstop;
> >>>> +       bool update = false;
> >>>> +       u32 value;
> >>>> +
> >>>> +       if (!mstop)
> >>>> +               return;
> >>>> +
> >>>> +       value = MSTOP_MASK(mstop->conf) << 16;
> >>>> +
> >>>> +       if (standby) {
> >>>> +               unsigned int criticals = 0;
> >>>> +
> >>>> +               for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
> >>>
> >>> unsigned int
> >>>
> >>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
> >>>> +
> >>>> +                       if (clk->critical)
> >>>> +                               criticals++;
> >>>> +               }
> >>>> +
> >>>> +               /* Increment if clock is critical, too. */
> >>>> +               if (clock->critical)
> >>>> +                       criticals++;
> >>>
> >>> If clock->shared_mstop_clks[] would include the current clock, then
> >>> (a) this test would not be needed, and
> >>
> >> Agree!
> >>
> >>> (b) all clocks sharing the same mstop could share a single
> >>>     clock->shared_mstop_clks[] array.
> >>
> >> I'll look into this but I'm not sure how should I do it w/o extra
> >> processing at the end of registering all the clocks. FWICT, that would
> >> involve freeing some shared_mstop_clks arrays and using a single reference
> >> as the shared_mstop_clks[] is updated after every clock is registered. Can
> >> you please let me know if this what you are thinking about?
> >
> > Currently, when detecting two clocks share the same mstop,
> > you (re)allocate each clock's shared_mstop_clks[], and add the
> > other clock:
> >
> >     rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
> >     rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);
> >
> > Instead, call rzg2l_cpg_add_shared_mstop_clock() once, and modify
> > rzg2l_cpg_add_shared_mstop_clock() to not only realloc the target's
> > shared_mstop_clks[], but also loop over all its existing entries,
> > and update their shared_mstop_clks[] pointers.
> I tried this approach but w/o complicated further the code I can't keep
> track of whether the "to be updated" (not reallocated) shared_mstop_clks[]
> pointers were previously updated pointers or devm_krealloc()'ed ones. I
> need this to properly free the unused arrays. Calling devm_kfree() on a
> non-devres resource triggers a WARN_ON() for each call.
>
> Because of this I prepared a new version where the duplicated lists are
> freed after all the mod clocks were initialized. I'll publish it soon.

What about using in rzg2l_cpg_update_shared_mstop_clocks():

    for (i = 0; i < priv->num_mod_clks; i++) {
        clk = ...[i];

        if (clk->mstop != clock->mstop)
                continue;

        n = clk->num_shared_mstop_clks;
        if (!n) {
            new_clks = devm_kmalloc(dev, 2 * sizeof(...), GFP_KERNEL);
            new_clks[n++] = clk;
        } else {
            new_clks = devm_krealloc(dev, clk->shared_mstop_clks,
                                     (n + 1) * sizeof(...), GFP_KERNEL);
        }
        new_clks[n++] = clock;

        /* update all matching clocks */
        for (j = 0; j < n; j++) {
            priv->clks[new_clks[j]]->shared_mstop_clks = new_clks;
            priv->clks[new_clks[j]]->num_shared_mstop_clks = n;
        }

        break;
    }

The above is an oversimplification, as it does not take care of
converting between mstp_clock and clk_hw pointers where needed.

Does that make sense?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

