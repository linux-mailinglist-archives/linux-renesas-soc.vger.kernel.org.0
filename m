Return-Path: <linux-renesas-soc+bounces-7333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6893117C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 11:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2FA0B2301C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 09:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B89187324;
	Mon, 15 Jul 2024 09:42:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CD5186E34;
	Mon, 15 Jul 2024 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721036527; cv=none; b=ZHMS605pV2x0/Nf7MlSRDCWo/AOPTcGgKUveum3hYquJV6uIm3cz+Y6oJqJdqWMS4dOWtV7xiCtPgfiGBEtXxWsY+LR5CI1/Y6j26w2boCmwbWVAw9V9a299+My9IM2tmPMlpTvXlQJfQNMo+x9ZJkbK7koQwEYOsl259ErbjZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721036527; c=relaxed/simple;
	bh=x69YZN4FJusk9fPjLL0YXfgkcrUQFERtj1MOuG38mnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4hz2ZdTVeRUUqeNsrPUNtFdQCBJXChFVyx+T6sPqYlJ6tRzcQ9sQEg+Am9D/d4tmHE7GnaILaj5/pYjAoysMna5MZ07B1VTzSaBVd4qjisXsq3s20QRrx+BYi3sTd/OEKSrc9hC/JI7v/3xQAFx4uxX00Emk0DhHyQhyUnOVGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-65fc94099a6so15061467b3.1;
        Mon, 15 Jul 2024 02:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721036523; x=1721641323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvGxhd74JqVuIEOqRaI+e+PaiFpW8y5+5k+CbweUmMM=;
        b=Aal/O6p8Y4Dizgs+1NzVGGzwo5YAixMf+WRgIE8mIHPgcxaOvfC3/hPNZN7n5BNxSC
         wLCswwvtDZN/nM4k2iGRO5Ur4yuCu75QAMIklefdI8s+gTSCPrYHX8EvVVlsOp3/b01w
         CtjVOQZseSMA24PEjFt5m3I9UbWSPj8/8qdTykOE4BuFFMdFhrddvKDduMd78fu5l6dw
         1n15xKtGjPAXnK+Z6QPQEIVmZ9BrwXsK+CGP9QBR1U71QTBIz4Mhe5yOOIVMNCGE1m1N
         +Rf0Ly4vdOT+qm7zdj8FwhdCUW0aBGn2lU6l+zx540/QxGMjO8uUmdnxDXHmt6PUV5yb
         Rn2w==
X-Forwarded-Encrypted: i=1; AJvYcCXXKxwXFd4kQKPUixj07bqViqhYzb91nCdsVzfeZgrAQ8xNne+pa2KSHZcmlZl/igl6+xGn/npsFmML6eUZpNu5xvevEo+hJh04zRRPKbNz/1WzRSdbS45JBOrlXCSG2pOQ8NJUegeW+2B1zOwBq7KaBIJFK9l58fd/HwSwJjGc5UfV9jgAMo4/P866mzhunQDlYL0iG/1/he5pwGtmxcHKUAdIdu8g
X-Gm-Message-State: AOJu0YwqRNgm3sOY8qyTF9L+5YKunHt5iS5UoiBQI3XVgiNIyS+ukxGo
	Fvsmxp6m1baUJmFq1KnydgvQKIX4DpIwkpPCIIOuMnbtFyiIvNv7e0CUENvH
