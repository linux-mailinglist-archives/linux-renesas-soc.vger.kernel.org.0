Return-Path: <linux-renesas-soc+bounces-7587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441F93F163
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 11:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 969ED1C21E01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 09:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA5F13D255;
	Mon, 29 Jul 2024 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hy6/F8Vt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B3B78B4E;
	Mon, 29 Jul 2024 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722246005; cv=none; b=RJ1x7Vqg+UYHjEz6lSCBkia801Owfu90Zn2x4TFzp1NzZ9K2D0aJNfCbPh58E5oa5Egs7a3Rmg5sV/zUadD1RLNde/JUfIiGzPiTIygw0oYSQpxnEJ4CRGnRsWbsQW36qFQg20ScSbyHlHZaHPwCeoMMEd7dOca7MXONw9qyNqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722246005; c=relaxed/simple;
	bh=v5CVpGXRECC7xxZl4Fle2Mk+XUxzkpObh9lVcLfvV1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uiecYG1XnNlGngT4/5+BkoAV5fvcy88BNLOhZ6PETidMZAYf5a2qolHiG0HsLx3erHNEtTTjhRMSXZxDWY6KDM8GEgzkBiet28H1VwKXC3ayya7N05nAIkkN0EoDQGMMJcjXce2WeJbB4p1GBsaKnN9z2S2KciZOM4dcYiCoMag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hy6/F8Vt; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4f6b8b7d85bso1083101e0c.1;
        Mon, 29 Jul 2024 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722246003; x=1722850803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqJ/zR4THD+IIHEf2QepwtOw7uhTMsZvKiU8UBFA/vA=;
        b=Hy6/F8VtnhtrOCV2FcTRgE7DJhYeh4iicv6moqk0NBUCCguz3q8gBXdr5hNVQDDpPe
         4Jf4RfdgpdVdDBqdbVM63THXs7wNtEvHu4Soh9xwnEyMt0YsIhfv7lHA0Br6CMz2kD42
         Tv9cflDOKZv2yHKwJiWhiB4SHxerMTkEXW3k8viedFu5sdIQdpr535Okz5nVaDnAKx8i
         nXSEg4YMt3Da4m9FaNV4E8OlNhSgSO4VGezLaV2wWQeuXKishWjneh8cENxyO/gd7w6k
         fjyOfuUef7U65kVD5zng3s/8DKwmSlk2BcAQZKHuLEdNo2w+1WgDkJndJ4PmnFM8vOd/
         WhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722246003; x=1722850803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqJ/zR4THD+IIHEf2QepwtOw7uhTMsZvKiU8UBFA/vA=;
        b=XAF2DT/f0Q9KHo2YxJEd3Gjw5BDOODfDfIavdG6KI/Xuy4lWw3hCSVBlBJR6gKn3dO
         azN+N/slHgwVOhCCe1QD/3sNN8I2MVn2m+i+Dl+6lyWChOiu+N3zVZgahaw9rr2hU6/2
         pheE+6YUlefvM4luOwThZWXHkCyk2NyS2vn7bJ3i1XqG0n6b2/cArhGwVxh6RbyJcpNC
         qdWjDESigtGo0YwF/QlEsEqyOVXiaNIcdAhqhL8r/CAry3/jlSu+NOEqA+6cXTVL1PV/
         71iVnb7W7CaCbnpNbhefl4M4ZfKJVhUpXCM1GYxg312hv59lVgHdOpGbvPGa1QpbZxtn
         u7qw==
