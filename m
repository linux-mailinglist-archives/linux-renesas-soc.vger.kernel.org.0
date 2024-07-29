Return-Path: <linux-renesas-soc+bounces-7582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E993EF98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 10:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1FE28478B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 08:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B673A139D12;
	Mon, 29 Jul 2024 08:14:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3722678C98;
	Mon, 29 Jul 2024 08:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722240882; cv=none; b=PYGyOun26PE6JiUs1eopuxDwf6xzDHHtsQMNqpLfoZYzW0FEMJPAPzwcpPI1bxVKsZHjWK90EYjBM76cH1Gpqf7kAWUdufwNFu8DOiiiQzDhTu3I3HFd6YU0De6msKYdbCxvUrbAZXpZK1MqkGKWuFJEChfScaCQKXbsIOi57TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722240882; c=relaxed/simple;
	bh=TjciwxBZFvj3o1heIGosoDiwk140Sw33SeHArxc+voo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDNA+w6ObhkpZ0JyMCiiUBand0Th7ekEMaBVm2MgcbEDJxrbUP2Km0b85a7YhjTXXVg7WrHFQ3f8HQWyPan6Tvx2KeIGTj90gdGRw7khn5006VZ1xPQwfFll5lkg9MnN6rpkzVNCq70zQ19VVIHL/IsqG9RYPc9EceDIc+VzpkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e026a2238d8so1632129276.0;
        Mon, 29 Jul 2024 01:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722240879; x=1722845679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1EIdtPGiXOSospH+OEGixBiy6HXU/pJVnoa2jx2Y5Y=;
        b=G1AjGp9I2wKBZmFDWi1mpWB7JAfBmgfcirfI9M1iRwGjNYN/R86/bwcyo3zl9hcF/l
         CHyI7Or8LWGdlrQsIaNWhvpL6g8/GTb+EnPJqc/VUMCxRkyx0F9+jipLdNQlKgLyLaeZ
         FCBsE8oeRli9iQP9A++jgKx1oH9PsgiAyRCu3ec9N4y2ySzo0F1znaLb/shvqzLY1I9t
         NDOfoTcM+CLGFnx7lfIsI4CEVqn3t29gsaJhCgbC4o/PeM5u/8boLZpWfvqKUhS3E+cu
         D9ZzqmXkXGldss8ONFlGbfHhkzZQwTidAAi0DyBF8UnK2xTJ76CIcYnGMrcLd+fRWxqm
         LItQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD1gpyWowTCqhWcy8FK/7cPdB075lf/nJ3nr6383OJ96R+Kici+TxhQ6rHIKCv9Lq9teXikgelA2TgrUVJfFHAzxbcPlh1dMmgFqpE/gkyemv8Gi+fPh6lHxCV8m45TwdcI1ehijAXS78IH9yKjZn9xcLt8g9xjn9MMaaIQ6rNGT/3Bw/BW2n2Qup7+cHvJDNLOpbFVkkroC3zOcsKNbdLd/MAYhMY
X-Gm-Message-State: AOJu0Yx03FL0lYXREPR9+mCWla0+meFn2bLY0zG9dKBRuG2fSKoXbYRE
	cvIX8GrTJgNSZPMxGu6hm1QM9B6Uw/DJV8t2MYZ3213VlPmP9DQueci5Fy/o
X-Google-Smtp-Source: AGHT+IGvfh4ym0okaqEwFy1SyN+Pc4WM0XSleoIYaURCr0eWk6WUaZHg3I73a/utq3k74pO0PvNEWg==
X-Received: by 2002:a25:9187:0:b0:dff:91e:56ed with SMTP id 3f1490d57ef6-e0b5449e17dmr7235013276.1.1722240878714;
        Mon, 29 Jul 2024 01:14:38 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b6ece061dsm576856276.49.2024.07.29.01.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 01:14:38 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-66599ca3470so15747997b3.2;
        Mon, 29 Jul 2024 01:14:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhNElTauyIXF15EyxobegRRFMkmRhixCPhembv9ou+WrarroWFfDUyVdepq8dFvZYWD9HD7PbpC8yNvpOQXTONAUhJuUYtqZ+mvbaEtgHXrbxYRV4qLH1viH8vyacYv3tlxpH7DBNkDLK/fO+uS8PWElr1wPjg1Qvh0MSUv4ypnZzx7MDxM4J8ututBQVMHCUGz+4I1n01TrtkjIaxG8JZupVNRafF
X-Received: by 2002:a81:9145:0:b0:660:56fb:7f00 with SMTP id
 00721157ae682-67a0adc957bmr56006987b3.46.1722240878292; Mon, 29 Jul 2024
 01:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240715125438.553688-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUvfAqJR6=4MG3hXC6cn1AnKz7+RAp4GG1jvdwOctgNzQ@mail.gmail.com> <CA+V-a8uBL-2DeAtu6BnF37Loe_fT6PNbAx=8O9acTR1Ey2zRrg@mail.gmail.com>
In-Reply-To: <CA+V-a8uBL-2DeAtu6BnF37Loe_fT6PNbAx=8O9acTR1Ey2zRrg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 10:14:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU3ijNmw8nfTHbrsX28ASwO=pTaMaODPg1PUr9x5kPibg@mail.gmail.com>
Message-ID: <CAMuHMdU3ijNmw8nfTHbrsX28ASwO=pTaMaODPg1PUr9x5kPibg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Sat, Jul 27, 2024 at 12:51=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Jul 26, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, Jul 15, 2024 at 2:56=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > --- /dev/null
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> >
> > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)   =
   \