X-Google-Smtp-Source: AGHT+IFyKvPJlqMmkikCryE4C7E/9ULLrvatoeDHnVDC15S/DMMPNW6Ki14KH16kihynzouwx+C3KQ==
X-Received: by 2002:a81:8a82:0:b0:65f:80ed:683e with SMTP id 00721157ae682-65f80ed6975mr66161437b3.2.1721036523143;
        Mon, 15 Jul 2024 02:42:03 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-65fc492c74csm7186167b3.144.2024.07.15.02.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 02:42:02 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-65fc94099a6so15061157b3.1;
        Mon, 15 Jul 2024 02:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPXPAQEVonpbhf9C7exa1w1pJrUZX0GW4NyUPwcsqyy+3bTAPepN8PlYS1+w9bNYh/vSi+J6W5Oewh7lrWqYBgEMzDpiRjgAz5KEvRxgGjgJGdF5VLEwhgWun61HP6EJQpb+csN1rQlTNaJ0bwNfybB+k1VIIXLiIqtzl4QqjRNCezHNbO+Fry5gf6623VuWyiXVGUmOoex0q5nvMaXasLHmf1ux/o
X-Received: by 2002:a81:b64f:0:b0:63b:b3b8:e834 with SMTP id
 00721157ae682-658f09d3c58mr212121517b3.32.1721036521357; Mon, 15 Jul 2024
 02:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
 <CA+V-a8vABF6vg+J7DAGzgnw8612oe6VfJkc5y-krySvnpAnPkQ@mail.gmail.com>
 <CAMuHMdXuyQZ=SFfQa5kvZTwYa0uRXc7khJ-vOYBRE5SCd11rPw@mail.gmail.com>
 <CA+V-a8ui9AKDOZzg_dgPXeGhGE-+rBHU8O1tpdb8w8myo-1p5Q@mail.gmail.com>
 <CAMuHMdVyqBmipMLeYd0nw3kEHwc=RvWJvrD8EYKVt+36E7oS+A@mail.gmail.com> <CA+V-a8u_oMxG8QmmK=_y8z6O_H-22SyCkje-VrQVqHn4H=5oow@mail.gmail.com>
