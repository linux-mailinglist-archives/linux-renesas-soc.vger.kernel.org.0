Return-Path: <linux-renesas-soc+bounces-17389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF0BAC0E99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6183A8CEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44F1228C5DE;
	Thu, 22 May 2025 14:46:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7044D28C5BA;
	Thu, 22 May 2025 14:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925193; cv=none; b=JbzIaso2EtgISrIoqp1qnYeQ2A775EpYJgL2tFYsVwyTDQ2v4qS4Arl7K9/368y8Y2lnpzNJnrfhsqENqYi8jsURAo1U9rPtkfCeNNdzWjqfjWfzGs3qVXWNhxSovE8ZavbzocGQ9tVC9d2mcLQUT0mCuQZ1eJdkJh5fkwOyrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925193; c=relaxed/simple;
	bh=jGdoBrqHjg13zm4xfYQIo8gzcL1Zl6z3Y34gQKFpIp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qNIfxRjEg4ddKTca4fSxaPxHKE/cVI4QLZJncOcUkCxb3yZsJXDujsZDZk++n/jbRqlYXSdSJ9Xb/KND10gT8fbntVFVo9whlWday0buhkazUhqNuRnD1oQOHV5uS+h/sNsv2kqVpL/8MO8tuaeiQw0jndpbttzemSjcz3JBFv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c54b651310so1165301185a.0;
        Thu, 22 May 2025 07:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925190; x=1748529990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bXYDoFX345xvkUri2FHThUW6JeVcswiD4QsWFASJ7DQ=;
        b=JchAWxEw+TEdVtkRMqXPrLtYQ4qywEpk3px+LPjA88sBoNyPY8TrTS2ZAQIBbqLAQU
         5iEfmdnPDTFELuaoTKbOKwZ+1tUlZ4NGUgwo3o8iB2EyyRyDowRt984srNRf3n52pAdQ
         6srH8e6vVgGLFVMfJXI2vj5WNsQh/lmFyu9w8cdAK1k9xNGD6ZoG961llGYXiRtN9e6R
         8skrsd6RgGwd5K9X21e2xR7T3WorkhhPdW0R2WQA9FCq6pqXePYiJ08MONSEGXo7V4oF
         l6piNqDOLiPDURQ0/jKeeHBBv44juvfYD7Y1AR1QZRvcaEUrVaRbbpZxEtPv4YxX7T11
         XWtw==
X-Forwarded-Encrypted: i=1; AJvYcCUslGyJqjeRPaWrlhJ/Kemnk0xSpb3lj1lANVPampQTROWvUb9SncQzngx5AHC2SZek/RKfmAozEUYN@vger.kernel.org, AJvYcCV5LvFyJVluWzXZGQO1INSmyqO0aOAKX0PZo2fNynXkmhbbm0XQb80xWhHIFg6uQ/jqaNURN4L+Kxn6@vger.kernel.org, AJvYcCVG9EjsQaEGV60EA/VKD+tyobaItfoq9emzGUuJ2bax8pyBvcbuB6XMM5cRXcsyK5tPira22ShYjlgPM88G@vger.kernel.org, AJvYcCVmku+sRN6nPE6GV4dPGSZOHYXXDT9lWiYVKQx4h0IqlHVDyL9Nwv/T/6uYsVGszdEk/p+92khsWis1PBp31XhB9KY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0v/pOWqC+5Cjrlz9k+UzPdGdLmswgvEVT5v1w7C4X8rcsJaGT
	gBw255RMxpuLidPcOmM+VW4LXIUXIfTevg5j298gmmiF9SZV3x4N+0JkH9E8IPIc
X-Gm-Gg: ASbGncsHLAGlyGTgDIsbi2Knf92ibgQJZx4PyYZ9/QMwwGL/GD043sST4I4tW/GFmgV
	jGqs2XR7EaKpPHlAHHSSmlEkt1XAWrJ6ekuhNjEqp6oMn6Ddq8Sk0bA+cBXtrA21yhePQzzOCdW
	G3vcI7+jwYX8Fg2TzfnrmQd5YTj053Ty0m2VDirwzv3QnIfFoV0tjuwZ3EtO8rTpYt5hRWGscuN
	hpBDJm/1smfCN8DUZqlXjoCpgqUygMbHq37dI/axCax+NBz4pPfY57BNJQZsT4EzDIe5N2MCMnf
	Zh7091uQ9DpF47FYvcYnVCmLcbb/hl4Ev+0OkxU/pj6wBcVOInpOHboLyFfDgpH6rikJBjGgXG8
	lPzcvptrCk7iIYhCI8A==
