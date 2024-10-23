Return-Path: <linux-renesas-soc+bounces-9999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376E9ACACE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 15:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2D84281B1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 13:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2071ADFF2;
	Wed, 23 Oct 2024 13:12:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00A814B94F;
	Wed, 23 Oct 2024 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729689121; cv=none; b=nSZbeVe5b8gWcrTnOh9MlFnXDvBugxLAT7KI/qM6ke8z0SPQwQD59Yyy38K/7AhaQanb1lRNiCWZU9LTexJRtKJDYLF8nev2OvOz22sFQ853GO6sBhpA3o82JYSC0HWdyNErewl8LuFKK1j2AN+ggbofBnfx3jZxcgN8gZGMtb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729689121; c=relaxed/simple;
	bh=RLCB/wwIYzb81sPD0IBhIVmVkhUuXCigyqhYKPobdzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tC9XMoQswfRsEry+yadlTHeHND7+AP4bEXg5lf2KFGqRQFg+ra673LtcpTLRLcT94RcBZbi/2hzPANGXxgSAbqAQ+XROXim7we0YsPgkrgOFX8Y2zrwGAidAwr61I4ohxZc1fmytJA67idEEL9V8D9HNB3fDrpP197c91btlCOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e5e5c43497so32654137b3.3;
        Wed, 23 Oct 2024 06:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729689118; x=1730293918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwPQwQiFd2RLAnGRyTPZliatFsw4n+Tc684clixLYHI=;
        b=C6lIrIU1yiNnG0+jqy4r6Xkp8uExNcvQ/p5RkIJ5lfIwx2iM05oqSKTo/c4B38A5Gd
         U6NPNrNQPMSfPNxgU9Gna10RCAnfRiOMkvywbGaWPSueeZV1AXCPoPDXHvuHTY5E1pR8
         MUZt9KWLPlYdJgTGOpkYaic24n4rTAsyrof5RHU73hb1mOQRzQAmWU6kw3wH1FjI5rpw
         S0X8ct9acb8iTCiPOwAdMAL254EHJ29BCDQx7IuBgNbHHUHy5aACsJJGAIR2xOY10Lx+
         kGToc3lDaJ8tjcQNSqTmcrj1SFGRef8ygQHfz1aDDp8pBfbkZp8Y4qlCB3Coy7svhBrq
         TymA==
X-Forwarded-Encrypted: i=1; AJvYcCV72bykF2+MQ1yIZG3NetNHgRdK7SRTmV7o33qlMhW1204MxO7FFuUgLe2Wq8hUbPxbcrtApVIfyVll@vger.kernel.org, AJvYcCVhsJrvLYjTsc1+WrswqMgY+g2rL/8LCOdps/+rfPyE1ldTzY5oZ11o+WHaq/YATDJCxnma9gKNLFH9LQJt@vger.kernel.org, AJvYcCWEfe9Smes3GPwUPUy/CT9cXv+W2qYxf678gcdX/1eFWE7Y/GG9ALO9Na7ZOUtvkwNviZMeKC+suTPupaNFO1v+BTc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg3bGgbxUPO1IzxfZhdnYf86ghqnFoIAfLgmKYHuNXMzmT0Ldb
	LRsENu07jF+8gdBmiaRmUI0v0yIWBj3e36sQNl5inIH/D7peJ6qgYJH2Gr2H
