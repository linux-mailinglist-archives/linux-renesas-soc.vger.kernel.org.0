Return-Path: <linux-renesas-soc+bounces-9624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA999654F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 11:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22E052817FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 09:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8379018A92D;
	Wed,  9 Oct 2024 09:28:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42937189B9D;
	Wed,  9 Oct 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728466102; cv=none; b=ZZdOr/Iq/NcenjkClGjjH8FRmYtD3r63uV2aUvW/A8yNX2vzHq8tSmfmWkqTai8rcyLG+BtrJNrM0a/CGquNOH0fpcqI4CtQMP905YoQWBUYLZD3Pj6AXHBbl2Y5MUkSsyvSSKkon/j3y0TRlTfzfUCv/pVUm6jKM/5wPV6STzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728466102; c=relaxed/simple;
	bh=3uH0VHQ5FbfEU6U+DIwCrLir1cI06f1Nwd6HjQO06xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWb+d93DL7KPfsnat6A9MDzoy9eyV/7OZeG2zdljBUFWoSfJtrEEL1C3a7QK0EQKQni0xkqnOOX7k1LUkOWSxyOtdj96S6R03qm1yGGZTpK7V5f7HhhkJEnaucLDNy+1vcvG7afdB80MvATerALetNZVYfB2wxZl8LFOtg2sr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6dde476d3dfso53403027b3.3;
        Wed, 09 Oct 2024 02:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728466098; x=1729070898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2aKKIBJN+fcgMd4SG9SyuTgYPFz3/hZQ2vaXaYBN9Y=;
        b=AusfVUV6i4vaAArcHqJsYBY3mvtB+2+3x+P8zLNVT8TilslC4xS5cC0n2XBV+SFQ2T
         EdYgD+gSUqtSuZxpG6Kx8SLCK9RLmJ7knezp/iruZNY3D8QBGoEm0MbZGE0hMB9izT1e
         Hgfa+bEDXnckbPMQiW6VvUsny1GJPwKqWxK8j0e7EWPVsWCkYMBH5FggGUml/d4ltbPm
         Kpmmo/ISo1ChiH6XtJSBViQxtY0A2DRslX31BxuYebTIB1eah5k9fc6f6pbKp/MvSbKN
         WRyzIGzcB433lUlx8SLgzyteHb0GpkN5SjXjnMOBktU2FPhBmqWMlAYxljFwEhNoB/wE
         r2JA==
X-Forwarded-Encrypted: i=1; AJvYcCU3IMA5JzjA+DnK7XTv46blvBWOzmdBRrqd1MmPUA3F2pxtI9ug+9ByjeVs7NnINi6Adf7tyTcRgp7l@vger.kernel.org, AJvYcCVY3A8M+zI5tVEO/2PQxT3VkdCJDaAPCuEDyLI7uHzz2CUIHC/C4wic3KUpBdkh8JbqCD582TlD17KUXImLcUyeXVM=@vger.kernel.org, AJvYcCXlfMRQHl+aRqnPZiK9TIL+UsXACrycCebOKmXMs9jCVA7lnal/J4cnoO9T84ObVR5dolg99e6IfpQlLCR5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4jkyblgKuTSwsAZlm0oXRAeWXUWyxH7dF+KLCUFrCjXDkPoJx
	GKp/Pn0m+vqcLj9hqijCrSGXAzCT9msmjexjaFcCG4KleGbulk2XJ1YDfUHm
