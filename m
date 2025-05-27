Return-Path: <linux-renesas-soc+bounces-17537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 916BDAC4B3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FC9B189EAE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 09:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AF224DCEB;
	Tue, 27 May 2025 09:10:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89B41F78F2;
	Tue, 27 May 2025 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748337053; cv=none; b=jOdOC8/IeGQQpPf0+lwoIbhEAcgWouABl2C1pSBtvTN5zVRDuufcVCREiiPcDMiJxSF1+CQjfxIgyWWnFFFY72lJCLt6eiLmJMkS1Z9o0qJlliWBV6JDgspyE57BLS/Aw5A1UKYuba7oMrdPASTJqY638FTuPS5slrUtZ18RWbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748337053; c=relaxed/simple;
	bh=B/Wx22myN9t9W1nCFl2Qf/W3eMXStDV+9t2QZS4ibns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MC2kvc37f4Uv5l2NmEwm+XBPU33gIEMkMXHaJ4afxMw61A411lmoxWSEjYOaccDcWHMxca6THNOzQkQhZI04CCwCze6s0SyKMDwMMtFjjEh3jPrqMFF+PTE1LOQ2/Dd6ArA6SrkNB6SiGV1KKcsHZlyik7YyNaeJ/3Q+5yj/n2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-52b2290e28eso537767e0c.3;
        Tue, 27 May 2025 02:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337049; x=1748941849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0XqENSKLuOF2zrMfrOr5CmcVoSO19vNQHmzVty4UvCI=;
        b=l1BcyiBlB2n8I7Pj5Sb55cr8J5K2k7vhafl7mdH0GbCRAq8dVoMswL/ocbHLq5Gtgv
         qKa612K0gKKpFJ2mpE4Fw1kfG3HgvTR2fO48nvOJSKbA6bo0lQCqb9t397y0gv1qOavX
         TxvaPyE+BqR/LGSe3LSomVbMxzTUIiaW+0So5Bu7drqBgcEVtDSN1emTm+gKU0zY2Fa8
         1VipUGVTWhdPnHokTqwkau0E92FMfyAi8pMuQnC2fYYuLlZ1DOeoA2cbZd8bsbKCdm6p
         5ayKJsiYEDmfNdu6nsk+8f/vNHP8ccP5Ppi5bJNqPmulmnUH7renn2CVgRS7eeD7tNsx
         4sbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPKWwxubOXmR7w0SIOsruP4Hy4PWQWRl8hI0DyuX6mxrtZinG0gYIKm4WLwTzR9HvbryzW9ekyh/QZ@vger.kernel.org, AJvYcCV5e+z5XtK3ahBH7SzOyilUqD209Yfk/er2evEN9kgmyAE6j2frKYJcL4NA03U45YZK4BnRrV5iQSC2Rh965IO7s4M=@vger.kernel.org, AJvYcCXr8p7CjPWmpd17OPlTn5c3WcxVUsNYkWxJz2nwX33ewCDq331KEU93kgZJ32s0BIxbvyW2M/iARVOXbs0P@vger.kernel.org, AJvYcCXxiQDUnkmsOJ9h1UC9aHQrE8TmL5/P5/uoNKRj6jvwuZKap4GQEpjvUSHgJvFzk6SMwN73FypBZwcy@vger.kernel.org
X-Gm-Message-State: AOJu0YxKlOC2JrZTyyqarH7ywLnC6MG1AyCO4QrI9PKKI/bZiQeq4MFg
	xAbuLjfoWuvt8TTXEjP1zc9511PtX3A296tEl3vccbXvj7Z2UEQgPTdSUKsg20B7
