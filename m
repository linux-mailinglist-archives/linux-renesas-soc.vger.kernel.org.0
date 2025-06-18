Return-Path: <linux-renesas-soc+bounces-18508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2D6ADEEC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 16:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66DE117694D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jun 2025 14:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0B22EAB6D;
	Wed, 18 Jun 2025 14:03:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371952EACF8;
	Wed, 18 Jun 2025 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750255386; cv=none; b=OV1LYVpqZlnf/WNvBpeEhVx0c290qGpFeRF7b09hY/6kkOIPatAvEztaa81eG0cJx8SZ9y40LzKRrDMQ50dB3uvHXkAJKmLfpW8of1JWNoBDi65dazgf5ZQ7gZMpm4hqJVFgmbqttg3t8t5xXyd7k5PehDzPcO4lZ29UY868xIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750255386; c=relaxed/simple;
	bh=hXNpekz5LoJ3CyM0ijrbGhyFDUXv+oWwCtm1gWZeT5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUubSYjpWcoUcgJkRzMfUGJA+mNCVC7jJjoI20dXjYXRFIOU7znXwTt1ZL6MStA47iAr1HPo9kU8np0rRpdU5T3In98Suotl6RHNy52SWDJGHbUff1y9PIxAs4Gwc0Z3UuGckm8X/zc0FbuInCyIMIDuwRHr7zbuXFamb2elDrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5675dec99so867636685a.0;
        Wed, 18 Jun 2025 07:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750255382; x=1750860182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UquoSacexH9KMsNGG6crsEB7G5KSquyLXIpYFBqfNn0=;
        b=Ttx/kpw3zT9b0o0KckUhYk+Jnopt03seYRm4VhfXgBlDTyKW+1Q7tszowlQ5SlJgUr
         /fw9RT2IMnoCiUqtazPdsfKbG13zEzHfT3jpsm5Hx+TAv2wnxvqb7Cfpb8rFTPgJ9O5T
         7P9fgUzAFORecJzXd13WLmPArv4bHhKNAg7f4jkavNehTN4NPE1zLDjo/yQOd17AuIiW
         whJX5HX7/CedDEHv1WoTpqa6frdHfhnl6gbrvvYTBas46gCU1s/mn+vgf+aumGXgXE92
         ylVf53L4tyCb6t+bfmNqAzvN79VI8oCHvPlzUP8kKrCzHxZbreMLfLB1jnYsC1wZcb6S
         ddfw==
X-Forwarded-Encrypted: i=1; AJvYcCVOn7H7jboU2yco1aU1Y4n6bCsNkgsV3HLARQzFQL1rM3WZ/zlD2HHml7jm4dk6hG3R56pNddRTC5RU43BnGVYBqoc=@vger.kernel.org, AJvYcCXIPZW1oc4HRT4enz63B0W/jf8i3seE2ejLfWps0rS3G/03tPFfgQ3CVzr1DKNBK/Dr8ElF24OgNEjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YycUj0S6ixhogrq8PcTNgKMMe94r3kgoWJCdSuHAUDLGVSYGz65
	zoOuP7A8chI1mgTbYl5DSGwEP9eOLxINkP03ZxdtM7zRi0FpSAzYyvYfsYc1q1Hh
X-Gm-Gg: ASbGnct0J+HMJm49k/94MCznY9bMDu/al0lZjzXT4I0/oaBBMVlvW0myMO+jqG9/paJ
	RVu8tlPE8ii/+e20PaTXi0KL4BIHaqvzTcMM+9hBer/vxTmQD+O6UhEfhJcMrZeFKHN4eulMZE0
	jD6ly0adO9R/y44qCunKfbT+e1SEibDFF8DP0aeUJKjdBojZRxj95zJhizD/Js26YfPQJD+iGp7
	4Hz/HA7okIpCHcnkttFy055RNM13wqS8MBawcXhT44kNMI18i5HbdcZUdCDceuEFocmGroZYRnA
	EPDUG7mD3VxdPR8O1wLyEmnABnmwe8zoNg58p500q+CgP9GQCOnslq0vKEHTMWAC6aJNPCEwH17
	OYEUPCNoQpb+Y/MZ8q5PLE5P5SBit
