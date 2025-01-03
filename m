Return-Path: <linux-renesas-soc+bounces-11823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF45A00C87
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 18:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6DA18848A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 17:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA2C1F9F74;
	Fri,  3 Jan 2025 17:06:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E546B5;
	Fri,  3 Jan 2025 17:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735923983; cv=none; b=QedHRuAm92Tmk0rp2e4VaVysio19s1g27FZTaiA8Ztkk1fj2Jwa/9V/WMDmOYZt6kSH4vLDZkTrkYhuaHKJHhSgH5x4ZIFT8WIC6ht8By7xlZf9h/duC3com05M3yOhuKUZq+aZM0L60LYAV4m2o+i6qfpJo12KjZA7ujXPl7Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735923983; c=relaxed/simple;
	bh=w03Ogn19Y27aZB1oczXSy5K3Nf7ApeClkKeUvWUigmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uyeujd9YVqeQrGWeI9ouAEBlUvIE96FA60S6BEcwmHpEFcpsawLXYmOyXYE29hC879RZMvn97+uMFJcxSWApJv1NFRGAzEYkMnJCuBADuhL7OtLLkjcUkoI6UgprXVpFCNtlnniS5F+1NLTNUQGdpXhF1hfvNicnG6F5pUcXwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4679ea3b13bso93146551cf.1;
        Fri, 03 Jan 2025 09:06:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735923978; x=1736528778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxvrG6R+Z5r8bK4L4sjv0voRI7+odFkKXBJxXqn6kSs=;
        b=iLlU9rFOgRs5vrVWYRqLhPnYLm/CBcvJIfu1zHTXkGrtsldv9LtQDLvSWMj9KEfbJf
         c8v1hNLmGQgRlhw3wGiY6qKl5iehklP0KKEHmcESDOxNXghfKH+KRVVBm5ES9sotOxEt
         h4V4kHlARs+h7y1CfdHF9dC6gMnNrVN66mzRFf94rsvCcvc/XhNpAZQ5oorcJguztACf
         bEYYShGBx6u83hQDUlcX19UMOP0TFYjg26Nbi1iTr1LVZ9wnKl8jS3emdmMo2+3AHwXg
         NA7eNmM54pa2/M/uHQG4pn+X+JF13eFmWitXvHF05a154V61+c4NMlblgHNaBJkAIH71
         hkaw==
X-Forwarded-Encrypted: i=1; AJvYcCUsxDxtkuytNz2qoIIbpDA6W03cLkNCfLxhLPnmXANlPlxvhrLYDeizwnw4r7OlqqQJwSnO325ckhDUjw91oLWQOog=@vger.kernel.org, AJvYcCVsh3X78UY67qPzMUsYTsgceXvfykZmAN873FAxi35zS03OYgf9Q1dDxY7o/G/8l5wcT3j46s9zteKq7L5O@vger.kernel.org, AJvYcCWL6XShfkM137/Z+57lmLNFcuWc7AnxFfCP14gb83W8D5jLQRwDIqFZ38lXugHi+K/LN46UGp9Mjq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYaG4Mv1bqkdet95IYejWC+VthHwtXOsIkvqtpC9osd0LjPUpu
	xVT4CPmHhTthlXA0a4RlZ6TrcVhUDCIFGG95N6iAghuB0980gRetwJKonexhbPk=
X-Gm-Gg: ASbGncsobRVqhvom0F8EhcroQVfcNdrVXVsiZaKQfzlbL3LT0pwfQYPeH7+C1862TiT
	ikwNAjNawZBmy+iOe9zd34HNuSyT8cBASuvZvg6/xwDN3BdtImoBsIyrdqEcRW6466WH+Tdyvtt
	ewjChO/wPimrEhLGg4D6eqMbOg6Sl5EewG4KY0eIsTn6ZxJ77uyM/ZHJHyKw+gzOTGZd0CC8gIV
	lFoxZUFn+ZXdQNWHxr0PtAS6/Gd35y5kHMlX067sn9THKdA4NrcF+If+LqcEP9XrBa9vkxhFiie
	ehHHdIPb/cn5qGwjEl8AP8A=
