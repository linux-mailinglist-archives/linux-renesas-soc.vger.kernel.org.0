Return-Path: <linux-renesas-soc+bounces-7331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503DF931086
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF1E2826D5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 08:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D037818734B;
	Mon, 15 Jul 2024 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK96ecL6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98A187344;
	Mon, 15 Jul 2024 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033086; cv=none; b=jyQHVaTjTUw352bT3lGSjI2iGmKblo6ZDZRaC1sGO59NRB8vUaMEqhpY/JbhJsyWgWBSyRkUIBDyS7PaQ6h1COnMOfSOODlYwR4EB28UJC6I52knej1gqqr7PnhVIFLRbqGBXINkiuj+qzijw6bFT7fOgkazLLaCfrYyoMHKv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033086; c=relaxed/simple;
	bh=i4yD1gZFJr7CqfdBUlA+o7O+9Bb5ZpvRLIn3wKoeVsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/JizV8eaH7JRdNROQWM/8cPAiykDM85kv48bDEcqMrEQp7qzRdAiTUiqdv3xI+vLT/TS0eThCf9FFZOHb83VmZNMNWRp+WBzW4WSN0UAuwowXPjAUXV9m8paL8YbgHdBntJpwSiqtMHVUuBe57cF9GtIE2l+s2MNroPBq/Svbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK96ecL6; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4f2f39829a9so1399805e0c.2;
        Mon, 15 Jul 2024 01:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721033084; x=1721637884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgTjx1S0gPDJQLRjGbMZdaL2/PHzlmKPyNwLkSk+q54=;
        b=nK96ecL6x9n3wUgV3k3KWiOm73Fib3Z/616idJ+JiollUUDB23WFMr0lJqN1QRfrjK
         vsTs3CANkSyQ12yiXgQlqxtQW3IN7HEIAzwwzTWCFGl99gt6xd3qwDWJMzIBFcdBULtv
         8vjmKjw+AmgQLQtS0cjDZIARHRsIIHhyPmiZ18HyevMnU4o1z9/cdAjBtrFPVio4DhZ/
         qokNQuz/1192Uyz7ISM/hLBGSBBXXsDzmfrWZ7+GfCBOMiewDpjvsYZlDmwWXJBUOjKm
         0cXBXEKaEeCDUjfu1ZPQ7Tx+GZ6NKJQxk8XWkCXQH+VVs0gZ7ffIFwa4/PqyTgHp9jJZ
         K0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033084; x=1721637884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgTjx1S0gPDJQLRjGbMZdaL2/PHzlmKPyNwLkSk+q54=;
        b=vzwb52cN/ZhDn5c6jpMJFLImzWP631OK7NWJl8NCD6Rd7X3ETgvI4my6JxS6tXZ/Iq
         AZRNhotnHj/4iQJ0pZuaAPP5zPS1/BUl8PLG2v+dNQpb4s08Vo7csKoDOBIW8q4jjSUf
         TbCX8Pb9yrAe2CWUQoyg/swUkj+glknC87dmG6b/sq9EzeK88rNwlxVDcESgR7wHLeLV
         dm5IHWwHx8RyPRPp3ulvFUx/Ss77iEAB9Y6H3wICUBh/6bKTsGOKYDBMvp/2Z3lyAQTT
         yjDaVzPqtNiIKas6xXjYou7uDyJzQKXYAutQAQru07jx4lx7SXhUieBFfyF8CEj3nDYC
         hXkA==
X-Forwarded-Encrypted: i=1; AJvYcCU4Wj69GOa+nYx0LSR2bN64XDP/v+yXZib9q6+4/wGigKHhQJxA8XWHSCK3fhzd/QJt0RwZ9WpI8IlmCzNypWu/n3f76QFr1KYB9qRpPef11WlRIeTJaIlj/DQu+lKj9H+pqJ+xMWiJnmYuX3i2pVmt/sxGHN9009XCL12JS5eUKY3c1FW2Tm6TfXJOw15QkzTn5Xgr2rpb/nkVH8hk2LU7BH1ctp/+
X-Gm-Message-State: AOJu0YyW7g2I5QjCZeZkK/qzqWNYl0jRuI5Fnto3jxd6gg0q8jKPhQk1
	xAZ5IwifdJzhbK5MeZvWxwYfatvQduDNPjNL4EGZERbLBDftqH0AtonmOoEkRjlCW96kSASZ/pR
	zKnzCqKtHtut5QApA6B92xZgBcFmTPJnnDOU=
X-Google-Smtp-Source: AGHT+IFmi0cLv6M0EbxWLmzPMdPpe7qghgEQdEXkjBOnZqxsiaAxR4k53lGNPsCvNE4L3o6Yad4axhopYwcFpOjPmv0=
X-Received: by 2002:a05:6122:2981:b0:4f2:ea44:fd14 with SMTP id
 71dfb90a1353d-4f33f18e2e5mr22374157e0c.2.1721033083797; Mon, 15 Jul 2024
 01:44:43 -0700 (PDT)
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
 <CA+V-a8ui9AKDOZzg_dgPXeGhGE-+rBHU8O1tpdb8w8myo-1p5Q@mail.gmail.com> <CAMuHMdVyqBmipMLeYd0nw3kEHwc=RvWJvrD8EYKVt+36E7oS+A@mail.gmail.com>
