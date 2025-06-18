Return-Path: <linux-renesas-soc+bounces-18503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C440ADED29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 14:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFFB41616FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 12:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165D32E2651;
	Wed, 18 Jun 2025 12:59:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2CC2E06EF;
	Wed, 18 Jun 2025 12:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251546; cv=none; b=SCNVs5WfFbsvwbfRy0WeTb+Z80lmvzYTdghloPway1c+0tH59fuf24tVrPNM/ovBUr6EjU2FnzWTpx7gfppEpQ4RowOLivfbvUppJiJVdKEhyn0x5OMPDDQSnZROm3WedBd/IuCSC0OuAv0Gee/yhvyuk5rAzaBhEXqxNIhR560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251546; c=relaxed/simple;
	bh=sUE5LGpFJyA5Qa0xAihWgfI7AQnk+dJiPpO9R8rKSXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsZxL1NmVinP9ZnZiXPxNxamP0pggPvJvAIBYq4gmBfofqPqavIP96H8UkEtevL92Y6zOJWOqwvLpFOgns+tuComrjqUrvJ/9SC3/6zcxM6sozr0XnOPhwZNvhdJimwH3ZsPctzkDEcXKpANFYzGSbhkPNxPYuhDUxTpP07Y8DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-877d7fa49e0so4465152241.2;
        Wed, 18 Jun 2025 05:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251542; x=1750856342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1meYcoxvrbd2d7zCFlmnwZmD+qg+m1hMmuA8AxCWAmU=;
        b=I2k3MwZeXntDDAhHLW+fqVx4YvfOBfGZWZmiVW5q91+VxpEMtM+9+vuU+dT9uc1k+V
         fpUfu95rMz5n9j8xo5/vWRlBqge26k9vKm0dt/j8u4sfpTajxodkSUN/DbXp15jZYdz4
         2c30xYnad/K6lR2rkH/FYOVG7NZdD8ciWvi7fS91y3eFBbY7EFFPmLijBAdTjRDkYfKm
         RxIlYxeyWWGrHzzwPJUWrdihtwrt+XApo+VLamS3UF92mLMGsmSxvvB/6f+80xZzF9Rf
         YBD5m/ftAFIH08JAu0gao2DL/X2DSo3vYx9jgchXAI2ZSzIdlVJ3BUoWQR5eMxbUQJs/
         fnjg==
X-Forwarded-Encrypted: i=1; AJvYcCUgdE/pMR2NabK6lSYHxXyKAS3U2dZs5SInFXOktBEdL7uaA+eQL0IlOnt04i9DMipJqfpEmX/2qKZkEMHyThRwsSo=@vger.kernel.org, AJvYcCXTGxjb9Su3e7lodBX77X2+AlodbIfuxKnhwkhr5Je3T9TPLpGKWVgZrd5mNtOueBaxoVPzYs7eQx1V@vger.kernel.org
X-Gm-Message-State: AOJu0YznEA5FEU69QHkeYiehNRL8OmFOekM2ObTBxWRRtbcaq3oFw2Ir
	YBhttyZthQQyJbfgTSC6+nVe4jUFlFO+3EB3u2gpJB6Krhxcrdi6CW2IqNo+hEzd
X-Gm-Gg: ASbGncsX/XXRFKh8oLeoIzmhzUS5gXXHPToqfRoTBeUrmGoP2cHdm7gNhH8qHEXQgS2
	dYkve0MIA2nceNLyNNK29qBEoXgShUJgq6AMQgSeHa1reoErll8d/fiIpf01cDYrOvhztPjgvc7
	xZSPG2xTTRsXCVJl982ui+6tfMWqh7rdj9XTDq/Vkk1uvnfJEZySq/b3g/5ExZg28CPum+lfVSA
	AwjSu1O3/LzzKmVdS1JF/IgXZf4pGmj7wi2RPLCHZ16+zfnkqNVr3sumXZjbjPy67o4NSqjWr8B
	KoBiJeqj5arM+F7mK9zFintzKNc0sd67rTplNPYuvZQHFdmMQBPJj2I1be6r7T48J175PEnGxxS
	DgUUYXpTZwfE1QHfhI2PM84YZ
X-Google-Smtp-Source: AGHT+IH9kOtKhJCquLZLD3ZclHbELqy5aJRA58At7h/AfUyCpxJGcjRk7y2l3imgtEZIyaE/TCNyeA==
X-Received: by 2002:a05:6102:598e:b0:4e6:245b:cf57 with SMTP id ada2fe7eead31-4e7f625b10cmr14082479137.24.1750251542463;
        Wed, 18 Jun 2025 05:59:02 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7f239a920sm1828791137.27.2025.06.18.05.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:59:02 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-87f2adec2b7so1215318241.0;
        Wed, 18 Jun 2025 05:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQhNVR5BZxyXW7YVhj4z30je9ZNUIqnfJC+2Hb7C4nlceSYS/Vu1ojWyA9D3wqJGmPo/o77ntTzWAG@vger.kernel.org, AJvYcCXXLe5c3w6ke6NgEr8l2I207Pef4cFYIM1sShWCEW6qzqO1iivautn6TmBNjPYkoFHn64b3N4VtlD3v3Ocpi7TEZZo=@vger.kernel.org
