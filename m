Return-Path: <linux-renesas-soc+bounces-25143-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03449C87688
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 00:00:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50E2F353ADD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A796F23B61E;
	Tue, 25 Nov 2025 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTfCjr2H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840521D5B0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 23:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764111628; cv=none; b=OqbB2Sv5dXK7Lj4/3pMOjLynrtr+oGv+oXBCdgPmTeIkIlaDjKhhs3oRnmDUvB/VuNJOYaCpFCHfBEF0avtxh44ndNq+Y1U/EXKYLsqkcXFCA10kJYAJEKOhoeGALrpzfyvwC+PRbek6xRtlRkVsK7oTVSDjrOI2LL2pKDfqixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764111628; c=relaxed/simple;
	bh=idak+uCeBCyAvyZ9fprhw/KV0s00N1Im+/NB63tUTdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpGVmopqp9Wmfjk0pEy8wH3nDdLylirqrK/WHh8AiOsIbTa5tHrp5MOyJpcBarGaSYt5ZwxgK/gB3b7HzlsDXamUMHzEZjOFMNsGzjr5eQk8faON9VYVgtReySWuIwA1IDsltNjE15iO3IFPzhsmKpZdkrr5VH5BRZQNjKcrk4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTfCjr2H; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b38de7940so3081964f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764111625; x=1764716425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mxf/zvDrowgtITZiOKfTYBQoYBwaTnkdZo06JbINmCs=;
        b=ZTfCjr2HyC9b8BUwxdsIkpLyFKZPhpPwoVXlQz2JzFtP3aL/BeC1cDx81evI7+UhO8
         LQzXkQTragSR0Tvsnm+YFWAJKwIX81M6EoyRxNbYinJO07AMZ5R8sITnN9Wtpjz+DOld
         YLkvCFcQXUKBPH5jLMZp9TJSIr2GoTspG/S12DGr2yWY5/HOqpKaM5LOFYFML3M6sAS4
         hiPUksnLdFmYGo7+j29cfRaB6J+63OjmodjHcSgpu0kjLAlDFmzV3McR40mbcq6VCiHa
         DVxe0HdJqgtwD+Mf8Ni3QFvc24tRJZIiQFG8ykkR7PIV04PnJKsakPxBGReNMEFJRWc5
         sjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764111625; x=1764716425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mxf/zvDrowgtITZiOKfTYBQoYBwaTnkdZo06JbINmCs=;
        b=oqCzPlYNVPTUvS39lRMa9uE/Rw7C5FWSDdKFi5VdN8BqhP2GJrUdlvRU3rmHeCAE9t
         em80WxfR/1qkf/yP9tEGM7qRiHMMj1vBhBhqAW//6KYzoW8S7zSDas8+fIOxRqBf9h2v
         TXikzePXYZWQbS7Ik6fivNY9s9nEe0ylG0n3QQmqWIw511izTMM07Vq3YE2l9zlcA0nb
         ZrYsoYsFdj92uJ6htnvwNUZZbzJeJxOKp+a8giajrYbL+n0RmANqvDmkE2ZFBVltbrOh
         T2HFNsBSrKaUQ4J10fRojnY/RirTpKrlXlerF1PWcV1DcuD3VHkzAGSqGKNZrGTN0WR4
         LPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLF2Uua0w13K4BPQ1hACVqox4g4syCwEL4/YQFVACYaDmyXCqi9T2GOEx85ZGF9cxgnV0mYs6Un41AcjBKwsaHAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+BIPFv87XaLkOoG4TPH+wR63WVQrQ9dvnaUHH4+zDh4Nv88q
	apZSnt2fBLG+5MTi2gHETMp7gGpy7qnZsQ0SHQar90lMQQev8kxUK2kCCimtbAY0PpZ8xCPSwEs
	CQrhH+EvXb2vHg+L8Hje6MRNu+kLvvJU=
