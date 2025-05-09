Return-Path: <linux-renesas-soc+bounces-16855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC8AB137E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89421B222A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 12:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C786328ECEF;
	Fri,  9 May 2025 12:35:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB41482F5;
	Fri,  9 May 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794103; cv=none; b=jyOmYBvZvRiO5khyPEbXaSuxQh7zGG33i5IuOgnTi9C4P4bKO60BL6s+r07gXEdm3Gbk5BJTY3rIwuPHCW2AnTLyRjq965FjGhl01bpkISEkus+Z+jSg/RxDOYyJlg2Jz8Q5U3dWK06DFP2SYPESAQuoG1u6Evd188dmLnQAY0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794103; c=relaxed/simple;
	bh=G75b+GhVhMnqOFc0IDAkV6m8fQgJOkK5sx1cr0HRUtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfW/5hlY2VCx6Qbs6y/1wytNxhcCIz1Hna2qji0KLs4j1TLJm7o7d1c9Q+yofpYvQ31ibrMRpsjU7+K7QanTzGTV5aJ5iak4UffrjlBxiQwdWORr1UoraebyF0VZ50W7Exaqf6LboVomde7lmQdxKGIOi25vlsfm4+K+rHy/AUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52b2290e292so782274e0c.3;
        Fri, 09 May 2025 05:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794100; x=1747398900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94UQ6nPbfEM2IWkc+ebOq3AomqrfTBM0co76eK16X14=;
        b=lUjeT94RlPCb9eP1vz/H8Qp9N0DL6Oxup183keJmG909N9a0VWFU+5Od+KZ7sDl2a8
         lWYKJcqNBYF0rWWGJgIkJW7jwWgJdKNRXCM6laC0oeh8+3xacN5X2teewjXAy1PRKPX2
         2GVTja8Q3tWsGkzDcNtxDSXOxiuExQaDYApi+3V3Z4wsckQ1APRHYflGZ/hEpzaEBtxA
         yHqX8ndq/fTA6MtrTfvCRyAwa5gwzh5Wo8nY9V0SkBlRNo8Z7o9jNO+1jPeog4EYjarK
         ygCmmtstLOIV5iqqa7dW0S3fSE83O79eCAFT/aYrDawzfeWEash7WciZnscp5o6lW/vj
         TaDg==
X-Forwarded-Encrypted: i=1; AJvYcCUGTk5YwhuKUUbG/YYFGd5UbBgd7uAkLCB0thzCcfMfNf/GXmTVxVPk0coKzbO1pGAUmf4rPC0UfLqX@vger.kernel.org, AJvYcCWEGkt+52o7tHWi2qP2dKSulu9AV5cCyZ49O2F7jLgehOLWBvqFjzHrE9DViUC0Gn/CgfTqx5W9EeUepGHnb89G7OE=@vger.kernel.org, AJvYcCWqoSVqAW8onWL4O26eYBC1zaHix+P4CdWYuv9+lJChl4flNBkv5dY30lFPdhNPad9ZFZbYBbCDjGfEEGoL@vger.kernel.org, AJvYcCX7/Y/DZpUekBScAw9yUay6x1U6aEO+LA7TgnytWPXjCnmbLJtsNJRQHzKWnz4Z8VOZ2bDSGxdqMgI3@vger.kernel.org
X-Gm-Message-State: AOJu0YxDHEPf24EKanQXa/2oipOEkB3ca/NnThTNyhmCJAet1+Mx6rJd
	LK1DEawt3z6hAxEgmjTHIgMluoJOqDMDv08dOGbQvUTzOINEzI9K5vwQBujU
X-Gm-Gg: ASbGncsxSUR3glmAU+/M9F3zrE4CQ1vqiUh9/mDXb8h74q5fy60h1WwoIPQ/QZsZJSB
	2ywCtIuQnLAMh1wtHKB8CHFHfVHNzxVX/urvqtSsP8O770sYHZKWDY/qzanrdFPMrN/0Zk1P8mH
	f9F6DRQi8ovhFgWtFv4j/blLwgPaQ/vYjj56/eEpL+ixcN1v6PSJZdNbMHJebduTPkOen/DlQsH
	i045a3RyVnI2np5qH+Tubi6N0WJxOttZVwnqzRLFvXFh8O8R37ntOt92b9DA2ETDlXorCs770QY
	/ufS2hGBch4lzjQxSgzVXCiWQzUZBGdw42hIjzwgARTothwm7Obc+SX3+yRKU8TLmRwlEifis1t
	K9dQ=
X-Google-Smtp-Source: AGHT+IGH7tls50rMKezCOILGfoeHd//zLH+2RVKKlaiq/DvKVFxKawlx2R4DwXqAeopiUHl6WvesSw==
X-Received: by 2002:a05:6122:250a:b0:526:7f3:16e0 with SMTP id 71dfb90a1353d-52c53ae0af6mr2307713e0c.1.1746794099721;
        Fri, 09 May 2025 05:34:59 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c536ff1bfsm1080835e0c.7.2025.05.09.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:34:59 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8783d2bf386so535646241.0;
        Fri, 09 May 2025 05:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNHI8KGBlwzkHrd+Dp/xmj0oB+iwwssuE4M4LGXErqQoHFvdPD6JhalVcoLesMONgts7IgF01C9Ds9@vger.kernel.org, AJvYcCVhOUrrVX2h1OW+HsV56rEdpZCVw10UbxP3Dg+qyNeCnx/KhJiRKhlYxGnJStfR6migMIttkD1a7P3VXs+V@vger.kernel.org, AJvYcCVhaLfkdWVNUqSIO8NVLoUp3dAntlzcpHGIMa9AgnNpkPf4CqmsqIgQUOLmMBpiGR2aatM7tduepwSXOOFwkjQ7BgA=@vger.kernel.org, AJvYcCXeeoEg5YSpH8IfWTYz38Iv5CLLkntKMu9MVtnM04dhyCZyuaInLoMi+E1U390q08zPhWh/u3s1WHIL@vger.kernel.org
