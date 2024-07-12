Return-Path: <linux-renesas-soc+bounces-7314-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 159C692FD6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 17:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88E181F218A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B19171E73;
	Fri, 12 Jul 2024 15:23:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD45D17107F;
	Fri, 12 Jul 2024 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720797805; cv=none; b=PRSVrB6nMyREzuxgayUZC/mADEmnT4QqxtWZX5qSexRWXKkWex1AVO2e+x+CbCt/Oi8iEdtAbk9wUnKGRKcwRdvcc2RTCkcvec9WzYT2vcJLVvwEVY/CsmvTM5e9vuQ6lz45bAavi9DzSGk+LUArfgi97P+Z7Vqe6oFjEjXGiyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720797805; c=relaxed/simple;
	bh=CLEleT3E/91hHvbY/LSpElkXfmEV+rF/611m9AQ6ZVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZD2N02eRKT8wj9+siQ46IXihLRGqRAV4a9e9OMVwT8w6RCwH1rjdniwAFeUgy718ZRexnSlIQPJd7PzvkWcl70WoKzMgn5fK5/FY09N0pBnalKc55T0n7iW9rPHiks9p2M3+SLC2L4FwqnK6PlS7/AUpCTIGoRPVPt2Y2Wz7Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-654ce021660so22167657b3.1;
        Fri, 12 Jul 2024 08:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720797801; x=1721402601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caJ13BPt4kPkog3dsyl1U0td6PM/VCqmk+HhBV4Sp8g=;
        b=qHz0LblPXAgYRu5rRP6YsoI5QVmw+mbvOZq1/ilXA+QKAffex7ROjwZr4eHCdZ834L
         3/ble/WOJAiPyy37JIvZD5+zChGPgGrfjedLJY+AP2jHd0Jfs43yN/kjLFmq67ZoLK7p
         PW+ba9a19dNabdXXRkrlr8/2QXL2tQuRsHH14KwJJ56GsnUdlS/qRdXa5o1PnJcJxqAO
         S9YXp8WUIZBa5UQKMK9LmDADefs4oBg2w9shWi/31ATOu3nwEO0z9+7dqZRctaZRe0ts
         T09sPzB6CqZEuhUyhSGBByItJOMbatdzIMA6Wzfrvi19cAN9yb/5eyHzmAqER3+ho0nR
         QEYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuy2U4W+GGHi7JHMf+dLNztmkg90Cx8yGwm6HHJIOOj6yyvLDpushVRevYeYJXbZQRB/fMpPyIxyRW/QYMm2E5hlS3m7h+HR92hPTiIP9cR9jM3uAhiFD6NkB8RHsirsN6aNdFPVVug/T0VWUzrJhPhbiUxBVMLKap6ehlKStG+eEqcdpsEvqBBqbgyrdOQsq92vUVRjFKCA/O8/ufT8w7O2mrSDe/
X-Gm-Message-State: AOJu0YwZwh4rGXzjV6tbFRtDJAx9vLLANOsFcPo1StjDk7CO07yjUWo1
	ywL2cIfnWRGvXed5hpzPKEmeZ/dksoj9UFG6X9s8lBTm+lI0DlOrPUcl+9MX
X-Google-Smtp-Source: AGHT+IHZbHRhykTBDBiMzpqhRZp62YbIt94RxyzFtNQyN6EaIAuCvAwDhFGKOX8Voo3F8mhFSmuZgw==
X-Received: by 2002:a81:844c:0:b0:63b:f6c1:6068 with SMTP id 00721157ae682-659ce3c6018mr106977597b3.32.1720797800678;
        Fri, 12 Jul 2024 08:23:20 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e483ed3asm15124217b3.23.2024.07.12.08.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 08:23:20 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-654ce021660so22167077b3.1;
        Fri, 12 Jul 2024 08:23:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+PsDTQLqS1wp4wgeFXnQ94a1GLXHxkAZL0LGiff9IXOjpKZSqLdNEKzo7tTk5s98erSc3JV1Ph/ka7HX3NckidShsu7NUDh0o+5aMTm6nQVo4OrECfQzYC7fVD2egqHXF/zQuXOfEkKCWjysMlV916SKW4z0RAvH9e24CNKPQ7EVI/Wfd7zSCZwtNlLy/9t6z677dPIbG8DmQAogOvZM1yHN8UcWB
X-Received: by 2002:a05:690c:dd3:b0:62f:b04c:2442 with SMTP id
 00721157ae682-658ee7912d5mr149730507b3.7.1720797799770; Fri, 12 Jul 2024
 08:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com> <CA+V-a8vABF6vg+J7DAGzgnw8612oe6VfJkc5y-krySvnpAnPkQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vABF6vg+J7DAGzgnw8612oe6VfJkc5y-krySvnpAnPkQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 17:23:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXuyQZ=SFfQa5kvZTwYa0uRXc7khJ-vOYBRE5SCd11rPw@mail.gmail.com>
Message-ID: <CAMuHMdXuyQZ=SFfQa5kvZTwYa0uRXc7khJ-vOYBRE5SCd11rPw@mail.gmail.com>
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

On Fri, Jul 12, 2024 at 5:14=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Jul 12, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
> > On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v2->v3
> > > - Dropped num_hw_resets from struct rzv2h_cpg_priv
> > > - Dropped range_check for module clocks
> > > - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> > > - Added support for critical module clocks with DEF_MOD_CRITICAL
> > > - Added check for mon_index in rzv2h_mod_clock_endisable and
> > >   rzv2h_mod_clock_is_enabled()

> > > --- /dev/null
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.h

> > > +/**
> > > + * struct rzv2h_reset - Reset definitions
> > > + *
> > > + * @reset_index: reset register index
> > > + * @reset_bit: reset bit
> > > + * @mon_index: monitor register index
> > > + * @mon_bit: monitor bit
> > > + */
> > > +struct rzv2h_reset {
> > > +       u8 reset_index;
> > > +       u8 reset_bit;
> > > +       u8 mon_index;
> > > +       u8 mon_bit;
> > > +};
> > > +
> > > +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> > > +
> > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit)   =
   \
> > > +       [_id] =3D { \
> >
> > Indexing by _id means the reset array will be very sparse.  E.g. the
> > innocent-looking r9a09g057_resets[] with only a single entry takes
> > 600 bytes.
> >
> > If you do need the full array for indexing, please allocate and
> > populate it at runtime.
> >
> OK, I will use the radix tree for resets (is that OK)?

You mean XArray? include/linux/radix-tree.h has:

    /* Keep unconverted code working */
    #define radix_tree_root         xarray
    #define radix_tree_node         xa_node

Given a single xa_node is already 576 bytes, just allocating the full
linear reset array at runtime is probably better.

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