X-Forwarded-Encrypted: i=1; AJvYcCUh0yEv6EWT33NDfUQXF9wwNt2yLEGp1egoOm8wKJSoqelv2IPUaDRVqq4BXjvIRcO5RdU4HCzxtGNNJS5bgz6RftV7yf2WNDtekBAWMZlY0iDi1CSkkqEQi9E4neA00G493KVk10e42GrJch2eeAmYHu2mqNwcvlah3TU2RtXAbkmU6qBpvJO9KlvI0FX+yXnEzpONw6viKnkQ8s7+ZzfVNI6td2vx
X-Gm-Message-State: AOJu0YyOzYJjzmni7eHUHBc9fsnL1GTkm3LFRSQn0Xaw+5vro9+72DwC
	13DXt16Xrkuhgdb0P0tRLE1cvCl6/sH2uzQW0kz70XygmLnZ4JLxkqLf/dj8pBJ8M3yUybno4w/
	ZAo18+UZUOGfblmaXwb15ZGfQ3Ic=
X-Google-Smtp-Source: AGHT+IHJOw3LYL+pc0QeWca13CNB+qj11UjJq1kTH+3jSlVQYnx+/46EaOcVohMn+/9cRGfpWpZzHXtBAp0ZZa7aFWg=
X-Received: by 2002:a05:6122:459e:b0:4f5:23e4:b7c with SMTP id
 71dfb90a1353d-4f6e66f6614mr7603498e0c.0.1722246002839; Mon, 29 Jul 2024
 02:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240715125438.553688-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUvfAqJR6=4MG3hXC6cn1AnKz7+RAp4GG1jvdwOctgNzQ@mail.gmail.com>
 <CA+V-a8uBL-2DeAtu6BnF37Loe_fT6PNbAx=8O9acTR1Ey2zRrg@mail.gmail.com> <CAMuHMdU3ijNmw8nfTHbrsX28ASwO=pTaMaODPg1PUr9x5kPibg@mail.gmail.com>
In-Reply-To: <CAMuHMdU3ijNmw8nfTHbrsX28ASwO=pTaMaODPg1PUr9x5kPibg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Jul 2024 10:38:00 +0100
Message-ID: <CA+V-a8vDKDsEOnPONgo7Q4fKX==VdCwUfXcrQqEMU+VQmEb0fg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Mon, Jul 29, 2024 at 9:14=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Sat, Jul 27, 2024 at 12:51=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Jul 26, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, Jul 15, 2024 at 2:56=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > --- /dev/null
> > > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > >
> > > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit) =
     \
> > > > +       [_id] =3D { \
> > >
> > > Indexing by _id means the reset array will be very sparse.  E.g. the
> > > innocent-looking r9a09g057_resets[] with only a single entry takes
> > > 600 bytes:
> > >
> > >     $ nm -S drivers/clk/renesas/r9a09g057-cpg.o | grep r9a09g057_rese=
ts
> > >     0000000000000038 0000000000000258 r r9a09g057_resets
> > >
> > Agreed.
> >
> > > So please pack the array here, and either unpack it while making the
> > > priv->resets copy, or implement translation ("look-up") from ID to
> > > packed index in rzv2h_cpg_reset_xlate().
> > >
> > OK, I will implement the below:
> >
> > #define PACK_RESET(_resindex, _resbit, _monindex, _monbit)    \
> >     (((_resindex) << 24) | ((_resbit) << 16) | ((_monindex) << 8) | (_m=
onbit))
> >
> > #define DEF_RST(_resindex, _resbit, _monindex, _monbit)    \
> >     PACK_RESET(_resindex, _resbit, _monindex, _monbit)
> >
> > #define GET_RESET_INDEX(x)    (((x) >> 24) & 0xFF)
> > #define GET_RESET_BIT(x)    (((x) >> 16) & 0xFF)
> > #define GET_MON_INDEX(x)    (((x) >> 8) & 0xFF)
> > #define GET_MON_BIT(x)        ((x) & 0xFF)
> >
> > static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
> >                  const struct of_phandle_args *reset_spec)
> > {
> >     struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
> >     unsigned int id =3D reset_spec->args[0];
> >     u8 rst_index =3D id / 16;
> >     u8 rst_bit =3D id % 16;
> >     unsigned int i;
> >
> >     for (i =3D 0; i < rcdev->nr_resets; i++) {
> >         u8 cur_index =3D GET_RESET_INDEX(priv->resets[i]);
> >         u8 cur_bit =3D GET_RESET_BIT(priv->resets[i]);
> >
> >         if (rst_index =3D=3D cur_index && rst_bit =3D=3D cur_bit)
> >             return i;
> >     }
> >
> >     return -EINVAL;
> > }
> >
> > Let me know if this is OK, or to avoid looping in xlate maybe we can
> > have a packed entry in the resets property of DT by this way we can
> > avoid having the resets array all together?
>
> Sorry for being unclear. I did not mean packing the fields in the struct
> into a single word, but packing the entries in the r9a09g057_resets[]
> array.  Using the rzv2h_reset structure is fine.
>
> With:
>
>     #define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)    =
   \
