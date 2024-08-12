Return-Path: <linux-renesas-soc+bounces-7807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0DD94E982
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 11:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 472A8B21468
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 09:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5416F16CD33;
	Mon, 12 Aug 2024 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJSYPc2S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D720323;
	Mon, 12 Aug 2024 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723454211; cv=none; b=ivarqpDD+mA84tuuwlBMwtX63kPbwzduaX8SN4t24FXY3sCHR/w8038uxmNcVrcLEml6cJ/afDRgwve7u4YLI5PidE0Q0w4Zy1HouSKDQJEhC4+hDHwV/y5PbTT3lkgKM06+fi6s10vlxQQLhRXPjt2JqmyOZMGy/JphBx4Uu4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723454211; c=relaxed/simple;
	bh=pyBF/86LqUiION4qHaLcqi4A/u7vrSsIgInTa7fvoOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUknvs+RCdnL+1gtx0DOqKZQmDKL3nM9wFFF1AWrujxdX/bYHXSP52dYi/0HFe+A350saF7FbWCm6lKtQ4RQ36z71GsHGg98003FOPMh5XvQmb00brXIk/uvNOA0hlMc/jKfqZXr61OSReFQwegd2vwsDTD9x1t+AqycVNu/VxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJSYPc2S; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4f50d8ce6e0so1507442e0c.0;
        Mon, 12 Aug 2024 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723454208; x=1724059008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbIWC815KkCQo/Ul1lAf6qnju76j2AciTh0K+Rx8BGA=;
        b=dJSYPc2S2YTIw9oT1pbq6ILkAQlfwaxLeGeE5lAYouYdeJnEEmYIamwB2A9BG7FbVf
         6vj8jSv0bFgYjarg8lAnWUtUEvrVSiZMPnP65Vwf792U0DxWRmt7+205KycPS8Wkjh8x
         EXF+ynTkPihx3fvbVvmZT/Phy+2hewhrANZkbnh0u1DQ/9n4HGdbE/fxcISV5rzjJjXo
         xfA/DMC20iBCX0KiR/0DYbBX8OImUf8mWT2j9r9QVooDJDh6nXlepqg7zz1d6Wper3Ot
         mHDkbZsvZrtkQpPXQLJ/tHo//XBFJ1SjPCvcDlqvj0s9IvSlfDJaALssCFdrmKiEKGVA
         S5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723454208; x=1724059008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbIWC815KkCQo/Ul1lAf6qnju76j2AciTh0K+Rx8BGA=;
        b=pN7CI8sFbQxRbNtoEDxFdlhikzfNyf6FsBrRCgVDLSjI6n20OpvdEC8jqV1KkfqnXL
         9mPVMzh9AvMkSR+AS3J+ZGvIEpXTH58sjea4uvnfnK2hlo3aNsrpkR//dCSOHk/6IIAv
         TaKInu7EWRsax2DNH/FmEtg6YMziMDxBMskxjmHMayYCyaYK1NgL6FDVeFFya5Stb0h/
         7eV7VZUF4H35IFmBzthDMhug4+TEN3sVk4nSBKIhAAVBIBRSq/hdArZwAOdwkO3ZeZ+H
         CXWw7XWC9T+oL1xXFrtOfjenXQ1yuOwUJEAoBribgjkef35hf5Q9QY24s3rPOsbnrI+c
         /p9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV614OXYa/1XIYmsHJVt6AIlE3h6WssZnHCatOpcMqc8SItfrzBu40Wu0gEw4ZC0uYHKHat62ITjVCmst/Z1Eow/M6FooWttuLnH5oabvpKqDbyt1TULzJ4itv7VJGbhUC4Ish+yjc25F3ZObELGdMeft756ItMj3mO1Xd48MioXt4kwjQC3W8+YQMH
