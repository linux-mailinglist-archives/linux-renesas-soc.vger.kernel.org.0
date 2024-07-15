Return-Path: <linux-renesas-soc+bounces-7334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C789311C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 11:57:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1AB0283235
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 09:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B2D187330;
	Mon, 15 Jul 2024 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXRxAfda"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6851862AB;
	Mon, 15 Jul 2024 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037435; cv=none; b=HaLZa50YZdsAYwp0TpAHosZitulKgJTZUJn3lw2bORyMvLSBxp0PLU5aSog0AzZcqUH0il9Oy51e56gfJhi8i3Xyhl8R+Oz6eV/rrNoZCiwRhwb7iqERsOIJQOGgBbYKcT2gRgSp65STWIavK2HmuL37n3g+Y9SJ9ZOrmp0cVoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037435; c=relaxed/simple;
	bh=irhb5eWja6bscc28xc60+rtffvcagtPOF1GgORiL3MM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Au+qNGT8xyi+QwSgdJT0zgMj8VfQfarfnKgcR2EXvJjHcL/VkLrHoqIHhQPWjaIR/IDJxRDlwj+saIphsOdyVXbSf8YEVN5F4fvAOb6OXprVxvTAHbljNVMypcpr36KP/SQ24mzc3XrgBrAo1Cmk16NqlQ2Cl8CeKE5XzBaL2lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXRxAfda; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4f2e2795350so2557380e0c.0;
        Mon, 15 Jul 2024 02:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721037433; x=1721642233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4HcfYt34Nur1uUMiCTLC+8U0g2McWEpTlrr98WYo9c=;
        b=ZXRxAfdauuQCSvhJtKiuSu1X6z8EDHsXCQ6l5Nhu7DWc9thKFu96nvR9ueeYaHLgN5
         +H4NviRUAJr+bx65I+MLyh1FF1NctLCo/1INrP+9eLSWq7NMbaGqQ6AwV9fwKTJhVz4l
         xyzyd+RdwxBCPyUW+UBIDeVYJO6CQUIJg6MO3ASgPI8VKnVeGOfOKVjx3Hji7FoAVLoC
         5LsYfnX6MXIykYII0FFAvvI3h9ElBUdGZ7xvzoik2HjHmNSvheTXEcfpUo+f/J6HQcIr
         uaqHJiUR7SNRVfcr5LwZv4zNGknJw9RZEvZ6onFk96B3uZIG74mKYCQxCC9HaqZAfx8Y
         nq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037433; x=1721642233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4HcfYt34Nur1uUMiCTLC+8U0g2McWEpTlrr98WYo9c=;
        b=ZBWb4/5nBlfgUywHh+R0EGXJrQa4GlA3xFeAExUxxJA52KAs+O5LHYmu4uzM7svQQF
         GCWFDKFXHz07wlSlP23Cl5klwkhwOgPvJKceST/a6E/P0jPyfY/Cw7WfOpCUHJKfEIEn
         bw9yOZKMDpFw3HUiAqIFVfCLCDXSgegqA/Ri6bdWBH9VZFjLABKKdWxVUcRCZkyxkPdQ
         3hvJSTkA16tjQjFVTM5lkks8WjgpeCvXAfOEYp34upfI2SXF3TuIFyWwOwz8FiCMtkfL
         qGiixba7FJ4Vf67SRKbVAm9ItPnw2cNaMKQTvgxZN5RZBKZUOpLyY/SUIE/t5fUqQefY
         Nu5g==
X-Forwarded-Encrypted: i=1; AJvYcCWdVPhZV8eB9uoyBHgd4WgefkFYH6sbPgnTRgbo9Is5tSUzlTbCBWi6fOHXyOypgcPA5aEr64De4YKSaX6sVjx/A8INUvDFiYkvsoA4QScsiD0PVW1GU2ZBXOK6XfxAzllmnOLVN9Aei9TkUVE9WmbwF2abLcSWe2/4tW0FLH4IEuLWLZ2P2lRgaZ172VjtQkHJgxE0xI38Oj/CBtCIjIvav/7fwfzW
X-Gm-Message-State: AOJu0YzXXWEjVALOSAch/LbRBYxycMwIWpT44afUjVXp7FuvN+7E64I/
	ZD29C6FJ1b6On1P1WOE5Oadp/rXJuaJJeWRrM7muwStqGJodTdI0y8/OzHVWY8oeVaBfWztrOyk
	M3CzpRVtsVUh0I654Akvq2A57s9Q=
