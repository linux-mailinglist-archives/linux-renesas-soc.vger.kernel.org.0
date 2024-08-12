Return-Path: <linux-renesas-soc+bounces-7811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D6F94ED11
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 14:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DE92283300
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 12:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4188217A902;
	Mon, 12 Aug 2024 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0U/yUCk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB69A17A5A3;
	Mon, 12 Aug 2024 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723465947; cv=none; b=lp/8prsl48LmjRwqrwZXnXzaj9DcMvMzINpqQf816BnrTAigiVBYhTouiVYr2LShjQ/WkWOWkR0RDRICOI44vWqhh4+CrZYoXbvTQZgLWkNnynA0eOqzhXnuT3rrpWjavCPwDfsowo/NZssZ9l/XkLvvRXvgSDLJBGE+cvf/dAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723465947; c=relaxed/simple;
	bh=csxKe1CvcUas5BlvHluDCFPmmYEba5WXuKw9MdotW5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHlcVF4FbK+0+3HEzO7Fzd8ImadBtNohftDjLssU9kc8ZCQLgYrRX9XQA99vpB/u2LjdrGg0FTNzUIBsX/ztMamDYgsbZYe7qVVecXoqIuGzko3e0GmJJe4W0QWtKFA0nNMyP4iwf1zwch/5VYippDmj4+W64rAptKXU2B5J5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0U/yUCk; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4f6bd3a7bbdso1615508e0c.3;
        Mon, 12 Aug 2024 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723465944; x=1724070744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le1zscKV4miNtPBIOT02uIb8thahGwdJDUVJjbhOKtU=;
        b=T0U/yUCkkq9J6PfVF53Z/VozaM6RYlM2BYaf74SWdlNz1YpftaNRDE/SsjKfHsx7cz
         pvfJuQ+Ttt/hdfSINCdzw4ZAqCXbgFoZrKFRudCDB37e52PyAZyx0Ssoh4+oSlQyKICm
         JCyRCHI2txkAvNYiqkBYTnNF3ejkUvChffC6KY52uZB5+odV4E4E7IryuWLaNEKoGscQ
         nzsMvT99T2tE0okTo3vBzJ/U69GAMARX4IzJxnKJVkZ9WSGB5gpR9gDjRl4ZnFk6wbnh
         cR6aiwQJ36xc6X9rmFgGJfKNtSSCRrPBCMNB1ewGq/l6Q91FSjZBuoLYOwfS4a1csWyX
         z+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723465944; x=1724070744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=le1zscKV4miNtPBIOT02uIb8thahGwdJDUVJjbhOKtU=;
        b=L0AgKbaTkGMLTVds9wkrw/7INiMPXVXZ6F2O57kEQCCw0dor10Ap2R7DC8RNEWB7jT
         hjO3v1s1daIOCV8sabNWYFuLYFyDIJtnhNeoriOyF0CJSVisaDCZNQuFEKPhoTCDAeo0
         OrTwqZ2ippgDHmc1ToXk3whEKylmnfc2Yp0bTO6eeg1fSZf/2S8kZDx4QBvEr3vFH5JN
         m0tTW2NVciO8drHr+lSY1+WOVQ1fAp/KHXhwI4CkYeplkJMLk+ihPpfvOfoqtRMjZcV9
         M10OyeELKAqK81Niwv218ixiI8sygPfL2Ym76/grpxCkgEDEB/cPcnbvANhqQWrWwk11
         8DFw==
X-Forwarded-Encrypted: i=1; AJvYcCU5Fy0g+x70ksCVOsWUdtWXP29hcD/+Idrfj8q9lvxNDCYEao4n5417AQ4ancpUanyJJ38bzxIKo72NEZ9W+kQm/Z8=@vger.kernel.org, AJvYcCWw1Yxh7eL7al88nSV6Kg2udaUWTb1Y+rJXs+ySPpcFRzdVYDrOz0ZDaHupXFchmSRMehzepnvhC2UL@vger.kernel.org, AJvYcCXz8n/vB3LyThWTp5icC42Ru4jg++qcRd3B8eO1Q04WQR8OFsZN7cehycyIBqiohlcVnFQppSpryapWymFj@vger.kernel.org
X-Gm-Message-State: AOJu0YxofnQ2H4IxTko/ljvx0Gq839jSscIwNw0c0YAtDW7zE9dC4igl
	1MVmiFlii8ukYG7yBv0T04T8gYxg13DvsXfIbRM+hav2A9/I26U78xobbbB7Z/Ad08j6hG79QSg
	0KxNzRtaAKMo1dXhChVmGGbW8Xgg=
X-Google-Smtp-Source: AGHT+IEOsrH1eLwyDBDxnUlwqGxChTJINBTeBrZFmcEaYjHTiwBrCRMwAzo6rKa8AR5mynofTSCBUDFN5suAbEwWP28=
X-Received: by 2002:a05:6122:3286:b0:4f5:1787:18aa with SMTP id
 71dfb90a1353d-4fabed8a33emr347752e0c.0.1723465944459; Mon, 12 Aug 2024
 05:32:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E95ED1171818488EFEFA86852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Aug 2024 13:31:58 +0100
Message-ID: <CA+V-a8sR1Lu1FYMQbDXzzi19ShF-RLkwirF-51aWp1bjwG8LXw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
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

On Mon, Aug 12, 2024 at 1:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Sunday, August 11, 2024 9:50 PM
> > Subject: [PATCH v2 6/8] arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 n=
odes
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add WDT0-WDT3 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - New patch
> > ---
> >  arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 44 ++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/bo=
ot/dts/renesas/r9a09g057.dtsi
> > index 435b1f4e7d38..7f4e8ad9b0a5 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -184,6 +184,17 @@ scif: serial@11c01400 {
> >                       status =3D "disabled";
> >               };
> >
> > +             wdt0: watchdog@11c00400 {
> > +                     compatible =3D "renesas,r9a09g057-wdt";
> > +                     reg =3D <0 0x11c00400 0 0x400>;
> > +                     clocks =3D <&cpg CPG_MOD 75>,
> > +                              <&cpg CPG_MOD 76>;
> > +                     clock-names =3D "pclk", "oscclk";
> > +                     resets =3D <&cpg 117>;
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               ostm4: timer@12c00000 {
> >                       compatible =3D "renesas,r9a09g057-ostm", "renesas=
,ostm";
> >                       reg =3D <0x0 0x12c00000 0x0 0x1000>;
> > @@ -224,6 +235,28 @@ ostm7: timer@12c03000 {
> >                       status =3D "disabled";
> >               };
> >
> > +             wdt2: watchdog@13000000 {
> > +                     compatible =3D "renesas,r9a09g057-wdt";
> > +                     reg =3D <0 0x13000000 0 0x400>;
> > +                     clocks =3D <&cpg CPG_MOD 79>,
> > +                              <&cpg CPG_MOD 80>;
> > +                     clock-names =3D "pclk", "oscclk";
> > +                     resets =3D <&cpg 119>;
> > +                     power-domains =3D <&cpg>;
> > +                     status =3D "disabled";
> > +             };
>
> I guess same group(all wdt together) arranged together?? Not sure.
>
I think Geert prefers it to be sorted based on unit address. So I'll
let Geert make a decision on this (and the rest of the similar patches
where nodes are sorted based on unit address and not grouped based on
IP).

Cheers,
Prabhakar

