Return-Path: <linux-renesas-soc+bounces-17518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A81AC4344
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 19:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECA93AD5BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 17:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB8923D288;
	Mon, 26 May 2025 17:09:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CDD1FAC50;
	Mon, 26 May 2025 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748279368; cv=none; b=V1fdMA7OcG50kh2Jo/aubO6EH+JR6nlx3HnHBLBp3fGLakjty/5MbA3P9pWv7X7qZLeQITxNMQV1xd1rloofX1DahWi3ZgqAGliW73acxepMsv7vZShYvKJnIpRuSWmIdHvDPjYMCnLntV8CdVdBlw6tH5/0ZjQjZkgDpydieAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748279368; c=relaxed/simple;
	bh=NgjikTgLT3ncgvHbQDeRkIwkScl4z9dA/879hmvw4B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VR3Hf1iZjgmVLoWiGrmPLz1N6ECYY71UlhdtluxRl09T35sSFktemrvSoImJuydv3nlmuQeoNXTetUkf+tEV/GlWuAJXBnU5PugfTCEV42qW52kJ2vpJ58XOwQEQa6dAPLz6b0eFJxMI36oXerqOgR/GoaAaGuIXUGz7r8o3lCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6faacf5d5adso8370856d6.1;
        Mon, 26 May 2025 10:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748279364; x=1748884164;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXXRrkCVRWGC+UUPwRbKc1NSP6ircYN35Brf2nSLerQ=;
        b=TCtU7DJjqicwZC84NF1DF4RhRG5nCF061nGx3Y/I0+zhseYsUTRK7F7okt1SjK0T86
         UyjljMd2eXpHA/Kcq0BZFtdTlg3zir9kOnO++jiv3D/gav5P5QQk3Ubov+bb2uzZl3wj
         oJZXQHLC8kTXp7KgezT4L8FIpTsJzK57iJgpd/WG1ZjVr89a8zQlZCzFhrsyqEdlzMUI
         Gel2xvbIpcQxgG20G2sooYtvI0mUJi2ziD7jV785nkp9q8p06axjSSO5QN3Hu2IPTJS3
         SIQITsDvLn20yg8t8yIW5kIZUOv5cx1Nkm5cQFzxDYPCkJ2fc0gC+mQLL5vYSjwiVhgm
         Kotg==
X-Forwarded-Encrypted: i=1; AJvYcCUNPkEadsjgweqotacPArC7rUB0/3CAhl9kdIv2ZcvF/hdaAeVvWj/wO53zgc8YAbCC7+6QBxpB7eh6@vger.kernel.org, AJvYcCUX0OwsaZDhEV/Q4+qx+23PRPut9DPvr4zlymz7T+7f1DWv0obiTwOEmbaG9DLnC4Y+CYDul4Hqh/xsxgJe@vger.kernel.org, AJvYcCUezMkQcT/Qzm+iwCoiBkkrGCkVKbGN+2zjrzO7cPMsMJxLpsE4BhWT9svvcOZ2V0tmoCNx/cJsGq+zZ7g06bD74hw=@vger.kernel.org, AJvYcCUwv1f6U35YJzhRYLLcxHEpwpOCQzyGPWixHYZU2LsEOZivtLqTtyl1FpAiXkBw8WKxaf1vn2VmuYHs@vger.kernel.org
X-Gm-Message-State: AOJu0YxENnBunuvvl442pMyXkh+ffFky6cuOgZ1i5Yc8lL1Yzx3+9hei
	1LBlnaaZ2Ca7DT65CzgJkGTYotfrQ5/XWm/45HLWeZskqsOonnVQ95J26Wfw+F9j
X-Gm-Gg: ASbGnctfDMGilMr4prICqe6cJZk0iNxkPenwfrpArfYYTyiMjszz4Bu/O88hPEpw/Vn
	BbYLEgZY8+2wnzUbl7SYrFsvTtzktdT0nBIzIVNIpXsIgx7nDGvetjJK8k/j8x9DhycwkDnO/ZP
	CehVYA6SliQkOrbGZWQvGS8QajfAF5PJlQl2YWjPKFtq+55SfTrt8xWsfMBry7lYAtUSrV1Crwf
	XQvIVlUNPffBolwV1VBPzLa/AMh6qWJ98Xuj2EL64jsmeQDFS/0qZFxlz61rNFOJyTM6Rlx81yl
	g3Di6xYr4Z3HUw0SfS230/JEmM5MtdlpN8+WlTzvNZLJ5Jxrt0LW7F4HQBJ525pmdUHnOylnygO
	4ScyMASE3w5APUu071Q==