X-Google-Smtp-Source: AGHT+IFIVvgMOMOjyYrsOAEC0aMvqBsNACz1m43MGrtaqXMJ8PGv+gfNhakujVGVxMIpC42QX56zmg==
X-Received: by 2002:ac8:7f94:0:b0:467:5367:7d09 with SMTP id d75a77b69052e-46a4a8e15aamr761531241cf.16.1735923978052;
        Fri, 03 Jan 2025 09:06:18 -0800 (PST)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com. [209.85.222.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb2b4d2sm147031211cf.79.2025.01.03.09.06.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 09:06:17 -0800 (PST)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso1091682785a.2;
        Fri, 03 Jan 2025 09:06:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNTQT7WKYjGN8TavSsuRvHWoj/dSIy4eR3DNT0y5ROV7J/uP6he9HhDG4pXflVacEzb2HKS251Zl4=@vger.kernel.org, AJvYcCWYm++ZNjLMSCE6aTy5fHEeOClMza7H5C7akEE+pdlokgsvB/XgvlzTEtpbgi6LY2Osm+zYoEe9tcJnYEwE@vger.kernel.org, AJvYcCXOJsNRnv/0MOlC6nNuh+uZtf/AYU6it65QTBcrnhKa72njMJz2+QsVV3Y4pIIC9SD0GP7ZxZy6WXtKYpz5b5pwDBE=@vger.kernel.org
X-Received: by 2002:a05:620a:248d:b0:7ac:c348:6a55 with SMTP id
 af79cd13be357-7b9ba7e8035mr8961386385a.38.1735923977093; Fri, 03 Jan 2025
 09:06:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 18:06:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1gPNCFddg_DyK7Bv0BeFLOLi=5eteT_HhMH=Ph2wVvA@mail.gmail.com>
X-Gm-Features: AbW1kvZH3h90FFJ41mMy_QIkS6-_E-OU2dz2UbomdTjHtSUW21KoUPbh10zL814
Message-ID: <CAMuHMdX1gPNCFddg_DyK7Bv0BeFLOLi=5eteT_HhMH=Ph2wVvA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Jan 2, 2025 at 7:18=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Switch MSTOP handling from group-based to per-bit configuration to
> address issues with shared dependencies between module clocks. In the
> current group-based configuration, multiple module clocks may rely on
> a single MSTOP bit. When both clocks are turned ON and one is
> subsequently turned OFF, the shared MSTOP bit will still be set, which
> is incorrect since the other dependent module clock remains ON. By
> switching to a per-bit configuration, we ensure precise control over
> individual MSTOP bits, preventing such conflicts.
>
> Replace the refcount API with atomic operations for managing MSTOP bit
> counters. The refcount API requires explicitly setting the counter to
> `1` before calling `refcount_inc()`, which introduces potential edge
> cases and unnecessary complexity. Using atomic operations simplifies
> the logic and avoids such issues, resulting in cleaner and more
> maintainable code.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Dropped unnecessary parentheses
> - Switched using to devm_kcalloc() instead of devm_kmalloc_array()
> - Optimized check in rzv2h_mod_clock_endisable() if the states are same
> - Dropped GET_MSTOP_IDX() macro and handled indexing in the code
> - Made mstop_mask to unsigned long to avoid casting

Thanks for the update!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -446,38 +443,70 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_c=
lk *core,
>  }
>
>  static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
> -                                        struct mod_clock *clock)
> +                                        u32 mstop_data)
>  {
> +       unsigned long mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK, mstop=
_data);
> +       u16 mstop_index =3D FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
> +       unsigned int index =3D (mstop_index - 1) * 16;

Probably I didn't explain it well, but you could avoid the "- 1"
here and in all functions accessing priv->mstop_count, by adjusting
priv->mstop_count in rzv2h_cpg_probe()[1].