X-Gm-Gg: ASbGncu5ly/VzxTr1JwBkFnJXgq0WZKSUQrjBAFoiG85soIMpf2BGm+lLY5x7cse2eT
	FQjn9ptjpRT69Kbk28enqrzmF0l89U52VAHne1mi7mpNpjq/tEbK+fKUKYFHU4wa9bZxuGeouES
	xKxBxcbUfPEFSKnasZDLKi4Yo8Nnp+kQL8UCPaIRWzyTIFZNR/qCgI9U2scIZ4aPrCrb8bzOl3b
	I46DZovpsy53nhJHJ8SUjC+t88wCIYH1txWd8dp7K66t26EBXVxqrCZQ9YAF6mSZws/XGeBfDmc
	axDHDNHhUHA2C+KW7w301/EUyyP7QYjdZDpf7dYruBELH/z7geBLzwy9PesZyaFpeoXHEesERnl
	muv1NT9CXa9mLvw==
X-Google-Smtp-Source: AGHT+IH865uZABhm/PprJEcIwAVehlE6cZBeEZIfaZIQtnzLlrLiEE19Q2jBvwlcWuQgSX175I7aGA==
X-Received: by 2002:a05:6122:a18:b0:530:5a43:db61 with SMTP id 71dfb90a1353d-5305a43dc63mr375766e0c.2.1748337048777;
        Tue, 27 May 2025 02:10:48 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53050aadc5asm1725446e0c.16.2025.05.27.02.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 02:10:48 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4e58a9bb8fcso211709137.2;
        Tue, 27 May 2025 02:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxTe/t7TI9mUkjG2AAIVFPHC/mFp46oktYfKZLvUQqylnEVQ4nDwq1hZjgklhi3lVWU2JyKeJ6EA7q7WHo3NtAVXE=@vger.kernel.org, AJvYcCWiplPh8633ZClqhSOnrmf+gIwBo86zEs0u4bTupyH46iWbVZdmGDuobXSTMseH/RkwgMViPmQYPMtk@vger.kernel.org, AJvYcCXCm8jKt80bIjlQJ1B480mmvPjYYKa0H6jJIaMn/tabVzCcRyY+q8YqKGqD5yAvVuRwMx/N0y9F1SK8@vger.kernel.org, AJvYcCXeMzbtZMpjwSuk3bJIAfaolrAYjWSE2nfqm0uXCkZDp5A4SRuZkt6+XBDx+iYmbBjUwlyWTqvkspqIQ7B1@vger.kernel.org
X-Received: by 2002:a05:6102:3754:b0:4e5:9426:f9e6 with SMTP id
 ada2fe7eead31-4e59426fafdmr239937137.23.1748337048376; Tue, 27 May 2025
 02:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
 <20250514090415.4098534-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWNrU=XOZr3dKKXQikzCzJ1oUPGQofWFdRX9x6rhYn3XA@mail.gmail.com>
 <b0d15a62-e164-4a8a-b4c7-77d9c3b2e7b2@tuxon.dev> <CAMuHMdUT57QfwfeoFfp-rL0yX_32QQNU3-c3MnPgdbSWi182Hw@mail.gmail.com>
 <87a923c1-c996-4769-86bd-b28b42574c3a@tuxon.dev> <CAMuHMdWr=ZHiMQ4bREu_crpuE_M3Wp4JLNEKMqd_4NT1tcTfZg@mail.gmail.com>
 <d318550c-25cb-4305-8a39-4e4ff51728d8@tuxon.dev>
