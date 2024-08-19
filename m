Return-Path: <linux-renesas-soc+bounces-7901-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783B9956C7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 15:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CC2A1C21397
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Aug 2024 13:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E0B516C857;
	Mon, 19 Aug 2024 13:59:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB51BDCF;
	Mon, 19 Aug 2024 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724075940; cv=none; b=hDAxLWVxsQsmekUVYKQMY/1Tq0wL7+fuEyhdsz7xFdw5fGBjYR15OQTLeQDUMLcXEM6UcwSkZ3YXtfjQEwj3R9o7H1QgHQey0K3Tmm1IsjW5/NEOgEqUhfN3cuNF+7XwZduRw7hcAVDUvz9U/q1fKgf5rqe2Bo/YbReAQDAionY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724075940; c=relaxed/simple;
	bh=nThcJ6TwlO3hmTw8F29f+VnLPMO0aRRuwMRWx2Vi2ak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyANIGchdiO6twMt1n/DTqtY/VmiPMH7WWH46RWvuq0pDL49J1lX4sDBY5+ZtZMAOYYFniMLAMc9yNLihINTobLx1kdOpkfEi+Mtzt9m5yz2mFMqHOpHI6ReYbOFmLSaibkvtDMHesitto6boA90wsGu5qmHuJvg2iERvs1bK38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6aab656687cso33142637b3.1;
        Mon, 19 Aug 2024 06:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724075936; x=1724680736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YlyH90hAS3XvB8g9oyaNdjrvTWCtFfarjprnORBxjE=;
        b=E4IH5yB+FK+ljnA2cL51qAX9UiAjC1SXiey0yCRepRNuIjhoTwCq8dfvBQl5/enbWz
         wdzyr/7oM09atcztltWvN6VIeeimzthKtNY07x6Rvv/IOCP3Ev3nukXjtBmsKjLC5rHS
         e/iKbdNtU9y2Dlx1I6DhS04NoqGqUGHK1tExd0LVTTX++/iOd2XTeEC7S8i5ne8cLLcU
         6dEdUXEbn7+6suwtf8RQKb6NSwBoy8FM/u2hWkSyssjQjfSJlVCQtL+9QmWK4kPDGdFB
         rhs6bwFtQsiXTSmtROzlG2TtMdbEpi9GdqupVhtQ4rm9q3AAiQEfe32rnm3VXLWSP46d
         lihA==
X-Forwarded-Encrypted: i=1; AJvYcCWxurx2+O0j5UJhpORm5BZ5rlkDlFPA3AsUgRfKKVfRtvCEK8xBOt7YDRZ78D/0MKP/0a0WU43sMXmXFOaPEgO3xeNehxDRHFvVnNrzPf/aEhqnEw8B3hQ4Rw7V5z3tuXeGCs3MZU5Tzqcyb0bh8PtTZN3gFjg3Mdf+nNyloRX3Yk7P5qnnf9O4zJfJ
X-Gm-Message-State: AOJu0Ywaf3ALt4RuFMpKRKIocxDdFfb8syGjzyFe6FUdY6T40CJ5QiQc
	vyWd3SgAu/ZxxlQLaiXTnkOOiXDaASZ4eWCA2iZ7qZ7TeZqRPmSUcW/0P5YL
X-Google-Smtp-Source: AGHT+IFumlAs3XEqA8NU8hFKtXAmE+UH+vggeNpsCQNtRtuuXywnOjxsu1RrYeYOc4h+k7LIpXyHfA==
X-Received: by 2002:a05:690c:498a:b0:6ac:de95:8675 with SMTP id 00721157ae682-6af20087039mr121977157b3.24.1724075935742;
        Mon, 19 Aug 2024 06:58:55 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6af99f9df9csm15954037b3.45.2024.08.19.06.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 06:58:55 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6aab656687cso33142077b3.1;
        Mon, 19 Aug 2024 06:58:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjmg5Qb2HxRPpRcIZzcv5/dPeViJa22FroBZoaluj5KKY8xwhHh8n4uSnWOuramnzdwF/NnsbjCkiruysQ6eFKYCtA8eS2lnn2knoMSe4mdSkuDTABXk5res9hzATFPYmbSSD5ixd5vmxcghv9xLMqUhtuIDyebn1yBVooHi/AeMTCpW4jbG1ordZ2
X-Received: by 2002:a05:690c:2906:b0:6a9:5953:a659 with SMTP id
 00721157ae682-6b1f1d10ae2mr60563827b3.18.1724075934800; Mon, 19 Aug 2024
 06:58:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com>
In-Reply-To: <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Aug 2024 15:58:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw7ZLvtbmTN=g-Xh3RLWSVH3U0VpbehREyNcYypHnDsQ@mail.gmail.com>
Message-ID: <CAMuHMdUw7ZLvtbmTN=g-Xh3RLWSVH3U0VpbehREyNcYypHnDsQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, Aug 12, 2024 at 2:32=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Aug 12, 2024 at 1:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.=
com> wrote:
> > > -----Original Message-----
> > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > Sent: Sunday, August 11, 2024 9:50 PM
> > > Subject: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3=
 nodes
> > >
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > > v1->v2
> > > - New patch
> > > ---
> > >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++++=
++
> > >  1 file changed, 44 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/=
boot/dts/renesas/r9a09g057.dtsi
> > > index 435b1f4e7d38..7f4e8ad9b0a5 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > > @@ -184,6 +184,17 @@ scif: serial@11c01400 {
> > >                       status =3D "disabled";
> > >               };
> > >
> > > +             wdt0: watchdog@11c00400 {
> > > +                     compatible =3D "renesas,r9a09g057-wdt";
> > > +                     reg =3D <0 0x11c00400 0 0x400>;
> > > +                     clocks =3D <&cpg CPG_MOD 75>,
> > > +                              <&cpg CPG_MOD 76>;
> > > +                     clock-names =3D "pclk", "oscclk";
> > > +                     resets =3D <&cpg 117>;
> > > +                     power-domains =3D <&cpg>;
> > > +                     status =3D "disabled";
> > > +             };
> > > +
> > >               ostm4: timer@12c00000 {
> > >                       compatible =3D "renesas,r9a09g057-ostm", "renes=
as,ostm";
> > >                       reg =3D <0x0 0x12c00000 0x0 0x1000>;
> > > @@ -224,6 +235,28 @@ ostm7: timer@12c03000 {
> > >                       status =3D "disabled";
> > >               };
> > >
> > > +             wdt2: watchdog@13000000 {
> > > +                     compatible =3D "renesas,r9a09g057-wdt";
> > > +                     reg =3D <0 0x13000000 0 0x400>;
> > > +                     clocks =3D <&cpg CPG_MOD 79>,
> > > +                              <&cpg CPG_MOD 80>;
> > > +                     clock-names =3D "pclk", "oscclk";
> > > +                     resets =3D <&cpg 119>;
> > > +                     power-domains =3D <&cpg>;
> > > +                     status =3D "disabled";
> > > +             };
> >
> > I guess same group(all wdt together) arranged together?? Not sure.
> >
> I think Geert prefers it to be sorted based on unit address. So I'll
> let Geert make a decision on this (and the rest of the similar patches
> where nodes are sorted based on unit address and not grouped based on
> IP).

Sorted based on unit-address, but keep all nodes of the same type together.
I.e.:
    wdt0: watchdog@11c00400 { ... };
    wdt2: watchdog@13000000 { ... };
    wdt3: watchdog@13000400 { ... };
    wdt1: watchdog@14400000 { ... };

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

