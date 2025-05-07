Return-Path: <linux-renesas-soc+bounces-16762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE34AAE529
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF795234DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 15:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCCF28B4F5;
	Wed,  7 May 2025 15:43:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FF28A1F7;
	Wed,  7 May 2025 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632596; cv=none; b=D7KNVbijO3KBZ5sf0wivPgymoN0BxJ11baMmBMSSDVpqJeyQL9r41/EeEon0QiRyZ9v99vR7eb25r4pfBEkvUjyIoi37kQhOYETHg0pJN25PwhvR/IzzAPKhTGOwHuWm+OXkdey+XpimqZulfumhrDAuxrCIWTnkHNSEcH/EJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632596; c=relaxed/simple;
	bh=aZZgChc/FKvYXXlHjSui+eIyfNDq535bqcUY5JsUo9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlsWASgBEgVfuLFmQve5cKWV+849NNhcLU8iLGI/zwIJWOdR9e8wvCo/hF1W7ckOhVWfeHXdmfEz86ORgLR+YUtxFt9JhOt/dfeVpn+TSRodViv+HtYXTiKX9JfKuLamM+bpbKVDIP2XxG7RKAGdjOoUnDVjdIGLhHKUZzintRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4c308e7b84fso1947653137.1;
        Wed, 07 May 2025 08:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632590; x=1747237390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUMxr+2lhks/u8B0iQOEHdfcEOV4y8jBHGLzw8o1uJE=;
        b=oCQsT/oEXM+pV3jVhLdVNyt9JFIgWuQBYyufrtXKCeooelB8oaC/EFEw11JhNJjI/e
         X6iWOUZnaLOAGcrYQ9CEthv3eO6sFQ2zUYSnyGAyydvd1kKX6m9Sv8IToBt/XMLFjyTu
         kw2aLO5Cf4nybuERKHa/tGOfJ9VTmGWkiYnSz6bSpWzy7v62Mi/8D8ddRGTdZnK3BWCr
         zS0k5OLoTq9/kO6BlCPeohokNjFSGUvq31A6CB/Dd/qY7na0iDn/RHvVVPCOIIQsll/V
         ztIwcJopVMB8K3CGcAxTALm6f/OE9PaEui0iwh2lD5mkR+qusPwyuscC7EUXCgnJvvI0
         GRSA==
X-Forwarded-Encrypted: i=1; AJvYcCVkmdVreHL1AwsMgpxnXupVbIJ0ZTJ4WfhOz2IBji60+N4A6G2Wi4X4Fx/qgMDtJivdqL9jmLk7L00A@vger.kernel.org, AJvYcCWIz1iwAQ0FFsybEOYVONz/ZIlDx9Crrgr1rWRmJaXWPYfbmCEyHj6/sb2wEKm49jIN0myKXe/FLmIraZco@vger.kernel.org, AJvYcCWKQQ1iWu7ZugZUN6kAzGMCYhyAKnT3P8F7QMVRuQvaeSqkLSSQigJ1EQq+Kd+nHzbAsvbf92Avcj85MDDG+6H5XMk=@vger.kernel.org, AJvYcCXVIi+YP1WYfMl2fKOgF28XKBvSlfg44CnpudFvlxOiAgiwllsiCH+c/naLIcXaDNluNFqZk2TndZty@vger.kernel.org
X-Gm-Message-State: AOJu0YzFhPn5+iaIs7OaMi6ZaBR712GzMc4vDUG0qaKKzIe/KjwhInMz
	oboZTt9lyz6BIC9hsR2L4uDNsUXrkOmY3DjgFq0+woAO2lQpk0ksNhWliA67
X-Gm-Gg: ASbGncv376Q2GcqXmaH2OBmRpbb7j+6BWU4scu/S79Rx2fLs0FGuSFsOBtkfIGVv8Ho
	GOqF+W3jg0YRTHYe29K0/yguyY93xWVnmX4Zpqehl09lywC4WR+ACel3PDOYX3cNyOd8Gj5QCnq
	sn+YozGK5hGrRlAQGr9ZVi8OjN+UvaPWdswM2zE+UFTILXS4Z7DQhur9XwdjCL4FpYMGTSExrkH
	vnG1aq3oLSgcdGKnb4j/Lowztd3iTHaAghmVfolChiK4GUboKYw0CpKWCMro1NGaVygCKcb1tvU
	Kve+F3a7ipWEstBQTpB7a79UAP84jQM/57pCJl4Ub5smHw0k0tGyPyJxA7Dv91jnKoYAUWL9s5Z
	S44w=
