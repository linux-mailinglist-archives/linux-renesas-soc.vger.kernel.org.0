Return-Path: <linux-renesas-soc+bounces-7577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0218393DED8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jul 2024 12:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6211E283A09
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jul 2024 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFB557CB4;
	Sat, 27 Jul 2024 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cm9C4aN5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390454A05;
	Sat, 27 Jul 2024 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722077471; cv=none; b=qSnIvJWp+X8u4sGF4EmVwV4+FquBKbdqtYl51frrVYJpcbf8gUYapl88aZQ84ym1rYSf6BMISz2lCpmOvPifeGvU0/7asvXWASbTwznvvDgHOrfepyv2STJjUVTmh2QfZfTRPI5nIVbFRDb4fkGXeTQ/uSghcjLhMJw0SSJ9lP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722077471; c=relaxed/simple;
	bh=Qu8yTtXSpUt6sF5POGQHHaqx/q5RCwG2FKnWhbzzRFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plxDOeu5XGmnosob8IFPp6Ih6i8Qv1fBy6izzSsggnvaFiVqIZyTU4chTVIROc8PFzd4A0nbA+B1TtAetrKnvozZ1PwEzpGdA2kzSMDMrtCx1t2vfg6TsMVJcV2jcoB6WtLTLTG1N7Xj4q+8WWXDHTiYSZl8bfwrWhgDcvryzK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cm9C4aN5; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4f51af903a7so786656e0c.1;
        Sat, 27 Jul 2024 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722077468; x=1722682268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV+4f6D3i6gGUSXVzy2/TC966i3OBF3UHvdHkbSiA2Q=;
        b=Cm9C4aN59IwzSQM0aVoqjq8VtpwKf4+O4T6RkE0sPCi9Ft5rlHFow848+7oK4tx5Mr
         UfAIoPeyNDXk1EuF4V3wFQl/Hkx8Zu+M9APAAYNxWNcHZ6ZZgSQHdE1FyyWi/SmxYWQE
         /uEwRGLzSHQNngDxQ45YUIPGojM0hGykVVWBTDPdAcjuz1KXSf6MVeNmw3LfacTTdPh5
         NoDiDn0tH9YANhaLVocHVlnppVjTDNpYM28+dpqvqxA6xsMxaOSkvp0CeZUV+frn3ag7
         69D7d6goprlW3U7Cd5JPpjAKV1jSf+kdpdcyVfY1xd1Te/LyTzDXhErM31P+tKq+JuIV
         /DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722077468; x=1722682268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV+4f6D3i6gGUSXVzy2/TC966i3OBF3UHvdHkbSiA2Q=;
        b=T2FNqLo04XS5+CQ3TOBxkxHZlC04R1hG6Ys0sIYqQfXkl0TBSMFrEDg9gSQwO3Y4hx
         23nTC3spoveDIVn2yKeJy9Uc3UuvAN9HSkDy8O5vlUz8tL4Wkpy7v29gR/5V77maEopk
         eaps1Zivq8QilqnzpaBPfLGHjqoII1qVCzJb2QJExHPvX3zbdKz/s4GDVohDpydpW9sf
         /Pf3tEj0paGJTkY1R1WeLUp32Qk5LQA9f8GfJ88WTI3EeAy8RDOk8FfXvTcj6LZAZ/JV
         wLVva7pvgdGEqRZ3IUbuTlcVPCnh+M9KznxCGZHx2EWyMC3yM5avVElg+9PwhcR4QAi+
         dFWA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ems4odbgJfVFKdhoNq1pUunpvsrhYCB6B7cXjt9rVaHlY+c6qIG/+r6CZrhA/bdJ2ya25uoop4GXAgpJH120bt2yYbR8C0FSbL6pisIF9U/xY6nhiKppOhsWFGzk6pJXKtd40s2Ctz7xr24POJbaNBBqRfA/4iiX40ctAtp1F23+MKf0msa2MRk4rFrTqN7cJ1GEtga/wE2I/Lj4xFaN/VK3zNvq
X-Gm-Message-State: AOJu0YwKGRlYZ4BWIycArDmQHpA+UT1lp6imR3ei8E/w9Bvg+MFVHESJ
	tBkNUwT2Bu3EeIvRZr0xykK7kd5PwlWqTW5j9st/g6x2vapufw5rqhymw1q7F3120+XfCKLkGaL
	9kxCxrTlqxxUPOXq4aERrJgwQ+Qc=
