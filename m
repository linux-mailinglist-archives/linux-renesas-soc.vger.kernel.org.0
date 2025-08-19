Return-Path: <linux-renesas-soc+bounces-20685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA02B2BBA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 10:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE381188BD2F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45041311588;
	Tue, 19 Aug 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnJzxOEm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7320B31064B;
	Tue, 19 Aug 2025 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591675; cv=none; b=m4sNMCAQiFveUDQsYS451De7U3AXX930D5v5UZI/6f5zGfOg/OSzU0HMq+5VAqp2LIriszvxwnWgAnr3eltS6eR5HOx67kBXDO/+31/X3F5Oano3dkH46u8v1cZxKu2iraahLoRs2fw9+0Z6TeCOSUtmZL5r/3nG6NK2OH6TcX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591675; c=relaxed/simple;
	bh=eV9F9dJLIUD4HaJWu8ulAAZHbArtSMyU6Z/Slsa8pYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVsByCYNlizYwdmR2WX818W9DuByzYW3RJiXgshGnONKFw9XgEKyTHaIDSsQ0CAE5/IcLHTUpkIVtz6vBcn9zicizCR3YezGG2Vfk4JjI7c0v3eKrh4gWTp70oxo81x/uuUHVNrmoOQSJNjRa6IIztPtbBkTPK6Fp+jBPJ8xCsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnJzxOEm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b9dc5c8ee7so3235396f8f.1;
        Tue, 19 Aug 2025 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755591672; x=1756196472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vBZjRYGMKAjOHS7reRNLRBgLmK/5KiCydYZAsIzfDU=;
        b=AnJzxOEmzeUFxoP81trHgPgTYo3tGzeBCTs7zQF9J+VdYTjFh+OXsmT42GQoohBlPe
         DSwGI3WWsD4lu8gwNP+nAFQBMBHCHQ1HQSykqO38HRsTgLjvM3AdkaA5dQcQcmSzhXFw
         Ub1ecyuW5lgje2SHmvrhJPb6Ib/O4fT10cRlIIpnVnAwgNNO8F9b/GzERPdJkFFfRBW/
         K6asZr8iIeP2DPzG5PLMCQppScPip9Ug3MTngVnUp71oR5qq+e+21sasOq/bfq/MwbeD
         5GTL0c5ckbE8tUxkAzW0JYwvCZYxF2mnL9i0r8BnHy8UL1th6cb/oJ3+jV49mQAhNOto
         eHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755591672; x=1756196472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vBZjRYGMKAjOHS7reRNLRBgLmK/5KiCydYZAsIzfDU=;
        b=VTsJ7PQToT1W9vLtXwt8To3mq6h+xo0gT971cxr3rUmQt69nzK5l6cT98hvn/FUNx0
         RZ2KeQEOl5XBdlmPgznPyQSBujiaHqhajYGHHR4PudJQxr+tbBoiXHmg+AqaEMCAqrpL
         nzqPbYDxVbDPTEEhdoxSABvK6QzehpPDfZgQitH7zU/QB5pOidjSzi0NOxN8pP73yGEk
         gw1PLoezuJzxgHQn67yQprp8p9DY9xX828MwaIdwQTcDgkOIjpt8BjMxb4aPfrbGd+vc
         IbBo+H331+DLiVecUHNyXESwEvnD94jsVBr5IfagveQEhlnFjnImh8OW4O2gUzsrSjuB
         xnyg==
X-Forwarded-Encrypted: i=1; AJvYcCUaC9suqPAd+eIr3HNxrfkOTBWuhpxhDoBB7CBTWY/c0fF5aEkdd+eQBGmIMpQPpZyqf1dL+8Vybps8Uz/g@vger.kernel.org, AJvYcCVLuM4ZWDGlRHXbxL3HKvEwEEv4/SFQmya2PcHXX2uQZP+gZ9/6sD8ktVD6H6fSf8uBQ/k7HKkO1Zp3SAb3VLdx0ok=@vger.kernel.org, AJvYcCVY+YV64sqZYzJDfejEOSroi0GMtnRvbjQK8tdfybGqAtXY6CbvMMEer8Q03LihWk1LpRD0DYtX4MvL@vger.kernel.org
X-Gm-Message-State: AOJu0YwebNnY6VGMEF7P2L24tHu8ShsVdFge1QjTpDkqxkcXa/sDJ8/j
	ZaIQtILWjZzDZuQFuMxrkNAQRVeCi71tiq67jHgsX+7UUv+vyf4lGcOyu6lFN7hRxE/XeaYSyrC
	RLeX9vgVwr/Q/rvGfVG6yUXdQLEAoJvE=
