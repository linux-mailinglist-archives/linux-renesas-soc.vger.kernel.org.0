Return-Path: <linux-renesas-soc+bounces-9626-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D399966A7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 12:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 282071F21164
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 10:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A853E18E05C;
	Wed,  9 Oct 2024 10:08:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B794B18D640;
	Wed,  9 Oct 2024 10:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468533; cv=none; b=U88QAbGpTPi23NH30RX3DVVA2N1+9lRw5Xrc+VDa7E+sObiXrV0hHmAQqmdkAalwPFdvBg3q2yMeqHgHUIsgX1NlcMWTEHIu271A/svbE020fDHmevdBVL3Z/QyNlM8St1wABuscFDkS3LwVi8Fr0Hk5Lbef3ciVoSVSLUzbg0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468533; c=relaxed/simple;
	bh=A9arrd6CXln4kM45qcu3k0KnTcQURZ4YPe/hgYZUnKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HApZZ7rL/ni0RILMzNF8NHWWCZe2+xaHr3R1+jfIcnTJW7h/XoaKC+yQsoosF/Ojz77L6D4DeW7pFs4VdJFx/iB1BLlIMWhtjFArKnrVN1nD/o+KZPbFfS22CPC0pc1QqkaRjsqX8NrtYJgch5KiWDaRV+wbWjPpeYEvaqV9Rrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e314136467so6872247b3.0;
        Wed, 09 Oct 2024 03:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728468530; x=1729073330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vV5IRQRxtXB52TxK3F1q5QKIg2zVBkFtlRq/GKjlVs=;
        b=oKF0rRo5bJ7701ObuwsOkYgCZTG1ECrTlqNUIv6+H+U5cFCILahchBPK7f6EM0gOhe
         Sm5gNtXuxj2wzL8gK2p4ovgopzEREz5hcrNRjGjWnN2r802ZzU7gJMggYKRVOl/dHtdL
         4hJGUnV4eOTGvaO2gyoBCoSZghNNdI+Ju5bGnTVc821hBNZYeqezQJrs5D1veZO8uH/r
         R+w84094Ck3U+kX4RLz5UAR9GzUixniDe99vVm/gGEU7m+2/M8kmCv6qIDnF+w3Nz5gl
         lBspFiyEsH4xbShQh8i0OKMWrqBHvQjaxJyUA9kr4lTUKEfF41Cmh/7+MCmC0NCZpd7M
         lIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhnErpDxxKaGRBOs+PQ4l1MKP+Jh5X4FjmC3WF5auqzsxnIkQo/DgtY1qHDp5gWN3knWsHirBHy7egX3u2@vger.kernel.org, AJvYcCWi6jd19Ot3ui+d7hwWttSioTPHmxO6RMfDjtftYwK6DNooB3cGxGynEAdOKS9JOLMJ6vijymxZfI6ZfmgrgLdniCg=@vger.kernel.org, AJvYcCXYM0iqlfe0o/w/WtaMR/+SAMVRMzZldrLDtVSUCGkVDoi3kaF6ndq+8MHv9aJQeadsb/GF7AAxcdQU@vger.kernel.org
X-Gm-Message-State: AOJu0YyA5PakWTDh7LZqOybjtCOleGmhkvE6BRbHZlSjPIM3xR4nRq+h
	dyJXUHhJG/fx1cJIDnHZ1Z8cz0YpI6O8zjTr2EjCjmOd7RDnuKJYFWIQA+pm
X-Google-Smtp-Source: AGHT+IHLkM1luoBL1ZzPhCE4YH3QqquIvwRkLaxF9iYxbKFOxjP2llmuUnJiyotHz+qhqNl6tIZ6Hg==
X-Received: by 2002:a0d:ee44:0:b0:6e3:1f43:3ad1 with SMTP id 00721157ae682-6e31f433ec3mr14418167b3.14.1728468530378;
        Wed, 09 Oct 2024 03:08:50 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e32bab5d97sm303757b3.23.2024.10.09.03.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 03:08:50 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e314136467so6872107b3.0;
        Wed, 09 Oct 2024 03:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+2xnNmZ+d04dQeiULiGecqmXpLxp1R1AVmwKvsSyhj+uIlF1c6jIHVeeq8YtQLEOK4uDw8yNbBJhm@vger.kernel.org, AJvYcCW7iVssmoD4LueSCydff6cP6hauZDcAfmJRpWue7TDa4QJrmYAX4G9GOTn69sRbOaUihf0I+fzDRjnnJi1n@vger.kernel.org, AJvYcCWkoIgpJLYyO2lOQ1INr7h55C974BwDeGrS78QN4Zl7VhT9VjbU4b7Emd4BrH/01qzo3XxYBPndGlaiCpU34V6i1jY=@vger.kernel.org