In-Reply-To: <CAMuHMdVyqBmipMLeYd0nw3kEHwc=RvWJvrD8EYKVt+36E7oS+A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Jul 2024 09:43:10 +0100
Message-ID: <CA+V-a8u_oMxG8QmmK=_y8z6O_H-22SyCkje-VrQVqHn4H=5oow@mail.gmail.com>
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

On Fri, Jul 12, 2024 at 6:11=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Jul 12, 2024 at 5:29=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Fri, Jul 12, 2024 at 4:23=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Fri, Jul 12, 2024 at 5:14=E2=80=AFPM Lad, Prabhakar
> > > <prabhakar.csengg@gmail.com> wrote:
> > > > On Fri, Jul 12, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
> > > > > On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csen=
gg@gmail.com> wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renes=
as.com>
> > > > > > ---
> > > > > > v2->v3
> > > > > > - Dropped num_hw_resets from struct rzv2h_cpg_priv
> > > > > > - Dropped range_check for module clocks
> > > > > > - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> > > > > > - Added support for critical module clocks with DEF_MOD_CRITICA=
L
> > > > > > - Added check for mon_index in rzv2h_mod_clock_endisable and
> > > > > >   rzv2h_mod_clock_is_enabled()
> > >
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > >
> > > > > > +/**
> > > > > > + * struct rzv2h_reset - Reset definitions
> > > > > > + *
> > > > > > + * @reset_index: reset register index
> > > > > > + * @reset_bit: reset bit
> > > > > > + * @mon_index: monitor register index
> > > > > > + * @mon_bit: monitor bit
> > > > > > + */
> > > > > > +struct rzv2h_reset {
> > > > > > +       u8 reset_index;
> > > > > > +       u8 reset_bit;
> > > > > > +       u8 mon_index;
> > > > > > +       u8 mon_bit;
> > > > > > +};
> > > > > > +
> > > > > > +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> > > > > > +
> > > > > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monb=
it)      \
> > > > > > +       [_id] =3D { \
> > > > >
> > > > > Indexing by _id means the reset array will be very sparse.  E.g. =
the
> > > > > innocent-looking r9a09g057_resets[] with only a single entry take=
s
> > > > > 600 bytes.
> > > > >
> > > > > If you do need the full array for indexing, please allocate and
> > > > > populate it at runtime.
> > > > >
> > > > OK, I will use the radix tree for resets (is that OK)?
> > >
> > > You mean XArray? include/linux/radix-tree.h has:
> > >
> > >     /* Keep unconverted code working */
> > >     #define radix_tree_root         xarray
> > >     #define radix_tree_node         xa_node
> > >
> > Yes, I meant the above.
> >
> > > Given a single xa_node is already 576 bytes, just allocating the full
> > > linear reset array at runtime is probably better.
> > >
> > Agreed, I will create a linear reset array and loop through the array
> > based on reset index and reset bit to match with id whenever required.
>
> With a full allocated linear reset array you do not need to loop,
> but you can just index it by the reset ID??
>
Instead of having a sparse array, to save memory I was thinking
something like below:

/**
 * struct rzv2h_reset - Reset definitions
 *
 * @reset_index: reset register index
 * @reset_bit: reset bit
 * @mon_index: monitor register index
 * @mon_bit: monitor bit
 */
struct rzv2h_reset {
    u8 reset_index;
    u8 reset_bit;
    u8 mon_index;
    u8 mon_bit;
};

#define DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)    \
    { \
        .reset_index =3D (_resindex), \
        .reset_bit =3D (_resbit), \
        .mon_index =3D (_monindex), \
        .mon_bit =3D (_monbit), \
    }

#define DEF_RST(_resindex, _resbit, _monindex, _monbit)    \
    DEF_RST_BASE(_resindex, _resbit, _monindex, _monbit)


in rzv2h_cpg_probe() (.num_resets =3D ARRAY_SIZE(r9a09g057_resets))

    resets =3D devm_kmalloc_array(dev, info->num_resets, sizeof(struct
rzv2h_reset), GFP_KERNEL);
    if (!resets)
        return -ENOMEM;

    for (i =3D 0; i < priv->num_resets; i++)
        memcpy(&resets[i], &info->resets[i], sizeof(struct rzv2h_reset));

And have the below xlate function that will convert id into index ie
index into rests array.

static int rzv2h_get_reset_index(struct rzv2h_cpg_priv *priv,
                 unsigned long id)
{
    u8 reset_index =3D id / 16;
    u8 reset_bit =3D id % 16;
    unsigned int i;

    for (i =3D 0; i < priv->num_resets; i++) {
        if (priv->resets[i].reset_index =3D=3D reset_index &&
            priv->resets[i].reset_bit =3D=3D reset_bit)
            return i;
    }

    return -EINVAL;
}

static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
                 const struct of_phandle_args *reset_spec)
{
    struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
    unsigned int id =3D reset_spec->args[0];
    int index =3D rzv2h_get_reset_index(priv, id);

    if (index < 0) {
        dev_err(rcdev->dev, "Invalid reset index %u\n", id);
        return -EINVAL;
    }

    return index;
}


rzv2h_cpg_assert() and rzv2h_cpg_deassert() which will use an id that
can directly index into resets[] array.

Please let me know if this is OK.

Cheers,
Prabhakar