X-Google-Smtp-Source: AGHT+IHcQ7MinvAnC6kpy89cvhJT+mll+slDxsosk5lrB1ZrrxVhLN+U7KkOUpFfHCVMCq/Z+ZgX7A==
X-Received: by 2002:a05:6214:1c4e:b0:6f4:b265:261 with SMTP id 6a1803df08f44-6fa9cfd29c8mr174833586d6.8.1748279363400;
        Mon, 26 May 2025 10:09:23 -0700 (PDT)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa317b3c0sm28226426d6.15.2025.05.26.10.09.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 10:09:23 -0700 (PDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c55500d08cso221467285a.0;
        Mon, 26 May 2025 10:09:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUi9SjUV4YHhJ4ZR0wDXrBCEawBr7mflNylijAgDGcVBVc6GbOiV0UD78ZyQEOuvHnWz04X1+CkEYR@vger.kernel.org, AJvYcCVqPpaQKR7kDQCteQtK740N6R9Cy9JA7laaQRu0LXy8ISeRZflVGDdpXays3jIE8g2S3BlK2muBSZz97MIQ@vger.kernel.org, AJvYcCVtbmcyBcuBTzzQfwefWG0kp8l3dHX93BNcwD1WjjNV5KnQWTQenpSelqOlgeCNiejvpw/UaNUbhC1o@vger.kernel.org, AJvYcCXVerYSihf+KDpMi8KtMSmIGISjQjfOqoZjOeul9+MjNuxeVh4V6VsY8+Svj5D9Nul3rCsV6f9BXZh8sgsSYqj/QsI=@vger.kernel.org
X-Received: by 2002:a05:620a:2617:b0:7c7:a537:7ce2 with SMTP id
 af79cd13be357-7ceecbe6019mr1427790485a.32.1748279362789; Mon, 26 May 2025
 10:09:22 -0700 (PDT)
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
 <87a923c1-c996-4769-86bd-b28b42574c3a@tuxon.dev>
In-Reply-To: <87a923c1-c996-4769-86bd-b28b42574c3a@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 May 2025 19:09:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWr=ZHiMQ4bREu_crpuE_M3Wp4JLNEKMqd_4NT1tcTfZg@mail.gmail.com>
X-Gm-Features: AX0GCFsWx8SnGMOgAVNiu3OhCH22ETF7HVsKqGDfKSLpUG9ITV5S1whXv7iRYKA
Message-ID: <CAMuHMdWr=ZHiMQ4bREu_crpuE_M3Wp4JLNEKMqd_4NT1tcTfZg@mail.gmail.com>
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

On Mon, 26 May 2025 at 17:55, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 26.05.2025 16:33, Geert Uytterhoeven wrote:
> > On Fri, 23 May 2025 at 09:41, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> >> On 22.05.2025 17:46, Geert Uytterhoeven wrote:
> >>> On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
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
> >>>> 1/ Clear module MSTOP bit
> >>>> 2/ Set module CLKON bit
> >>>>
> >>>> B/ Switching to Standby State (e.g., during remove):
> >>>> 1/ Clear CLKON bit
> >>>> 2/ Set MSTOP bit
> >>>>
> >>>> However, in some cases (when the clock is disabled through devres), the
> >>>> order may have been (due to the issue described in link section):
> >>>>
> >>>> 1/ Set MSTOP bit
> >>>> 2/ Clear CLKON bit
> >>>>
> >>>> Recently, the hardware team has suggested that the correct order to set
> >>>> the MSTOP and CLKON bits is:
> >>>>
> >>>> Updated Order:
> >>>> A/ Switching to Normal State (e.g., during probe):
> >>>> 1/ Set CLKON bit
> >>>> 2/ Clear MSTOP bit
> >>>>
> >>>> B/ Switching to Standby State (e.g., during remove):
> >>>> 1/ Set MSTOP bit
> >>>> 2/ Clear CLKON bit
> >>>>
> >>>> To prevent future issues due to incorrect ordering, the MSTOP setup has
> >>>> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> >>>> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> >>>> from the RZ/G3S HW manual, Rev1.10.
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
> >>>> ---
> >>>>
> >>>> Changes in v2:
> >>>> - udpated patch description to avoid plural in the configuration
> >>>>   sequence description b/w MSTOP and CLK_ON
> >>>> - use atomic type to store the usage counter; s/refcnt/usecnt/g
> >>>> - moved MSTOP_OFF(), MSTOP_MASK() macros to rzg2l-cpg.c
> >>>> - dropped struct mstp_clock::critical and use clk_hw_get_flags()
> >>>>   instead to get the clock flags
> >>>> - used unsigned int iterators in for loops
> >>>> - keep memory allocated for a single list for clocks sharing the
> >>>>   same MSTOP by updating the rzg2l_mod_clock_add_shared_mstop_clk();
> >>>> - s/rzg2l_cpg_mstop_show/rzg2l_mod_clock_mstop_show/g,
> >>>>   s/rzg2l_cpg_mstop/rzg2l_mod_clock_mstop/g,
> >>>>   s/rzg2l_cpg_update_shared_mstop_clocks/rzg2l_mod_clock_update_shared_mstop_clks/g
> >>>>    to keep the same naming conventions for functions handling mod clock MSTOP
> >>>> - use the newly added for_each_mstp_clk() macro all over the code
> >>>
> >>> Thanks for the update!
> >>>
> >>>> --- a/drivers/clk/renesas/rzg2l-cpg.c
> >>>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> >>>
> >>>> @@ -1209,6 +1232,94 @@ struct mstp_clock {
> >>>>                 else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
> >>>>                          ((mstp_clk) = to_mod_clock(hw)))
> >>>>
> >>>> +/* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
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
> >>>> +               for (unsigned int i = 0; i < clock->num_shared_mstop_clks; i++) {
> >>>> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
> >>>> +
> >>>> +                       if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
> >>>> +                               criticals++;
> >>>> +               }
> >>>> +
> >>>> +               /*
> >>>> +                * If this is a shared MSTOP and it is shared with critical clocks,
> >>>> +                * and the system boots up with this clock enabled but no driver
> >>>> +                * uses it the CCF will disable it (as it is unused). As we don't
> >>>> +                * increment reference counter for it at registration (to avoid
> >>>> +                * messing with clocks enabled at probe but later used by drivers)
> >>>> +                * do not set the MSTOP here too if it is shared with critical
> >>>> +                * clocks and ref counted only by those critical clocks.
> >>>> +                */
> >>>> +               if (criticals && criticals == atomic_read(&mstop->usecnt))
> >>>> +                       return;
> >>>> +
> >>>> +               value |= MSTOP_MASK(mstop->conf);
> >>>> +
> >>>> +               /* Allow updates on probe when usecnt = 0. */
> >>>> +               if (!atomic_read(&mstop->usecnt))
> >>>> +                       update = true;
> >>>> +               else
> >>>> +                       update = atomic_dec_and_test(&mstop->usecnt);
> >>>> +       } else {
> >>>> +               atomic_inc(&mstop->usecnt);
> >>>> +               update = true;
> >>>
> >>> Shouldn't the update be conditional, i.e.:
> >>>
> >>>     if (!atomic_read(&mstop->usecnt))
> >>>             update = true;
> >>>     atomic_inc(&mstop->usecnt);
> >>>
> >>> ?
> >>
> >> Indeed, it should be conditional as you suggested.
> >>
> >>>
> >>>> +       }
> >>>> +
> >>>> +       if (update)
> >>>> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
> >>>> +}
> >>>
> >>>> +static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
> >>>> +                                                   struct mstp_clock *clock)
> >>>> +{
> >>>> +       struct mstp_clock *clk;
> >>>> +       struct clk_hw *hw;
> >>>> +
> >>>> +       if (!clock->mstop)
> >>>> +               return 0;
> >>>> +
> >>>> +       for_each_mstp_clk(clk, hw, priv) {
> >>>> +               struct mstp_clock **new_clks;
> >>>> +               int num_shared_mstop_clks;
> >>>> +               bool found = false;
> >>>> +
> >>>> +               if (clk->mstop != clock->mstop)
> >>>> +                       continue;
> >>>> +
> >>>> +               num_shared_mstop_clks = clk->num_shared_mstop_clks;
> >>>> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
> >>>> +                       if (clk->shared_mstop_clks[i] == clock) {
> >>>> +                               found = true;
> >>>> +                               break;
> >>>> +                       }
> >>>> +               }
> >>>> +               if (found)
> >>>> +                       continue;
> >>>
> >>> Can this happen? With your current code, the answer is yes.
> >>> But I think this loop and check can be removed...
> >>>
> >>>> +
> >>>> +               if (!num_shared_mstop_clks)
> >>>> +                       new_clks = devm_kmalloc_array(priv->dev, 2, sizeof(*new_clks), GFP_KERNEL);
> >>>> +               else
> >>>> +                       new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
> >>>> +                                                (num_shared_mstop_clks + 1) * sizeof(*new_clks),
> >>>> +                                                GFP_KERNEL);
> >>>> +
> >>>> +               if (!new_clks)
> >>>> +                       return -ENOMEM;
> >>>> +
> >>>> +               if (!num_shared_mstop_clks)
> >>>> +                       new_clks[num_shared_mstop_clks++] = clk;
> >>>> +               if (clk != clock)
> >>>
> >>> This check is always true
> >>
> >> If I'm not wrong now, when adding the clock to it's own list, and the list
> >> is empty (!num_shared_mstop_clks check above is true), if this condition is
> >> missing the clock it will be added twice in its own list.
> >
> > Sorry, I missed that this function is called _after_ the clock is
> > added to priv->clks[].  So one question and comment here:
> >   1. Do you need a one-entry array (actual allocation is two entries)
> >      for module clocks with an mstop entry that is not shared?
>
> That extra entry should not be needed. It should not happen to have an
> mstop clock in the priv->clks[] array w/o at least a clock in its shared
> list. I was wrong in both the initial code and the reply I sent to your
> initial comment. Appologies for that.