X-Google-Smtp-Source: AGHT+IHcHM2TP9wAeSNlphfIUf53SSW/uU8sgvd51TSwwCAEqDGyELRvRbzKoFHDFW0Mogp7XF7uyQ==
X-Received: by 2002:a05:6102:5047:b0:4da:e631:a472 with SMTP id ada2fe7eead31-4dc7388534bmr2813460137.20.1746632590231;
        Wed, 07 May 2025 08:43:10 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b09be5bsm2026724241.22.2025.05.07.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:43:09 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-878af63c5eeso2117241.3;
        Wed, 07 May 2025 08:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfl7Jh/b5DfHhgb7EVDxxZ0N1JCzaRbM6XHPFjKCv5T/dnm6+Nj0mzr3wuBSvPpc7asLSDAVzZw0h1@vger.kernel.org, AJvYcCVcLgl2aop6jKz1BcMhogCq6J49M8VAminUaniKYosB29JO3DbX2MhzjeUaelYtz/BYKjaFm5n/1rrG@vger.kernel.org, AJvYcCWxn6iWZ/mloWRtkty1wEryT5Nm5hh9NQbStI+fizTE/sPDQsO+t2+65dOoxnEJWYlPU7SwyDIP4pKBVjz02cvsxkc=@vger.kernel.org, AJvYcCXVT32HIOXO3uBXRYKtlv9rDVCwsbaIIoI7mZVCDqg8dJY2MJsLG3yVTaPBGnq0WbbrcAXIG+tlvmcQrQDW@vger.kernel.org
X-Received: by 2002:a05:6102:4a87:b0:4c1:9d9b:54b8 with SMTP id
 ada2fe7eead31-4dc73798060mr3795860137.2.1746632589040; Wed, 07 May 2025
 08:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 17:42:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
X-Gm-Features: ATxdqUEuQDtMusDU2rItVZZnlMlFUXqW2XUV92GuKBAh0sE3-lMcm24r1i5N0jI
Message-ID: <CAMuHMdUv6+KFuobDzzmKFOH6PvwU0RFzd1M9WrEZ-yzESBahkw@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
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
> 1/ Clear module MSTOP bits
> 2/ Set module CLKON bits
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Clear CLKON bits
> 2/ Set MSTOP bits
>
> However, in some cases (when the clock is disabled through devres), the
> order may have been (due to the issue described in link section):
>
> 1/ Set MSTOP bits
> 2/ Clear CLKON bits
>
> Recently, the hardware team has suggested that the correct order to set
> the MSTOP and CLKON bits is:
>
> Updated Order:
> A/ Switching to Normal State (e.g., during probe):
> 1/ Set CLKON bits
> 2/ Clear MSTOP bits
>
> B/ Switching to Standby State (e.g., during remove):
> 1/ Set MSTOP bits
> 2/ Clear CLKON bits
>
> To prevent future issues due to incorrect ordering, the MSTOP setup has
> now been implemented in rzg2l_mod_clock_endisable(), ensuring compliance
> with the sequence suggested in Figure 41.5: Module Standby Mode Procedure
> from the RZ/G3S HW manual.
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