X-Google-Smtp-Source: AGHT+IF9qJ3I9cQbClau4ryfzJ2v6Cd0e9wLqks28UFrpUdTaALNqbrszSxGIYmVCmyL9Bp/t+i70wjPT7RYiiJAW6A=
X-Received: by 2002:a05:6122:3bc8:b0:4b9:e8bd:3b2 with SMTP id
 71dfb90a1353d-4f49262b02cmr5758474e0c.2.1721037432991; Mon, 15 Jul 2024
 02:57:12 -0700 (PDT)
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
 <CAMuHMdVyqBmipMLeYd0nw3kEHwc=RvWJvrD8EYKVt+36E7oS+A@mail.gmail.com>
 <CA+V-a8u_oMxG8QmmK=_y8z6O_H-22SyCkje-VrQVqHn4H=5oow@mail.gmail.com> <CAMuHMdX0XRC_gRW6qQEhW09zX+sv_njAznGN0i7UVgsy6gj_yw@mail.gmail.com>
In-Reply-To: <CAMuHMdX0XRC_gRW6qQEhW09zX+sv_njAznGN0i7UVgsy6gj_yw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Jul 2024 10:55:40 +0100
Message-ID: <CA+V-a8tpCURbrGAG6NwD5WMz8NH3BfGvQXUj=Ooef2SsbPbnJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Mon, Jul 15, 2024 at 10:42=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Jul 15, 2024 at 10:44=E2=80=AFAM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Jul 12, 2024 at 6:11=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Fri, Jul 12, 2024 at 5:29=E2=80=AFPM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
<snip>
> > /**
> >  * struct rzv2h_reset - Reset definitions
> >  *
> >  * @reset_index: reset register index
> >  * @reset_bit: reset bit
> >  * @mon_index: monitor register index
> >  * @mon_bit: monitor bit
> >  */
> > struct rzv2h_reset {
> >     u8 reset_index;
> >     u8 reset_bit;
> >     u8 mon_index;
> >     u8 mon_bit;
> > };
> >
> > #define DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)    \
> >     { \
> >         .reset_index =3D (_resindex), \
> >         .reset_bit =3D (_resbit), \
> >         .mon_index =3D (_monindex), \
> >         .mon_bit =3D (_monbit), \
> >     }
> >
> > #define DEF_RST(_resindex, _resbit, _monindex, _monbit)    \
> >     DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)
> >
> >
> > in rzv2h_cpg_probe() (.num_resets =3D ARRAY_SIZE(r9a09g057_resets))
> >
> >     resets =3D devm_kmalloc_array(dev, info->num_resets, sizeof(struct
> > rzv2h_reset), GFP_KERNEL);
> >     if (!resets)
> >         return -ENOMEM;
> >
> >     for (i =3D 0; i < priv->num_resets; i++)
> >         memcpy(&resets[i], &info->resets[i], sizeof(struct rzv2h_reset)=
);
>
> You can combine both using devm_kmemdup().
>
Thanks for the pointer.

> > And have the below xlate function that will convert id into index ie
> > index into rests array.
> >
> > static int rzv2h_get_reset_index(struct rzv2h_cpg_priv *priv,
> >                  unsigned long id)
> > {
> >     u8 reset_index =3D id / 16;
> >     u8 reset_bit =3D id % 16;
> >     unsigned int i;
> >
> >     for (i =3D 0; i < priv->num_resets; i++) {
> >         if (priv->resets[i].reset_index =3D=3D reset_index &&
> >             priv->resets[i].reset_bit =3D=3D reset_bit)
> >             return i;
> >     }
> >
> >     return -EINVAL;
> > }
> >
> > static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
> >                  const struct of_phandle_args *reset_spec)
> > {
> >     struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
> >     unsigned int id =3D reset_spec->args[0];
> >     int index =3D rzv2h_get_reset_index(priv, id);
> >
> >     if (index < 0) {
> >         dev_err(rcdev->dev, "Invalid reset index %u\n", id);
> >         return -EINVAL;
> >     }
> >
> >     return index;
> > }
> >
> >
> > rzv2h_cpg_assert() and rzv2h_cpg_deassert() which will use an id that
> > can directly index into resets[] array.
> >
> > Please let me know if this is OK.
>
> That would work, too, at the expense of needing a loop for look-up
> (traditional trade-off between memory and time ;-)
> But look-up is only done once (per device), so that should be fine.
>
> It all depends on how many resets you will end up using...
> Memory allocation also has a granularity, so once you have more
> than a specific number of resets, you better use a sparse array,
> and simple indexing.
>
Ok got you, I'll update it and send a new version.

Cheers,
Prabhakar