X-Received: by 2002:a05:6102:50a1:b0:4e6:d7af:a7b1 with SMTP id
 ada2fe7eead31-4e7f6163427mr11792185137.10.1750251541926; Wed, 18 Jun 2025
 05:59:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com>
 <20250311113620.4312-2-biju.das.jz@bp.renesas.com> <TYCPR01MB11332F064115080582332B78986AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdVy3B+i2p6unkX-n=7AYCfP5B8sW7F9GJi7URcvniGA2A@mail.gmail.com>
 <TYCPR01MB1133206083EC0249A827261EB86AD2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <CAMuHMdUyY8SsUQEZwxdCK-ggPuYy8L_WwnUgq3Cj7oYiTcyNTQ@mail.gmail.com>
 <TY3PR01MB11346123B74D86590C0F8B9CD86AD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWevyJ8Z4YWYx0rr=_TD0OTywbkPfNwRcw5k=yDV-i2Ow@mail.gmail.com>
 <CA+V-a8t1siG17NKna-ACUzCoXFTOyVxuLonTVSRLnNq1ie3iTg@mail.gmail.com>
 <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com> <CA+V-a8u4PgttE0LaH7M=-5Br400sNE1gzk_a3L_9jfXZgCLd-Q@mail.gmail.com>
In-Reply-To: <CA+V-a8u4PgttE0LaH7M=-5Br400sNE1gzk_a3L_9jfXZgCLd-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 14:58:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQ7pK+zvZm6MHsfGRctyOSurQpDYJztSfD6P1gvuw_RA@mail.gmail.com>
X-Gm-Features: Ac12FXwAn1i7if3raSJXh_qxLoG4NjstR8JSjZJWfoo_pM_Eodsqb7Z5GGJf2Sw
Message-ID: <CAMuHMdVQ7pK+zvZm6MHsfGRctyOSurQpDYJztSfD6P1gvuw_RA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: memory: Document RZ/G3E support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Wed, 18 Jun 2025 at 14:06, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Jun 18, 2025 at 8:03=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.com>=
 wrote:
> > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon, 31 =
Mar 2025
> > > > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Document su=
pport for
> > > > > > > > > > the Expanded Serial Peripheral Interface (xSPI) Control=
ler in
> > > > > > > > > > the Renesas RZ/G3E
> > > > > > > > > > (R9A09G047) SoC.
> > > > > > > > > >
> > > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > >
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/Documentation/devicetree/bindings/memory-controll=
ers/renes
> > > > > > > > > > +++ as,r
> > > > > > > > > > +++ zg3e
> > > > > > > > > > +++ -xspi.yaml
> > > > > > > >
> > > > > > > > > > +    spi@11030000 {
> > > > > > > > > > +        compatible =3D "renesas,r9a09g047-xspi";
> > > > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x20000000 0x10=
000000>;
> > > > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISI=
NG>,
> > > > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING=
>;
> > > > > > > > > > +        interrupt-names =3D "pulse", "err_pulse";
> > > > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD =
0xa0>,
> > > > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0x=
a1>;
> > > > > > > > >
> > > > > > > > > On the next version I am going to update spix2 clk as <&c=
pg
> > > > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> > > >
> > > > According to the RZ/G3E clock system diagram, (the parent of) clk_s=
pi
> > > > is derived from (the parent of) clk_spix2, not the other way around=
?
> > > > So you can model clk_spi as a fixed divider clock with parent clk_s=
pix2
> >                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
[A]

> > > > and factor two.  I.e. provide a new core clock R9A09G047_SPI_CLK_SP=
I
> > > > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> > > >
> > > With this approach when R9A09G047_SPI_CLK_SPI is used as a core clock
> > > and XSPI node is disabled the clk_summary reports the core clock is O=
N
> > > (while it's actually OFF).
> >
> > Is that a real problem, or is it purely cosmetic?
> Just cosmetic tbh as despite being a MOD clock we have to define it as
> a core clock in the DT.
>
> > > Can we maybe use a unused ON index and ON bit for example 25, 0 (ie
> > > 0x190) and represent this is a module clock for example for the
> > > spi_clk_spix2 clock and use this in the DT and let the CPG core code
> > > handle such turning ON/OF the module clocks based on the enable count
> > > which will be handled internally in the driver?
> >
> > Please do not use "unused" module clock bits.  These do not describe
> > the hardware, and may actually exist in the hardware (try disabling
> > all undocumented module clocks, and observe what fails...).
> >
> Agreed, "unused" module clock bits were only used as a dummy. The
> read/write operations were only performed on the actual bits which are
> documented in the HW manual.
>
> > If spi_clk_spi really must show being disabled, you can change it
> > from a fixed divider clock (which does not implement .{en,dis}able())
> > to a custom fixed divider clock that does implement .{en,dis}able()
> > and keeps track internally of the fake state, or even looks at the
> > state of spi_clk_spix2?
> >
> Good point. Maybe instead of implementing the dummy .{en,dis}able() I
> will implement the is_enabled() + (clk_fixed_factor_ops). The
> is_enabled() will take care of reading from the MON bits and report
> the actual state of the clock.
>
> > However, upon second look, spi_clk_spi is not implemented as a fixed
> > divider clock with parent clk_spix2, as described above:
> >
> >       .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
> >          .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> >             spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> >          spi_aclk          0  0  0 200000000  0  0  50000  N
> >          spi_hclk          0  0  0 200000000  0  0  50000  N
> >       .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y
> >
> > Instead, they both use pllcm33_xspi as the parent clock.
> > Apparently I missed that in the review of RZ/G3E XSPI clock support.
> > The changelog for that patch does describe the correct topology?
> >
> The topology is correct for RZ/G3E, spi/spix2 are sourced from
> pllcm33_xspi divider and there is a divider (/2) for spi.

Both spi_clk_spix2 and spi_clk_spix have .pllcm33_xspi as
immediate parent.

[A] describes something different:

    .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
        spi_clk_spix2  0  0  0 40000000   0  0  50000  N
            spi_clk_spi    0  0  0 20000000   0  0  50000  Y

I.e. if spi_clk_spix2() is disabled, spi_clk_spi() is disabled, too.

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