X-Gm-Gg: ASbGnctaKTtsBVNOH5jmK6IQxi4tcUHX1MrtQjq5S61IKQq5P0s6W2wVyXyYmsVjJde
	v/MgJ/9OVzib2Ja4g7NabP5bBDtjNt/Z/+BPEH3xg1C60D6FnDfohQDwFddwYee8yRybmyq4IV6
	M2rXWubcOVYlVczRhi9Ln9M3B815JgnIARgyPV/1ZrlajKnUh6W4ah51FpELNJhdQ4HOs3Zkh37
	LzkCBgJ
X-Google-Smtp-Source: AGHT+IFeNWxvYpcM3OIxaUKPq5mVT5RNbGZru6luRbj+TFOpuxOpfK4fUY/hhF92Ohrv/yuWAHjlUvfnCXF/t8IrCpc=
X-Received: by 2002:a05:6000:26c1:b0:3a4:d6ed:8e2e with SMTP id
 ffacd0b85a97d-3c0ec194b11mr1171469f8f.41.1755591671384; Tue, 19 Aug 2025
 01:21:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-14-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVx2_D=B=UHWjwL3dk+jO-85HrYyoiA4SV15xiRQYRt6Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVx2_D=B=UHWjwL3dk+jO-85HrYyoiA4SV15xiRQYRt6Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Aug 2025 09:20:45 +0100
X-Gm-Features: Ac12FXxd0U8k8FaSfJGpOMo0pd4hkj9dhGrGqVsr80ROHPdY3rHab5c5hfH7rL0
Message-ID: <CA+V-a8vbS2uH3BxXX_RrrCgQbLe9e+BL077GkopcKpMFZEJODg@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 5:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:04, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable SD card slot which is connected to SDHI0 on the RZ/T2H and
> > RZ/N2H EVKs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
>
> > @@ -104,6 +116,35 @@ sd0-emmc-ctrl-pins {
> >                 };
> >         };
> >
> > +#if SD0_SD
> > +       sdhi0-pwen-hog {
> > +               gpio-hog;
> > +               gpios =3D <RZT2H_GPIO(2, 5) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "SD0_PWEN";
> > +       };
> > +#endif
> > +
> > +       sdhi0_sd_pins: sd0-sd-group {
> > +               sd0-sd-data-pins {
>
> No need for repeated sd0-sd-prefixes in the subnodes.
>
Ok, I will drop it.

> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /*=
 SD0_DATA0 */
> > +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* S=
D0_DATA1 */
> > +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* S=
D0_DATA2 */
> > +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* S=
D0_DATA3 */
> > +                                <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* S=
D0_DATA4 */
> > +                                <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* S=
D0_DATA5 */
> > +                                <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* S=
D0_DATA6 */
> > +                                <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* S=
D0_DATA7 */
> > +               };
>
> SDcard uses only DATA0-3?
>
Agreed, I will drop the rest.

Cheers,
Prabhakar

> > +
> > +               sd0-sd-ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /*=
 SD0_CLK */
> > +                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
> > +                                <RZT2H_PORT_PINMUX(22, 5, 0x29)>, /* S=
D0_CD */
> > +                                <RZT2H_PORT_PINMUX(22, 6, 0x29)>; /* S=
D0_WP */
> > +               };
> > +       };
> > +
> >  #if SD1_MICRO_SD
> >         sdhi1-pwen-hog {
> >                 gpio-hog;
>
> The rest LGTM.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