So no single-entry arrays...

> >      Perhaps for critical clocks? That could be handled in
> >      rzg2l_mod_clock_module_set_state(), by explicitly checking
> >      the clock's own critical flag if num_shared_mstop_clks is zero.
> >
> >   2. If rzg2l_mod_clock_update_shared_mstop_clks() would be called
> >      _before_ the clock is added to priv->clks[], the clk != clock
> >      check would not be needed.
>
> Yes, you're right. Running rzg2l_mod_clock_update_shard_mstop_clks() before
> the priv->clks[] is updated simplifies the logic (see below).
>
> >
> >>>> +                       new_clks[num_shared_mstop_clks++] = clock;
> >>>> +
> >>>> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
> >>>> +                       new_clks[i]->shared_mstop_clks = new_clks;
> >>>> +                       new_clks[i]->num_shared_mstop_clks = num_shared_mstop_clks;
> >>>> +               }
> >>>
> >>> ... by adding a "break" here.  The loop above has already updated the
> >>> shared_mstop_clks[] arrays for all clocks sharing the same mstop value.
> >>
> >> It may happen that the entries in the module clock array provided by the
> >> SoC specific drivers to not be sorted by module clock ID. That's the case
> >> with RZ/G2L IA55 clocks (from r9a07g044-cpg.c):
> >>
> >> static const struct {
> >>         struct rzg2l_mod_clk common[79];
> >> #ifdef CONFIG_CLK_R9A07G054
> >>         struct rzg2l_mod_clk drp[5];
> >> #endif
> >> } mod_clks = {
> >>   .common = {
> >>     // ...
> >>
> >>     DEF_MOD("ia55_pclk", R9A07G044_IA55_PCLK, R9A07G044_CLK_P2,
> >>                          0x518, 0, MSTOP(BUS_PERI_CPU, BIT(13))),
> >>     DEF_MOD("ia55_clk", R9A07G044_IA55_CLK, R9A07G044_CLK_P1,
> >>                          0x518, 1, MSTOP(BUS_PERI_CPU, BIT(13))),
> >>
> >>     // ...
> >> };
> >>
> >> Where IDs are defined as:
> >>
> >> #define R9A07G044_IA55_CLK     8
> >> #define R9A07G044_IA55_PCLK    9
> >>
> >> These clocks share the same MSTOP bit.
> >>
> >> Because the ia55_pclk is the 1st clock registered (index 9) it will be
> >> added to priv->clks[base + 9].
> >>
> >> Next registered clock will be for ia55_clk, with index 8, it will be added
> >> to priv->clks[base + 8].
> >>
> >> for_each_mstp_clk() loops on clocks from priv->clks[] array. If a break
> >> will be done at the end of the for_each_mstp_clk() loop, at the end of the
> >> registration each of these clocks will have on it's shared_mstop_clks[]
> >> only references to itself.
> >
> > If rzg2l_mod_clock_update_shared_mstop_clks() would be called _before_
> > the clock is added to priv->clks[], this issue could not happen, right?
>
> That's true. With the above update this is not happen:
>
> static int
> rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
>                                          struct mstp_clock *clock)
> {
>     struct mstp_clock *clk;
>     struct clk_hw *hw;
>
>     if (!clock->mstop)
>         return 0;
>
>     for_each_mstp_clk(clk, hw, priv) {
>         struct mstp_clock **new_clks;
>         int num_shared_mstop_clks;
>         bool found = false;
>
>         if (clk->mstop != clock->mstop)
>             continue;
>
>         num_shared_mstop_clks = clk->num_shared_mstop_clks;
>         new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
>                                  (num_shared_mstop_clks + 1) *
>                                   sizeof(*new_clks),
>                                  GFP_KERNEL);
>         if (!new_clks)
>             return -ENOMEM;
>
>         new_clks[num_shared_mstop_clks++] = clock;
>
>         for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
>             new_clks[i]->shared_mstop_clks = new_clks;
>             new_clks[i]->num_shared_mstop_clks = num_shared_mstop_clks;
>         }
>         break;
>     }
>
>     if (clock->num_shared_mstop_clks)
>         return 0;
>
>     clock->shared_mstop_clks = devm_kzalloc(priv->dev,
>                                        sizeof(*clock->shared_mstop_clks),
>                                        GFP_KERNEL);
>     if (!clock->shared_mstop_clks)
>         return -ENOMEM;
>
>     clock->shared_mstop_clks[0] = clock;
>     clock->num_shared_mstop_clks = 1;

... but here you still create a single-entry array?

>
>     return 0;
> }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