X-Google-Smtp-Source: AGHT+IE208VBVJpVa79gKkF9A1p8KE9d9jsSWhPXL4FzGDkzZeDYbGs1okTzJiHkRKkkefvMZTq/Mw==
X-Received: by 2002:a05:690c:3145:b0:6e2:985:f4df with SMTP id 00721157ae682-6e7f0ffc91cmr21558297b3.44.1729689118503;
        Wed, 23 Oct 2024 06:11:58 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5a502d9sm15089327b3.47.2024.10.23.06.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 06:11:58 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3d97b8274so56709647b3.1;
        Wed, 23 Oct 2024 06:11:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6Wbq+leWdBQQnBdcjAMyHVgJU8AsHkR2Ud1uk8fH3eoXvX4g5I3gEUQ1qIyfDUwMMxfTFdOH+LUMuMCWF@vger.kernel.org, AJvYcCW7+EhEWTGQXeM8VpdxfmwUmw1zE8+NMbRbFIC5F2V+GHxfGFPKDOWWXjyfKNuzz7biXoVy3jUQ0MMp@vger.kernel.org, AJvYcCWBnOy9IItjYZ61bYDa8fo8JhJTyNnCfSacAla9jIAT26iLThcJVa8EVBVtUvUsB5HQwNszhGlr4hGkosvOPYHkaRc=@vger.kernel.org
X-Received: by 2002:a05:690c:f93:b0:6e2:1090:af31 with SMTP id
 00721157ae682-6e7f0dbbacfmr25008687b3.3.1729689117825; Wed, 23 Oct 2024
 06:11:57 -0700 (PDT)
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
 <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
 <TY3PR01MB1134648DE5396A9ED9227BEB186792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWa0=pKfY=RL1NYXP+EBz6AK-6Br4wy4d_g4XwoCyW9og@mail.gmail.com>
 <TY3PR01MB1134642E82FBCF217DFD8A75386792@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346FA2A49CEF90C98EF9335864D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346FA2A49CEF90C98EF9335864D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Oct 2024 15:11:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW19r6BHhxoK73fz79VfszpBteYAPQqTRhYzmkOuk4hVw@mail.gmail.com>
Message-ID: <CAMuHMdW19r6BHhxoK73fz79VfszpBteYAPQqTRhYzmkOuk4hVw@mail.gmail.com>
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