In-Reply-To: <d318550c-25cb-4305-8a39-4e4ff51728d8@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 May 2025 11:10:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXufBWPawkSMsvEdq66EPKi2SrB2REJjaLqu1RkSO8CWg@mail.gmail.com>
X-Gm-Features: AX0GCFtJOPYqEe9TXq6Ms9B981Y5GsMG_D_HKMu4fvaYa98sdPBbEAVY79OUdTU
Message-ID: <CAMuHMdXufBWPawkSMsvEdq66EPKi2SrB2REJjaLqu1RkSO8CWg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Tue, 27 May 2025 at 10:58, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 26.05.2025 20:09, Geert Uytterhoeven wrote:
> > On Mon, 26 May 2025 at 17:55, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >> On 26.05.2025 16:33, Geert Uytterhoeven wrote:
> >>> On Fri, 23 May 2025 at 09:41, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >>>> On 22.05.2025 17:46, Geert Uytterhoeven wrote:
> >>>>> On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> >>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>>
> >>>>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> >>>>>> module has one or more MSTOP bits associated with it, and these bits need
> >>>>>> to be configured along with the module clocks. Setting the MSTOP bits
> >>>>>> switches the module between normal and standby states.
> >>>>>>
> >>>>>> Previously, MSTOP support was abstracted through power domains
> >>>>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> >>>>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
> >>>>>>
> >>>>>> Previous Order:
> >>>>>> A/ Switching to Normal State (e.g., during probe):
> >>>>>> 1/ Clear module MSTOP bit
> >>>>>> 2/ Set module CLKON bit
> >>>>>>
> >>>>>> B/ Switching to Standby State (e.g., during remove):
> >>>>>> 1/ Clear CLKON bit
> >>>>>> 2/ Set MSTOP bit
> >>>>>>
> >>>>>> However, in some cases (when the clock is disabled through devres), the
> >>>>>> order may have been (due to the issue described in link section):
> >>>>>>
> >>>>>> 1/ Set MSTOP bit
> >>>>>> 2/ Clear CLKON bit
> >>>>>>
> >>>>>> Recently, the hardware team has suggested that the correct order to set
> >>>>>> the MSTOP and CLKON bits is:
> >>>>>>
> >>>>>> Updated Order:
> >>>>>> A/ Switching to Normal State (e.g., during probe):
> >>>>>> 1/ Set CLKON bit
> >>>>>> 2/ Clear MSTOP bit
> >>>>>>
> >>>>>> B/ Switching to Standby State (e.g., during remove):
> >>>>>> 1/ Set MSTOP bit
> >>>>>> 2/ Clear CLKON bit
> >>>>>>
> >>>>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
> >>>>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> >>>>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> >>>>>> from the RZ/G3S HW manual, Rev1.10.
> >>>>>>
> >>>>>> Additionally, since multiple clocks of a single module may be mapped to a
> >>>>>> single MSTOP bit, MSTOP setup is reference-counted.
> >>>>>>
> >>>>>> Furthermore, as all modules start in the normal state after reset, if the
> >>>>>> module clocks are disabled, the module state is switched to standby. This
> >>>>>> prevents keeping the module in an invalid state, as recommended by the
> >>>>>> hardware team.
> >>>>>>
> >>>>>> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> >>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>>>>> ---
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> - udpated patch description to avoid plural in the configuration
> >>>>>>   sequence description b/w MSTOP and CLK_ON
> >>>>>> - use atomic type to store the usage counter; s/refcnt/usecnt/g
> >>>>>> - moved MSTOP_OFF(), MSTOP_MASK() macros to rzg2l-cpg.c
> >>>>>> - dropped struct mstp_clock::critical and use clk_hw_get_flags()
> >>>>>>   instead to get the clock flags
> >>>>>> - used unsigned int iterators in for loops
> >>>>>> - keep memory allocated for a single list for clocks sharing the
> >>>>>>   same MSTOP by updating the rzg2l_mod_clock_add_shared_mstop_clk();
> >>>>>> - s/rzg2l_cpg_mstop_show/rzg2l_mod_clock_mstop_show/g,
> >>>>>>   s/rzg2l_cpg_mstop/rzg2l_mod_clock_mstop/g,
> >>>>>>   s/rzg2l_cpg_update_shared_mstop_clocks/rzg2l_mod_clock_update_shared_mstop_clks/g
> >>>>>>    to keep the same naming conventions for functions handling mod clock MSTOP
> >>>>>> - use the newly added for_each_mstp_clk() macro all over the code
> >>>>>
> >>>>> Thanks for the update!
> >>>>>
> >>>>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
> >>>>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> >>>>>
> >>>>>> @@ -1209,6 +1232,94 @@ struct mstp_clock {
> >>>>>>                 else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
> >>>>>>                          ((mstp_clk) = to_mod_clock(hw)))
> >>>>>>
> >>>>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
> >>>>>> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
> >>>>>> +                                            bool standby)
> >>>>>> +{
> >>>>>> +       struct rzg2l_cpg_priv *priv = clock->priv;
> >>>>>> +       struct mstop *mstop = clock->mstop;
> >>>>>> +       bool update = false;
> >>>>>> +       u32 value;
> >>>>>> +
> >>>>>> +       if (!mstop)
> >>>>>> +               return;
> >>>>>> +
> >>>>>> +       value = MSTOP_MASK(mstop->conf) << 16;
> >>>>>> +
> >>>>>> +       if (standby) {
> >>>>>> +               unsigned int criticals = 0;
> >>>>>> +
> >>>>>> +               for (unsigned int i = 0; i < clock->num_shared_mstop_clks; i++) {
> >>>>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
> >>>>>> +
> >>>>>> +                       if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
> >>>>>> +                               criticals++;
> >>>>>> +               }
> >>>>>> +
> >>>>>> +               /*
> >>>>>> +                * If this is a shared MSTOP and it is shared with critical clocks,
> >>>>>> +                * and the system boots up with this clock enabled but no driver
> >>>>>> +                * uses it the CCF will disable it (as it is unused). As we don't
> >>>>>> +                * increment reference counter for it at registration (to avoid
> >>>>>> +                * messing with clocks enabled at probe but later used by drivers)
> >>>>>> +                * do not set the MSTOP here too if it is shared with critical
> >>>>>> +                * clocks and ref counted only by those critical clocks.
> >>>>>> +                */
> >>>>>> +               if (criticals && criticals == atomic_read(&mstop->usecnt))
> >>>>>> +                       return;
> >>>>>> +
> >>>>>> +               value |= MSTOP_MASK(mstop->conf);
> >>>>>> +
> >>>>>> +               /* Allow updates on probe when usecnt = 0. */
> >>>>>> +               if (!atomic_read(&mstop->usecnt))
> >>>>>> +                       update = true;
> >>>>>> +               else
> >>>>>> +                       update = atomic_dec_and_test(&mstop->usecnt);
> >>>>>> +       } else {
> >>>>>> +               atomic_inc(&mstop->usecnt);
> >>>>>> +               update = true;
> >>>>>
> >>>>> Shouldn't the update be conditional, i.e.:
> >>>>>
> >>>>>     if (!atomic_read(&mstop->usecnt))
> >>>>>             update = true;
> >>>>>     atomic_inc(&mstop->usecnt);
> >>>>>
> >>>>> ?
> >>>>
> >>>> Indeed, it should be conditional as you suggested.
> >>>>
> >>>>>
> >>>>>> +       }
> >>>>>> +
> >>>>>> +       if (update)
> >>>>>> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
> >>>>>> +}
> >>>>>
> >>>>>> +static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
> >>>>>> +                                                   struct mstp_clock *clock)
> >>>>>> +{
> >>>>>> +       struct mstp_clock *clk;
> >>>>>> +       struct clk_hw *hw;
> >>>>>> +
> >>>>>> +       if (!clock->mstop)
> >>>>>> +               return 0;
> >>>>>> +
> >>>>>> +       for_each_mstp_clk(clk, hw, priv) {
> >>>>>> +               struct mstp_clock **new_clks;
> >>>>>> +               int num_shared_mstop_clks;
> >>>>>> +               bool found = false;
> >>>>>> +
> >>>>>> +               if (clk->mstop != clock->mstop)
> >>>>>> +                       continue;
> >>>>>> +
> >>>>>> +               num_shared_mstop_clks = clk->num_shared_mstop_clks;
> >>>>>> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
> >>>>>> +                       if (clk->shared_mstop_clks[i] == clock) {
> >>>>>> +                               found = true;
> >>>>>> +                               break;
> >>>>>> +                       }
> >>>>>> +               }
> >>>>>> +               if (found)
> >>>>>> +                       continue;
> >>>>>
> >>>>> Can this happen? With your current code, the answer is yes.
> >>>>> But I think this loop and check can be removed...
> >>>>>
> >>>>>> +
> >>>>>> +               if (!num_shared_mstop_clks)
> >>>>>> +                       new_clks = devm_kmalloc_array(priv->dev, 2, sizeof(*new_clks), GFP_KERNEL);
> >>>>>> +               else
> >>>>>> +                       new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
> >>>>>> +                                                (num_shared_mstop_clks + 1) * sizeof(*new_clks),
> >>>>>> +                                                GFP_KERNEL);
> >>>>>> +
> >>>>>> +               if (!new_clks)
> >>>>>> +                       return -ENOMEM;
> >>>>>> +
> >>>>>> +               if (!num_shared_mstop_clks)
> >>>>>> +                       new_clks[num_shared_mstop_clks++] = clk;
> >>>>>> +               if (clk != clock)
> >>>>>
> >>>>> This check is always true
> >>>>
> >>>> If I'm not wrong now, when adding the clock to it's own list, and the list
> >>>> is empty (!num_shared_mstop_clks check above is true), if this condition is
> >>>> missing the clock it will be added twice in its own list.
> >>>
> >>> Sorry, I missed that this function is called _after_ the clock is
> >>> added to priv->clks[].  So one question and comment here:
> >>>   1. Do you need a one-entry array (actual allocation is two entries)
> >>>      for module clocks with an mstop entry that is not shared?
> >>
> >> That extra entry should not be needed. It should not happen to have an
> >> mstop clock in the priv->clks[] array w/o at least a clock in its shared
> >> list. I was wrong in both the initial code and the reply I sent to your
> >> initial comment. Appologies for that.
> >
> > So no single-entry arrays...
>
> Oh, I missread it yesterday everning. Sorry for confusion. Let me try again:
>
> >
> >>>      Perhaps for critical clocks? That could be handled in
>
> The clock is added to its own shared_mstop_clk[] array to avoid extra
> conditions when all the clocks sharing the same mstop need to be checked
> for an action. One example is code at [A] (for critical clocks) that was
> available in v1.
>
>
> >>>      rzg2l_mod_clock_module_set_state(), by explicitly checking
> >>>      the clock's own critical flag if num_shared_mstop_clks is zero.
>
> The clock was added to its own shared_mstop_clk[] array as a result of this
> comment I got from you on v1 (with regards to checking the clock's critical
> flag):
>
> "If clock->shared_mstop_clks[] would include the current clock, then
> (a) this test would not be needed, and
> (b) all clocks sharing the same mstop could share a single
>     clock->shared_mstop_clks[] array."
>
> If I understood correctly, in [1] it has been proposed to have something
> like what is proposed here to avoid extra conditional check (like [A]), in
> rzg2l_mod_clock_module_set_state():
>
> for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {
>     unsigned int
>     struct mstp_clock *clk = clock->shared_mstop_clks[i];
>
>     if (clk->critical)
>         criticals++;
> }
>
> /* Increment if clock is critical, too. */
> if (clock->critical) // <<< [A]
>     criticals++;
>
> Please let me know if I misunderstood your initial request?

You did not misunderstand my initial request.  Until recently, I just
hadn't realized that you still need to check for a critical clock if
the mstop is not shared, sorry for that.

However, I think it is better to just add an extra check

    if (!clock->num_shared_mstop_clks &&
        (clk_hw_get_flags(&clock->hw) & CLK_IS_CRITICAL))
            criticals++;

to rzg2l_mod_clock_module_set_state(), than to allocate single-entry
arrays for each and every clock that does not share the mstop.
Do you agree?

Thanks!

> [1]
> https://lore.kernel.org/all/CAMuHMdXFtBmjDu=1RS2MLNYzhZ0fmpT7+1QbA9p4LvoLHitOuw@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