X-Google-Smtp-Source: AGHT+IFDofTQ5t5fQPInbqJgKu0ImAUboS7K+Szr0J3dkPTY4eTsCO7bbkwelJWhfNatDJOpbUzKHeeTK2f/32irboU=
X-Received: by 2002:a05:6122:35c2:b0:4f5:312a:6573 with SMTP id
 71dfb90a1353d-4f6e606417emr1158988e0c.5.1722077468216; Sat, 27 Jul 2024
 03:51:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240715125438.553688-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUvfAqJR6=4MG3hXC6cn1AnKz7+RAp4GG1jvdwOctgNzQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUvfAqJR6=4MG3hXC6cn1AnKz7+RAp4GG1jvdwOctgNzQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 27 Jul 2024 11:49:14 +0100
Message-ID: <CA+V-a8uBL-2DeAtu6BnF37Loe_fT6PNbAx=8O9acTR1Ey2zRrg@mail.gmail.com>
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

Thank you for the review.

On Fri, Jul 26, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Jul 15, 2024 at 2:56=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add family-specific clock driver for RZ/V2H(P) SoCs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4
> > - Dropped masking of parent clks with 0xffff
> > - Dropped storing mod clk id and now calculating it
> >   based on index and bit.
> > - Made parent to u16 in struct rzv2h_mod_clk
> > - Made a copy of resets array in struct rzv2h_cpg_priv
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +/**
> > + * struct rzv2h_cpg_priv - Clock Pulse Generator Private Data
> > + *
> > + * @info: Pointer to platform data
>
> There is no longer an info member.
>
Agreed, I will drop it.

> Hint: W=3D1 would have told you.
>
Thanks for the pointer.

> > + * @dev: CPG device
> > + * @base: CPG register block base address
> > + * @clks: Array containing all Core and Module Clocks
> > + * @num_core_clks: Number of Core Clocks in clks[]
> > + * @num_mod_clks: Number of Module Clocks in clks[]
> > + * @resets: Array of resets
> > + * @num_resets: Number of Module Resets in info->resets[]
> > + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> > + * @rcdev: Reset controller entity
> > + */
> > +struct rzv2h_cpg_priv {
> > +       struct device *dev;
> > +       void __iomem *base;
> > +
> > +       struct clk **clks;
> > +       unsigned int num_core_clks;
> > +       unsigned int num_mod_clks;
> > +       struct rzv2h_reset *resets;
> > +       unsigned int num_resets;
> > +       unsigned int last_dt_core_clk;
> > +
> > +       struct reset_controller_dev rcdev;
> > +};
>
> > index 000000000000..33631c101541
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
>
> > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)     =
 \
> > +       [_id] =3D { \
>
> Indexing by _id means the reset array will be very sparse.  E.g. the
> innocent-looking r9a09g057_resets[] with only a single entry takes
> 600 bytes:
>
>     $ nm -S drivers/clk/renesas/r9a09g057-cpg.o | grep r9a09g057_resets
>     0000000000000038 0000000000000258 r r9a09g057_resets
>
Agreed.

> So please pack the array here, and either unpack it while making the
> priv->resets copy, or implement translation ("look-up") from ID to
> packed index in rzv2h_cpg_reset_xlate().
>
OK, I will implement the below:

#define PACK_RESET(_resindex, _resbit, _monindex, _monbit)    \
    (((_resindex) << 24) | ((_resbit) << 16) | ((_monindex) << 8) | (_monbi=
t))

#define DEF_RST(_resindex, _resbit, _monindex, _monbit)    \
    PACK_RESET(_resindex, _resbit, _monindex, _monbit)

#define GET_RESET_INDEX(x)    (((x) >> 24) & 0xFF)
#define GET_RESET_BIT(x)    (((x) >> 16) & 0xFF)
#define GET_MON_INDEX(x)    (((x) >> 8) & 0xFF)
#define GET_MON_BIT(x)        ((x) & 0xFF)

static int rzv2h_cpg_reset_xlate(struct reset_controller_dev *rcdev,
                 const struct of_phandle_args *reset_spec)
{
    struct rzv2h_cpg_priv *priv =3D rcdev_to_priv(rcdev);
    unsigned int id =3D reset_spec->args[0];
    u8 rst_index =3D id / 16;
    u8 rst_bit =3D id % 16;
    unsigned int i;

    for (i =3D 0; i < rcdev->nr_resets; i++) {
        u8 cur_index =3D GET_RESET_INDEX(priv->resets[i]);
        u8 cur_bit =3D GET_RESET_BIT(priv->resets[i]);

        if (rst_index =3D=3D cur_index && rst_bit =3D=3D cur_bit)
            return i;
    }

    return -EINVAL;
}

Let me know if this is OK, or to avoid looping in xlate maybe we can
have a packed entry in the resets property of DT by this way we can
avoid having the resets array all together?

Cheers,
Prabhakar

