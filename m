Return-Path: <linux-renesas-soc+bounces-9676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC690999E77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 09:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA4F81C20EBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 07:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECC0207217;
	Fri, 11 Oct 2024 07:48:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3D9194C8B;
	Fri, 11 Oct 2024 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728632926; cv=none; b=bRVXW/RolNPlrKpS72otYnV0gVds6HwfkgE0s8wVrLa01dc+QBFzmnWqION5EndS9CNydOKR3XIrbegurtAPZKSWOkyangFy5ENSAsvIItqLqASu+A2/V9+D7P4HCgXMXt9EqOkWpp24ZKBCE8DtvvVZAOLlhXAhkdxIhbnY9MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728632926; c=relaxed/simple;
	bh=5PxAtmEg6c80GcTqw9EtUJyLEYvoimLldfv2T6Djfec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpR95eQNMIj2LHaQTsY34Cle1lPDT0Bw4qhOspcxATnOe76ZEnX0ffQJKFcMybBMwiCY68aZkR8UwrNZmBR5WfkS1VgVu3NSMVvoI//cV5+85t5QiNtTPanf7jJjo1326z3JMByv3OFWMlFmV7u1Rvi7c1ip3xiNg90jHtgvgnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e292926104bso100211276.0;
        Fri, 11 Oct 2024 00:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728632923; x=1729237723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF1rn831cmH5mrZVO8Opg9/mH+FUDVvlewE3yyVEIFQ=;
        b=i6ScBP9S1u2od9tLYoeqr7om9KpJyeEh3VQ9M0aBo1JRMsuhJAA56qqgvVTjvQiw90
         Q4CDmgbOuHnlMvsS86cwwqi3SAynn72/MG8EKolXJc06Qq++XOJp/Oz3Sia1eSiktYeA
         j/z2zOUSQxXnY9ucaDJ2viCiaahfC8KVqqjGXlUk57NEoLHsZluUihiUMu4vCG/JQtaV
         XZHDPe6VrDokqi/DyxzqAhnpXTV9w0Ynlazd+hqZdicLaeRwLfjMtmJYF06IhXLqnAME
         HWN81YEhT3S0VAnxVxDM/0AcxzWF6PNYDW+JCDCb1OWEvRVWfVin91ZDdoJlR0LK6jLj
         VARA==
X-Forwarded-Encrypted: i=1; AJvYcCUY5bwgHmx8NRoD5B0SQhnl3mscrJvrpUst0nOFL+MERJyOW0r4TBqABYPtRMcp6FtfFgw5KhB0bCv1@vger.kernel.org, AJvYcCUnAp+jA5D08FSCmIgCPqCNX0PPCzgDy4/fuoAZyJzYswJ82OZKJ0M+VuPUmXNtX6DApuCIPeIPaVfgvwah5xaSGPk=@vger.kernel.org, AJvYcCVZR9gOHs6MG/U89zXq4mbvwkQtyQXKoS8jb7JNiIetFPVYJjmFOTvLxmS2ArtovhcsQi/vbUe9hAYw3i2P@vger.kernel.org
X-Gm-Message-State: AOJu0YzpoC4jWudy/sd+VZjGbYPYOd4Ry0VlD4pzrBzXtsu1wgPyCVHC
	Jtv5cgtM9OTVxCO9RJ5IrLIVlkuKS6fE6BxLftDzTougfPWDCnFTF2rO0dK5b1E=
X-Google-Smtp-Source: AGHT+IGCJE97opgCDg4IQkzRl5bQfd+YTaXchmqBwed2h2sY6U9nWMUxDX6AxGDvtjmh6JAkzRCWjw==
X-Received: by 2002:a05:6902:1387:b0:e29:f0e:e7e4 with SMTP id 3f1490d57ef6-e2919da241fmr1179964276.29.1728632922851;
        Fri, 11 Oct 2024 00:48:42 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e290ef7cbcfsm689780276.62.2024.10.11.00.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 00:48:42 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6db20e22c85so14481507b3.0;
        Fri, 11 Oct 2024 00:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFkLvm7rKVlZHsNL9ezYOW6nRpRyYwdeHa7UPx4hkbTtbhujdoqSNxxIi/SAvBGSv8B443qcR0ZJCnaQ3B@vger.kernel.org, AJvYcCXTo55IT1yWMbxrqdkXAN2w5mH1Qvzy+MBuAdUwsdefjWL78wI5A64UEimrDwiuO1f0UolfBhfjZImM@vger.kernel.org, AJvYcCXvIgJbe7+XImAecpfdxaB4jsjicV/M/IW1WCdjLpVM8VEkGrue932bHoWoDqMRwU0pPBF+R5t/LM6GRMY4yBwlpSA=@vger.kernel.org
