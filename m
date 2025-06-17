Return-Path: <linux-renesas-soc+bounces-18411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FC4ADC2E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7047716EF6F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC5628C5C7;
	Tue, 17 Jun 2025 07:11:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD632BF017;
	Tue, 17 Jun 2025 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144293; cv=none; b=hZPcLc6exIhmXepNRFNHhL/r4sbnxH9Rfckq129Ozo/JpUQiv3bU38DMgWYzGbDEsaaBu2LlUkJhWNt7ALb9oL7+N4BGXjQbS7qG/Ng/v3Cnd6gIqTBEOTFVcpvMVgXKPU6FIbblPqxCQbNe6C6N4GMcYDNSV3h4XDyielQaBSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144293; c=relaxed/simple;
	bh=yTAt50N3neyeCnLnBEeHFhoVNDZmnsqQwamaiAfI0pU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCSSsQpPEqb2oTzXX8l9KU+QIG6N7oX+IJh9jdiI5PXr9Q6We/UFI1vrkk5JpfLI8u7kXsytYw1RUANcoaYkiIFXpAlxqmh66d+Hhm827ujAotYBgcCDWrOUIy1/TIrbwFp6ZL6xMXJ66NRzSGiEopHi680HXg7aHcMRIFsj6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e7e5b6207bso1186648137.2;
        Tue, 17 Jun 2025 00:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144290; x=1750749090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/v5q2fXiwY4TAB8aPNUe4fxk10SyY4tqtEOV0DB9XA=;
        b=gCLMtW52oaTxJbOaU6zw783OZU5+5TyIsyf/lxq/tEOx44m/eV4PXyo724a0qIIW7R
         lriYoL05T65YdcjJnG8uHvvPPfjq9ZT/84KUAKIVYGNcdiz2traqdYliq35XmFN6Zv7v
         gilPvKWCmF8xC+MxAD7Zhmb1X7g5VTU4Uj871yRQ5+67qT56ffiV9ruyVdo7dtruQsZb
         rgrits1CvTpy4hiKibVzRyrYchlQDYIGFAiPcj62Of9PEMUlHlCdmD2/1q0T0lar7GFC
         TxdWnMGUDhzFfgJlnBF3sqo66rKxYTV2gXpnvDq+KCXg1ntaxGWKmlZS1rDR/KjLom6K
         Ez+w==
X-Forwarded-Encrypted: i=1; AJvYcCWcUgu5bEw3/XeBENdus2eeQqtDTHBzKj0Cqk2pg8wnLAZwUqs0R+4+tk+zHakyP9gTDrQ0lYEYyGgp@vger.kernel.org, AJvYcCWp/EoWbwm8NULvWiMBItD1geQHwR25mlIH0CD7/sbFkmL5gnSyGUAmAncfHqVcR4gnoq2ryNFCUasO@vger.kernel.org, AJvYcCX900WhzXt3YBhtijGSuFeXNHZu3efBDY0mGg4yPso6YiO4ZInUTrLoKdGmiaXh4P2TrEPM4QuIG9uGFLEP@vger.kernel.org, AJvYcCXSbuwnUffHRvIepvdsSVH7BBhM+OhHKcMDQX5K2WgCNKzaStVq8EKmLdBjnJ23ComXq+Fkcfm3eZzwAYcWg97oEnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFvzy0oKtw387x0Vu6SDtHAFI90z15tIQLLumVzEV8igSvtVF
	LOg0kvsFp1ESKHS3mEaIJIUu1b2RGUxy+g3dKT5BRJeBknptsxGQwU9cszUeKL3E
X-Gm-Gg: ASbGncsawNid3DBNOaIqOpGfxcfZUit4raO9Rdrxjc8oqihY9SC1aQd1/kYLCyD+efo
	f7AA5g3rsGKWWO6ndSFHVzSoJZyqkoiAC7XzT/wILLOkXoLGlkUTeobeRXwFsZdXQyDUFJLF5N0
	2pVOVlBqBd4FVoGjksVaN47IMLUqMvlGzzMTTqda0ja8fN5DKYopxuCWtoT8Q6O4K6MUszB8X4o
	hWBtYcbrq1Si3J+nRJeP2244/wWmrnVKQdqdWL2cVkWi/D1V7XpKpT3KJu1+B3VMWcAb0gfo3Cm
	nig+TwfyYbgTbVQCljq0ECMX8UC5PLa3SQ9bDOB4hsXzbK6pu4f7PXuy/+1PdQ2TbUHwf2+3Nk3
	aYeeKmV1nTdgirIFXPX74+hn8
