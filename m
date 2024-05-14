Return-Path: <linux-renesas-soc+bounces-5359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4418C5602
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 14:25:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CA19B20F57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 12:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9C543AD7;
	Tue, 14 May 2024 12:25:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B81843AD6;
	Tue, 14 May 2024 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715689541; cv=none; b=utmYEb6M3tZwfCNBPX99wtjnKcxNsIWQDnIXvazt7DBOuOT5lQmvpOu46KljTqwFBxpcVSp0Edv668IU2SaYnxwBAsQ+JQj4UUPxArwrXQRgaGZ9Mxg0hQv4QaVZUDc2U9IBpBikzxehjGEYJTEHMcVEIkZasYm44F83cp387Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715689541; c=relaxed/simple;
	bh=kLklBqH1RWPEFCWJS0iM8GEOcosFvwFB5TLgUkOsmQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYRFUHduaAPePhBgQkJfPBxSUS4EHuMHhum1hQMUxVLkMjtj/35sJMl6CzJQwbccmAZ2szmy8ff0nnd7i8G6BIfytelW5/bnoSomXmFykZUjPitv3c02xWiokbQixjfSIFpUu7wZtf9oBViFCgqZesjjZDxVfJrn+oZXcY22+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61b2218ab6fso44299147b3.1;
        Tue, 14 May 2024 05:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715689538; x=1716294338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CiUEa8Wkhi+xfDPXsGNPzDxbD2Ay2si78NXbB1yU/Ho=;
        b=kpD7aEwFefUKDmgOW3wJEkFPyP9gdXpGmSRq6lzwLImng/QwXz2/QWMHssMES/2cv4
         jyJJ1Zpiy9GqjxPHlj/jfx8G5b7lSaDeQsDNddKQpEQwBuMNPS5Q0x1tDQb21kN1pvko
         D6LrCNoYgiZ2B5fDpG8TUAdTsdJ50/sbREdFk+LBJfZSm50pty0JBjjIYjsFMT6i6ltG
         5/W8LXfiJ0jrn4yuXzQGfFrBENdnzlkMxZzt4jFpY/MrjfuZ0W5sHQQXnfOLHJ63ThsF
         nhkyO2PCti//mdbpucvV848YLix390G7tXISLlTio+d4V4rD7wDseBXco03M2yn+UoyI
         E5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBPTbmYbpPm9Vz2nIWfo0o8Nn2uKhZOIT1kmBPCGOu0NFzdBw8SQhx2rXK8wUDKcQB0gmNwWMq6mUzaCW15zpuOQAldt9o5ENtBRDDfkPQiJLN+BnzSsjaKl5Bi2EWgow3QZeGlArE+fc=
X-Gm-Message-State: AOJu0YzsiBeawDdFFZvOo7+dJAW6sfJDhpr7YoR8fiGoxLWILH1cDeEx
	2CfTPrAgaALg7DHPgPvVqJj5pixrV3njTq/bchlPzXZUPtVztMqWzNSIo9+j
X-Google-Smtp-Source: AGHT+IGT4DOrIom7D8Fj/N8EnM/jyjr6jA8gwVSSaxfkyfH1PvB5OSoot70nKUZC8tQjVcn3tsX/Dw==
X-Received: by 2002:a81:83c5:0:b0:61a:d286:9d0f with SMTP id 00721157ae682-622affcc457mr123642317b3.38.1715689537584;
        Tue, 14 May 2024 05:25:37 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e233a04sm25269337b3.9.2024.05.14.05.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 05:25:37 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-622ce869e9bso32200047b3.0;
        Tue, 14 May 2024 05:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWR8UJ/o4gCvgHJN1IXgmuIqT31PHAw0HMi/CZctRZZ2TuE11jLK7Pw8zjhe9Y9KXDaztmFScI2Rrl+cRQEIsGLQJ6JBh+RFSF8sPl5RmRCWle0lwFsOtQhXUoFl3Qwo2lUgnlZGARTp+M=