X-Google-Smtp-Source: AGHT+IGo+Jq68JUyvE2pv4otkWu0HrUMSss5nFlpSsUo6+3luMJgIlB7nReYTDFlpXxfuWNZwebtsQ==
X-Received: by 2002:a05:620a:3906:b0:7cd:4409:e58a with SMTP id af79cd13be357-7cd47f1d10dmr3095598885a.17.1747925189695;
        Thu, 22 May 2025 07:46:29 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467dad11sm1030918585a.42.2025.05.22.07.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 07:46:29 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7cad6a4fae4so1280151885a.2;
        Thu, 22 May 2025 07:46:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJaJ4C30DB5MGaWhdoyjRU1ZDZpsKxv21SK2x3ZeJQ2Q7qXnHR3dM/o9xij1Xegnd805nw08e3wpS1fBmJ1yhZHoQ=@vger.kernel.org, AJvYcCVQC8gog5mLXN5q+fROdOHvmz4rA/zh+KDVF04ENi/XzQ98QcVcujNnjyIwKT/H2MOk4Xu7cUI46+TR@vger.kernel.org, AJvYcCWT5RxgpiiYKeEqAi2xKGNhDTc1K3EeUJJMT9AA3X/3nhAj6WEh4100upR0DvVepTip7IxlkK9tQTyWP79C@vger.kernel.org, AJvYcCWoycRFRzduO/YxyTM92+5L5ofD/nk4CJJaJraOBIqT//E3z5ZJktE6pmmFKE7ZOtfghgZEFhFFQdAm@vger.kernel.org
X-Received: by 2002:a05:620a:28c4:b0:7ce:ca97:a6bf with SMTP id
 af79cd13be357-7ceca97a751mr1418236585a.41.1747925189146; Thu, 22 May 2025
 07:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com> <20250514090415.4098534-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250514090415.4098534-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 16:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNrU=XOZr3dKKXQikzCzJ1oUPGQofWFdRX9x6rhYn3XA@mail.gmail.com>
X-Gm-Features: AX0GCFuESfgLh7W8dVPWmidHDnVLxMr4K5FIPtvaMB1sChOdtx4D2qi9YXeHRDM
Message-ID: <CAMuHMdWNrU=XOZr3dKKXQikzCzJ1oUPGQofWFdRX9x6rhYn3XA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Wed, 14 May 2025 at 11:04, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
> module has one or more MSTOP bits associated with it, and these bits need
> to be configured along with the module clocks. Setting the MSTOP bits
> switches the module between normal and standby states.
>
> Previously, MSTOP support was abstracted through power domains
> (struct generic_pm_domain::{power_on, power_off} APIs). With this
> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>
> Previous Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Clear module MSTOP bit
> 2/ Set module CLKON bit
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Clear CLKON bit
> 2/ Set MSTOP bit
>
> However, in some cases (when the clock is disabled through devres), the
> order may have been (due to the issue described in link section):
>
> 1/ Set MSTOP bit
> 2/ Clear CLKON bit
>
> Recently, the hardware team has suggested that the correct order to set
> the MSTOP and CLKON bits is:
>
> Updated Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Set CLKON bit
> 2/ Clear MSTOP bit
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Set MSTOP bit
> 2/ Clear CLKON bit
>
> To prevent future issues due to incorrect ordering, the MSTOP setup has
> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> from the RZ/G3S HW manual, Rev1.10.
>
> Additionally, since multiple clocks of a single module may be mapped to a
> single MSTOP bit, MSTOP setup is reference-counted.
>
> Furthermore, as all modules start in the normal state after reset, if the
> module clocks are disabled, the module state is switched to standby. This
> prevents keeping the module in an invalid state, as recommended by the
> hardware team.
>
> Link: https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - udpated patch description to avoid plural in the configuration
>   sequence description b/w MSTOP and CLK_ON
> - use atomic type to store the usage counter; s/refcnt/usecnt/g
> - moved MSTOP_OFF(), MSTOP_MASK() macros to rzg2l-cpg.c
> - dropped struct mstp_clock::critical and use clk_hw_get_flags()
>   instead to get the clock flags
> - used unsigned int iterators in for loops
> - keep memory allocated for a single list for clocks sharing the
>   same MSTOP by updating the rzg2l_mod_clock_add_shared_mstop_clk();
> - s/rzg2l_cpg_mstop_show/rzg2l_mod_clock_mstop_show/g,
>   s/rzg2l_cpg_mstop/rzg2l_mod_clock_mstop/g,
>   s/rzg2l_cpg_update_shared_mstop_clocks/rzg2l_mod_clock_update_shared_mstop_clks/g
>    to keep the same naming conventions for functions handling mod clock MSTOP
> - use the newly added for_each_mstp_clk() macro all over the code