> +       atomic_t *mstop =3D &priv->mstop_count[index];
>         unsigned long flags;
> -       u32 val;
> +       unsigned int i;
> +       u32 val =3D 0;
>
>         spin_lock_irqsave(&priv->rmw_lock, flags);
> -       if (!refcount_read(&clock->mstop->ref_cnt)) {
> -               val =3D clock->mstop->mask << 16;
> -               writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx)=
);
> -               refcount_set(&clock->mstop->ref_cnt, 1);
> -       } else {
> -               refcount_inc(&clock->mstop->ref_cnt);
> +       for_each_set_bit(i, &mstop_mask, 16) {
> +               if (!atomic_read(&mstop[i]))
> +                       val |=3D BIT(i) << 16;
> +               atomic_inc(&mstop[i]);
>         }
> +       if (val)
> +               writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
>         spin_unlock_irqrestore(&priv->rmw_lock, flags);
>  }

> @@ -647,12 +619,39 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_c=
lk *mod,
>
>         priv->clks[id] =3D clock->hw.clk;
>
> -       if (mod->mstop_data !=3D BUS_MSTOP_NONE) {
> -               clock->mstop =3D rzv2h_cpg_get_mstop(priv, clock, mod->ms=
top_data);
> -               if (!clock->mstop) {
> -                       clk =3D ERR_PTR(-ENOMEM);
> -                       goto fail;
> +       /*
> +        * Ensure the module clocks and MSTOP bits are synchronized when =
they are
> +        * turned ON by the bootloader. Enable MSTOP bits for module cloc=
ks that were
> +        * turned ON in an earlier boot stage.
> +        */
> +       if (clock->mstop_data !=3D BUS_MSTOP_NONE &&
> +           !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw)) {
> +               rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
> +       } else if (clock->mstop_data !=3D BUS_MSTOP_NONE && mod->critical=
) {
> +               unsigned long mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MAS=
K, clock->mstop_data);
> +               u16 mstop_index =3D FIELD_GET(BUS_MSTOP_IDX_MASK, clock->=
mstop_data);
> +               unsigned int index =3D (mstop_index - 1) * 16;
> +               atomic_t *mstop =3D &priv->mstop_count[index];
> +               unsigned long flags;
> +               unsigned int i;
> +               u32 val =3D 0;
> +
> +               /*
> +                * Critical clocks are turned ON immediately upon registr=
ation, and the
> +                * MSTOP counter is updated through the rzv2h_mod_clock_e=
nable() path.
> +                * However, if the critical clocks were already turned ON=
 by the initial
> +                * bootloader, synchronize the atomic counter here and cl=
ear the MSTOP bit.
> +                */
> +               spin_lock_irqsave(&priv->rmw_lock, flags);
> +               for_each_set_bit(i, &mstop_mask, 16) {
> +                       if (atomic_read(&mstop[i]))
> +                               continue;
> +                       val |=3D BIT(i) << 16;
> +                       atomic_inc(&mstop[i]);
>                 }
> +               if (val)
> +                       writel(val, priv->base + CPG_BUS_MSTOP(mstop_inde=
x));
> +               spin_unlock_irqrestore(&priv->rmw_lock, flags);
>         }

This logic could be simplified to:

    if (clock->mstop_data =3D=3D BUS_MSTOP_NONE)
            return;

    if (mod->critical) {
            unsigned long mstop_mask =3D FIELD_GET(BUS_MSTOP_BITS_MASK,
clock->mstop_data);
            ...
    } else if (rzv2h_mod_clock_is_enabled(&clock->hw)) {
            rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
    }

>
>         return;
> @@ -922,6 +921,11 @@ static int __init rzv2h_cpg_probe(struct platform_de=
vice *pdev)
>         if (!clks)
>                 return -ENOMEM;
>
> +       priv->mstop_count =3D devm_kcalloc(dev, info->num_mstop_bits,
> +                                        sizeof(*priv->mstop_count), GFP_=
KERNEL);
> +       if (!priv->mstop_count)
> +               return -ENOMEM;

[1]

    /* Adjust for CPG_BUS_m_MSTOP starting from m =3D 1 */
    priv->mstop_count -=3D 16;

Anyway, it's getting late in the cycle, so I am queuing this tentatively
in renesas-clk for v6.14, to allow the bots to give it a run in this
Monday's linux-next. I will still have to squash the fixes
(+ whatever minor updates?) into the original bad commit (adding
Co-Developed-by-tags for you and Biju), but that can be done later,
just before sending my final pull requests for the v6.14 merge window...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