On Wed, Oct 23, 2024 at 3:04=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Fri, Oct 11, 2024 at 9:43=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Wed, Oct 9,
> > > > > 2024 at 11:41=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.com> wr=
ote:
> > > > > > > From: Geert Uytterhoeven <geert@linux-m68k.org> On Tue, Oct 8=
,
> > > > > > > 2024 at 10:10=E2=80=AFPM Lad, Prabhakar <prabhakar.csengg@gma=
il.com> wrote:
> > > > > > > > On Tue, Oct 8, 2024 at 6:33=E2=80=AFPM Biju Das <biju.das.j=
z@bp.renesas.com> wrote:
> > > > > > > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > > > > > > From: Lad Prabhakar
> > > > > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > > >
> > > > > > > > > > > Add OPP table for RZ/V2H(P) SoC.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Lad Prabhakar
> > > > > > > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > > > > > > ---
> > > > > > > > > > > v1->v2
> > > > > > > > > > > - Set opp-microvolt to 800000 for frequencies below
> > > > > > > > > > > 1.1GHz
> > > > > > > > > > > ---
> > > > > > > > > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41
> > > > > > > > > > > ++++++++++++++++++++++
> > > > > > > > > > >  1 file changed, 41 insertions(+)
> > > > > > > > > > >
> > > > > > > > > > > diff --git
> > > > > > > > > > > a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > > > > b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > > > > index 1ad5a1b6917f..4bbe75b81f54 100644
> > > > > > > > > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > > > > > > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> > > > > > > > > > >             clock-frequency =3D <0>;
> > > > > > > > > > >     };
> > > > > > > > > > >
> > > > > > > > > > > +   /*
> > > > > > > > > > > +    * The default cluster table is based on the assu=
mption that the PLLCA55 clock
> > > > > > > > > > > +    * frequency is set to 1.7GHz. The PLLCA55 clock =
frequency can be set to
> > > > > > > > > > > +    * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1=
 pins (and additionally can be
> > > > > > > > > > > +    * clocked to 1.8GHz as well). The table below sh=
ould be overridden in the board
> > > > > > > > > > > +    * DTS based on the PLLCA55 clock frequency.
> > > > > > > > > > > +    */
> > > > > > > > > > > +   cluster0_opp: opp-table-0 {
> > > > > > > > > > > +           compatible =3D "operating-points-v2";
> > > > > > > > > > > +
> > > > > > > > > > > +           opp-1700000000 {
> > > > > > > > > > > +                   opp-hz =3D /bits/ 64 <1700000000>=
;
> > > > > > > > > > > +                   opp-microvolt =3D <900000>;
> > > > > > > > > >
> > > > > > > > > > Not sure CA-55 can change voltage from 800mV to 900mV??
> > > > > > > > > > Based on Power Domain Control, it needs to be in AWO
> > > > > > > > > > mode for changing the PD_CA55
> > > voltage.
> > > > > > > > > >
> > > > > > > > > > The manual says OD voltage is 0.9V and ND voltage is 0.=
8V.
> > > > > > > > > >
> > > > > > > > > > Is 1.7GHZ is ND or OD?
> > > > > > > > >
> > > > > > > > > {1.7,1.6,1.5 GHz} is enabled when VDD09_CA55 is at 0.9 V
> > > > > > > > > and for
> > > > > > > > > 1.1 GHz it is 0.8V.
> > > > > > > > >
> > > > > > > > > Maybe when you do /2, /4, /8 using dividers, the voltage
> > > > > > > > > may be still the same??
> > > > > > > > >
> > > > > > > > I think you are right when BOOTPLLCA[1:0] pins are set to
> > > > > > > > 1.7GHz the
> > > > > > > > VDD09_CA55 is at 0.9 V, further dividing the clock shouldnt
> > > > > > > > affect the voltage levels at the PMIC output.
> > > > > > > >
> > > > > > > > Geert, please let me know if my understanding is incorrect.
> > > > > > >
> > > > > > > The actual VDD09_CA55 voltage is controlled by the external
> > > > > > > PMIC (RAA215300).  It is the responsibility of the system
> > > > > > > designer to make sure VDD09_CA55 is at 0.9V when
> > > > > > > BOOTPLLCA[1:0] is strapped for OD, as CPU core clock rates
> > > > > higher than 1.1 GHz need a higher core voltage.
> > > > > > > I don't think it hurts to supply the higher core voltage whil=
e
> > > > > > > running the CPU core at low core frequencies, except for extr=
a power consumption.
> > > > > > >
> > > > > > > To control VDD09_CA55 dynamically, the CPU cores should have
> > > > > > > cpu-supply properties pointing to the regulator controlling i=
t (raa215300).
> > > > > >
> > > > > > This needs a big work(see: 4.5.3.1.3 PD_CA55 area voltage chang=
e).
> > > > > > CA-55 needs to signal CM-33 so that it switches to AWO mode(Onl=
y
> > > > > > CM-33 is active) and In AWO mode, CM33 is in charge of changing
> > > > > > CA55 voltage and then switches to ALL-ON mode
> > > > >
> > > > > Ugh, this is indeed much more complicated than on other SoCs.
> > > > > So basically you are stuck with the initial voltage settings.
> > > >
> > > > FYI, I got confirmation that 1.7GHz,0.9V is Normal drive and It is
> > > > the default for RZ/V2H and upcoming RZ/G3E SoCs.
> > >
> > > OK, so no "turbo-mode" property is needed.
> >
> > "turbo-mode" is 1.8GHz
> >
> > "1.8GHz cannot be supported by CA55 only (CM33 is required) so upstream=
 target is 1.7GHz."
> >
> > So, without CM-33, turbo-mode is not possible?? We are rechecking this =
and will provide feedback once
> > we get info from HW people.
>
> Got update from HW team.
>
> From HW point of view, 1.8GHz, 0.9V is over drive and 1.1GHz, 0.8V is nor=
mal drive.
> but for achieving 1.8GHz, CM33 is required. So no "turbo-mode" property i=
s needed.
>
> But viewpoint from Linux, 1.7GHz, 0.9V is over drive and 1.1GHz, 0.8V is =
normal drive
> and 1.7GHz should be the upstream target.

Thanks for the follow-up!

> As you said, looks like the current patch is good enough.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