Thanks for the update!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -1209,6 +1232,94 @@ struct mstp_clock {
>                 else if (((hw) = __clk_get_hw((priv)->clks[(priv)->num_core_clks + i])) && \
>                          ((mstp_clk) = to_mod_clock(hw)))
>
> +/* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
> +static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
> +                                            bool standby)
> +{
> +       struct rzg2l_cpg_priv *priv = clock->priv;
> +       struct mstop *mstop = clock->mstop;
> +       bool update = false;
> +       u32 value;
> +
> +       if (!mstop)
> +               return;
> +
> +       value = MSTOP_MASK(mstop->conf) << 16;
> +
> +       if (standby) {
> +               unsigned int criticals = 0;
> +
> +               for (unsigned int i = 0; i < clock->num_shared_mstop_clks; i++) {
> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
> +
> +                       if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
> +                               criticals++;
> +               }
> +
> +               /*
> +                * If this is a shared MSTOP and it is shared with critical clocks,
> +                * and the system boots up with this clock enabled but no driver
> +                * uses it the CCF will disable it (as it is unused). As we don't
> +                * increment reference counter for it at registration (to avoid
> +                * messing with clocks enabled at probe but later used by drivers)
> +                * do not set the MSTOP here too if it is shared with critical
> +                * clocks and ref counted only by those critical clocks.
> +                */
> +               if (criticals && criticals == atomic_read(&mstop->usecnt))
> +                       return;
> +
> +               value |= MSTOP_MASK(mstop->conf);
> +
> +               /* Allow updates on probe when usecnt = 0. */
> +               if (!atomic_read(&mstop->usecnt))
> +                       update = true;
> +               else
> +                       update = atomic_dec_and_test(&mstop->usecnt);
> +       } else {
> +               atomic_inc(&mstop->usecnt);
> +               update = true;

Shouldn't the update be conditional, i.e.:

    if (!atomic_read(&mstop->usecnt))
            update = true;
    atomic_inc(&mstop->usecnt);

?

> +       }
> +
> +       if (update)
> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
> +}

> +static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
> +                                                   struct mstp_clock *clock)
> +{
> +       struct mstp_clock *clk;
> +       struct clk_hw *hw;
> +
> +       if (!clock->mstop)
> +               return 0;
> +
> +       for_each_mstp_clk(clk, hw, priv) {
> +               struct mstp_clock **new_clks;
> +               int num_shared_mstop_clks;
> +               bool found = false;
> +
> +               if (clk->mstop != clock->mstop)
> +                       continue;
> +
> +               num_shared_mstop_clks = clk->num_shared_mstop_clks;
> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
> +                       if (clk->shared_mstop_clks[i] == clock) {
> +                               found = true;
> +                               break;
> +                       }
> +               }
> +               if (found)
> +                       continue;

Can this happen? With your current code, the answer is yes.
But I think this loop and check can be removed...

> +
> +               if (!num_shared_mstop_clks)
> +                       new_clks = devm_kmalloc_array(priv->dev, 2, sizeof(*new_clks), GFP_KERNEL);
> +               else
> +                       new_clks = devm_krealloc(priv->dev, clk->shared_mstop_clks,
> +                                                (num_shared_mstop_clks + 1) * sizeof(*new_clks),
> +                                                GFP_KERNEL);
> +
> +               if (!new_clks)
> +                       return -ENOMEM;
> +
> +               if (!num_shared_mstop_clks)
> +                       new_clks[num_shared_mstop_clks++] = clk;
> +               if (clk != clock)

This check is always true

> +                       new_clks[num_shared_mstop_clks++] = clock;
> +
> +               for (unsigned int i = 0; i < num_shared_mstop_clks; i++) {
> +                       new_clks[i]->shared_mstop_clks = new_clks;
> +                       new_clks[i]->num_shared_mstop_clks = num_shared_mstop_clks;
> +               }

... by adding a "break" here.  The loop above has already updated the
shared_mstop_clks[] arrays for all clocks sharing the same mstop value.

> +       }
> +
> +       return 0;
> +}

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

