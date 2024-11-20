Return-Path: <linux-renesas-soc+bounces-10644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3629D4290
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 20:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AE71F23C80
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 19:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10B41BC9F7;
	Wed, 20 Nov 2024 19:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWsqlZAV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9361BC061;
	Wed, 20 Nov 2024 19:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130957; cv=none; b=k9ajoB5TbW5iJDj6ALN+rbNOLAiwgp3ZkLeD2RvF82VF6ptUXHWRXlPafGgwLKrqbipAgXdFrEZpwiYmKdcdJKEGPswsf1LU32CB0t+J9szwN6oCHxlXmivngkEgLMOVnVE0SZEKL8TbhgKGyRcH+vDDTbiO3/173Y4Tl/+5+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130957; c=relaxed/simple;
	bh=ZPYp0IZVAjHM4JDQIHaRL5vp1JPYoi6IbSswaXN6jP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIuiT0FjxxwwdfN4unFBZqutkNhieRBVwJwhVpDfLDdXAg8YrezZSQ5TqQhPpIQ6abR6voGHthYxll4rZEfdgtuwWuDYrXweEj4jswM8c0n6bsZRpm/dylN++DKW31YnRIrA5RPwnXsQakT3MsHxo5gfoH152dgl26MGwaCTn5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWsqlZAV; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3882273bdfso82696276.0;
        Wed, 20 Nov 2024 11:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732130955; x=1732735755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQL68213SAAMRcK9gGL74Y8M4ooTmkpEfteUh52JzCA=;
        b=eWsqlZAVL0eM90DWn7Ous5AtBgHkDboVJ7GFun+G+oR8AQQC8KHJ1Z3FVVnN87oAY5
         CFJ2UFJIEaXhNPjtoe6smQBNKzoy7rzsWixwN5ivU+ntVBACo7pcRcJoc8LLNvScQXvO
         9dITZ2fRxqDML8MspRv2mvYedI4+BLSlGBzp7+i/d9nlo0LRJI8cwh2rKCSzwTKAkBTn
         jq/gGq8yFUXXrRkGwnu2VDir1sqlLycQcnDibot2EucMbZyxjLRAZpymjdw4HRlG1p1E
         Nye2BqCuR4yrKtXKumdeWXxO+CY64cp5WbChOQUoCcYadoWKWlX/0avsFjFWETOQ6Rk0
         mXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130955; x=1732735755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQL68213SAAMRcK9gGL74Y8M4ooTmkpEfteUh52JzCA=;
        b=QAsJIaDFbWaIARuEiRNoqic/wzuX1pr18cVZUEprixuZotNQgFkxFpjwYhXit40vFO
         fKt/bTla1SifoN4SAuhzRFUuFSBhFUMNbrlLhcX0Ni3xdyFx1uTkuiRG4c1pJ/kc8iOh
         lQn9eijX8OGq00nnue75EZLu9QyCq+ffvOJYjEDjUKQ3epq3ZISGGveobkc/keCg16Jy
         uk1waPdLhwgiXJDauXqKG2y6lyVZq/EvkCNLmoHicncXkYZOztxNpWvXdo3zi0cVsnLq
         ZZA75VCbZCrO0HOpz9rXz2WgUib4Vc1g2SEjbXhc6EY9GhLYNguzYwyS5OML/2ntrcDo
         rh7g==
X-Forwarded-Encrypted: i=1; AJvYcCWAqKEcEo85RiNk7Sv6GhMgW4P73Y5NW0aWjtTdBLmAugysbz8UHXGNKQLgZq7AhTbYnNFmpc9Kyr1RWas=@vger.kernel.org, AJvYcCWLxA8JKF1n6eMt7zwJ8SdIzq1eyEpqQxCTvGp5ctvK9f0OM/Z7JTH8bBAmllveBokK0Kh2KUenc+KZGyXKhUwLrzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjnoWZlyUBYQ8Or+YzgeGz+FBmOR/+eH5E81Nl2zqfGcAS9Ru
	tlBStRH1S4AVCvFAJ9KoijwfBOrV2OY9jsR+4fj2pANbCyZnHYVZqnCICBE5BNgJvc5cs8G8Wc+
	W5vmQDFcEPBr3NuyRQysoCzHWXbg=