> > > +       [_id] =3D { \
> >
> > Indexing by _id means the reset array will be very sparse.  E.g. the
> > innocent-looking r9a09g057_resets[] with only a single entry takes
> > 600 bytes:
> >
> >     $ nm -S drivers/clk/renesas/r9a09g057-cpg.o | grep r9a09g057_resets
> >     0000000000000038 0000000000000258 r r9a09g057_resets
> >
> Agreed.
>
> > So please pack the array here, and either unpack it while making the
> > priv->resets copy, or implement translation ("look-up") from ID to
> > packed index in rzv2h_cpg_reset_xlate().
> >
> OK, I will implement the below:
>
> #define PACK_RESET(_resindex, _resbit, _monindex, _monbit)    \
>     (((_resindex) << 24) | ((_resbit) << 16) | ((_monindex) << 8) | (_mon=
bit))
>
> #define DEF_RST(_resindex, _resbit, _monindex, _monbit)    \
>     PACK_RESET(_resindex, _resbit, _monindex, _monbit)
>
> #define GET_RESET_INDEX(x)    (((x) >> 24) & 0xFF)
> #define GET_RESET_BIT(x)    (((x) >> 16) & 0xFF)
> #define GET_MON_INDEX(x)    (((x) >> 8) & 0xFF)
> #define GET_MON_BIT(x)        ((x) & 0xFF)
>
> static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
>                  const struct of_phandle_args *reset_spec)
> {
>     struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
>     unsigned int id =3D reset_spec->args[0];
>     u8 rst_index =3D id / 16;
>     u8 rst_bit =3D id % 16;
>     unsigned int i;
>
>     for (i =3D 0; i < rcdev->nr_resets; i++) {
>         u8 cur_index =3D GET_RESET_INDEX(priv->resets[i]);
>         u8 cur_bit =3D GET_RESET_BIT(priv->resets[i]);
>
>         if (rst_index =3D=3D cur_index && rst_bit =3D=3D cur_bit)
>             return i;
>     }
>
>     return -EINVAL;
> }
>
> Let me know if this is OK, or to avoid looping in xlate maybe we can
> have a packed entry in the resets property of DT by this way we can
> avoid having the resets array all together?

Sorry for being unclear. I did not mean packing the fields in the struct
into a single word, but packing the entries in the r9a09g057_resets[]
array.  Using the rzv2h_reset structure is fine.

With:

    #define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)      =
 \
            [_id] =3D { \
                    .reset_index =3D (_resindex), \
                    .reset_bit =3D (_resbit), \
                    .mon_index =3D (_monindex), \
                    .mon_bit =3D (_monbit), \
            }

    #define DEF_RST(_resindex, _resbit, _monindex, _monbit) \
            DEF_RST_BASE(RST_ID((_resindex), (_resbit)), _resindex,
_resbit, _monindex, _monbit)

    static const struct rzv2h_reset r9a09g057_resets[] __initconst =3D {
        DEF_RST(9, 5, 4, 6),            /* SCIF_0_RST_SYSTEM_N */
    };

is expanded into an array of 150 entries (9 * 16 + 5 =3D 149 empty entries
followed by the SCIF_0_RST_SYSTEM_N entry), which is wasteful.
Over time the array will be filled more, but I expect there will still
be lots of unused entries.

Hence I suggest to drop the "[id]":

   - define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)      =
 \
   -       [_id] =3D { \
   +#define DEF_RST(_resindex, _resbit, _monindex, _monbit)       \
   +       { \
                   .reset_index =3D (_resindex), \
                    .reset_bit =3D (_resbit), \
                    .mon_index =3D (_monindex), \
                    .mon_bit =3D (_monbit), \
            }
   -
   -#define DEF_RST(_resindex, _resbit, _monindex, _monbit) \
   -        DEF_RST_BASE(RST_ID((_resindex), (_resbit)), _resindex,
_resbit, _monindex, _monbit)

Then r9a09g057_resets[] will contain only non-empty entries, at the
expense of no longer being able to index it directly by reset ID.
To solve the indexing, there are two options.

Option A: Translate from reset ID to real index during lookup, like
          you do in the rzv2h_cpg_reset_xlate() above:

    static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
                     const struct of_phandle_args *reset_spec)
    {
        struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
        unsigned int id =3D reset_spec->args[0];
        u8 rst_index =3D id / 16;
        u8 rst_bit =3D id % 16;
        unsigned int i;

        for (i =3D 0; i < rcdev->nr_resets; i++) {
            if (rst_index =3D=3D priv->resets[i].reset_index &&
                rst_bit =3D=3D ->resets[i].reset_bit)
                return i;
        }

        return -EINVAL;
    }

Option B: "Unpack" rzv2h_cpg_info.resets[] during copying in
          rzv2h_cpg_probe():

    priv->resets =3D devm_kcalloc(dev, max_num_reset_ids,
                                 sizeof(*priv->resets), GFP_KERNEL);
    for (i =3D 0; i < ARRAY_SIZE(info->resets); i++) {
            id =3D RST_ID(info->resets[i].reset_index, info->resets[i].rese=
t_bit);
            priv->resets[id] =3D info->resets[i];
    }

BTW, for option B (and for the current code in v4),
rzv2h_cpg_reset_xlate() should validate that the entry is non-empty.

I hope this is more clear?

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

