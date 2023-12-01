Return-Path: <linux-renesas-soc+bounces-524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B84800CB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 14:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A97AB212BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415B23C083;
	Fri,  1 Dec 2023 13:58:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 954DFCF;
	Fri,  1 Dec 2023 05:58:27 -0800 (PST)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5d33574f64eso21260207b3.3;
        Fri, 01 Dec 2023 05:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701439106; x=1702043906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++6+OjzDPNE9iBiMEjK/LzWtgvbJm+3E8WxpGVHPw6M=;
        b=M5ozXlhsW1bKc3Q9d/MbMOPfp4m6POApsNPfDzy9jC9TQ5nnSVLQ8dGnGvPdIWJEPG
         5gjPm2tQc3M2C9xGyVSJmTMiz5qHC8m/tTfWmzAf53c7UmknxD8cepH1g1xFZSxsIocU
         Q4q5u8O2uqcL0EwWQ1u1VmF4SocZnFEl9H3sLASHoXyaoTLsMPax2gPTa1JNbguB0J7X
         Xuli3PbW5fDwKfEBlZxqDCbFzaW1moG2ezoJszC3pSlsBGeyP0VwAedMiTjeanPaRPJ7
         mKjI2TPDPxRQ89MZMLKbJGutv7LIoT5a6WC9/BK8umwybi7o12a5Dip4Hjy9jJ5uzcFL
         qUvw==
X-Gm-Message-State: AOJu0YzgC4blp9pznaeQXWBbcAJOo90KrA9dIFjcc0Rn/1GBMMNv1sWB
	cnwOTjr1p+FNpPlKQQhj1rguUQueZ/yz2g==
X-Google-Smtp-Source: AGHT+IG7W8rkMlGoi1YZNYPQPwX4EfbsSkeQk/z4Y1K5UyInFtOxTnYtrxdlgR8iX3nAzTOm83L3MA==
X-Received: by 2002:a0d:c607:0:b0:5c8:708f:1ea with SMTP id i7-20020a0dc607000000b005c8708f01eamr26684213ywd.32.1701439106674;
        Fri, 01 Dec 2023 05:58:26 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id n127-20020a0dcb85000000b005ccf7fc2197sm90012ywd.24.2023.12.01.05.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 05:58:26 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5d3d0f862f7so12884517b3.0;
        Fri, 01 Dec 2023 05:58:26 -0800 (PST)
X-Received: by 2002:a25:660f:0:b0:da0:3d0d:3a18 with SMTP id
 a15-20020a25660f000000b00da03d0d3a18mr25739065ybc.39.1701439106271; Fri, 01
 Dec 2023 05:58:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201110840.37408-1-biju.das.jz@bp.renesas.com>
 <20231201110840.37408-6-biju.das.jz@bp.renesas.com> <CAMuHMdXH3VVg0KmC0rtjeb_A_Awj805Mirc4pZu=KDZO9pdZZQ@mail.gmail.com>
 <TYVPR01MB1127976D50055BD345C7935F28681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
In-Reply-To: <TYVPR01MB1127976D50055BD345C7935F28681A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Dec 2023 14:58:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjxMA_z-Zwf+WtKFOQRFfU-fF4t6y+AsH0Xrwhy+JqtQ@mail.gmail.com>
Message-ID: <CAMuHMdWjxMA_z-Zwf+WtKFOQRFfU-fF4t6y+AsH0Xrwhy+JqtQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: rzg2ul-smarc: Enable PMIC and
 built-in RTC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Dec 1, 2023 at 2:48=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Fri, Dec 1, 2023 at 12:09=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:
> > > Enable PMIC DA9062 and the built-in RTC on the RZ/{G2UL,Five} SMARC
> > > EVK.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
> > > @@ -23,6 +23,35 @@ &cpu_dai {
> > >  &i2c0 {
> > >         clock-frequency =3D <400000>;
> > >
> > > +       da9062: pmic@58 {
> > > +               compatible =3D "dlg,da9062";
> > > +               reg =3D <0x58>;
> > > +
> > > +               da9062_rtc: rtc {
> > > +                       compatible =3D "dlg,da9062-rtc";
> > > +               };
> > > +
> > > +               da9062_onkey: onkey {
> > > +                       compatible =3D "dlg,da9062-onkey";
> > > +                       status =3D "disabled";
> >
> > Why is this disabled? This is connected to the power button.
>
> I haven't tested this driver. OK I will test and enable it.
>
> >
> > > +               };
> > > +
> > > +               watchdog {
> > > +                       compatible =3D "dlg,da9062-watchdog";
> > > +                       status =3D "disabled";
> > > +               };
> > > +
> > > +               thermal {
> > > +                       compatible =3D "dlg,da9062-thermal";
> > > +                       status =3D "disabled";
> > > +               };
> > > +
> > > +               gpio {
> > > +                       compatible =3D "dlg,da9062-gpio";
> > > +                       status =3D "disabled";
> > > +               };
> >
> > Why are these three disabled?
> > If they are truly unused, you can just drop the nodes instead.
>
> If I drop these, I get failed messages(eg: da9062-gpio: Failed to locate =
of_node [id: -1])
> for these nodes.

IC... They are indeed mandatory, but ignored when disabled.
Hence the subnodes should be made required in the DT bindings.

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

