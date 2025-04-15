Return-Path: <linux-renesas-soc+bounces-15997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41256A89E29
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:33:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AC7D7A4A92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 12:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0841FECA1;
	Tue, 15 Apr 2025 12:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F3FW3SlT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D218610B;
	Tue, 15 Apr 2025 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720401; cv=none; b=sfA+ugppS+eFErL5ApFV01UU2AOTcSSjjtB6DWqcOwmtvaOtjfaPjFKlRY8UMiMuYQK75Qj0oX9xTMuz3CDC8d77xbEQ556NdjareJ5O1lSseExjRGsMPnNx3djzlvewznVeoY/NOJ2mylwv5NHJn2oHqJuQKGOnguXAOSp++1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720401; c=relaxed/simple;
	bh=Ii+F19AJs5opq+KeLJNbqzuvmk0s6lxbaw99dsOiyXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qVwkQQc2bwq7yPBVJhRp6gOLUtUniQvk7s/hTItOA8KUv+ebBiwqjcFTKr7owevIpULJwImgM0BKmrhxtIug8nh8LMvRVD6YyfS9Bs5QFn9tgqyXC7kll7JxpLGr1YFOTWrVzr65OuRMm8bYvKvb00Kech+DRWGxNKOaVefdhJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F3FW3SlT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3491152f8f.0;
        Tue, 15 Apr 2025 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744720398; x=1745325198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=;
        b=F3FW3SlTl6N0PbVUP/4taQhELT8xjHAT3Q64jb6GqqRAK/fegzUtV1wdvqoz91opak
         FvuZ8b6v0VHkM6+WVOnk2OhOdZAS5dgD5mxvp/8IEYLYVZOCigf7HoS1P9EB+Mx9hiro
         1r43gxm3K0dfwBQ1JzNz+dswoEcYV0PNJD+/oW0Xyfa5AewIzUJV0XULHYAF84jS6C8v
         GPahIQlgBfc3ibWgG4/aoR3zNK8kgdaLbteeDVsHBL/floidYUEeCKQqFAt8kHiZXfK6
         S8wtaG+TcNP/11D+xN/2/TEeSmkjuvfT709gJZ+eK0OvQSGjEFyICqfspLm+A3+BOoaE
         qLWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744720398; x=1745325198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISejIS0NoteW5+822XXFLOsDwPRqdqjmt0InyJ7Yj2s=;
        b=TsZalPf2DJpIOSRXaJtu4zXiuGV3/t4PIsDuMuekHRUVe29cTmb0Qp23QndnVDbVJI
         ot6pwr6jRoUzMs+No0jQdV++XYUh4kPp1Fsf5Mso6elq2pC/wFftfbh+HIuUFxJA/UeR
         EtHi7GOeGQEw5mcNEhB4mdfy9ebLiAFlxOFrIG52S8iiAtdy8XtJo/pQwkH929N00Co6
         25bjDLfFrNz5013UXieCapVjbN1Dm+oWaOfacxCVx7IIMLwXT44hkid1zRzagzJH1bxV
         13qV73GhF4QYzCwqI1ol6t9qDA6lY/muQWMdKsxX6KyJrHGaWsyiJddp2b/BTzDO/yij
         n7rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFheITyke3ofM+wCVj0n+cLTMmwfEySrVQ4YOHda2XebGzLJLDz4CkQJOEERcN/ybULxAOSq9G@vger.kernel.org, AJvYcCUyUbKQHhPV2XtfkkQabdU3IzSr6EqFLeGZd+M1RBv9ys4u69jhEiYRxd8PNbo7IUCr/PvmCmCMCjt5@vger.kernel.org, AJvYcCWGP0QYM0sp/aHKLwizXjNMahc37tPpfc0+QxuDqnv4m0sOPtXcUYWKlDp9Gfi+5Dycb+AOMQx3uxRV0Su5eGAmV5k=@vger.kernel.org, AJvYcCXn4LCwIUyZfGy7gdWY5hhoVTsIgWg39FVkJaqhOhpfimqYZSw06h/hu6EOge1a0SUnsiB4Hl9gckWkldsQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+pmx692EoEJw/TFtqqM/ZUKcsq08JrDg1yOSdrjc5hptUaYOI
	tDqwcloUEsLQldRevKkzDWyH38/otSt3Eoy2LtxxNpy/FucoKz4H4X7pXKyKTZnwaG/Lo3RVNgP
	53kHAeZBPiwpa3y3KJsvUD55tqTQ=
X-Gm-Gg: ASbGncuzuEmVgbaa8eghwBRlNlCkNw4Y8Fh9bOXntFJ4FfSx4dwW1A0SEcnVPt5X0wL
	aAeWjic63u1hfUlhZYngpACRKSoa/oByZNSBayAsqVsSS5nwiIcxGiZbzykSA4JR/AmP+6gCsqp
	KzILsa9TW2mrBrGKRi9+uVxaiGn9xgiYP5HyyDuN89PGEjXwOHKWl+SIqXMF+hpIeo
X-Google-Smtp-Source: AGHT+IFwJex1FRxNns/6VHFTGeLhVt+kuVcAblH1w86U7VFm3sR6UibK49iXZpLHLruiVNnIp7i8sraSXqWjt0jcORA=
X-Received: by 2002:a05:6000:4021:b0:39c:dfa:c3de with SMTP id
 ffacd0b85a97d-39eaaebc663mr13620738f8f.47.1744720397705; Tue, 15 Apr 2025
 05:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk> <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
In-Reply-To: <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 13:32:51 +0100
X-Gm-Features: ATxdqUFXWhW8_Nw5u1OaWa5-kTdFNmMYCXvTAenRwVBKAiwpOUnqgIySUTDSG10
Message-ID: <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, Apr 14, 2025 at 7:14=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Russell,
>
> On Mon, Apr 14, 2025 at 5:57=E2=80=AFPM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > > +     gbeth->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> > > +     if (IS_ERR(gbeth->rstc))
> > > +             return PTR_ERR(gbeth->rstc);
> > > +
> > > +     gbeth->dev =3D dev;
> > > +     gbeth->regs =3D stmmac_res.addr;
> > > +     gbeth->plat_dat =3D plat_dat;
> > > +     plat_dat->bsp_priv =3D gbeth;
> > > +     plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
> > > +     plat_dat->clks_config =3D renesas_gbeth_clks_config;
> > > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > > +                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
> > > +                        STMMAC_FLAG_SPH_DISABLE;
> > > +
> > > +     err =3D renesas_gbeth_clks_config(gbeth, true);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     err =3D stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> > > +     if (err)
> > > +             renesas_gbeth_clks_config(gbeth, false);
> > > +
> > > +     return err;
> > > +}
> > > +
> > > +static void renesas_gbeth_remove(struct platform_device *pdev)
> > > +{
> > > +     stmmac_dvr_remove(&pdev->dev);
> > > +
> > > +     renesas_gbeth_clks_config(get_stmmac_bsp_priv(&pdev->dev), fals=
e);
> > > +}
> >
> > Would calling renesas_gbeth_clks_config() in the suspend/resume paths
> > cause problems?
> >
> > If not, please consider using plat_dat->init() and plat_dat->exit()
> > to control these clocks, and then use devm_stmmac_pltfr_probe()
> > which will call the ->init and ->exit functions around the probe
> > as necessary and at removal time (and you won't need the remove
> > method.)
> >
On the RZ/G3E, the upstream support for testing S2R is not yet in a
usable state. So for now, I'll switch to using init/exit callbacks and
drop the PM callback.

Cheers,
Prabhakar