X-Received: by 2002:a81:9294:0:b0:618:5083:caa0 with SMTP id
 00721157ae682-622aff60cf3mr122246107b3.12.1715689536985; Tue, 14 May 2024
 05:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>
 <20240513100931.GA3015543@ragnatech.se> <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>
 <20240513125658.GB3015543@ragnatech.se>
In-Reply-To: <20240513125658.GB3015543@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 14:25:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXATsobm4rjkCV8SECNXQhuD1Cqr7ChyvtcaiLtLFtetw@mail.gmail.com>
Message-ID: <CAMuHMdXATsobm4rjkCV8SECNXQhuD1Cqr7ChyvtcaiLtLFtetw@mail.gmail.com>
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 13, 2024 at 2:57=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-05-13 13:44:22 +0200, Geert Uytterhoeven wrote:
> > On Mon, May 13, 2024 at 12:09=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > On 2024-05-13 11:39:54 +0200, Geert Uytterhoeven wrote:
> > > > On Thu, May 9, 2024 at 11:10=E2=80=AFPM Niklas S=C3=B6derlund
> > > > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > > > Add initial support for Renesas Ethernet-TSN End-station device o=
f R-Car
> > > > > V4H. The Ethernet End-station can connect to an Ethernet network =
using a
> > > > > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/R=
GMII.
> > > > > Depending on the connected PHY.
> > > > >
> > > > > The driver supports Rx checksum and offload and hardware timestam=
ps.
> > > > >
> > > > > While full power management and suspend/resume is not yet support=
ed the
> > > > > driver enables runtime PM in order to enable the module clock. Wh=
ile
> > > > > explicit clock management using clk_enable() would suffice for th=
e
> > > > > supported SoC, the module could be reused on SoCs where the modul=
e is
> > > > > part of a power domain.
> > > > >
> > > > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ra=
gnatech.se>
> > > > > ---
> > > > > * Changes since v4
> > > > > - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.
> > > >
> > > > Thanks for the update!
> > > >
> > > > > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > > > > +{
> > > > > +       u32 val =3D 0;
> > > > > +
> > > > > +       /* The MAC is capable of applying a delay on both Rx and =
Tx. Each
> > > > > +        * delay can either be on or off, there is no way to set =
its length.
> > > > > +        *
> > > > > +        * The exact delay applied depends on electric characteri=
stics of the
> > > > > +        * board. The datasheet describes a typical Rx delay of 1=
800 ps and a
> > > > > +        * typical Tx delay of 2000 ps.
> > > > > +        *
> > > > > +        * There are boards where the RTSN device is used togethe=
r with PHYs
> > > > > +        * who do not support a large enough internal delays to f=
unction. These
> > > > > +        * boards depends on the MAC applying these inexact delay=
s.
> > > > > +        */
> > > > > +
> > > > > +       /* If the phy-mode is rgmii or rgmii-rxid apply Rx delay =
on the MAC */
> > > > > +       if (priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > > > > +           priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_RXID)
> > > > > +               val |=3D GPOUT_RDM;
> > > > > +
> > > > > +       /* If the phy-mode is rgmii or rgmii-txid apply Tx delay =
on the MAC */
> > > > > +       if (priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > > > > +           priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
> > > > > +               val |=3D GPOUT_TDM;
> > > > > +
> > > > > +       rtsn_write(priv, GPOUT, val);
> > > > > +}
> > > >
> > > > > +static int rtsn_phy_init(struct rtsn_private *priv)
> > > > > +{
> > > > > +       struct device_node *np =3D priv->ndev->dev.parent->of_nod=
e;
> > > > > +       struct phy_device *phydev;
> > > > > +       struct device_node *phy;
> > > > > +       phy_interface_t iface;
> > > > > +
> > > > > +       /* Delays, if any, are applied by the MAC. Mask RGMII mod=
e passed to the
> > > > > +        * PHY to avoid it also adding the delay.
> > > > > +        */
> > > > > +       switch (priv->iface) {
> > > > > +       case PHY_INTERFACE_MODE_RGMII:
> > > > > +       case PHY_INTERFACE_MODE_RGMII_ID:
> > > > > +       case PHY_INTERFACE_MODE_RGMII_RXID:
> > > > > +       case PHY_INTERFACE_MODE_RGMII_TXID:
> > > > > +               iface =3D PHY_INTERFACE_MODE_RGMII;
> > > > > +               break;
> > > > > +       default:
> > > > > +               iface =3D priv->iface;
> > > > > +               break;
> > > > > +       }
> > > >
> > > > This introduces the same issues (the "workaround" state below) we h=
ad
> > > > with ravb before.
> > > > 9b23203c32ee02cd ("ravb: Mask PHY mode to avoid inserting delays tw=
ice")
> > > > was the workaround,
> > > > a6f51f2efa742df0 ("ravb: Add support for explicit internal clock de=
lay
> > > > configuration")
> > > > was the final fix.
> > > >
> > > > Do we really want to repeat that mistake?
> > >
> > > Is it the same issue?
> >
> > Sort of: you end up in a state similar to between the two commits fixin=
g
> > the issue on ravb.
> >
> > > The RAVB issue is around PHY drivers adjusting
> > > delays based on [rt]xc-skew-ps properties. The RTSN bindings only dea=
l
> > > with {rx,tx}-internal-delay-ps properties.
> > >
> > > After a discussion with Andrew my understanding is that the PHY shall
> > > not attempt to add any delays from {rx,tx}-internal-delay-ps properti=
es
> > > if the phy-mode used in of_phy_connect() is PHY_INTERFACE_MODE_RGMII.=
 As
> > > we mask the phy-mode here the PHY shall never attempt to add delays a=
s
> > > we deal with that in the MAC.
> > >
> > > It feels like I missed something? Sorry if I'm confused.
> >
> > The PHY never applies the {rx,tx}-internal-delay-ps properties, as
> > these are meant for the MAC (cfr. "internal").
> > The PHY does apply the "*-skew-ps" properties.
> >
> > If you mask any *ID part from the phy_interface_t, you lose the ability
> > to let the PHY apply any additional delay.
> >
> > We have several boards that use both the internal MAC delay and
> > the PHY skew properties.
>
> I understand and this make sens to me. But it is in direct contrast to
> what Andrew and I have iterated in previous versions of this driver.
>
> If I understand you correctly Geert, you suggest I should modify the
> driver to
>
> 1. Have the MAC (RTSN driver) apply Rx and/or Tx delays based on the
>    {rx,tx}-internal-delay-ps properties.
>
> 2. Not mask the phy-mode and pass it as is to of_phy_connect() as the
>    PHY driver will act only on [rt]xc-skew-ps properties and always
>    ignore any {rx,tx}-internal-delay-ps properties.
>
> This allows both the MAC and PHY driver to apply delays independently of
> each other.
>
> While if I understand Andrew correctly (and this is what the RTSN driver
> tries to do in this version) is
>
> 1. Have the MAC (RTSN driver) apply Rx and/or Tx delays based on the
>    phy-mode. Add Rx+Rx if rgmii-id, Rx if rgmii-rxid, Tx if rgmii-txid.
>
> 2. Mask the phy-mode passed to of_phy_connect() to always be
>    PHY_INTERFACE_MODE_RGMII if a rgmii phy-mode is in use. This is done
>    as the MAC driver will always apply the delay and the PHY should
>    never add a delay on its own.
>
> 3. The [rt]xc-skew-ps properties are not consider at all in this
>    solution.
>
> It is not possible to implement both proposed solutions I'm afraid. I
> prefers Geert's solution and this is what was done in earlier versions
> and this would align the behavior of the Renesas Ethernet driver if
> nothing else. But in conversation with Andrew in earlier versions of
> this series have moved to solution 2 as this seemed like the correct way
> of doing things.
>
> At this point I'm confused on which approach to use. @Andrew and @Geert
> how do you guys propose we align the two ?

Indeed, both should be aligned, to avoid confusion.

The implementation of the ravb driver was based on the feedback I
received at that time:
  1. The *ID phy mode delays must be applied by the PHY, not by the MAC,
  2. Any additional MAC delays should be specified using
      {rx,tx}-internal-delay-ps properties.

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