X-Google-Smtp-Source: AGHT+IGmGXOTpi0qXp+Fe518rzD3BDhD1gY1GU420CUqMzNvIkNdc+fSqjBb5uXe6pRgnIjsb1LVy8zMEgL4rWF8axE=
X-Received: by 2002:a05:690c:25c7:b0:6e3:153a:ff62 with SMTP id
 00721157ae682-6eebd180660mr47807337b3.23.1732130955076; Wed, 20 Nov 2024
 11:29:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241117212711.13612-1-rosenp@gmail.com> <26a1dd4d-80b1-411a-abb5-92e20f5751e7@omp.ru>
In-Reply-To: <26a1dd4d-80b1-411a-abb5-92e20f5751e7@omp.ru>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 20 Nov 2024 11:29:04 -0800
Message-ID: <CAKxU2N8NCGJqXAkHO0TiuPUa44TLMHUm--WP2r3WJhuHWPk9Mw@mail.gmail.com>
Subject: Re: [PATCHv3 net-next] net: modernize ioremap in probe
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: netdev@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>, 
	Marcin Wojtas <marcin.s.wojtas@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:RENESAS ETHERNET SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 12:02=E2=80=AFPM Sergey Shtylyov <s.shtylyov@omp.ru=
> wrote:
>
> On 11/18/24 12:27 AM, Rosen Penev wrote:
>
> > Convert platform_get_resource_bynam + devm_ioremap_resource to
> > devm_platform_ioremap_resource_byname.
> >
> > Convert platform_get_resource + devm_ioremap_resource to
> > devm_platform_ioremap_resource.
> >
> > resource aquisition and ioremap can be performed in one step.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v3: reworded commit message again. Also removed devm_ioremap
> >  conversions. Even though they use normal resource, they are not
> >  the same.
> >  v2: fixed compilation errors on PPC and reworded commit message
> >  drivers/net/dsa/hirschmann/hellcreek.c         | 18 +++---------------
> >  drivers/net/ethernet/atheros/ag71xx.c          | 13 +++++--------
> >  drivers/net/ethernet/broadcom/bcm63xx_enet.c   |  6 ++----
> >  .../net/ethernet/marvell/mvpp2/mvpp2_main.c    | 14 +++++---------
> >  drivers/net/ethernet/renesas/rswitch.c         |  9 +--------
> >  drivers/net/ethernet/renesas/rtsn.c            | 10 ++--------
> >  drivers/net/mdio/mdio-ipq4019.c                |  5 +----
> >  7 files changed, 19 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/h=
irschmann/hellcreek.c
> > index 283ec5a6e23c..940c4fa6a924 100644
> > --- a/drivers/net/dsa/hirschmann/hellcreek.c
> > +++ b/drivers/net/dsa/hirschmann/hellcreek.c
> [...]
> > @@ -1982,23 +1981,12 @@ static int hellcreek_probe(struct platform_devi=
ce *pdev)
> >
> >       hellcreek->dev =3D dev;
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsn")=
;
> > -     if (!res) {
> > -             dev_err(dev, "No memory region provided!\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     hellcreek->base =3D devm_ioremap_resource(dev, res);
> > +     hellcreek->base =3D devm_platform_ioremap_resource_byname(pdev, "=
tsn");
> >       if (IS_ERR(hellcreek->base))
> >               return PTR_ERR(hellcreek->base);
> >
> > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "ptp")=
;
> > -     if (!res) {
> > -             dev_err(dev, "No PTP memory region provided!\n");
> > -             return -ENODEV;
> > -     }
> > -
> > -     hellcreek->ptp_base =3D devm_ioremap_resource(dev, res);
> > +     hellcreek->ptp_base =3D
> > +             devm_platform_ioremap_resource_byname(pdev, "ptp");
>
>    You have full 100 columns now, so doing this with 2 lines doesn't seem=
 necessary --
> checkpatch.pl shouldn't complain...
Looks like that's bdc48fa11e46f according to git blame. Reading the
commit message, 80 is still prefered. The reason it's done here is
because of .clang-format, which still lists 80.
>
> [...]
>
>    Other than that, looks saner now... :-)
>
> MBR, Sergey
>

