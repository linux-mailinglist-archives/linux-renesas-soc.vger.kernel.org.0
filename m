Return-Path: <linux-renesas-soc+bounces-24338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFC7C415B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 19:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD6F84E599C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 18:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090C43358D4;
	Fri,  7 Nov 2025 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdoTi6BG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B64329390
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762541735; cv=none; b=DYWp8NtP0NV0rn7mvrHfFnBXzr8ZQhD7tDjK15R5Ofji1H7zqdvFoRRzNRRsBgJC/lhhAd/xsR3yQcIiGMr6eR8emeWvKX6UKVutrHWbP8ffmn+oNhWyV84r8mxm1K57Ip6AOMZoMYqwa5rbY+aJEPXD9vBuomRW24ELKxRGSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762541735; c=relaxed/simple;
	bh=IdtM5FvAG0CA3/E9xLGv8ZkSNkz0C6s2910O2wI6WPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bsFRRQluqhkc9IhiA/K07eDGLVo6TVlvEATNf/zWpUecgw8SWukCtF/sCmBzY19/GXbSkvWNr9FW38EQuvGQjAyVuz6LJCvtIurMomVQ1zbaYhP0vtqBa1hsGtnPiUUixF9/CyiWyuCjnjQQtYGynZOif9DPwcIPwDmXlbt+0Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdoTi6BG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so5311015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762541732; x=1763146532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYOFjOauC9uTwp6iLyWT9D/OqXU3tri/WbPZz+gGnEI=;
        b=XdoTi6BGPJHgh8HuCKKgiZgd+1b066E9SePyQ9tPFBGkk0fnKYhhuk6u5VYahSojLD
         zX8xHiO7Z7fm376QDK4qsL+gYRzffUIPcXLKmKb9OnD4poYo7F0NZJssI7Iz5Dfzpbyl
         4kDM6dnd4Dy4qYUeNKv8jTLIHPiSmMnxstIGcz8lQKwxTjgWW/XYY7YptDmSfrialHN7
         D+A42kfndtnO0UUd5wxuq+ocD+/ZA28QqmM10DsVzRwoVEBgRgHAZ1WTFAwql1Ehenxk
         a2FlJL/AL3YYhNJIaUtNCn7wgJ1BZ3dZn/jhUzZwE+PkjsGFAgcVMOkxqzU6MB0o1BlR
         wxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762541732; x=1763146532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYOFjOauC9uTwp6iLyWT9D/OqXU3tri/WbPZz+gGnEI=;
        b=X1RPTFj+GexMnIct13M/14RI1mQ8NxtB6MgqYSr5C7KwziKL35Daq2UbBkmr1AGIBJ
         ad6mmuf+xR5KwmeHxbtRL0c/hgwDbDp/ebq8jSLbHZQo+j2hEU1goolzRjx0bH8zfnxU
         OyKKDtupO5QGmPZiVK552Rj1tRChV5bqVAwFXLx3nN//l8kOxF+9Cfv2SDt5cRwTnYwZ
         C6tgv+7y8KT7zHCxDD1LbMDUIQdgIQcy71wImiVOv0WWEnrSvuSgOFD1rhzgwu3fIK9P
         1aJgaTmT6SHPgHddEnyoJZX4gxWM0ibzsjX1tZ6f7xHa+yDCzMhZ2KuzKlVogZnNXOuy
         Slxg==
X-Forwarded-Encrypted: i=1; AJvYcCVHaulmEusgvZCVhXFn5tMt9LupK3BR1AMDb78Ll/4nbgd71wEvXgjuEeFpk4AAN0q9jpZNw1ud13Uc1UyO4H9Ybw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy48e2q9oVC6Txr3fSNPblASua7HLUIA/z4+M+fVEA1LKbhSzY9
	itpAaEZ4M0MvI90HLh9q24PiTZlH9kOY5qBM1VaBM4+UFp2TipOwYMd8LcAYe0GlXlPhd2yWRgA
	ccc5v73We/Y+Sn2sJx0aq42dGEbVVeRQ=