X-Gm-Gg: ASbGncv8sJjSANnxvkhBk4pqavS/vtl4A5KUpKAqf2zSvlaoDC1sG/KCp0Ohaz12FpG
	8rJMJcgJM2PClOL1l8nPBdI+fsphfa2Ia4p47pMDsJhwvyLny+Uj5A2erSi2gC/xpGtjuipJIPm
	ivz8Fw6ZQaFwq2v75VZAyRV8dYdAu5WkDQT+DojqJb79m0ILPOZU+bF/+1UrXmfTlNc1Z53LKLO
	GOGDz4bJlyGGD5nvws9sn2rl3IHnEhBpziOA6rhygCPd2YkIafNpC/kUmRwi9zYktVhCc05lML0
	qdqHuFYgzwWO77815MiQuAgxfKc=
X-Google-Smtp-Source: AGHT+IHfTWcr4pmhEZy7lyLJ8KSjZgdKx6azzv+gBs/PSqdSM9UG1I2+fi9zPROnLAOvdSZsRKUsX214IvJvuEEVAIA=
X-Received: by 2002:a05:6000:1ace:b0:42b:397f:8dd4 with SMTP id
 ffacd0b85a97d-42cc1d0cd18mr17489452f8f.49.1764111625104; Tue, 25 Nov 2025
 15:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117205627.39376-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWuiB5Vystj10VX4hjdvCj3DwsXNu5vz_3EXRR3mmtbbQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Nov 2025 22:59:59 +0000