>             [_id] =3D { \
>                     .reset_index =3D (_resindex), \
>                     .reset_bit =3D (_resbit), \
>                     .mon_index =3D (_monindex), \
>                     .mon_bit =3D (_monbit), \
>             }
>
>     #define DEF_RST(_resindex, _resbit, _monindex, _monbit) \
>             DEF_RST_BASE(RST_ID((_resindex), (_resbit)), _resindex,
> _resbit, _monindex, _monbit)
>
>     static const struct rzv2h_reset r9a09g057_resets[] __initconst =3D {
>         DEF_RST(9, 5, 4, 6),            /* SCIF_0_RST_SYSTEM_N */
>     };
>
> is expanded into an array of 150 entries (9 * 16 + 5 =3D 149 empty entrie=
s
> followed by the SCIF_0_RST_SYSTEM_N entry), which is wasteful.
> Over time the array will be filled more, but I expect there will still
> be lots of unused entries.
>
> Hence I suggest to drop the "[id]":
>
>    - define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)    =
   \
>    -       [_id] =3D { \
>    +#define DEF_RST(_resindex, _resbit, _monindex, _monbit)       \
>    +       { \
>                    .reset_index =3D (_resindex), \
>                     .reset_bit =3D (_resbit), \
>                     .mon_index =3D (_monindex), \
>                     .mon_bit =3D (_monbit), \
>             }
>    -
>    -#define DEF_RST(_resindex, _resbit, _monindex, _monbit) \
>    -        DEF_RST_BASE(RST_ID((_resindex), (_resbit)), _resindex,
> _resbit, _monindex, _monbit)
>
> Then r9a09g057_resets[] will contain only non-empty entries, at the
> expense of no longer being able to index it directly by reset ID.
> To solve the indexing, there are two options.
>
> Option A: Translate from reset ID to real index during lookup, like
>           you do in the rzv2h_cpg_reset_xlate() above:
>
>     static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
>                      const struct of_phandle_args *reset_spec)
>     {
>         struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
>         unsigned int id =3D reset_spec->args[0];
>         u8 rst_index =3D id / 16;
>         u8 rst_bit =3D id % 16;
>         unsigned int i;
>
>         for (i =3D 0; i < rcdev->nr_resets; i++) {
>             if (rst_index =3D=3D priv->resets[i].reset_index &&
>                 rst_bit =3D=3D ->resets[i].reset_bit)
>                 return i;
>         }
>
>         return -EINVAL;
>     }
>
> Option B: "Unpack" rzv2h_cpg_info.resets[] during copying in
>           rzv2h_cpg_probe():
>
>     priv->resets =3D devm_kcalloc(dev, max_num_reset_ids,
>                                  sizeof(*priv->resets), GFP_KERNEL);
>     for (i =3D 0; i < ARRAY_SIZE(info->resets); i++) {
>             id =3D RST_ID(info->resets[i].reset_index, info->resets[i].re=
set_bit);
>             priv->resets[id] =3D info->resets[i];
>     }
>
> BTW, for option B (and for the current code in v4),
> rzv2h_cpg_reset_xlate() should validate that the entry is non-empty.
>
> I hope this is more clear?
>
Yes, thanks for the clarification. I will go with option A, so we
don't waste memory.

Cheers,
Prabhakar