X-Received: by 2002:a05:690c:ed0:b0:6db:cea9:6ed9 with SMTP id
 00721157ae682-6e32219a1f8mr16489267b3.4.1728468529925; Wed, 09 Oct 2024
 03:08:49 -0700 (PDT)
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
 <CAMuHMdULuCWd1V0Az=NWHhSb7voDKbTo9rp3Excntp7qvTbbuQ@mail.gmail.com> <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460ED98BB6EE2575D0CBC7867F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Oct 2024 12:08:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
Message-ID: <CAMuHMdX8rCM+yG4cwtG9yogwz0xWqD3O0aiXNMwE9Vkcpyhrkw@mail.gmail.com>
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

On Wed, Oct 9, 2024 at 11:41=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, Oct 8, 2024 at 10:10=E2=80=AFPM Lad, Prabhakar <prabhakar.cseng=
g@gmail.com> wrote:
> > > On Tue, Oct 8, 2024 at 6:33=E2=80=AFPM Biju Das <biju.das.jz@bp.renes=
as.com> wrote:
> > > > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Add OPP table for RZ/V2H(P) SoC.
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar
> > > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > ---
> > > > > > v1->v2
> > > > > > - Set opp-microvolt to 800000 for frequencies below 1.1GHz
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41
> > > > > > ++++++++++++++++++++++
> > > > > >  1 file changed, 41 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > index 1ad5a1b6917f..4bbe75b81f54 100644
> > > > > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > > > > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> > > > > >             clock-frequency =3D <0>;
> > > > > >     };
> > > > > >
> > > > > > +   /*
> > > > > > +    * The default cluster table is based on the assumption tha=
t the PLLCA55 clock
> > > > > > +    * frequency is set to 1.7GHz. The PLLCA55 clock frequency =
can be set to
> > > > > > +    * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and=
 additionally can be
> > > > > > +    * clocked to 1.8GHz as well). The table below should be ov=
erridden in the board
> > > > > > +    * DTS based on the PLLCA55 clock frequency.
> > > > > > +    */
> > > > > > +   cluster0_opp: opp-table-0 {
> > > > > > +           compatible =3D "operating-points-v2";
> > > > > > +
> > > > > > +           opp-1700000000 {
> > > > > > +                   opp-hz =3D /bits/ 64 <1700000000>;
> > > > > > +                   opp-microvolt =3D <900000>;
> > > > >
> > > > > Not sure CA-55 can change voltage from 800mV to 900mV??
> > > > > Based on Power Domain Control, it needs to be in AWO mode for cha=
nging the PD_CA55 voltage.
> > > > >
> > > > > The manual says OD voltage is 0.9V and ND voltage is 0.8V.
> > > > >
> > > > > Is 1.7GHZ is ND or OD?
> > > >
> > > > {1.7,1.6,1.5 GHz} is enabled when VDD09_CA55 is at 0.9 V and for 1.=
1
> > > > GHz it is 0.8V.
> > > >
> > > > Maybe when you do /2, /4, /8 using dividers, the voltage may be
> > > > still the same??
> > > >
> > > I think you are right when BOOTPLLCA[1:0] pins are set to 1.7GHz the
> > > VDD09_CA55 is at 0.9 V, further dividing the clock shouldnt affect th=
e
> > > voltage levels at the PMIC output.
> > >
> > > Geert, please let me know if my understanding is incorrect.
> >
> > The actual VDD09_CA55 voltage is controlled by the external PMIC (RAA21=
5300).  It is the
> > responsibility of the system designer to make sure VDD09_CA55 is at 0.9=
V when BOOTPLLCA[1:0] is
> > strapped for OD, as CPU core clock rates higher than 1.1 GHz need a hig=
her core voltage.
> > I don't think it hurts to supply the higher core voltage while running =
the CPU core at low core
> > frequencies, except for extra power consumption.
> >
> > To control VDD09_CA55 dynamically, the CPU cores should have cpu-supply=
 properties pointing to the
> > regulator controlling it (raa215300).
>
> This needs a big work(see: 4.5.3.1.3 PD_CA55 area voltage change).
> CA-55 needs to signal CM-33 so that it switches to AWO mode(Only CM-33 is=
 active) and
> In AWO mode, CM33 is in charge of changing CA55 voltage and then switches=
 to ALL-ON mode
>

Ugh, this is indeed much more complicated than on other SoCs.
So basically you are stuck with the initial voltage settings.

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

