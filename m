Return-Path: <linux-renesas-soc+bounces-5343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DEF8C3FFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 13:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993072874E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 11:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4D614D290;
	Mon, 13 May 2024 11:44:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70CB224F6;
	Mon, 13 May 2024 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715600680; cv=none; b=QQF89CEDhh4FLFXY0dGjplj1fQ4fYTFy/3zpJW3Y5KGVUtLpqs6IBmigEvEzIclTSMoLbkGujqCQ8qhxpYtoPr4RbuM0GBy7EiLgsMJaHkOJmIs2Q9Pw75SuGqUovjGrq91IIQDE1K5spfSeGj7KHG1bngG6fnLECTlLviMi1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715600680; c=relaxed/simple;
	bh=ubdPbDda7Pl3Y2//DWttS+YCfN9R/aF/O6ZvVFdP1Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InvK2DTazThYJnrZwkVj7UiDbU0WolMaBaYwRVpQ+Exe3dVa0UmDkuKH65XiCLnBpIdETBH5Tv62kCupLaiU9uJXiAea9dJ3kkJtVLFUG2I1PuuQtZgmFW6phBHHVygGG8yq5VxkE6pW6aEjCywwafmxF+vyb6Xpkmmdpx7Ttmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61bb219737dso46164097b3.2;
        Mon, 13 May 2024 04:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715600676; x=1716205476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR7QzxF8bZYZ+b5kWEkyWpGab/01JykZeSVdzh+wO9E=;
        b=mE+nfw/hswcRVZwyUrWRvbXIe15tJWyLlndOol+3ee+wL4ZBRWgvwH3wOQn0srGXK+
         2TiFfKWYu2HwGhip2kAekY8FjccCF8Od2xaLPyrikqzW4tXb9hyKmobAoWsZjE+Ps3+u
         dgTD4vmTPOpLb8pkwJRpm33+lWHYcSOClv/70krDAfp/Nf+iMJuU9ghie+2OLTSkZJpW
         blenhsZrT6EOeZd8Ae9uGjKLh5afypoDvpNY2qOP7+QEy2WKNz6BcMvDcIMxBKpXkNNL
         kHcDNUwXJcC5cIe1OZUtJFc4FnEVIi7bW8LPuxskmnyPxd1ehR4fZT+9x+N6itF4EVnO
         13rg==
X-Forwarded-Encrypted: i=1; AJvYcCVzIGYSNsMvzN8Ql8U3+HeVmIKKlUU6TcFFh7y5+YguVw6IcC1JD8Th0seo0m8fzoqrKDO+96MtF4vyoYDpcpispgJf2wmDQy/Sl1FynwCAZcjUUDld+utGGfdZSDy+vQ0L5sY5xm6aU+I=
X-Gm-Message-State: AOJu0YxAgY0RIdM32FVPt2cdW5lGUWVQdqDeppg4uCDoL+g6vTjDiEnB
	d9lPesZo0p4KWr45rKiPNfmvx7hhb8+DAC0p/VyWm3MVnW9aMrjiZGxuK1yC
X-Google-Smtp-Source: AGHT+IELhiDesUqQhwEqikipDtcE5ccXffLkuHz4u6YFIM3hCXtdYxSRxk0TjhZGOAxQhOy2GCjkEg==
X-Received: by 2002:a05:690c:b9d:b0:61b:3454:dbeb with SMTP id 00721157ae682-622affefd33mr106594407b3.46.1715600676433;
        Mon, 13 May 2024 04:44:36 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e26ae7esm20770137b3.57.2024.05.13.04.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:44:35 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-61df496df01so31646027b3.3;
        Mon, 13 May 2024 04:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9H3obs6JHDcr220tdNyivgNTXIDkbvBD/GvT8OEQ3mSWBL7LAnkLvml5UlIp+lAfb60NDH4NPS8yfQWuCtzCL4KgjOPylQiQsz2lnTrkhgY0wc+O6Rz28GGqHMlAXyvHxUfyFwuh0+I0=
X-Received: by 2002:a05:690c:5:b0:61b:bd7f:c602 with SMTP id
 00721157ae682-622affd9ff0mr113400937b3.38.1715600675703; Mon, 13 May 2024
 04:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com> <20240513100931.GA3015543@ragnatech.se>
