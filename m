Return-Path: <linux-renesas-soc+bounces-7529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101993C625
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 17:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDEA282876
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4697719D07C;
	Thu, 25 Jul 2024 15:07:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6107482;
	Thu, 25 Jul 2024 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721920050; cv=none; b=OEdG08w8RJLtYWZjAlrWJrYqduEVWoRQj91zpzUpyMSEmp5jd1/8rL166L6S66/OHa91WOuGirKPca4r9I8U1XaxzCYyGt/9qtTzdgqoZHI2EdwvH8MJl8tkeua5kQ7XW7CLHoOMyXVAsAhh+BtNBrQl2aBUsYVTtVu2h8jy8I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721920050; c=relaxed/simple;
	bh=BEh/sCTy4zNiPRAXhSYF+nxfCWBN9Lnjv8lwTazSLAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHc6XG9LWDtykqbC7r7OStVKdTI8prKs9ivhShR9tGx5BBpNhd6jOMtg82HAPkq1506If/oYnRKptb4aN7o4p5JHFie9P8uvGYNIC1rbp8aymvrTJGDtqwXpNgT04V5hG+8lgxTdLaNan25/RNrSoCpfaKlXgW1IPAxbpkjIudg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-65f8626780aso10348917b3.3;
        Thu, 25 Jul 2024 08:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721920047; x=1722524847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx5Ed2YLCRreb1v6l0Ht4jWVloA8xOeuA1//EueecNo=;
        b=lWGW3pTBjMrRpicxz3t5dPkILkDVv89yvh9Ox9Tu9orrqMJqrYQWWJAyPEDWWFGBrr
         P29/rnESXErgw6TaObEPXdgUuOqhE0G7m8avfxu5dIuZtW+lMJcw9eSZalUSESEPGoEY
         y+FxXHyuP65icG3XL4JlzrFSOommjeGMlLcW04GlVu+Qc/n2rGuOXwavJEkCI+8g/luM
         eAjfOcHX4pk8WxcdYbtKvjorNdr1emYKtoFXTbuKKnk8D0x37OliShCgsRqq+b1iw+wY
         mctmpxxKwHJraNxcRpn9wpbGwCveukMaX2Jv5NzUzPdapL4p5RAjsohrsql8VDMvrXwQ
         YpSw==
X-Forwarded-Encrypted: i=1; AJvYcCWH70ZOQIQT0b5vsCEYVcFnM8qA3XvJp320VlVSYKS61t8ZU+uauH0/c24ZW0uj4AswqnJqpcC0fJgv+iTPWnzsda/7xOpfDdcxUG+eryjj+Ldv1XCyxzsPFHD2OMhlWExVXKOBcFy3TeGSwRpXW6QCZhYbdSZid+sCPmWPeUUh2SzYlBQZA/twhll5
X-Gm-Message-State: AOJu0YxSMDOxusDDMOkjCos1WC0R9INSGaTYDcxt+UNqIBZwrJO9BdBz
	sljVXBHryMIU8piIUa0K7vJh+YRftdNmkfIb0BTevyesifjRAOCsWm4yemIz
X-Google-Smtp-Source: AGHT+IHIY46VBxj//nudjUvJ8zOpDY4bAwsZCHerPEvmzZQnTVQvLSV0f35KCBH63u3GjNRS/uVcVQ==
X-Received: by 2002:a81:c24e:0:b0:64b:a3f0:5eee with SMTP id 00721157ae682-675b6576b57mr21873877b3.17.1721920046678;
        Thu, 25 Jul 2024 08:07:26 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b024abcsm4206237b3.85.2024.07.25.08.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 08:07:26 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66599ca3470so10720657b3.2;
        Thu, 25 Jul 2024 08:07:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUzAMsRq4wxmuI94hheTv3EmUkVvphB45miMYoyUQI0DwLiFVUfWbSV7N1z0/6fuVSV2NHywaXynSO2ukRvops0k+f6spOwy+zBC+sEXA6h9iD/tX6wj4w7StS97p+sLERaOk9CZ9LA0ES3jlQvpQ+/vSqUftVBi+I4ANccSFZ1WYSVMymMSIuTL06
X-Received: by 2002:a0d:ee07:0:b0:64a:e220:bfbf with SMTP id
 00721157ae682-675b6c2fd50mr22917677b3.23.1721920046025; Thu, 25 Jul 2024
 08:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240725133932.739936-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUpZ6KWdjveVSS72jdSuySCB7KVgo=TSr7tt=G295bPXw@mail.gmail.com> <CA+V-a8vmiaYQnf4mCJD-Zx8BqSiDUS5NpaskYkOkuCpE7qH+3g@mail.gmail.com>
In-Reply-To: <CA+V-a8vmiaYQnf4mCJD-Zx8BqSiDUS5NpaskYkOkuCpE7qH+3g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Jul 2024 17:07:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVtdh-ykbm4EOoXU_ZTjOp9Jz9E00OusjtB1A-msTySjg@mail.gmail.com>
Message-ID: <CAMuHMdVtdh-ykbm4EOoXU_ZTjOp9Jz9E00OusjtB1A-msTySjg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044(l1): Correct GICD and
 GICR sizes
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Thu, Jul 25, 2024 at 4:59=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Jul 25, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Thu, Jul 25, 2024 at 3:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The RZ/G2L SoC is equipped with the GIC-600. The GICD + GICDA is 128k=
B,
> > > and the GICR is 128kB per CPU.
> > >
> > > Fixes: 68a45525297b2 ("arm64: dts: renesas: Add initial DTSI for RZ/G=
2{L,LC} SoC's")
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > > @@ -1043,8 +1043,8 @@ gic: interrupt-controller@11900000 {
> > >                         #interrupt-cells =3D <3>;
> > >                         #address-cells =3D <0>;
> > >                         interrupt-controller;
> > > -                       reg =3D <0x0 0x11900000 0 0x40000>,
> > > -                             <0x0 0x11940000 0 0x60000>;
> > > +                       reg =3D <0x0 0x11900000 0 0x20000>,
> > > +                             <0x0 0x11940000 0 0x40000>;
> > >                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>=
;
> > >                 };
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm6=
4/boot/dts/renesas/r9a07g044l1.dtsi
> > > index 9cf27ca9f1d2..6f4d4dc13f50 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > > @@ -16,3 +16,8 @@ cpus {
> > >                 /delete-node/ cpu@100;
> > >         };
> > >  };
> > > +
> > > +&gic {
> > > +       reg =3D <0x0 0x11900000 0 0x20000>,
> > > +             <0x0 0x11940000 0 0x20000>;
> > > +};
> >
> > What's the point of overriding this here?
> >
> Are you suggesting we drop this, as we have no users for it currently?

I didn't mean to drop it because we have no users of r9a07g044l1.dtsi.
I am just wondering what would be the side-effect of not overriding it?
After all, all r9a07g044 SoC variants have the same GIC hardware block?

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