X-Google-Smtp-Source: AGHT+IGwIN0KgjdXBRIUnow8+1heDS02mBfKjHKUuLUK/UOv5Zme7olUq6bkJ0wI+qmPgqskmxft5A==
X-Received: by 2002:a05:690c:399:b0:6e2:71b:150 with SMTP id 00721157ae682-6e3221a1695mr15829927b3.29.1728466098234;
        Wed, 09 Oct 2024 02:28:18 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e32b55ad9dsm266297b3.98.2024.10.09.02.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 02:28:17 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6dde476d3dfso53402747b3.3;
        Wed, 09 Oct 2024 02:28:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWTRq62LQzK82rHDL3z7M7ZXZ5sbLU+KYURtqU0Evh+iOJAu6Dooxjq6r5fcCVI7PrpHYXoLCGVkGOkZY/Va0ely2M=@vger.kernel.org, AJvYcCWoYhm7IbHwSkTrjwuOWb1kHO9LzeJFCxpeRQWMUbbTD2kfGUWTvupQizKHHbaeCS65SIlVV/thZ1m5Ip0e@vger.kernel.org, AJvYcCWs24KcHeMCk2LHo2vr/th014Vbsktt++vlekDwUS+US3QFyiFF6T6Htl42otzu4kD1rlW4KqBM+XVt@vger.kernel.org
X-Received: by 2002:a05:690c:f06:b0:6e3:1f02:4069 with SMTP id
 00721157ae682-6e322133df8mr20738077b3.7.1728466097482; Wed, 09 Oct 2024
 02:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
In-Reply-To: <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Oct 2024 11:28:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
Message-ID: <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Oct 8, 2024 at 10:10=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Oct 8, 2024 at 6:33=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add OPP table for RZ/V2H(P) SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > > v1->v2
> > > > - Set opp-microvolt to 800000 for frequencies below 1.1GHz
> > > > ---
> > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++=
++++
> > > >  1 file changed, 41 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm6=
4/boot/dts/renesas/r9a09g057.dtsi
> > > > index 1ad5a1b6917f..4bbe75b81f54 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> > > >             clock-frequency =3D <0>;
> > > >     };
> > > >
> > > > +   /*
> > > > +    * The default cluster table is based on the assumption that th=
e PLLCA55 clock
> > > > +    * frequency is set to 1.7GHz. The PLLCA55 clock frequency can =
be set to
> > > > +    * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and add=
itionally can be
> > > > +    * clocked to 1.8GHz as well). The table below should be overri=
dden in the board
> > > > +    * DTS based on the PLLCA55 clock frequency.
> > > > +    */
> > > > +   cluster0_opp: opp-table-0 {
> > > > +           compatible =3D "operating-points-v2";
> > > > +
> > > > +           opp-1700000000 {
> > > > +                   opp-hz =3D /bits/ 64 <1700000000>;
> > > > +                   opp-microvolt =3D <900000>;
> > >
> > > Not sure CA-55 can change voltage from 800mV to 900mV??
> > > Based on Power Domain Control, it needs to be in AWO mode for changin=
g the PD_CA55 voltage.
> > >
> > > The manual says OD voltage is 0.9V and ND voltage is 0.8V.
> > >
> > > Is 1.7GHZ is ND or OD?
> >
> > {1.7,1.6,1.5 GHz} is enabled when VDD09_CA55 is at 0.9 V
> > and for 1.1 GHz it is 0.8V.
> >
> > Maybe when you do /2, /4, /8 using dividers, the voltage may be still
> > the same??
> >
> I think you are right when BOOTPLLCA[1:0] pins are set to 1.7GHz the
> VDD09_CA55 is at 0.9 V, further dividing the clock shouldnt affect the
> voltage levels at the PMIC output.
>
> Geert, please let me know if my understanding is incorrect.

The actual VDD09_CA55 voltage is controlled by the external PMIC
(RAA215300).  It is the responsibility of the system designer to make
sure VDD09_CA55 is at 0.9V when BOOTPLLCA[1:0] is strapped for OD,
as CPU core clock rates higher than 1.1 GHz need a higher core voltage.
I don't think it hurts to supply the higher core voltage while
running the CPU core at low core frequencies, except for extra power
consumption.

To control VDD09_CA55 dynamically, the CPU cores should have cpu-supply
properties pointing to the regulator controlling it (raa215300).
I haven't checked how Linux behaves when no cpu-supply property is
present, or when it points to a fixed regulator.

I am also wondering if other opps (1.1/1.5/1.6/1.8 GHz) should be
added, too?  And probably any opp above 1.1GHz opp should be tagged with
"turbo-mode"?

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