Thanks for your patch!

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -1180,27 +1183,147 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
>                 core->name, PTR_ERR(clk));
>  }
>
> +/**
> + * struct mstop - MSTOP specific data structure
> + * @refcnt: reference counter for MSTOP settings (when zero the settings
> + *          are applied to register)
> + * @conf: MSTOP configuration (register offset, setup bits)
> + */
> +struct mstop {
> +       refcount_t refcnt;
> +       u32 conf;
> +};
> +
>  /**
>   * struct mstp_clock - MSTP gating clock
>   *
>   * @priv: CPG/MSTP private data
>   * @sibling: pointer to the other coupled clock
> + * @mstop: MSTOP configuration
> + * @shared_mstop_clks: clocks sharing the MSTOP with this clock
>   * @hw: handle between common and hardware-specific interfaces
>   * @off: register offset
>   * @bit: ON/MON bit
> + * @num_shared_mstop_clks: number of the clocks sharing MSTOP with this clock
>   * @enabled: soft state of the clock, if it is coupled with another clock
> + * @critical: specifies if this clock is critical
>   */
>  struct mstp_clock {
>         struct rzg2l_cpg_priv *priv;
>         struct mstp_clock *sibling;
> +       struct mstop *mstop;
> +       struct mstp_clock **shared_mstop_clks;
>         struct clk_hw hw;
>         u16 off;
>         u8 bit;
> +       u8 num_shared_mstop_clks;
>         bool enabled;
> +       bool critical;

I think you can do without this flag, and use
"clk_hw_get_flags(&mstp_clock.hw) & CLK_IS_CRITICAL" instead.

>  };
>
>  #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
>
> +/* Need to be called with a lock held to avoid concurrent access to mstop->refcnt. */
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
> +               for (u8 i = 0; i < clock->num_shared_mstop_clks; i++) {

unsigned int

> +                       struct mstp_clock *clk = clock->shared_mstop_clks[i];
> +
> +                       if (clk->critical)
> +                               criticals++;
> +               }
> +
> +               /* Increment if clock is critical, too. */
> +               if (clock->critical)
> +                       criticals++;

