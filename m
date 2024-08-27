Return-Path: <linux-renesas-soc+bounces-8388-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37061961134
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 17:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA0971F24877
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 15:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9C81C825E;
	Tue, 27 Aug 2024 15:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cydMjYHs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBCC17C96;
	Tue, 27 Aug 2024 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771817; cv=none; b=neQWYjEsNvHf/8I/cuhBInwaCpgFjSGdNfSw0jWrtCDlfvhtFS+VAD1bG1JirMp9vu6TP8UO+hcM4JwRlMZUWM3lNYlk0ROwu5VrWAcLGJXfMxOIrovPkPhmcNWLYwdWri/t6fNrVYWCLdt55yslACTkOnyYxVf3zVS6JxYYBOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771817; c=relaxed/simple;
	bh=NsihyD+aLfjCVXnAjPHyrMoeCZJhbzWagHDl4evqrtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaStqvK+6WsrKPPJbtHdIm2nM9o3sD1PoLfIDKEMHwFOiRaeaMfiWWfnAOUv61ik74+r8iNP2pX8P5HX1Kb3Hjd75j2JReET1ZgxhihLoBOkt5D7kBADZBjA6ZD2WbHpZ/dDyrRzl55/hvM6OzoJM4EcxLvKCl2TnwbovXk4bas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cydMjYHs; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-44fe11dedb3so31044421cf.1;
        Tue, 27 Aug 2024 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724771815; x=1725376615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+z7UkBh8WTRUHcbPdX5a5EteYt1iaUFixelF7ndFRI=;
        b=cydMjYHsU7sScaOh8hln+vNCuucRNViRW84uyg94tk5XONxyEcuJPek/UJbzmrl4bs
         mrLKsMRS0UbmstbW88ZWpR8sheHkKsqNOke9ew4ujClu2cv/xWh4RXWjsnl6NQL79QcN
         iSoAeDQ8lGjC78PnDeLXsOQ6qd4PSR0V4U1+AyJXw1wX0MI8o0rkZAP/l8svRul4Av3q
         VNvlH8x5x5TlreyDNJN9rXDxlAnjYKect4DqmAK9YPLM10bOjcseLtQlqdfTPsItZKaP
         FFGCBpIRc5d0a42dQn37S9UtEsUJQgroseVOm5/F47Ggfp8Ql4K5KXJF2+MJlwe1GBBE
         gR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724771815; x=1725376615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L+z7UkBh8WTRUHcbPdX5a5EteYt1iaUFixelF7ndFRI=;
        b=HVo8Wo2LArU3lAyqWszBTuRsKajmpMZKy8UREbhk9NIO1wvdEZPNxPUl9O9qt2BzbR
         2IuEME6NNyI3inThGPYl6BNaDHLef/y3xwgyGCeBIO+WsQoIPkARfm5PZtHYCuDqBra8
         IBsYnP98fBhmleFaDlXHnRh4E4BCnGLVBnLfPXV7EYI1417gtTCbPFz/YszmRBeZr2gL
         TlaJhKhbJXp0amtTtYSgr3xL/EnIeL+Z9Mrss98ZKxqn27dJRpJ16miP8fMsd+2uRPdT
         Ih4hHzUuEKZAWF8dj+jPVqAf55zkfIIyrq/EHVr1IWhy0WZdtZTA61R8h2IXkhr64VD7
         W9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUKIarfxvCuXHkmBk2ukJGwwFcPdYWCz5x5iOGjVr8jXc3q57f04l5zQpp9sEpL1eI/zSs5rygZUQDH6ca1@vger.kernel.org, AJvYcCVUhHRU9g+O3bSPQ9RSULx7LzO2x9olSacEQxlKd5KGKiEsfvNMqR7UGHTJnBTLDtzU9vdm1m9fevI5l6KykIxou64=@vger.kernel.org, AJvYcCXldeub1447fst2Hyaw+yK0udlkUIy9bjyO+TN0MnqWdRqDEWM60BinmSLJE8aunnkRHn1pFkqC6iXu@vger.kernel.org
X-Gm-Message-State: AOJu0YyjUt1Ez4fPR9yORql5ZQlLKgbyu//SKkCdrSW5T8g3sSaTJ3HV
	PVyq2EVFEAXH4sh+sLCcxWS2pyN9nqnUj3RvL9//NRO5jfyE3T6s0+1d67dw3kIfS7li7Jk7Vsa
	UaREWZu+BAtQ/S+eZnZl9uRylDBQ=