X-Google-Smtp-Source: AGHT+IFXfDp55BrHYmTUFrys8j+IG338Gmli+gcDsg5BdSgeQimTzqHRhg4iIm3NiIqw78w1Ek1wDA==
X-Received: by 2002:a05:620a:3198:b0:7d3:8df8:5885 with SMTP id af79cd13be357-7d3c6c191f9mr2224255785a.14.1750255382048;
        Wed, 18 Jun 2025 07:03:02 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8dfe347sm768149485a.36.2025.06.18.07.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 07:03:01 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d0a2220fb0so831762185a.3;
        Wed, 18 Jun 2025 07:03:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOeCtIhKWAaVCtnLYxcZciKFqNV7cQdomay//OaH20vlu94glBOy7dvj3nMxdNiZlWA/JMer7tpI/v@vger.kernel.org, AJvYcCXSaRNWBvhtpCxPdEYODyt+nPigH3ko7ZYM4/pEuE7uZYtJu+kBWcVPylx2KpTqoqb+ckfapURAOSRJx0F70lTNNqk=@vger.kernel.org
X-Received: by 2002:a05:620a:2954:b0:7d3:b957:cd0e with SMTP id
 af79cd13be357-7d3c6c192bfmr2502107385a.20.1750255381492; Wed, 18 Jun 2025
 07:03:01 -0700 (PDT)
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
 <CAMuHMdXw+mcj-P=Zm4R8WF0PxogPLfFCbALBRFN9Wn8UEo1FkQ@mail.gmail.com>
 <CA+V-a8u4PgttE0LaH7M=-5Br400sNE1gzk_a3L_9jfXZgCLd-Q@mail.gmail.com>
 <CAMuHMdVQ7pK+zvZm6MHsfGRctyOSurQpDYJztSfD6P1gvuw_RA@mail.gmail.com> <CA+V-a8tG4_2bXJ9H=FPT-Qa8zcgsE_5vkVQRj-ONDna5n4Ptgw@mail.gmail.com>
In-Reply-To: <CA+V-a8tG4_2bXJ9H=FPT-Qa8zcgsE_5vkVQRj-ONDna5n4Ptgw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 16:02:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOHmKM6mqQHFhGqmNp-doox1rHx0WNN9O8xntp1-TXqw@mail.gmail.com>
X-Gm-Features: Ac12FXzLS3L08eZLyZMcHCQmfUAzDs1RRAbOslg7L6woDaRiwhVlpnqcuqM9Dcw
Message-ID: <CAMuHMdUOHmKM6mqQHFhGqmNp-doox1rHx0WNN9O8xntp1-TXqw@mail.gmail.com>
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

On Wed, 18 Jun 2025 at 15:41, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Wed, Jun 18, 2025 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Wed, 18 Jun 2025 at 14:06, Lad, Prabhakar <prabhakar.csengg@gmail.co=
m> wrote:
> > > On Wed, Jun 18, 2025 at 8:03=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Tue, 17 Jun 2025 at 23:05, Lad, Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > > > > On Mon, Mar 31, 2025 at 7:25=E2=80=AFPM Geert Uytterhoeven <geert=
@linux-m68k.org> wrote:
> > > > > > On Mon, 31 Mar 2025 at 17:33, Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > > > > > On Mon, 31 Mar 2025 at 16:34, Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > > > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Mon,=
 31 Mar 2025
