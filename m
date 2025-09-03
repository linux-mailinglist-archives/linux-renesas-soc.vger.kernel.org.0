Return-Path: <linux-renesas-soc+bounces-21247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3ECB419AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B4DC5E27CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D372F1FCB;
	Wed,  3 Sep 2025 09:12:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048D7279DA3;
	Wed,  3 Sep 2025 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756890768; cv=none; b=qBFF4mKfwLo5sIl95zf8QZeqIwlHOcpE7pSJVG6p3RBkLWipTR8Ui3XC2kbBQEYn0kpQKG2H/1yoWMS9hP8JtbWK5YoVb6SQIL2bQbsKh4TpsWmI+2FfCqw+tgUmsj9oQpHaShSrtawTszmMF2gp60t4gSxAHPAUCfXW821pL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756890768; c=relaxed/simple;
	bh=DIPaprV3eihxw50ifN2D91RMCfoQucJ7myFEvM9sGio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qLnz8ezsugFHpEgvbZjGETh5B7fd2cx2NVWnywSQ8+F13rOHbDSjLrxM4gWnZrMYxcrTRs0ME+bDs8+ffhN/ISYitczGaPfaJJR08DojFB1Y/8pNANyy9z6sCR7r1LzXzY56q6B9hGqgKB5M3Fbc6CPsyikLR5iZ0aPYgBHUtlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-53042807be7so1300083137.3;
        Wed, 03 Sep 2025 02:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890766; x=1757495566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIDGYOWnJN960iS6MeVa//s0FaDx2mHxuzRZXe1C+FE=;
        b=CxxtDeFAgCTQzwxHn3f0lPPsvb7Ieai3o/pPQxA8zYNYbkQxr4lhfyWt0YnemnApHU
         RULmUmNEXfuzx2lm0AorY9ea/k4RSTeqRDeHvcf/UevTpYPkXr6fazjr1NKsVCq45REU
         FmimuLogVZRuEID48Kg5/9JAbO+DeqPWqwhKq+P1YeDl9gJtKt8M6ESK2dS7HiP1p1tq
         tGtcxLdu8NDIHGucKrFlfsi4N3rK6cxbgVtFvigZw82Y2wE6Z/Gz3Xbu7xD53E+USXk2
         BYjKYnti1o9/N7H7Sd7FVeW+RGGiviLQ6M/qKnxENUfWmfwDapvkn8ZHtIoQEKFm4VTd
         m+0A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6UnrcISoIUxrhMLb/YpfFs6I+GOAv7UYTOHxnXSQup9Dr/Qx3Sb3IK3kc8s3JhqBHWriWJSjH6DS4x8dGykF6js=@vger.kernel.org, AJvYcCUUTskgGzhPn/sdM3IckdbCX0eEI0Ez5alkK9CBKmVm5tg7xbASTyIA4qPBvyTTg0lsO4QIknB6SuJQ@vger.kernel.org, AJvYcCVTjxmuQwQi5BjAWNnjbsJY4WOCgUeXj31jn4WZU2tnvL+f1K0KKhFKKxwEzADMWd09l4DlU3ca@vger.kernel.org, AJvYcCW6+bf1FRXErcIzF601ehz9LH35Oz2mN9ITAQLb76n4Up1gDaVN0JKbqkcI+XgB/ZthezMSx6f0N4RMvu3U@vger.kernel.org
X-Gm-Message-State: AOJu0YyHp5jj09zpD4/VOzakWXUUcg9LlVnJPrY/VkdXJq6m6BCx0+QR
	MivPS+bajFuKP6NMBagaOy6t6d9bbmIINMxwdgCPcun0tQ6Nx4wAKcKFMpDR+IXW
X-Gm-Gg: ASbGnctYyDxCtTw/A2A7GhtqtSnMihBmUvb/96IEAaTfC2zZswgDjFlJBXab2Zh3hY9
	aMWatRGiCsDK7Hbo7/JzvORKghSwIPJk8D+pi9GGoNimjaW9k2hXNv7AxEtLQGAJidTdyGWrFNW
	sIvzToXgtPPZeG487p5UnJlITLCOfPvsFtRTuS62AArv7Ro0HaVju9hwi005DoA24YrwUpG90yr
	c4NDhFjEX/37tK9A5r/zKFqaato56VUkBIEC89JT4/pWB7AwWa7kygqGtZq1WjFPjB+cJWT6S7D
	+l0gKTzIhNJO3da8DxAX3MIgPAGNoSNB7GsauXqnrn4tPs4rIqfbXL/iA9Ce9gX1N/avMmw8HuA
	X+imeOEE8VzIzDRzpUy95ea/w/l4S41TVIqwwTKJq7+mOr6D8QVfg+CkjcTa8