X-Gm-Gg: ASbGncusPNB8ZyU/uxU06ZY6MwO/NEGtEGtcMegVE0WSrW2lEzCrHj1gM6C1oc8c2VG
	4jF2YrLDfSCBCGMPJ4H0YUjbtW8jWVojQdw1Wn28z8+FFv9n1x84KGXG0l+t11gMf2GzAobekMJ
	ZbX1mRDtIqVBZbC/37V+xCH7W0CZn1Fl18BZss7FGovc3kVGLDH9AXzMMJwcz1N/ewDHBJWndg3
	EQdm260G27fcVf005BCFGBvDQjyI7vA2MA2zjStSFN4UkYg3/qQpbf+z7kf
X-Google-Smtp-Source: AGHT+IHRiq8LOI7XDfcnPBif5Be5tlbEofXfFjh2SF9CKa5iZ2LCl/Y697lC6+uXYXH4qXNN3Gqe5tbSe6dhD42hJjI=
X-Received: by 2002:a05:600c:1d0d:b0:477:bf1:8c82 with SMTP id
 5b1f17b1804b1-47772dfba72mr4536435e9.15.1762541732159; Fri, 07 Nov 2025
 10:55:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch> <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>
 <2dabb0d5-f28f-4fdc-abeb-54119ab1f2cf@lunn.ch>
In-Reply-To: <2dabb0d5-f28f-4fdc-abeb-54119ab1f2cf@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 7 Nov 2025 18:55:05 +0000
X-Gm-Features: AWmQ_bnn3KbAT4rF9IvIcF36WFZWDqZECyk5JzQF2JLVOWx3xWwFfMtNq7cdMzE
Message-ID: <CA+V-a8uk-9pUrpXF3GDjwuDJBxpASpW8g5pHNBkd44JhF8AEew@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: mscc: Add support for PHY LEDs on VSC8541
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 7, 2025 at 1:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > > @@ -2343,6 +2532,26 @@ static int vsc85xx_probe(struct phy_device *=
phydev)
> > > >       if (!vsc8531->stats)
> > > >               return -ENOMEM;
> > > >
> > > > +     phy_id =3D phydev->drv->phy_id & phydev->drv->phy_id_mask;
> > > > +     if (phy_id =3D=3D PHY_ID_VSC8541) {
> > >
> > > The VSC8541 has its own probe function, vsc8514_probe(). Why is this
> > > needed?
> > >
> > vsc85xx_probe() is used for other PHYs along with VSC8541 hence this
> > check, vsc8514_probe() is for 8514 PHY.
>
> Ah, sorry. I was looking at 8514, not 8541. So yes, this is needed.
>
> However, i think all the current probe functions could do with some
> cleanup. There is a lot of repeated code. That could all be moved into
> a vsc85xx_probe_common(), and then a vsc8514_probe() added, which uses
> this common function to do most of the work, and then handles LEDs.
>
Certainly the probes can be simplified into a single function. I'll
create a patch for this.

> Also, is the LED handling you are adding here specific to the 8541? If
> you look at the datasheets for the other devices, are any the same?
>
Looking at the below datasheets the LED handlings seem to be the same.
Do you want me to add this for all the PHYs? Note I can only test this
on 8541 PHY only.

VSC8541: https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/Pro=
ductDocuments/DataSheets/VMDS-10496.pdf
VSC8502: https://ww1.microchip.com/downloads/en/DeviceDoc/VSC8502-03_Datash=
eet_60001742B.pdf
VSC8514: https://ww1.microchip.com/downloads/en/DeviceDoc/VMDS-10446.pdf
VSC8501: https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Pro=
ductDocuments/DataSheets/VSC8501-03_Datasheet_60001741B.pdf
VSC8504: https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Pro=
ductDocuments/DataSheets/60001810A.pdf
VSC8530: https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/Pro=
ductDocuments/DataSheets/VMDS-10516.pdf
VSC8584: https://ww1.microchip.com/downloads/en/DeviceDoc/VMDS-10455.pdf
VSC8582: https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/Pro=
ductDocuments/DataSheets/VMDS-10421.pdf
VSC8575: https://ww1.microchip.com/downloads/en/DeviceDoc/VMDS-10457.pdf
VSC8574: https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Pro=
ductDocuments/DataSheets/60001807A.pdf
VSC8572: https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Pro=
ductDocuments/DataSheets/60001808A.pdf
VSC8562: https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/Pro=
ductDocuments/DataSheets/VMDS-10475.pdf
VSC8552: https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/Pro=
ductDocuments/DataSheets/60001809A.pdf

Cheers,
Prabhakar

