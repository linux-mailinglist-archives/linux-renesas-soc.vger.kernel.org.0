Return-Path: <linux-renesas-soc+bounces-7810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373994ECF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 14:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A951F21D8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 12:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E7517AE0E;
	Mon, 12 Aug 2024 12:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdzqkFi9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC7517A594;
	Mon, 12 Aug 2024 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465741; cv=none; b=LxN3CMR+QVe1MU/6VEixk5kGGlXN1a+ekgzu8yShUT9vN/dfVplcJKFIsZy4RgJBoXdztXHiLa0X9fgrvLw27+LZzylyRYUbitb20xFld2Epw0EyhNs9fU8+bhDt0jigYAuDIg6/FpWGaZ4g82ElkKSykpafI/lQPn1u0FRpmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465741; c=relaxed/simple;
	bh=OOzAyQ03ZtMeF7A2FRx7abj8ps+nT7X2VrI2X2HcBSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AK6rj/c6uBLyVYsunHxToywYKB/LQeqhwtp2UBp9JP775EqOO+ROh6A/QncGYwdpaV9WClaEcePlx11gpGvgT6Fnk25uE8wqimjBPkn31ApqEGaQgvEnXZRIuzdlHagLLL6NMk7z+GQQQMvNAcX6Y9zm0B+hZaRLUzpyFftlRdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdzqkFi9; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-82c30468266so1394953241.0;
        Mon, 12 Aug 2024 05:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723465737; x=1724070537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmvUcZJslqDH1zmxDHmponIrktodaIlrZefDJgoVFQI=;
        b=XdzqkFi9JmlbOMaK6mSAuRm5v4WKMo81y3vPpClK/2LDQSYHGgVKYoNJqEFMbOtSQc
         YW8BMLPf0KqV7KO40spE+cYi+9H7UT+gYCZYvvMGlNQz5EK1vmLWadpCVtdznVhOCKnJ
         fW9L3xxTSpD00E0bRC+4G09KHbF8feXm6oQSYXNi/a+JVR/EAUIWw1X2M6RKNTBgwR67
         eS7bh68k5GrDM4YBTwy0AVRCSA2LQCIsUNcbGS2mgduZD/63qLGQjpJivmHWdRrQ1LVQ
         dPxnjz/KdvDE9PJg2vBjBkj9a3zHmpOc14g3BqKKis7nJ/KHm2rGGRxRCqmyDMJA9Z61
         /x+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465737; x=1724070537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmvUcZJslqDH1zmxDHmponIrktodaIlrZefDJgoVFQI=;
        b=TC4IGR0tNG8izeUVJ0Jdx/yXgPr6Mini40MabZX8c4e/04ogSMyOmpjrFgmK88bgrQ
         UQ9apLZbwIsmfrh1qZtCg2LTpmavVbNNkV22mXvyd0INZwN8Fp6eHt00RzbzicqpSXYT
         YX/PF8OlXhW398ZfvcROkCLvT5ckwlW1DzNWAosP9NiYQi8APRy7NMX2+SU+jkD6kgJJ
         NcOeotSAZrMmwn7HiLXLiJxtwvXXQ3nVrZv+6Vw8KwnYq0nITXw1XTPwqA3bO/MVQGM0
         ySi0LqlNljseJ92sWbWJIcYHz8MqTztqHmiAQP8Mye5atQRU5VDS23SfcL0ORozS0y/N
         cAdw==
X-Forwarded-Encrypted: i=1; AJvYcCW9/LmTkQjTZMGLjeEKipENmSblkpEm5KJrLo+zO8iA8BNRgguDR8UQOJCqx+hXW283or0XVRxN4BTEYRABIMuN5cGKqOGHW8q0SGFjyuocJaEeQYVpND4QruLbZLACnL5i3upvexj4bMIqsAyGvNWAErW2kmyn5w9bRsLrohxftupLn+gT+prw7ufN
X-Gm-Message-State: AOJu0YxvyBTZLZhXWf4zlB9AF+oDXFDyMASTdhkK2EbRKvbuY8ffzAel
	tvE13GhHcYboyNLJI6IE5PwP3NCF/kGrsrRLvrMCCsrD9X5rghQmtOEcH2j8fjCpULl780Hjr6x
	rBajIP/9u05jhswh/b6zZS/Q+8hI=