X-Google-Smtp-Source: AGHT+IEECrac0ePQll+eB3DODknl5jNTsxyu1DoYNhYANkO/8t/uStlXCqMJKfPSo4qKb9rPcI6z7Q==
X-Received: by 2002:a05:6102:5092:b0:4e5:9380:9c25 with SMTP id ada2fe7eead31-4e7f60edf6bmr8208837137.3.1750144289731;
        Tue, 17 Jun 2025 00:11:29 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e708bd92sm1536011137.19.2025.06.17.00.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:11:29 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so1207487241.2;
        Tue, 17 Jun 2025 00:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRVnoWjeC1TlAwFUl541kuuGMXY/l2A0bjpC9XBTjKZhmDb20uH2mC3bGg0iE4u2f5UJn2LyddLgDY6n4A@vger.kernel.org, AJvYcCWpNgJRON4Cwt74vIBTHvobodD1Qs+UmZDNzjNVVt7N0F2OpfeCksQ1QqxENVuSeA0DPVcxPhUH8U6G@vger.kernel.org, AJvYcCXjo2aYqWW+npQ+IPJARYi2CfHS5uKSWiIUc/Dx0VEU3WEMWL7f1PuDlYgzyHf9YzZ62a7Dci1V0VnQ1c82B3oGUgQ=@vger.kernel.org, AJvYcCXwnnPJKSZGnBe+NIolocc5UfxYLbN+fkXBRtpp/iSHjfE4CExhpcfzvBtcnutFumDfTymOcc2EzodN@vger.kernel.org
X-Received: by 2002:a05:6102:4492:b0:4e7:bf31:2f68 with SMTP id
 ada2fe7eead31-4e7f621e0bdmr7699219137.25.1750144289064; Tue, 17 Jun 2025
 00:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com>
 <CA+V-a8sBhF-FwV0BXCxpHkuhdAg5YcwDsWPFRPSV_BdmNpLWYA@mail.gmail.com> <CA+V-a8t6WNQS-1AkFUeSioxNyF9vSbaxUDkQsYDk-=m1tysu+w@mail.gmail.com>
In-Reply-To: <CA+V-a8t6WNQS-1AkFUeSioxNyF9vSbaxUDkQsYDk-=m1tysu+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:11:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9506cHe5xyMSfu_AX_i7k+GupuaaAKDNH6LA9hEXNPA@mail.gmail.com>
X-Gm-Features: AX0GCFvsCJkfmKnYT1sdg_yrTI_i8ZrlUEHMC3xjoflEVfDCTNfz9EG-bVRYQ14
Message-ID: <CAMuHMdU9506cHe5xyMSfu_AX_i7k+GupuaaAKDNH6LA9hEXNPA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 13 Jun 2025 at 20:59, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, Jun 13, 2025 at 4:37=E2=80=AFPM Lad, Prabhakar <prabhakar.csengg@=
gmail.com> wrote:
> > On Thu, Jun 12, 2025 at 4:47=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Tue, 10 Jun 2025 at 01:23, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N=
2H
> > > > (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback =
since
> > > > the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P)=
,
> > > > allowing reuse of the existing driver without modifications.
> > > >
> > > > Update the binding schema to reflect differences: unlike RZ/V2H(P),
> > > > RZ/T2H and RZ/N2H do not require the `resets` property and use only=
 a
> > > > single clock instead of four.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > > > @@ -129,59 +131,75 @@ allOf:
> > > >          compatible:
> > > >            contains:
> > > >              enum:
> > > > -              - renesas,sdhi-r9a09g057
> > > > -              - renesas,rzg2l-sdhi
> > > > +              - renesas,sdhi-r9a09g077
> > > > +              - renesas,sdhi-r9a09g087
> > > >      then:
> > > >        properties:
> > > > +        resets: false
> > > >          clocks:
> > > > -          items:
> > > > -            - description: IMCLK, SDHI channel main clock1.
> > > > -            - description: CLK_HS, SDHI channel High speed clock w=
hich operates
> > > > -                           4 times that of SDHI channel main clock=
1.
> > > > -            - description: IMCLK2, SDHI channel main clock2. When =
this clock is
> > > > -                           turned off, external SD card detection =
cannot be
> > > > -                           detected.
> > > > -            - description: ACLK, SDHI channel bus clock.
> > > > +          description: ACLK, SDHI channel bus clock.
> > >
> > > According to the documentation, this is the SDHI high speed clock...
> > >
> Actually re-reading the doc there are two clocks (I had missed the
> second clock earlier),

And I had missed the first, as it is not shown in Figure 7.1
("Block diagram of clock generation circuit" ;-)

> 1] ACLK, IMCLK from the PCLKAM which is 200MHz
> 2] SDHI_clkhs from PLL2 which is 800MHz
> Note, on RZ/V2H too the ACLK/IMCLK is 200MHz and clk_hs is 800MHz
>
> So, I'll represent them as below:
>         clocks:
>           items:
>             - description: ACLK, IMCLK, SDHI channel bus and main clocks.
>             - description: CLK_HS, SDHI channel High speed clock.
>         clock-names:
>           items:
>             - const: aclk
>             - const: clkh
>
> And for the ACLK, IMCLK which comes from peripheral module clock
> (PCLKAM) this will be a module clock and CLK_HS will have to be
> modelled as a CORE clock.

OK.

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