If clock->shared_mstop_clks[] would include the current clock, then
(a) this test would not be needed, and
(b) all clocks sharing the same mstop could share a single
    clock->shared_mstop_clks[] array.

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
> +               if (criticals && criticals == refcount_read(&mstop->refcnt))
> +                       return;
> +
> +               value |= MSTOP_MASK(mstop->conf);
> +
> +               /* Allow updates on probe when refcnt = 0. */
> +               if (!refcount_read(&mstop->refcnt))
> +                       update = true;
> +               else
> +                       update = refcount_dec_and_test(&mstop->refcnt);
> +       } else {
> +               if (!refcount_read(&mstop->refcnt)) {
> +                       refcount_set(&mstop->refcnt, 1);
> +                       update = true;
> +               } else {
> +                       refcount_inc(&mstop->refcnt);
> +               }

I think if you would replace the refcount_t by an atomic_t, you could
use atomic_inc() unconditionally, cfr. rzv2h-cpg.c.

> +       }
> +
> +       if (update)
> +               writel(value, priv->base + MSTOP_OFF(mstop->conf));
> +}
> +
> +static int rzg2l_cpg_mstop_show(struct seq_file *s, void *what)
> +{
> +       struct rzg2l_cpg_priv *priv = s->private;
> +
> +       seq_printf(s, "%-20s %-5s %-10s\n", "", "", "MSTOP");
> +       seq_printf(s, "%-20s %-5s %-10s\n", "", "clk", "-------------------------");
> +       seq_printf(s, "%-20s %-5s %-5s %-5s %-6s %-6s\n",
> +                  "clk_name", "cnt", "cnt", "off", "val", "shared");
> +       seq_printf(s, "%-20s %-5s %-5s %-5s %-6s %-6s\n",
> +                  "--------", "-----", "-----", "-----", "------", "------");
> +
> +       for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
> +               struct mstp_clock *clk;
> +               struct clk_hw *hw;
> +               u32 val;
> +
> +               if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
> +                       continue;
> +
> +               hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> +               clk = to_mod_clock(hw);

As this patch adds four more loops iterating over all module clocks
and skipping empty entries, I think it is worthwhile to introduce a
custom for_each_mstp_clock()-iterator.

> +               if (!clk || !clk->mstop)

Can !clk happen? None of the other loops check for that.

> +                       continue;
> +
> +               val = readl(priv->base + MSTOP_OFF(clk->mstop->conf)) &
> +                     MSTOP_MASK(clk->mstop->conf);
> +
> +               seq_printf(s, "%-20s %-5d %-5d 0x%-3lx 0x%-4x ", clk_hw_get_name(hw),

Please drop the trailing space in the format...

> +                          __clk_get_enable_count(hw->clk), refcount_read(&clk->mstop->refcnt),
> +                          MSTOP_OFF(clk->mstop->conf), val);
> +
> +               for (unsigned int i = 0; i < clk->num_shared_mstop_clks; i++)
> +                       seq_printf(s, "%pC ", clk->shared_mstop_clks[i]->hw.clk);

... add add it here, by changing this format to " %pC".

> +
> +               seq_puts(s, "\n");
> +       }
> +
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rzg2l_cpg_mstop);
> +
>  static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>  {
>         struct mstp_clock *clock = to_mod_clock(hw);

> +
> +static int rzg2l_cpg_add_shared_mstop_clock(struct device *dev,
> +                                           struct mstp_clock *target,
> +                                           struct mstp_clock *added)
> +{
> +       for (u8 i = 0; i < target->num_shared_mstop_clks; i++) {

unsigned int

> +               if (target->shared_mstop_clks[i] == added)
> +                       return 0;
> +       }
> +
> +       target->shared_mstop_clks = devm_krealloc(dev, target->shared_mstop_clks,
> +                                                 sizeof(*target->shared_mstop_clks) *
> +                                                 (target->num_shared_mstop_clks + 1),
> +                                                 GFP_KERNEL);
> +       if (!target->shared_mstop_clks)
> +               return -ENOMEM;
> +
> +       target->shared_mstop_clks[target->num_shared_mstop_clks++] = added;
> +
> +       return 0;
> +}
> +
> +static int rzg2l_cpg_update_shared_mstop_clocks(struct rzg2l_cpg_priv *priv,
> +                                               struct mstp_clock *clock)
> +{
> +       if (!clock->mstop)
> +               return 0;
> +
> +       for (unsigned int i = 0; i < priv->num_mod_clks; i++) {
> +               struct mstp_clock *clk;
> +               struct clk_hw *hw;
> +               int ret;
> +
> +               if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
> +                       continue;
> +
> +               hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
> +               clk = to_mod_clock(hw);
> +               if (clk == clock)
> +                       continue;
> +
> +               if (!clk->mstop || clk->mstop != clock->mstop)

The first test is not needed, as clock->mstop is always non-zero here.

> +                       continue;
> +
> +               ret = rzg2l_cpg_add_shared_mstop_clock(priv->dev, clock, clk);
> +               if (ret)
> +                       return ret;
> +
> +               ret = rzg2l_cpg_add_shared_mstop_clock(priv->dev, clk, clock);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static void __init
>  rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>                            const struct rzg2l_cpg_info *info,

> @@ -1406,6 +1655,12 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>                 }
>         }
>
> +       ret = rzg2l_cpg_update_shared_mstop_clocks(priv, clock);
> +       if (ret) {
> +               clk = ERR_PTR(ret);
> +               goto fail;
> +       }
> +
>         return;
>
>  fail:
> @@ -1877,6 +2132,13 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
>         for (i = 0; i < info->num_mod_clks; i++)
>                 rzg2l_cpg_register_mod_clk(&info->mod_clks[i], info, priv);
>
> +       /*
> +        * Initialize MSTOP after all the clocks were registered to avoid
> +        * invalid reference counting when multiple clocks (critical,
> +        * non-critical) shares the same MSTOP.

share

> +        */
> +       rzg2l_mod_clock_init_mstop(priv);
> +
>         error = of_clk_add_provider(np, rzg2l_cpg_clk_src_twocell_get, priv);
>         if (error)
>                 return error;

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -82,6 +82,10 @@
>  #define SEL_PLL6_2     SEL_PLL_PACK(CPG_PL6_ETH_SSEL, 0, 1)
>  #define SEL_GPU2       SEL_PLL_PACK(CPG_PL6_SSEL, 12, 1)
>
> +#define MSTOP(name, bitmask)   ((CPG_##name##_MSTOP) << 16 | (bitmask))
> +#define MSTOP_OFF(conf)                FIELD_GET(GENMASK(31, 16), (conf))
> +#define MSTOP_MASK(conf)       FIELD_GET(GENMASK(15, 0), (conf))

The last two definitions are only used in rzg2l-cpg.c, so they can be
moved there.

> +
>  #define EXTAL_FREQ_IN_MEGA_HZ  (24)
>
>  /**

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