In-Reply-To: <CA+V-a8u_oMxG8QmmK=_y8z6O_H-22SyCkje-VrQVqHn4H=5oow@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jul 2024 11:41:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0XRC_gRW6qQEhW09zX+sv_njAznGN0i7UVgsy6gj_yw@mail.gmail.com>
Message-ID: <CAMuHMdX0XRC_gRW6qQEhW09zX+sv_njAznGN0i7UVgsy6gj_yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Jul 15, 2024 at 10:44=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Jul 12, 2024 at 6:11=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Jul 12, 2024 at 5:29=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Fri, Jul 12, 2024 at 4:23=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Fri, Jul 12, 2024 at 5:14=E2=80=AFPM Lad, Prabhakar
> > > > <prabhakar.csengg@gmail.com> wrote:
> > > > > On Fri, Jul 12, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
> > > > > > On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.cs=
engg@gmail.com> wrote:
> > > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > >
> > > > > > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > > > > > >
> > > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.ren=
esas.com>
> > > > > > > ---
> > > > > > > v2->v3
> > > > > > > - Dropped num_hw_resets from struct rzv2h_cpg_priv
> > > > > > > - Dropped range_check for module clocks
> > > > > > > - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> > > > > > > - Added support for critical module clocks with DEF_MOD_CRITI=
CAL
> > > > > > > - Added check for mon_index in rzv2h_mod_clock_endisable and
> > > > > > >   rzv2h_mod_clock_is_enabled()
> > > >
> > > > > > > --- /dev/null
> > > > > > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > > >
> > > > > > > +/**
> > > > > > > + * struct rzv2h_reset - Reset definitions
> > > > > > > + *
> > > > > > > + * @reset_index: reset register index
> > > > > > > + * @reset_bit: reset bit
> > > > > > > + * @mon_index: monitor register index
> > > > > > > + * @mon_bit: monitor bit
> > > > > > > + */
> > > > > > > +struct rzv2h_reset {
> > > > > > > +       u8 reset_index;
> > > > > > > +       u8 reset_bit;
> > > > > > > +       u8 mon_index;
> > > > > > > +       u8 mon_bit;
> > > > > > > +};
> > > > > > > +
> > > > > > > +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> > > > > > > +
> > > > > > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _mo=
nbit)      \
> > > > > > > +       [_id] =3D { \
> > > > > >
> > > > > > Indexing by _id means the reset array will be very sparse.  E.g=
. the
> > > > > > innocent-looking r9a09g057_resets[] with only a single entry ta=
kes
> > > > > > 600 bytes.
> > > > > >
> > > > > > If you do need the full array for indexing, please allocate and
> > > > > > populate it at runtime.
> > > > > >
> > > > > OK, I will use the radix tree for resets (is that OK)?
> > > >
> > > > You mean XArray? include/linux/radix-tree.h has:
> > > >
> > > >     /* Keep unconverted code working */
> > > >     #define radix_tree_root         xarray
> > > >     #define radix_tree_node         xa_node
> > > >
> > > Yes, I meant the above.
> > >
> > > > Given a single xa_node is already 576 bytes, just allocating the fu=
ll
> > > > linear reset array at runtime is probably better.
> > > >
> > > Agreed, I will create a linear reset array and loop through the array
> > > based on reset index and reset bit to match with id whenever required=
.
> >
> > With a full allocated linear reset array you do not need to loop,
> > but you can just index it by the reset ID??
> >
> Instead of having a sparse array, to save memory I was thinking
> something like below:
>
> /**
>  * struct rzv2h_reset - Reset definitions
>  *
>  * @reset_index: reset register index
>  * @reset_bit: reset bit
>  * @mon_index: monitor register index
>  * @mon_bit: monitor bit
>  */
> struct rzv2h_reset {
>     u8 reset_index;
>     u8 reset_bit;
>     u8 mon_index;
>     u8 mon_bit;
> };
>
> #define DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)    \
>     { \
>         .reset_index =3D (_resindex), \
>         .reset_bit =3D (_resbit), \
>         .mon_index =3D (_monindex), \
>         .mon_bit =3D (_monbit), \
>     }
>
> #define DEF_RST(_resindex, _resbit, _monindex, _monbit)    \
>     DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)
>
>
> in rzv2h_cpg_probe() (.num_resets =3D ARRAY_SIZE(r9a09g057_resets))
>
>     resets =3D devm_kmalloc_array(dev, info->num_resets, sizeof(struct
> rzv2h_reset), GFP_KERNEL);
>     if (!resets)
>         return -ENOMEM;
>
>     for (i =3D 0; i < priv->num_resets; i++)
>         memcpy(&resets[i], &info->resets[i], sizeof(struct rzv2h_reset));

You can combine both using devm_kmemdup().

> And have the below xlate function that will convert id into index ie
> index into rests array.
>
> static int rzv2h_get_reset_index(struct rzv2h_cpg_priv *priv,
>                  unsigned long id)
> {
>     u8 reset_index =3D id / 16;
>     u8 reset_bit =3D id % 16;
>     unsigned int i;
>
>     for (i =3D 0; i < priv->num_resets; i++) {
>         if (priv->resets[i].reset_index =3D=3D reset_index &&
>             priv->resets[i].reset_bit =3D=3D reset_bit)
>             return i;
>     }
>
>     return -EINVAL;
> }
>
> static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
>                  const struct of_phandle_args *reset_spec)
> {
>     struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
>     unsigned int id =3D reset_spec->args[0];
>     int index =3D rzv2h_get_reset_index(priv, id);
>
>     if (index < 0) {
>         dev_err(rcdev->dev, "Invalid reset index %u\n", id);
>         return -EINVAL;
>     }
>
>     return index;
> }
>
>
> rzv2h_cpg_assert() and rzv2h_cpg_deassert() which will use an id that
> can directly index into resets[] array.
>
> Please let me know if this is OK.

That would work, too, at the expense of needing a loop for look-up
(traditional trade-off between memory and time ;-)
But look-up is only done once (per device), so that should be fine.

It all depends on how many resets you will end up using...
Memory allocation also has a granularity, so once you have more
than a specific number of resets, you better use a sparse array,
and simple indexing.

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