X-Google-Smtp-Source: AGHT+IFwioAnY+g1zUDfQH455vJhNu6MADmtcBy2GolbEd/e1t61PUcDQcS98EGL14nSszH+aWumHg==
X-Received: by 2002:a05:6102:2ac9:b0:4f3:1d:6b47 with SMTP id ada2fe7eead31-52b1b8fe837mr5535364137.25.1756890765707;
        Wed, 03 Sep 2025 02:12:45 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8960ab19f6csm3054727241.8.2025.09.03.02.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:12:45 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5300b29615cso1521611137.0;
        Wed, 03 Sep 2025 02:12:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUl4+iYMeG8Hnc3BFEJw/qUx9U2XD6omI8jmGFgOWKYS/rsqhouqz28Me3t1xmda0PyOopskBVS@vger.kernel.org, AJvYcCUp9Yhqw2xwOoEDor4CeRekqs+yOIsFzOzkoRmYjHcuyvmJWoV31DcJlvCHgz8COQKd6xg27uZGoPhwfWQhQ548KlA=@vger.kernel.org, AJvYcCXSrUYUC/ga3DR9tgWUs9rqMm2W5UwLM2gpOfLZI1VJfzR5HhT8zZKqahhALHbL5RP/WXnkWIdLALUX@vger.kernel.org, AJvYcCXhngspuIb8ehi4Df1xWCqCWBfPtY9WX74SHBZEAMq64x72KVBjzNdA3WaQI7CEVIW/x2m5LLgc4MJvvDY4@vger.kernel.org
X-Received: by 2002:a05:6102:dcb:b0:4fa:25a2:5804 with SMTP id
 ada2fe7eead31-52b199544f5mr5403168137.10.1756890765101; Wed, 03 Sep 2025
 02:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902-enlightened-hidden-copperhead-4eefdf@kuoka> <CA+V-a8sSiNQ6W-ggmL8PP_G1sFq170DS1LJLFJs_WW0RC+XVEw@mail.gmail.com>
In-Reply-To: <CA+V-a8sSiNQ6W-ggmL8PP_G1sFq170DS1LJLFJs_WW0RC+XVEw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:12:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT+VknkQzFDTpXdiDh0JMwgUPXK7muKv99H2k7pzzodw@mail.gmail.com>
X-Gm-Features: Ac12FXyyoD4GKTQzybA_UZJlAFr10UqAQQrqR1L6lu-xvuDnZUEcM7VmVfWOBPc
Message-ID: <CAMuHMdVT+VknkQzFDTpXdiDh0JMwgUPXK7muKv99H2k7pzzodw@mail.gmail.com>
Subject: Re: [PATCH net-next 01/10] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document RZ/T2H and RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

Thanks for your patch!

On Tue, 2 Sept 2025 at 14:17, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Sep 2, 2025 at 9:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > On Mon, Sep 01, 2025 at 11:43:14PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Extend the RZN1 MIIC device-tree binding schema to cover the RZ/T2H
> > > and RZ/N2H SoCs. These SoCs have a MIIC converter similar to RZ/N1, b=
ut
> > > with some differences:
> > >
> > > - RZ/T2H has two reset lines; RZ/N1 has none.
> > > - RZ/N1 supports 5 MIIC ports, whereas RZ/T2H supports 4 ports.
> > > - On RZ/N1, MIIC ports can be mapped to various endpoints such as RTO=
S
> > >   MAC ports, switch ports, EtherCAT ports, SERCOS ports, HSR ports, o=
r
> > >   fixed PHY ports (covering PHY input indices 0-13). On RZ/T2H, ports
> > >   can connect to EtherCAT slave ports, Ethernet switch ports, or GMAC
> > >   ports (mapped to PHY input indices 0-8).
> > > - There are register bit differences between the SoCs, and RZ/N1 has
> > >   additional registers currently unused by the driver.
> > > - On RZ/T2H, the switch is connected to GMAC0 whereas on RZ/N1 the
> > >   switch can be connected to GMAC2/HW-RTOS GMAC.
> > >
> > > To accommodate these differences, a new generic compatible string
> > > `renesas,rzt2h-miic` is introduced for both RZ/T2H and RZ/N2H variant=
s.

Until now, we didn't have any family-specific "renesas,rzt2h-*"
compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
as a fallback for "renesas,r9a09g087-<foo>".
Is there any good reason to start deviating from this?

> > >
> > > The DT schema is updated to validate these differences and ensure pro=
per
> > > port and reset configurations per SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>

> > > --- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yam=
l
> > > +++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yam=
l
> > > @@ -4,13 +4,14 @@
> > >  $id: http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
> > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > >
> > > -title: Renesas RZ/N1 MII converter
> > > +title: Renesas RZ/{N1, N2H, T2H} MII converter
> >
> > Don't use regex here. RZ/N1, RZ/N2H and TZ/T2H....
> >
> Ok, I will use it as above (s/TZ/T2H/RZ/T2H).

s@TZ/T2H@RZ/T2H@ ;-)

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

