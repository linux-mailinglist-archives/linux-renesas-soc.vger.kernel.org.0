Return-Path: <linux-renesas-soc+bounces-24316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB12C3F81E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 11:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8666E4EFF03
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 10:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56322868A7;
	Fri,  7 Nov 2025 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iaz+n0YZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54032ABEC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511703; cv=none; b=dqcLEpukAYhxrT6uFp2XyAnw6RXyCznxDyr1bFVRQTp8crJtN2pn+LCMd5zA+3sLo4kuGlXMfb7IuyP/06IvPrpzvnrIOdmZJB0vCloi1jQwuaF7Sw7yiMLEtbcnPEy1SCO5+x5e0iqry0lwhelK4uC0d2/Evj9SiUnuvJX3rpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511703; c=relaxed/simple;
	bh=x0GmuhpPcEAXviJQIjJNh2Y6Rg2wvGAtp3KxPWMqZ9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EdxOMMdlIAsbib3VMpAeCIINJ/TIWVv7gcYCNyyzawCaehxGw3sNI4y3SbRW+HpdbXcGP8GEk2TQMM4Ecme5UExHbP9Fzk6oUoa4P8bfDpbZ1T5uvfxjVKnLWHqx1qvRaplKaNeCD7MJGQhGlWKH+c5Cm05j5Og4MwEq5ehYWbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iaz+n0YZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so6530525e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 02:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762511700; x=1763116500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQVjJ8VIubBEHnwfULYYTdZ6WDAP2MN1tczKjiZ/yyY=;
        b=Iaz+n0YZrhwdXBhYDJcIR8jhrGWLom7VCy5jwtmaQOqWsgtBlXkUaRnSVwf13Ifuay
         5iUNn7DtBK33OGKQLUVsXSVdVRtutsRNgzWa3mqwWoNVAPGQKnVWfLm78X4nDKodI1JN
         ZFEOHzVBYL/4RCN9LhSIQ7mgPvQmZhE58ZH5BdJ7/dRzsgFmzhARV+6OqrhGd3MXpWBm
         u83pPRuFsa6vWZWWd65M6bzrR3IWOzunz+rf6NVR1bwZtwpcSf4303Iou8b33KF0zUU+
         ZK46eTlqe3uWwZXH0H2lUOsliXTyQeZHzzj4zUD3lqzVhEPGyBRHOD51HJaO81Dx4nt4
         5TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511700; x=1763116500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQVjJ8VIubBEHnwfULYYTdZ6WDAP2MN1tczKjiZ/yyY=;
        b=j7j2rst7ncfxwH0lrNH8gjcH7aUkDaUBAQ9ncBzr4TAL8Q2+ojjeeTBejf6ZObc1Mu
         h8DsgYe7XEsQSmSxTJwaXwMQ7KHnUn4dfAyW2FCD2BdHC62tDrgojb+Ru7hq+bTJBq5r
         QwJ+iWDZy/tmwtjPXFNlSRaVy/LXTDteaWZ211pN/WLFy48D6TvONMkArXZWSm6nBXqT
         T/HxAZD33kLENUmcj7Kyz0rd/fpfkfPtLZjxd6gW/Z+D82chO3Kb35jUCPrAxPMr+Dvp
         F+WYkiuHOVnoQQORjcSOWR8GeUGjocap1WXXQM9eEPVgcKwxLmengmWLqk3SkMk5yTcw
         n2Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXeZ4OT2VdbDj5m1mKqeCMx2PrkAftciN8FGJa9OckJjKMeEf04GAsRkbU0rvHijKzg4eKysZsNqu52ZF2oOZSFgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQVBX9sBvSf9rvcEmj7Qtij6j+wkApK/FJBZDCoXB4dbzr30q
	87060wt90ALCLponHQY7P9qaoBo3wYPbakjopEHviNRucg4j9MBFZwPxPls23mU2gEZ7aPoKonu
	JKEstHdNJivijMkiHoPdgHO63OnXV/7Y=
X-Gm-Gg: ASbGncvF1LqU8TEoTSJXk2zYKTSOk0HsYiOqSoH+lBdSf+KPMdgwrGytpL4T4PUqkvf
	1kb8hk5WDG6FqkeTxgneNDdCHlYuf4M9k2KhJgyaJFii+hmVygdg1WjAQukgw7HWlR4/ZUpytSi
	Jbn+Q06S9FVyas2+xwHCsZuBle0Yomqf0QnYpCt+RGKsio+2vifOoKiA7QkWBrQFpE6UJTRnRSy
	tyFgABrns5Y+4fCZtX8mfa7RHxHo9/RogpBy7MFbfwoR9xcar0Clp5x4PRW
X-Google-Smtp-Source: AGHT+IFgzK9jRSXUa8PZiGhgZmWEhjhBpVxj/gvGkqKedymR11sElsC/BxxuT8v/TKCY9EX4wCAmUyIFQyctkLw0ero=
X-Received: by 2002:a05:6000:2510:b0:429:c989:cec0 with SMTP id
 ffacd0b85a97d-42aefb43ca4mr2089505f8f.48.1762511699907; Fri, 07 Nov 2025
 02:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch>
In-Reply-To: <ee6a79ae-4857-44e4-b8e9-29cdd80d828f@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 7 Nov 2025 10:34:32 +0000
X-Gm-Features: AWmQ_bmPT9XwqbmFCYebnP8Ga-hWLGwsMeFM_kjFF85aGBYiWla-RfJ-XS_PHMs
Message-ID: <CA+V-a8vFEHr+3yR7=JAki3YDe==dAUv3m4PrD-nWhVg8hXgJcQ@mail.gmail.com>
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