In-Reply-To: <20240513100931.GA3015543@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:44:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>
Message-ID: <CAMuHMdVF-szo7An5rXEahmZMu3RAzo6krSnU-qsgtNL0a-NrSg@mail.gmail.com>
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew@lunn.ch>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, May 13, 2024 at 12:09=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2024-05-13 11:39:54 +0200, Geert Uytterhoeven wrote:
> > On Thu, May 9, 2024 at 11:10=E2=80=AFPM Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > Add initial support for Renesas Ethernet-TSN End-station device of R-=
Car
> > > V4H. The Ethernet End-station can connect to an Ethernet network usin=
g a
> > > 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII=
.
> > > Depending on the connected PHY.
> > >
> > > The driver supports Rx checksum and offload and hardware timestamps.
> > >
> > > While full power management and suspend/resume is not yet supported t=
he
> > > driver enables runtime PM in order to enable the module clock. While
> > > explicit clock management using clk_enable() would suffice for the
> > > supported SoC, the module could be reused on SoCs where the module is
> > > part of a power domain.
> > >
> > > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnat=
ech.se>
> > > ---
> > > * Changes since v4
> > > - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.
> >
> > Thanks for the update!
> >
> > > +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> > > +{
> > > +       u32 val =3D 0;
> > > +
> > > +       /* The MAC is capable of applying a delay on both Rx and Tx. =
Each
> > > +        * delay can either be on or off, there is no way to set its =
length.
> > > +        *
> > > +        * The exact delay applied depends on electric characteristic=
s of the
> > > +        * board. The datasheet describes a typical Rx delay of 1800 =
ps and a
> > > +        * typical Tx delay of 2000 ps.
> > > +        *
> > > +        * There are boards where the RTSN device is used together wi=
th PHYs
> > > +        * who do not support a large enough internal delays to funct=
ion. These
> > > +        * boards depends on the MAC applying these inexact delays.
> > > +        */
> > > +
> > > +       /* If the phy-mode is rgmii or rgmii-rxid apply Rx delay on t=
he MAC */
> > > +       if (priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > > +           priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_RXID)
> > > +               val |=3D GPOUT_RDM;
> > > +
> > > +       /* If the phy-mode is rgmii or rgmii-txid apply Tx delay on t=
he MAC */
> > > +       if (priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> > > +           priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
> > > +               val |=3D GPOUT_TDM;
> > > +
> > > +       rtsn_write(priv, GPOUT, val);
> > > +}
> >
> > > +static int rtsn_phy_init(struct rtsn_private *priv)
> > > +{
> > > +       struct device_node *np =3D priv->ndev->dev.parent->of_node;
> > > +       struct phy_device *phydev;
> > > +       struct device_node *phy;
> > > +       phy_interface_t iface;
> > > +
> > > +       /* Delays, if any, are applied by the MAC. Mask RGMII mode pa=
ssed to the
> > > +        * PHY to avoid it also adding the delay.
> > > +        */
> > > +       switch (priv->iface) {
> > > +       case PHY_INTERFACE_MODE_RGMII:
> > > +       case PHY_INTERFACE_MODE_RGMII_ID:
> > > +       case PHY_INTERFACE_MODE_RGMII_RXID:
> > > +       case PHY_INTERFACE_MODE_RGMII_TXID:
> > > +               iface =3D PHY_INTERFACE_MODE_RGMII;
> > > +               break;
> > > +       default:
> > > +               iface =3D priv->iface;
> > > +               break;
> > > +       }
> >
> > This introduces the same issues (the "workaround" state below) we had
> > with ravb before.
> > 9b23203c32ee02cd ("ravb: Mask PHY mode to avoid inserting delays twice"=
)
> > was the workaround,
> > a6f51f2efa742df0 ("ravb: Add support for explicit internal clock delay
> > configuration")
> > was the final fix.
> >
> > Do we really want to repeat that mistake?
>
> Is it the same issue?

Sort of: you end up in a state similar to between the two commits fixing
the issue on ravb.

> The RAVB issue is around PHY drivers adjusting
> delays based on [rt]xc-skew-ps properties. The RTSN bindings only deal
> with {rx,tx}-internal-delay-ps properties.
>
> After a discussion with Andrew my understanding is that the PHY shall
> not attempt to add any delays from {rx,tx}-internal-delay-ps properties
> if the phy-mode used in of_phy_connect() is PHY_INTERFACE_MODE_RGMII. As
> we mask the phy-mode here the PHY shall never attempt to add delays as
> we deal with that in the MAC.
>
> It feels like I missed something? Sorry if I'm confused.

The PHY never applies the {rx,tx}-internal-delay-ps properties, as
these are meant for the MAC (cfr. "internal").
The PHY does apply the "*-skew-ps" properties.

If you mask any *ID part from the phy_interface_t, you lose the ability
to let the PHY apply any additional delay.

We have several boards that use both the internal MAC delay and
the PHY skew properties.

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