X-Google-Smtp-Source: AGHT+IFcpmMlKKZ8LojBXNqkfLSl9I+A1+MW5ID7EFAtliPkUzAfxVkLSFAtMSkohwdlMYWYPecUzU/j16xI442Rxyc=
X-Received: by 2002:a05:6122:2523:b0:4f6:b240:4af8 with SMTP id
 71dfb90a1353d-4fabf08eff5mr277744e0c.11.1723465737297; Mon, 12 Aug 2024
 05:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB113466DE7061B60485B3BE97986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vioGija2x=eoqn1jZbMpK8PAeLzXQZP52hQn976BKisw@mail.gmail.com> <TY3PR01MB1134680204C824F1B567B21B986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134680204C824F1B567B21B986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Aug 2024 13:28:31 +0100
Message-ID: <CA+V-a8toz3xpKSyBj39L-M0iOkbgTRse5jPTocspBrmDzZLUzQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Aug 12, 2024 at 11:02=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Monday, August 12, 2024 10:16 AM
> > Subject: Re: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: E=
nable OSTM, I2C, and SDHI
> >
> > Hi Biju,
> >
> > On Mon, Aug 12, 2024 at 8:40=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: Sunday, August 11, 2024 9:50 PM
> > > > Subject: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk:
> > > > Enable OSTM, I2C, and SDHI
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on th=
e
> > > > SD2
> > > > connector) on the RZ/V2H GP-EVK platform.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v1->v2
> > > > - New patch
> > > > ---
> > > >  .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 191
> > > > ++++++++++++++++++
> > > >  1 file changed, 191 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > > > b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > > > index 593c48181248..11c13c85d278 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > > > @@ -7,6 +7,8 @@
> > > >
> > > >  /dts-v1/;
> > > >
> > > > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > >  #include "r9a09g057.dtsi"
> > > >
> > > >  / {
> > > > @@ -14,6 +16,14 @@ / {
> > > >       compatible =3D "renesas,gp-evk", "renesas,r9a09g057h44",
> > > > "renesas,r9a09g057";
> > > >
> > > >       aliases {
> > > > +             i2c0 =3D &i2c0;
> > > > +             i2c1 =3D &i2c1;
> > > > +             i2c2 =3D &i2c2;
> > > > +             i2c3 =3D &i2c3;
> > > > +             i2c6 =3D &i2c6;
> > > > +             i2c7 =3D &i2c7;
> > > > +             i2c8 =3D &i2c8;
> > > > +             mmc1 =3D &sdhi1;
> > > >               serial0 =3D &scif;
> > > >       };
> > > >
> > > > @@ -32,17 +42,186 @@ memory@240000000 {
> > > >               device_type =3D "memory";
> > > >               reg =3D <0x2 0x40000000 0x2 0x00000000>;
> > > >       };
> > > > +
> > > > +     reg_3p3v: regulator1 {
> > > > +             compatible =3D "regulator-fixed";
> > > > +
> > > > +             regulator-name =3D "fixed-3.3V";
> > > > +             regulator-min-microvolt =3D <3300000>;
> > > > +             regulator-max-microvolt =3D <3300000>;
> > > > +             regulator-boot-on;
> > > > +             regulator-always-on;
> > > > +     };
> > > > +
> > > > +     vqmmc_sdhi1: regulator-vccq-sdhi1 {
> > > > +             compatible =3D "regulator-gpio";
> > > > +             regulator-name =3D "SDHI1 VccQ";
> > > > +             gpios =3D <&pinctrl RZG2L_GPIO(10, 2) GPIO_ACTIVE_HIG=
H>;
> > > > +             regulator-min-microvolt =3D <1800000>;
> > > > +             regulator-max-microvolt =3D <3300000>;
> > > > +             gpios-states =3D <0>;
> > > > +             states =3D <3300000 0>, <1800000 1>;
> > > > +     };
> > > >  };
> > > >
> > > >  &audio_extal_clk {
> > > >       clock-frequency =3D <22579200>;
> > > >  };
> > > >
> > > > +&i2c0 {
> > > > +     pinctrl-0 =3D <&i2c0_pins>;
> > > > +     pinctrl-names =3D "default";
> > > > +
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > >
> > > clock-frequency =3D <100000>; in SoC dtsim
> > >
> > > Why frequency set to 100kHz for all the i2c nodes even though SoC
> > > supports Transfer rate up to 1MHz? Is it board limitation restricting=
 to 100kHz?
> > >
> > This is due to driver limitation, once driver support for FM+ gets acce=
pted [0] I plan to update the
> > default frequency to !MHz in SoC DTSI.
>
> If there os no board limitation, please update to 400kHz, that is the nex=
t best frequency.
>
I'll let Geert take a call on this as anyway the once the patch [0]
will be merged we will update frequency to 1MHz.

> > [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/202407=
11115207.2843133-9-
> > claudiu.beznea.uj@bp.renesas.com/
> >
Cheers,
Prabhakar