Thank you for the review.

On Thu, Nov 6, 2025 at 8:45=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +static int vsc85xx_led_cntl_set_lock_unlock(struct phy_device *phydev,
> > +                                         u8 led_num,
> > +                                         u8 mode, bool lock)
> >  {
> >       int rc;
> >       u16 reg_val;
> >
> > -     mutex_lock(&phydev->lock);
> > +     if (lock)
> > +             mutex_lock(&phydev->lock);
> >       reg_val =3D phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
> >       reg_val &=3D ~LED_MODE_SEL_MASK(led_num);
> >       reg_val |=3D LED_MODE_SEL(led_num, (u16)mode);
> >       rc =3D phy_write(phydev, MSCC_PHY_LED_MODE_SEL, reg_val);
> > -     mutex_unlock(&phydev->lock);
> > +     if (lock)
> > +             mutex_unlock(&phydev->lock);
> >
> >       return rc;
> >  }
>
> The normal way to do this is have _vsc85xx_led_cntl_set() manipulate
> the hardware, no locking. And have vsc85xx_led_cntl_set() take the
> lock, call _vsc85xx_led_cntl_set(), and then release the lock. You can
> then call _vsc85xx_led_cntl_set() if needed.
>
Ok, I will add _vsc85xx_led_cntl_set() helper and use it in
vsc85xx_led_cntl_set() and led functions (for example
vsc85xx_mdix_get).

> > +static int vsc8541_led_combine_disable_set(struct phy_device *phydev, =
u8 led_num,
> > +                                        bool combine_disable)
> > +{
> > +     u16 reg_val;
> > +
> > +     reg_val =3D phy_read(phydev, MSCC_PHY_LED_BEHAVIOR);
>
> phy_read() can return a negative value. You should not assign that to
> a u16.
>
Agreed, I will check the return value of this. I followed the approach
which was currently used in the driver.

> Also, BEHAVIOUR.
>
> > +     reg_val &=3D ~LED_COMBINE_DIS_MASK(led_num);
> > +     reg_val |=3D LED_COMBINE_DIS(led_num, combine_disable);
> > +
> > +     return phy_write(phydev, MSCC_PHY_LED_BEHAVIOR, reg_val);
>
> You can probably use phy_modify() here.
>
Agreed, that will simplify the code.

> > +static int vsc8541_led_hw_is_supported(struct phy_device *phydev, u8 i=
ndex,
> > +                                    unsigned long rules)
> > +{
> > +     struct vsc8531_private *vsc8531 =3D phydev->priv;
> > +     static const unsigned long supported =3D BIT(TRIGGER_NETDEV_LINK)=
 |
> > +                                            BIT(TRIGGER_NETDEV_LINK_10=
00) |
> > +                                            BIT(TRIGGER_NETDEV_LINK_10=
0) |
> > +                                            BIT(TRIGGER_NETDEV_LINK_10=
) |
> > +                                            BIT(TRIGGER_NETDEV_RX) |
> > +                                            BIT(TRIGGER_NETDEV_TX);
> > +
>
> Reverse Christmas tree. The lines should be sorted, longest first,
> shortest last.
>
Agreed.

> > +static int vsc8541_led_hw_control_get(struct phy_device *phydev, u8 in=
dex,
> > +                                   unsigned long *rules)
> > +{
> > +     struct vsc8531_private *vsc8531 =3D phydev->priv;
> > +     u16 reg;
> > +
> > +     if (index >=3D vsc8531->nleds)
> > +             return -EINVAL;
> > +
> > +     reg =3D phy_read(phydev, MSCC_PHY_LED_MODE_SEL) & LED_MODE_SEL_MA=
SK(index);
>
> Another cause of u16, when int should be used. Please check all
> instances of phy_read().
>
Ok.

> > +     reg >>=3D LED_MODE_SEL_POS(index);
> > +     switch (reg) {
> > +     case VSC8531_LINK_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_LINK_1000_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_LINK_1000) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_LINK_100_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_LINK_100) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_LINK_10_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_LINK_10) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_LINK_100_1000_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_LINK_100) |
> > +                      BIT(TRIGGER_NETDEV_LINK_1000) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_LINK_10_1000_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_LINK_10) |
> > +                      BIT(TRIGGER_NETDEV_LINK_1000) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_LINK_10_100_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_LINK_10) |
> > +                      BIT(TRIGGER_NETDEV_LINK_100) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
> > +
> > +     case VSC8531_ACTIVITY:
> > +             *rules =3D BIT(TRIGGER_NETDEV_LINK) |
> > +                      BIT(TRIGGER_NETDEV_RX) |
> > +                      BIT(TRIGGER_NETDEV_TX);
> > +             break;
>
> Should the combine bit be taken into account here?
>
Agreed, I will drop setting TRIGGER_NETDEV_RX/TRIGGER_NETDEV_TX from
all the above case and set it based on the combined bit like below:

if (!behavior && *rules)
        *rules |=3D BIT(TRIGGER_NETDEV_RX) | BIT(TRIGGER_NETDEV_TX);



> > @@ -2343,6 +2532,26 @@ static int vsc85xx_probe(struct phy_device *phyd=
ev)
> >       if (!vsc8531->stats)
> >               return -ENOMEM;
> >
> > +     phy_id =3D phydev->drv->phy_id & phydev->drv->phy_id_mask;
> > +     if (phy_id =3D=3D PHY_ID_VSC8541) {
>
> The VSC8541 has its own probe function, vsc8514_probe(). Why is this
> needed?
>
vsc85xx_probe() is used for other PHYs along with VSC8541 hence this
check, vsc8514_probe() is for 8514 PHY.

Cheers,
Prabhakar