X-Gm-Message-State: AOJu0YyEiyhVN4wvhwQW9QVHXn9XVmlj1lurNHQmQPAUQdaG1VPyinY7
	3XODtQWvbBrKq25K3qzj3TsGGvn06LIp7/7kg3hSOlqFdjheKp/IuBjv8BAitUYNXGuKkbbEfTQ
	W0w/vu4xRUvS3Pl1KJH8kTNdNUdI=
X-Google-Smtp-Source: AGHT+IHfG3HxVMnVbymhhTBPJnvp2ZhlsObY8YoMYkAFzPeVr8X8rDMGITQ3T+qIIr+vSwcrnrbek7Lskp58T15G1rc=
X-Received: by 2002:a05:6122:16a5:b0:4f6:ad2d:c867 with SMTP id
 71dfb90a1353d-4f912ed2be0mr11189370e0c.12.1723454208369; Mon, 12 Aug 2024
 02:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113466DE7061B60485B3BE97986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113466DE7061B60485B3BE97986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Aug 2024 10:16:22 +0100
Message-ID: <CA+V-a8vioGija2x=eoqn1jZbMpK8PAeLzXQZP52hQn976BKisw@mail.gmail.com>
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

On Mon, Aug 12, 2024 at 8:40=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Sunday, August 11, 2024 9:50 PM
> > Subject: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enabl=
e OSTM, I2C, and SDHI
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD=
2
> > connector) on the RZ/V2H GP-EVK platform.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - New patch
> > ---
> >  .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 191 ++++++++++++++++++
> >  1 file changed, 191 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > index 593c48181248..11c13c85d278 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> > @@ -7,6 +7,8 @@
> >
> >  /dts-v1/;
> >
> > +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >  #include "r9a09g057.dtsi"
> >
> >  / {
> > @@ -14,6 +16,14 @@ / {
> >       compatible =3D "renesas,gp-evk", "renesas,r9a09g057h44", "renesas=
,r9a09g057";
> >
> >       aliases {
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c6 =3D &i2c6;
> > +             i2c7 =3D &i2c7;
> > +             i2c8 =3D &i2c8;
> > +             mmc1 =3D &sdhi1;
> >               serial0 =3D &scif;
> >       };
> >
> > @@ -32,17 +42,186 @@ memory@240000000 {
> >               device_type =3D "memory";
> >               reg =3D <0x2 0x40000000 0x2 0x00000000>;
> >       };
> > +
> > +     reg_3p3v: regulator1 {
> > +             compatible =3D "regulator-fixed";
> > +
> > +             regulator-name =3D "fixed-3.3V";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-boot-on;
> > +             regulator-always-on;
> > +     };
> > +
> > +     vqmmc_sdhi1: regulator-vccq-sdhi1 {
> > +             compatible =3D "regulator-gpio";
> > +             regulator-name =3D "SDHI1 VccQ";
> > +             gpios =3D <&pinctrl RZG2L_GPIO(10, 2) GPIO_ACTIVE_HIGH>;
> > +             regulator-min-microvolt =3D <1800000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             gpios-states =3D <0>;
> > +             states =3D <3300000 0>, <1800000 1>;
> > +     };
> >  };
> >
> >  &audio_extal_clk {
> >       clock-frequency =3D <22579200>;
> >  };
> >
> > +&i2c0 {
> > +     pinctrl-0 =3D <&i2c0_pins>;
> > +     pinctrl-names =3D "default";
> > +
> > +     status =3D "okay";
> > +};
> > +
>
> clock-frequency =3D <100000>; in SoC dtsim
>
> Why frequency set to 100kHz for all the i2c nodes even though SoC support=
s
> Transfer rate up to 1MHz? Is it board limitation restricting to 100kHz?
>
This is due to driver limitation, once driver support for FM+ gets
accepted [0] I plan to update the default frequency to !MHz in SoC
DTSI.

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2024071111=
5207.2843133-9-claudiu.beznea.uj@bp.renesas.com/

Cheers,
Prabhakar