X-Received: by 2002:a05:690c:c0a:b0:6e3:1f02:407b with SMTP id
 00721157ae682-6e3479b952emr12992727b3.11.1728632921631; Fri, 11 Oct 2024
 00:48:41 -0700 (PDT)
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
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com>
 <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com> <TY3PR01MB1134648DE5396A9ED9227BEB186792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134648DE5396A9ED9227BEB186792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2024 09:48:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa0=pKfY=RL1NYXP+EBz6AK-6Br4wy4d_g4XwoCyW9og@mail.gmail.com>
Message-ID: <CAMuHMdWa0=pKfY=RL1NYXP+EBz6AK-6Br4wy4d_g4XwoCyW9og@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Oct 11, 2024 at 9:43=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Wed, Oct 9, 2024 at 11:41=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Tue, Oct 8, 2024
> > > > at 10:10=E2=80=AFPM Lad, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > > > On Tue, Oct 8, 2024 at 6:33=E2=80=AFPM Biju Das <biju.das.jz@bp.r=
enesas.com> wrote:
> > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > > > From: Lad Prabhakar
> > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > >
> > > > > > > > Add OPP table for RZ/V2H(P) SoC.
> > > > > > > >
> > > > > > > > Signed-off-by: Lad Prabhakar
> > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > ---
> > > > > > > > v1->v2
> > > > > > > > - Set opp-microvolt to 800000 for frequencies below 1.1GHz
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41
> > > > > > > > ++++++++++++++++++++++
> > > > > > > >  1 file changed, 41 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > index 1ad5a1b6917f..4bbe75b81f54 100644
> > > > > > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> > > > > > > >             clock-frequency =3D <0>;
> > > > > > > >     };
> > > > > > > >
> > > > > > > > +   /*
> > > > > > > > +    * The default cluster table is based on the assumption=
 that the PLLCA55 clock
> > > > > > > > +    * frequency is set to 1.7GHz. The PLLCA55 clock freque=
ncy can be set to
> > > > > > > > +    * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins =
(and additionally can be
> > > > > > > > +    * clocked to 1.8GHz as well). The table below should b=
e overridden in the board
> > > > > > > > +    * DTS based on the PLLCA55 clock frequency.
> > > > > > > > +    */
> > > > > > > > +   cluster0_opp: opp-table-0 {
> > > > > > > > +           compatible =3D "operating-points-v2";
> > > > > > > > +
> > > > > > > > +           opp-1700000000 {
> > > > > > > > +                   opp-hz =3D /bits/ 64 <1700000000>;
> > > > > > > > +                   opp-microvolt =3D <900000>;
> > > > > > >
> > > > > > > Not sure CA-55 can change voltage from 800mV to 900mV??
> > > > > > > Based on Power Domain Control, it needs to be in AWO mode for=
 changing the PD_CA55 voltage.
> > > > > > >
> > > > > > > The manual says OD voltage is 0.9V and ND voltage is 0.8V.
> > > > > > >
> > > > > > > Is 1.7GHZ is ND or OD?
> > > > > >
> > > > > > {1.7,1.6,1.5 GHz} is enabled when VDD09_CA55 is at 0.9 V and fo=
r
> > > > > > 1.1 GHz it is 0.8V.
> > > > > >
> > > > > > Maybe when you do /2, /4, /8 using dividers, the voltage may be
> > > > > > still the same??
> > > > > >
> > > > > I think you are right when BOOTPLLCA[1:0] pins are set to 1.7GHz
> > > > > the
> > > > > VDD09_CA55 is at 0.9 V, further dividing the clock shouldnt affec=
t
> > > > > the voltage levels at the PMIC output.
> > > > >
> > > > > Geert, please let me know if my understanding is incorrect.
> > > >
> > > > The actual VDD09_CA55 voltage is controlled by the external PMIC
> > > > (RAA215300).  It is the responsibility of the system designer to
> > > > make sure VDD09_CA55 is at 0.9V when BOOTPLLCA[1:0] is strapped for=
 OD, as CPU core clock rates
> > higher than 1.1 GHz need a higher core voltage.
> > > > I don't think it hurts to supply the higher core voltage while
> > > > running the CPU core at low core frequencies, except for extra powe=
r consumption.
> > > >
> > > > To control VDD09_CA55 dynamically, the CPU cores should have
> > > > cpu-supply properties pointing to the regulator controlling it (raa=
215300).
> > >
> > > This needs a big work(see: 4.5.3.1.3 PD_CA55 area voltage change).
> > > CA-55 needs to signal CM-33 so that it switches to AWO mode(Only CM-3=
3
> > > is active) and In AWO mode, CM33 is in charge of changing CA55 voltag=
e
> > > and then switches to ALL-ON mode
> >
> > Ugh, this is indeed much more complicated than on other SoCs.
> > So basically you are stuck with the initial voltage settings.
>
> FYI, I got confirmation that 1.7GHz,0.9V is Normal drive and
> It is the default for RZ/V2H and upcoming RZ/G3E SoCs.

OK, so no "turbo-mode" property is needed.

And hence this patch is good as-is?
Thanks!

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