X-Received: by 2002:a05:6102:15a0:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-4deed3552b0mr2685121137.10.1746794098501; Fri, 09 May 2025
 05:34:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com> <e77c85de-4542-44e1-af2e-f63f72602ff8@tuxon.dev>
In-Reply-To: <e77c85de-4542-44e1-af2e-f63f72602ff8@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 May 2025 14:34:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com>
X-Gm-Features: AX0GCFtVScxF2koK4EeZ1OeR2EYr9pDTWXomyx_gSltjeSBJrsTivswCYklOMbw
Message-ID: <CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com>
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

On Fri, 9 May 2025 at 12:54, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 07.05.2025 18:42, Geert Uytterhoeven wrote:
> > On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> >> module has one or more MSTOP bits associated with it, and these bits need
> >> to be configured along with the module clocks. Setting the MSTOP bits
> >> switches the module between normal and standby states.
> >>
> >> Previously, MSTOP support was abstracted through power domains
> >> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> >> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
> >>
> >> Previous Order:
> >> A/ Switching to Normal State (e.g., during probe):
> >> 1/ Clear module MSTOP bits
> >> 2/ Set module CLKON bits
> >>
> >> B/ Switching to Standby State (e.g., during remove):
> >> 1/ Clear CLKON bits
> >> 2/ Set MSTOP bits
> >>
> >> However, in some cases (when the clock is disabled through devres), the
> >> order may have been (due to the issue described in link section):
> >>
> >> 1/ Set MSTOP bits
> >> 2/ Clear CLKON bits
> >>
> >> Recently, the hardware team has suggested that the correct order to set
> >> the MSTOP and CLKON bits is:
> >>
> >> Updated Order:
> >> A/ Switching to Normal State (e.g., during probe):
> >> 1/ Set CLKON bits
> >> 2/ Clear MSTOP bits
> >>
> >> B/ Switching to Standby State (e.g., during remove):
> >> 1/ Set MSTOP bits
> >> 2/ Clear CLKON bits
> >>
> >> To prevent future issues due to incorrect ordering, the MSTOP setup has
> >> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> >> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> >> from the RZ/G3S HW manual.
> >>
> >> Additionally, since multiple clocks of a single module may be mapped to a
> >> single MSTOP bit, MSTOP setup is reference-counted.
> >>
> >> Furthermore, as all modules start in the normal state after reset, if the
> >> module clocks are disabled, the module state is switched to standby. This
> >> prevents keeping the module in an invalid state, as recommended by the
> >> hardware team.
> >>
> >> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/clk/renesas/rzg2l-cpg.c
> >> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> >> +/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
> >> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
> >> +                                            bool standby)
> >> +{
> >> +       struct rzg2l_cpg_priv *priv = clock->priv;
> >> +       struct mstop *mstop = clock->mstop;
> >> +       bool update = false;
> >> +       u32 value;
> >> +
> >> +       if (!mstop)
> >> +               return;
> >> +
> >> +       value = MSTOP_MASK(mstop->conf) << 16;
> >> +
> >> +       if (standby) {
> >> +               unsigned int criticals = 0;
> >> +
> >> +               for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
> >
> > unsigned int
> >
> >> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
> >> +
> >> +                       if (clk->critical)
> >> +                               criticals++;
> >> +               }
> >> +
> >> +               /* Increment if clock is critical, too. */
> >> +               if (clock->critical)
> >> +                       criticals++;
> >
> > If clock->shared_mstop_clks[] would include the current clock, then
> > (a) this test would not be needed, and
>
> Agree!
>
> > (b) all clocks sharing the same mstop could share a single
> >     clock->shared_mstop_clks[] array.
>
> I'll look into this but I'm not sure how should I do it w/o extra
> processing at the end of registering all the clocks. FWICT, that would
> involve freeing some shared_mstop_clks arrays and using a single reference
> as the shared_mstop_clks[] is updated after every clock is registered. Can
> you please let me know if this what you are thinking about?

Currently, when detecting two clocks share the same mstop,
you (re)allocate each clock's shared_mstop_clks[], and add the
other clock:

    rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
    rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);

Instead, call rzg2l_cpg_add_shared_mstop_clock() once, and modify
rzg2l_cpg_add_shared_mstop_clock() to not only realloc the target's
shared_mstop_clks[], but also loop over all its existing entries,
and update their shared_mstop_clks[] pointers.

> >> +       for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
> >> +               struct mstp_clock *clk;
> >> +               struct clk_hw *hw;
> >> +               u32 val;
> >> +
> >> +               if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
> >> +                       continue;
> >> +
> >> +               hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> >> +               clk = to_mod_clock(hw);
> >
> > As this patch adds four more loops iterating over all module clocks
> > and skipping empty entries, I think it is worthwhile to introduce a
> > custom for_each_mstp_clock()-iterator.
>
> I was thinking about it and I tried do it with a macro, keeping this code
> in it:
>
>     for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
>         struct mstp_clock *clk;
>         struct clk_hw *hw;
>         u32 val;
>
>         if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
>             continue;
>
> but it was a complicated macro and abandoned it in the end.

Yes, the implementation would be complicated, but the semantics
would be clear.  The kernel already has complex macros like
for_each_nest_rmap_safe() and for_each_oldnew_connector_in_state().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