X-Gm-Features: AWmQ_blhqg2Ly_A14EsF2_GEsrjZcaf7JM2ijqwQpdQ0l2gyC6xMmEmyN7IBjGw
Message-ID: <CA+V-a8uGLMa33WC_e83keMe2GOONd-92Z2HWzPEK+NNvin-LXg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: r9a09g077: Add xSPI core and module clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Nov 24, 2025 at 4:14=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 17 Nov 2025 at 21:57, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add core clocks and module clock definitions required by the xSPI
> > (Expanded SPI) IP on the R9A09G077 SoC.
> >
> > Define the new SCKCR fields FSELXSPI0/FSELXSPI1 and DIVSEL_XSPI0/1 and
> > add two new core clocks XSPI_CLK0 and XSPI_CLK1. The xSPI block uses
> > PCLKH as its bus clock (use as module clock parent) while the operation
> > clock (XSPI_CLKn) is derived from PLL4. To support this arrangement
> > provide mux/div selectors and divider tables for the supported
> > XSPI operating rates.
> >
> > Add CLK_TYPE_RZT2H_FSELXSPI to implement a custom divider/mux clock
> > where the determine_rate() callback enforces the hardware constraint:
> > when the parent output is 600MHz only dividers 8 and 16 are valid,
> > whereas for 800MHz operation the full divider set (6,8,16,32,64) may
> > be used. The custom determine_rate() picks the best parent/divider pair
> > to match the requested rate and programs the appropriate SCKCR fields.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > Note this patch was originally part of series [0] as rest of the series
> > is already merged into linux-next, sending only this patch as v3.
> > [0] https://lore.kernel.org/all/20251028165127.991351-1-prabhakar.mahad=
ev-lad.rj@bp.renesas.com/
> >
> > v2->v3:
> > - Dropped check for 800/600 MHz in
> >   r9a09g077_cpg_fselxspi_determine_rate() instead compared divider valu=
es 3/4.
> > - Sorted pll4d1_div3/pll4d1_div4 definitions to be with other pll4d1 di=
viders.
> > - Dropped u64 caset in DIV_ROUND_UP_ULL()
> > - Hardcoded the maxdiv when no dividers are found
> > - Rebaesed to latest -next
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > @@ -58,11 +60,16 @@
> >  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
> >  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> >
> > +#define FSELXSPI0      CONF_PACK(SCKCR, 0, 3)
> > +#define FSELXSPI1      CONF_PACK(SCKCR, 8, 3)
> > +#define DIVSEL_XSPI0   CONF_PACK(SCKCR, 6, 1)
> > +#define DIVSEL_XSPI1   CONF_PACK(SCKCR, 14, 1)
> >  #define SEL_PLL                CONF_PACK(SCKCR, 22, 1)
>
> Moving all of these up while applying, so SCKCR comes before SCKCR2.
>
> >
> >  enum rzt2h_clk_types {
> >         CLK_TYPE_RZT2H_DIV =3D CLK_TYPE_CUSTOM,   /* Clock with divider=
 */
> >         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock sou=
rce selector */
> > +       CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn=
 source selector */
> >  };
> >
> >  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
>
>
> > @@ -148,6 +172,8 @@ static const struct cpg_core_clk r9a09g077_core_clk=
s[] __initconst =3D {
> >                 sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ON=
LY),
> >
> >         DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
> > +       DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
> > +       DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
>
> Inserting a blank line.
>
> >         DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
> >                 dtable_24_25_30_32),
> >         DEF_DIV(".sci1async", CLK_SCI1ASYNC, CLK_PLL4D1, DIVSCI1ASYNC,
>
> > +static int r9a09g077_cpg_fselxspi_determine_rate(struct clk_hw *hw,
> > +                                                struct clk_rate_reques=
t *req)
> > +{
> > +       struct clk_divider *divider =3D to_clk_divider(hw);
> > +       unsigned long parent_rate, best =3D 0, now;
> > +       const struct clk_div_table *clkt;
> > +       unsigned long rate =3D req->rate;
> > +       unsigned int num_parents;
> > +       unsigned int divselxspi;
> > +       unsigned int div =3D 0;
> > +
> > +       if (!rate)
> > +               rate =3D 1;
> > +
> > +       /* Get the number of parents for FSELXSPIn */
> > +       num_parents =3D clk_hw_get_num_parents(req->best_parent_hw);
> > +
> > +       for (clkt =3D divider->table; clkt->div; clkt++) {
> > +               parent_rate =3D clk_hw_round_rate(req->best_parent_hw, =
rate * clkt->div);
> > +               /* Skip if parent can't provide any valid rate */
> > +               if (!parent_rate)
> > +                       continue;
> > +
> > +               /* Determine which DIVSELXSPIn divider (3 or 4) provide=
s this parent_rate */
> > +               divselxspi =3D r9a09g077_cpg_fselxspi_get_divider(req->=
best_parent_hw, parent_rate,
> > +                                                               num_par=
ents);
> > +               if (!divselxspi)
> > +                       continue;
> > +
> > +               /*
> > +                * DIVSELXSPIx supports 800MHz and 600MHz operation.
> > +                * When divselxspi is 4 (600MHz operation), only FSELXS=
PIn dividers of 8 and 16
> > +                * are supported. Otherwise, when divselxspi is 3 (800M=
Hz operation),
> > +                * dividers of 6, 8, 16, 32, and 64 are supported. This=
 check ensures that
> > +                * FSELXSPIx is set correctly based on hardware limitat=
ions.
> > +                */
> > +               if (divselxspi =3D=3D 4 && (clkt->div !=3D 8 && clkt->d=
iv !=3D 16))
> > +                       continue;
>
> Inserting a blank line.
>
> > +               now =3D DIV_ROUND_UP_ULL(parent_rate, clkt->div);
> > +               if (abs(rate - now) < abs(rate - best)) {
> > +                       div =3D clkt->div;
> > +                       best =3D now;
> > +                       req->best_parent_rate =3D parent_rate;
> > +               }
> > +       }
> > +
> > +       if (!div) {
> > +               req->best_parent_rate =3D clk_hw_round_rate(req->best_p=
arent_hw, 1);
> > +               divselxspi =3D r9a09g077_cpg_fselxspi_get_divider(req->=
best_parent_hw,
> > +                                                               req->be=
st_parent_rate,
> > +                                                               num_par=
ents);
> > +               /* default to divider 3 which will result DIVSELXSPIn =
=3D 800 MHz */
> > +               if (!divselxspi)
> > +                       divselxspi =3D 3;
>
> Inserting a blank line.
>
> > +               /*
> > +                * Use the maximum divider based on the parent clock ra=
te:
> > +                *  - 64 when DIVSELXSPIx is 800 MHz (divider =3D 3)
> > +                *  - 16 when DIVSELXSPIx is 600 MHz (divider =3D 4)
> > +                */
> > +               if (divselxspi =3D=3D 3)
> > +                       div =3D 64;
> > +               else
> > +                       div =3D 16;
>
> Replacing by:
>
>     div =3D divselxspi =3D=3D 3 ? 64 : 16;
>
> > +       }
> > +
> > +       req->rate =3D DIV_ROUND_UP_ULL(req->best_parent_rate, div);
> > +
> > +       return 0;
> > +}
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk for v6.20, with the above changes.
>
Thank you for taking care of the changes.

Cheers,
Prabhakar