X-Google-Smtp-Source: AGHT+IFJcmoW6CXn+oY2Fsaex4mnzkkrd2eTMPElnvFzJM2tT0EQO9SLHZyYUW9xTx5pIxE8y5NbgxrAKOZkshOaAeg=
X-Received: by 2002:a05:622a:2515:b0:454:f3ce:66c1 with SMTP id
 d75a77b69052e-45509c37427mr213896101cf.11.1724771814852; Tue, 27 Aug 2024
 08:16:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240821085644.240009-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWC0sgF48Thdg95zyPn04XJv1H+ZScXZrUfzcp8v738ag@mail.gmail.com>
In-Reply-To: <CAMuHMdWC0sgF48Thdg95zyPn04XJv1H+ZScXZrUfzcp8v738ag@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Aug 2024 16:16:28 +0100
Message-ID: <CA+V-a8typL3W3_ivdeYLwLiAmKetHQUb0TVzQuLLi_suJgYRzw@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 26, 2024 at 11:38=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Aug 21, 2024 at 10:56=E2=80=AFAM Prabhakar <prabhakar.csengg@gmai=
l.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add initial SoC DTSI for Renesas RZ/V2H(P) ("R9A09G057") SoC, below are
> > the list of blocks added:
> > - EXT CLKs
> > - 4X CA55
> > - SCIF
> > - PFC
> > - CPG
> > - SYS
> > - GIC
> > - ARMv8 Timer
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3
> > - Updated GIC node to match with the coding-style of DTS
>
> Thanks for the update!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -0,0 +1,165 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/V2H(P) SoC
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +       compatible =3D "renesas,r9a09g057";
> > +       #address-cells =3D <2>;
> > +       #size-cells =3D <2>;
> > +
> > +       audio_extal_clk: audio-clk {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency =3D <0>;
> > +       };
> > +
> > +       rtxin_clk: rtxin-clk {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency =3D <0>;
> > +       };
> > +
> > +       qextal_clk: qextal-clk {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency =3D <0>;
> > +       };
>
> Please use alphabetical sort order (by nodename).
>
Ok, I will sort this alphabetically.

> > +       soc: soc {
> > +               compatible =3D "simple-bus";
> > +               interrupt-parent =3D <&gic>;
> > +               #address-cells =3D <2>;
> > +               #size-cells =3D <2>;
> > +               ranges;
> > +
> > +               pinctrl: pinctrl@10410000 {
> > +                       compatible =3D "renesas,r9a09g057-pinctrl";
> > +                       reg =3D <0 0x10410000 0 0x10000>;
> > +                       clocks =3D <&cpg CPG_CORE R9A09G057_IOTOP_0_SHC=
LK>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <2>;
> > +                       gpio-ranges =3D <&pinctrl 0 0 96>;
> > +                       #interrupt-cells =3D <2>;
> > +                       interrupt-controller;
> > +                       power-domains =3D <&cpg>;
> > +                       resets =3D <&cpg 165>, <&cpg 166>;
>
> Please use hexadecimal reset numbers, cfr. the description in the DT
> bindings. E.g. IOTOP_0_RESETN =3D CPG_RST_10 bit 5 =3D> 0xa5.
>
> This comment applies to all resets in this series.
>
> > +               };
>
> > +               scif: serial@11c01400 {
> > +                       compatible =3D "renesas,scif-r9a09g057";
> > +                       reg =3D <0 0x11c01400 0 0x400>;
> > +                       interrupts =3D <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
> > +                                    <GIC_SPI 536 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 537 IRQ_TYPE_EDGE_RISING>=
;
> > +                       interrupt-names =3D "eri", "rxi", "txi", "bri",=
 "dri",
> > +                                         "tei", "tei-dri", "rxi-edge",=
 "txi-edge";
> > +                       clocks =3D <&cpg CPG_MOD 143>;
>
> Please use hexadecimal module clock numbers, cfr. the description in
> the DT bindings. E.g. CGC_SCIF_0_clk_pck =3D CPG_CLKON_8 bit 15 =3D> 0x8f=
.
>
> This comment applies to all module clocks in this series.
>
Ok, I will update the clock and reset numbers to use hexadecimal.

Cheers,
Prabhakar

