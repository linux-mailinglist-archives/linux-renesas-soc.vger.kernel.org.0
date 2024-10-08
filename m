Return-Path: <linux-renesas-soc+bounces-9608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124FE995830
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 22:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D2E21C2145D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 20:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1DA21501D;
	Tue,  8 Oct 2024 20:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Plcn63EZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67400215004;
	Tue,  8 Oct 2024 20:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418235; cv=none; b=qKKT1nWxKrxW4g/O4bBNmwE6S4kpJtpnr/+afLY/zOijGBCQEblr2T7H18t7Uk9pZMUFY36zo4rWuJOu2xH0G8PySifwl5jZ2nsPEsTh0L05i/W/32Jar6QvxTeONJMUikvpbg3cpY9qBKGqsK5hfwJKSp+f/9P2XTHLM+8/y4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418235; c=relaxed/simple;
	bh=UEMKj7kRB7tqUYFlf30UBuHxuafQPA3Qs+l3nsYVLNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f23p9cZhjaLBXb7j32DW1W3svhkvtqb3BVrg0BRQEJitfF3UqtL5447rpa5092OGINqHCMF522csin7l92rIl7kjTFvw/nnBNLKz12AWSZcIxsH1IhV758OfvaHSRvVCFXoH+nxGPRSC84OU40n8p3q1HmwOTcVdRUU4TSoVodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Plcn63EZ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-50c9fb5751cso1341667e0c.0;
        Tue, 08 Oct 2024 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728418232; x=1729023032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeEJHtxRHcXi4zyu7WwEc8HIW+uF9Cr+P8a8iQW7oN8=;
        b=Plcn63EZ6KNVyir49o3HuDpkiuSCSHTcyRha0KK3qzKacfM26nieSCYMOZ/XIn/LoB
         8SlPghe4h7vPR75RHPvBnUgREpB/9oqlVY0/oIKHLcJWZjsnGn9Zl1VeFX6PrxYd5COO
         QCMbU34fvPkD/cWigxBPViPpfqu00VFPrbWIKFEcdhzXl9towzE3aFVFAAch+txxIqie
         72NMhuWSUlXd5VrHFKk3ZzTej6fbwwhhthaE0z4nD43SxYdcDQ0z/uAbV9/DvjAvpR+0
         S4SOJg6miCMKnoVWIEC9ycqrfeQbJk5ifcgGBeGov+Zllt7i4PUkF0JNpv6maeUeel0n
         N20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728418232; x=1729023032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MeEJHtxRHcXi4zyu7WwEc8HIW+uF9Cr+P8a8iQW7oN8=;
        b=RPHESYjiMzfZyBI4SVV3+yjjARcOFwkM3J9iHxCVZip8VG4vC5L3iqumLdlvD9+J8t
         ZpwcteCHgSjCbzIhB4ROSNK6+1FI3LOVpdL5mOdTxWvxhaf/HEyHvX5LEvmZEydsCPyi
         1lbyMMYqdgJYby25nAbPRgTx0MZdsI0gtSYo57xifPBzDK3S5to78RM7Nl7RZ4O/A9Ro
         wcYs70rZnwH0rQBuXoyg2O/SOKu+V02xZjRYKHq9rS+t6uR1ixMf0u8uDwW7P0ABKyIX
         ZYkF1HTOB4y2k5jmza237wJKt9yRuuOrErg6t//BY+wVZXtgNvlaBfphl+vctDEyuaHB
         4jXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWeJPEYpfsC+74pqIk7zbvu5Tb991EW593Qv+Bquf5vfPG3LpM8TG9lx0N1yLKRgHyFaxESUp9pCmaoOLK@vger.kernel.org, AJvYcCVq+bjt8pZ43EhWf0HshMEK2Xd7BGg+/pi0jaj9ZDRhDjpCxUtIn448xuOVGVk8Ffom1NzgNh9BWfVj@vger.kernel.org, AJvYcCX2uo2/c4uGvuUG4b3Gt3WL7KU/Yg2Vi6zde03nMIIgAB+r9iX03eRVamuuSTJaOXwfsrIhoU2I1ia8jqPylWYrqXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YygbiPUu/RIyB6X++CmPKUBxG3vJQVDRu06ha6HHBcUlojePDhv
	brgh7R11F9X7QoUySOWnMRHM/KuI9NxLHSEzUWbuXIAB0A+zUKCJeEO3rJRaBeTITZ2H9QR1ebH
	ePYgalhit7FgWrePe3ziwLAibTHs=
X-Google-Smtp-Source: AGHT+IH90LturO9Tma+PYndfVfk0hJJIxw/7re7JRVJvCcXQBbwdLQXgKd6tkyOlHw8Pz4mJWLnEuGwi6NFBDGnjWtg=
X-Received: by 2002:a05:6122:29c8:b0:50a:baa0:6396 with SMTP id
 71dfb90a1353d-50cf0c83765mr85840e0c.11.1728418232191; Tue, 08 Oct 2024
 13:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008164935.335043-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A1726BCE1687C6AFF519867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113469ABB6393E0A6451034A4867E2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Oct 2024 21:10:05 +0100
Message-ID: <CA+V-a8vWpUmq9esgcnjWVcPb-jUaLuKvhJF2VwiWrCx5_nOtww@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Oct 8, 2024 at 6:33=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
>
>
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Tuesday, October 8, 2024 6:19 PM
> > Subject: RE: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
> >
> > Hi Prabhakar,
> >
> > > -----Original Message-----
> > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > Sent: Tuesday, October 8, 2024 5:50 PM
> > > Subject: [PATCH v2] arm64: dts: renesas: r9a09g057: Add OPP table
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add OPP table for RZ/V2H(P) SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2
> > > - Set opp-microvolt to 800000 for frequencies below 1.1GHz
> > > ---
> > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 41 ++++++++++++++++++++=
++
> > >  1 file changed, 41 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/=
boot/dts/renesas/r9a09g057.dtsi
> > > index 1ad5a1b6917f..4bbe75b81f54 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> > >             clock-frequency =3D <0>;
> > >     };
> > >
> > > +   /*
> > > +    * The default cluster table is based on the assumption that the =
PLLCA55 clock
> > > +    * frequency is set to 1.7GHz. The PLLCA55 clock frequency can be=
 set to
> > > +    * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and addit=
ionally can be
> > > +    * clocked to 1.8GHz as well). The table below should be overridd=
en in the board
> > > +    * DTS based on the PLLCA55 clock frequency.
> > > +    */
> > > +   cluster0_opp: opp-table-0 {
> > > +           compatible =3D "operating-points-v2";
> > > +
> > > +           opp-1700000000 {
> > > +                   opp-hz =3D /bits/ 64 <1700000000>;
> > > +                   opp-microvolt =3D <900000>;
> >
> > Not sure CA-55 can change voltage from 800mV to 900mV??
> > Based on Power Domain Control, it needs to be in AWO mode for changing =
the PD_CA55 voltage.
> >
> > The manual says OD voltage is 0.9V and ND voltage is 0.8V.
> >
> > Is 1.7GHZ is ND or OD?
>
> {1.7,1.6,1.5 GHz} is enabled when VDD09_CA55 is at 0.9 V
> and for 1.1 GHz it is 0.8V.
>
> Maybe when you do /2, /4, /8 using dividers, the voltage may be still
> the same??
>
I think you are right when BOOTPLLCA[1:0] pins are set to 1.7GHz the
VDD09_CA55 is at 0.9 V, further dividing the clock shouldnt affect the
voltage levels at the PMIC output.

Geert, please let me know if my understanding is incorrect.

Cheers,
Prabhakar