> > > > > > > > > > at 15:54, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com> Documen=
t support for
> > > > > > > > > > > > the Expanded Serial Peripheral Interface (xSPI) Con=
troller in
> > > > > > > > > > > > the Renesas RZ/G3E
> > > > > > > > > > > > (R9A09G047) SoC.
> > > > > > > > > > > >
> > > > > > > > > > > > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > > > > > > > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com=
>
> > > > > > > > > >
> > > > > > > > > > > > --- /dev/null
> > > > > > > > > > > > +++ b/Documentation/devicetree/bindings/memory-cont=
rollers/renes
> > > > > > > > > > > > +++ as,r
> > > > > > > > > > > > +++ zg3e
> > > > > > > > > > > > +++ -xspi.yaml
> > > > > > > > > >
> > > > > > > > > > > > +    spi@11030000 {
> > > > > > > > > > > > +        compatible =3D "renesas,r9a09g047-xspi";
> > > > > > > > > > > > +        reg =3D <0x11030000 0x10000>, <0x20000000 =
0x10000000>;
> > > > > > > > > > > > +        reg-names =3D "regs", "dirmap";
> > > > > > > > > > > > +        interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_=
RISING>,
> > > > > > > > > > > > +                     <GIC_SPI 229 IRQ_TYPE_EDGE_RI=
SING>;
> > > > > > > > > > > > +        interrupt-names =3D "pulse", "err_pulse";
> > > > > > > > > > > > +        clocks =3D <&cpg CPG_MOD 0x9f>, <&cpg CPG_=
MOD 0xa0>,
> > > > > > > > > > > > +                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MO=
D 0xa1>;
> > > > > > > > > > >
> > > > > > > > > > > On the next version I am going to update spix2 clk as=
 <&cpg
> > > > > > > > > > > CPG_CORE R9A09G047_SPI_CLK_SPIX2>
> > > > > >
> > > > > > According to the RZ/G3E clock system diagram, (the parent of) c=
lk_spi
> > > > > > is derived from (the parent of) clk_spix2, not the other way ar=
ound?
> > > > > > So you can model clk_spi as a fixed divider clock with parent c=
lk_spix2
> > > >                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^
> > [A]
> >
> > > > > > and factor two.  I.e. provide a new core clock R9A09G047_SPI_CL=
K_SPI
> > > > > > instead of your proposed R9A09G047_SPI_CLK_SPIX2?
> > > > > >
> > > > > With this approach when R9A09G047_SPI_CLK_SPI is used as a core c=
lock
> > > > > and XSPI node is disabled the clk_summary reports the core clock =
is ON
> > > > > (while it's actually OFF).
> > > >
> > > > Is that a real problem, or is it purely cosmetic?
> > > Just cosmetic tbh as despite being a MOD clock we have to define it a=
s
> > > a core clock in the DT.
> > >
> > > > > Can we maybe use a unused ON index and ON bit for example 25, 0 (=
ie
> > > > > 0x190) and represent this is a module clock for example for the
> > > > > spi_clk_spix2 clock and use this in the DT and let the CPG core c=
ode
> > > > > handle such turning ON/OF the module clocks based on the enable c=
ount
> > > > > which will be handled internally in the driver?
> > > >
> > > > Please do not use "unused" module clock bits.  These do not describ=
e
> > > > the hardware, and may actually exist in the hardware (try disabling
> > > > all undocumented module clocks, and observe what fails...).
> > > >
> > > Agreed, "unused" module clock bits were only used as a dummy. The
> > > read/write operations were only performed on the actual bits which ar=
e
> > > documented in the HW manual.
> > >
> > > > If spi_clk_spi really must show being disabled, you can change it
> > > > from a fixed divider clock (which does not implement .{en,dis}able(=
))
> > > > to a custom fixed divider clock that does implement .{en,dis}able()
> > > > and keeps track internally of the fake state, or even looks at the
> > > > state of spi_clk_spix2?
> > > >
> > > Good point. Maybe instead of implementing the dummy .{en,dis}able() I
> > > will implement the is_enabled() + (clk_fixed_factor_ops). The
> > > is_enabled() will take care of reading from the MON bits and report
> > > the actual state of the clock.
> > >
> > > > However, upon second look, spi_clk_spi is not implemented as a fixe=
d
> > > > divider clock with parent clk_spix2, as described above:
> > > >
> > > >       .smux2_xspi_clk1     0  0  0 320000000  0  0  50000  Y
> > > >          .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> > > >             spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> > > >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> > > >          spi_aclk          0  0  0 200000000  0  0  50000  N
> > > >          spi_hclk          0  0  0 200000000  0  0  50000  N
> > > >       .smux2_xspi_clk0     0  0  0 533333333  0  0  50000  Y
> > > >
> > > > Instead, they both use pllcm33_xspi as the parent clock.
> > > > Apparently I missed that in the review of RZ/G3E XSPI clock support=
.
> > > > The changelog for that patch does describe the correct topology?
> > > >
> > > The topology is correct for RZ/G3E, spi/spix2 are sourced from
> > > pllcm33_xspi divider and there is a divider (/2) for spi.
> >
> > Both spi_clk_spix2 and spi_clk_spix have .pllcm33_xspi as
> > immediate parent.
> >
> > [A] describes something different:
> >
> >     .pllcm33_xspi     0  0  0 40000000   0  0  50000  Y
> >         spi_clk_spix2  0  0  0 40000000   0  0  50000  N
> >             spi_clk_spi    0  0  0 20000000   0  0  50000  Y
> >
> > I.e. if spi_clk_spix2() is disabled, spi_clk_spi() is disabled, too.
> >
> Okay, thanks - got it.
>
> To clarify, to implement spi_clk_spi core clock as a parent of
> spi_clk_spix2 I will need to implement some sort of mechanism which
> registers (late) core clks after core clks and module clks are
> registered as spi_clk_spix2 is a module clock.

Yes, I wondered about that as well, but wasn't too worried as you
already added the smux with e.g. "et0_rxclk" as parent, which also
doesn't exist at registration time ;-)

But indeed, the smux uses clock names to find the parents, while
fixed-factor clocks in zv2h_cpg_register_core_clk() expect clock IDs
(which are converted to names), and don't handle non-core clocks yet.
So either add support for late core clocks, or modify CLK_TYPE_FF
to use cpg_core_clock.parent_names[] in case of a non-core parent?

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

