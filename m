Return-Path: <linux-renesas-soc+bounces-5334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA2B8C3E44
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 11:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F7C51C21154
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 09:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A251487E5;
	Mon, 13 May 2024 09:40:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F627715;
	Mon, 13 May 2024 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715593211; cv=none; b=iwyOVN8hQOuO29J6W98ozrTgDksdTaIKyalqUldlURDI4XGOnSGkTgGZ5zMGtrWuZO3RbbITDZhqnzMx+40+au1itUKuWbro21+FDn9L7z/2F/V+zBn8pUQ1Dkbe6wGkBADKEZ1KQeLbV9S0qqlsLgf2RtnBY0ar2OufOdYFLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715593211; c=relaxed/simple;
	bh=Nmnc+c3/hr7r3AjTueUe6J1xRTmDFMiUlZX1tBMVHcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WgxeKT7GFZEeaLiMEa21i1xFKKdgQs+glbDHDIhebH90tAExhau6p1RX6lkFNOv1Syy2qv0fwcbjS4KWaRmudEeDJ3CnxeDeOffsb/w43Yg3MSt0f3QNZSLwFtP0YMnMqbP8Dgzp2oZqO4iNMH4zjFA+0rPUHgH1xpCXoZxMAPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61e0c1ec7e2so44946937b3.0;
        Mon, 13 May 2024 02:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715593208; x=1716198008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng3FAsG/JCaeFPdwQybfr3K8lHPR7N52nVbw3VV2iys=;
        b=pRb+6AtpqAr1j3GyXz9gTujAt7e/Brh+emAetWqkSrbjveHrLvVQ4YjcjbT7VHJofT
         l6XFxBWzEtEaIaDQGMOTubLi8kXivae8Lj5HqZtrdyIOipifZgxZxHUxktJF66QSj0Bc
         78m/7H/2m1FA9hZAYq7Dw+4N/qKtUAyBPgBe4tnedLhxX4ZlxGILKJqY1STt1mbL2YVP
         4TDyypNNZtX0QkGqGyJ3/XNjH25gegHPngz/o/g77sYSX6XbvfLkdpwcc/+O3bq6Pbyc
         ynnDTruvy1qvIXIvYD03+O7ZZiAN+nOQRYrKLnpv/s8eb7Yx0u+Py8PufrdyrUnqKMr5
         ofLg==
X-Forwarded-Encrypted: i=1; AJvYcCXnv0v1gY9F9vSV43ZRNFroVmk0ziiw2u7wvj0Dk04kUStWqkJW0WFpR1jKsAQamENPnZoAbOJ6Vhj+M8e/jBcvYupiodsqvIIYW2d0C2+qIlXLtdKOhHaghJKx4jV3GOnhatxnUWEBsMc=
X-Gm-Message-State: AOJu0YzoND2mhbYSDyT69twQxzRn/B6UMCrM5o4P6ZvnHLgYPUhyxzYu
	9BlTtGID66NQl9nKGGqwlMuE6/7z08Ynlnr1Br58Rk/55kmxE9jWUy51tE1k
X-Google-Smtp-Source: AGHT+IED3vSJf9a2K4j63XFA0B0/7Ess+zk+VrMmLX2ManhwWjQO7gn0nH0vWGwOrkc/iLoevEL/hw==
X-Received: by 2002:a81:6ccb:0:b0:618:48ab:e597 with SMTP id 00721157ae682-622af7c7228mr70661627b3.8.1715593208319;
        Mon, 13 May 2024 02:40:08 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e37926fsm19858057b3.106.2024.05.13.02.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 02:40:07 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dee72970df8so969974276.0;
        Mon, 13 May 2024 02:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNTrv1l07AKWVLworNiMBcaH4Vizvqh4VnTBqB235cLCu4SEVixXnqz2uWUROg0VFl2sFrVtd0YerahqTtGlqfZ06aPeU9Hqt409FAcv9NyNQ/iM3dgiEbm9iJ0GmLd+ukL2h7E1yremw=
X-Received: by 2002:a25:86c5:0:b0:dc6:c670:c957 with SMTP id
 3f1490d57ef6-debcfc35a33mr8336373276.32.1715593207006; Mon, 13 May 2024
 02:40:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 11:39:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>
Message-ID: <CAMuHMdWY-Ewm_ke6LxF1cpqQEdL3AnumyNKcTWvpFBJW_8wXJA@mail.gmail.com>
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas Ethernet-TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev <netdev@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas, Andrew,

On Thu, May 9, 2024 at 11:10=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
>
> The driver supports Rx checksum and offload and hardware timestamps.
>
> While full power management and suspend/resume is not yet supported the
> driver enables runtime PM in order to enable the module clock. While
> explicit clock management using clk_enable() would suffice for the
> supported SoC, the module could be reused on SoCs where the module is
> part of a power domain.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v4
> - Enable GPOUT_RDM and GPOUT_TDM delays depending on phy-mode.

Thanks for the update!

> +static void rtsn_set_delay_mode(struct rtsn_private *priv)
> +{
> +       u32 val =3D 0;
> +
> +       /* The MAC is capable of applying a delay on both Rx and Tx. Each
> +        * delay can either be on or off, there is no way to set its leng=
th.
> +        *
> +        * The exact delay applied depends on electric characteristics of=
 the
> +        * board. The datasheet describes a typical Rx delay of 1800 ps a=
nd a
> +        * typical Tx delay of 2000 ps.
> +        *
> +        * There are boards where the RTSN device is used together with P=
HYs
> +        * who do not support a large enough internal delays to function.=
 These
> +        * boards depends on the MAC applying these inexact delays.
> +        */
> +
> +       /* If the phy-mode is rgmii or rgmii-rxid apply Rx delay on the M=
AC */
> +       if (priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> +           priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_RXID)
> +               val |=3D GPOUT_RDM;
> +
> +       /* If the phy-mode is rgmii or rgmii-txid apply Tx delay on the M=
AC */
> +       if (priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_ID ||
> +           priv->iface =3D=3D PHY_INTERFACE_MODE_RGMII_TXID)
> +               val |=3D GPOUT_TDM;
> +
> +       rtsn_write(priv, GPOUT, val);
> +}

> +static int rtsn_phy_init(struct rtsn_private *priv)
> +{
> +       struct device_node *np =3D priv->ndev->dev.parent->of_node;
> +       struct phy_device *phydev;
> +       struct device_node *phy;
> +       phy_interface_t iface;
> +
> +       /* Delays, if any, are applied by the MAC. Mask RGMII mode passed=
 to the
> +        * PHY to avoid it also adding the delay.
> +        */
> +       switch (priv->iface) {
> +       case PHY_INTERFACE_MODE_RGMII:
> +       case PHY_INTERFACE_MODE_RGMII_ID:
> +       case PHY_INTERFACE_MODE_RGMII_RXID:
> +       case PHY_INTERFACE_MODE_RGMII_TXID:
> +               iface =3D PHY_INTERFACE_MODE_RGMII;
> +               break;
> +       default:
> +               iface =3D priv->iface;
> +               break;
> +       }

This introduces the same issues (the "workaround" state below) we had
with ravb before.
9b23203c32ee02cd ("ravb: Mask PHY mode to avoid inserting delays twice")
was the workaround,
a6f51f2efa742df0 ("ravb: Add support for explicit internal clock delay
configuration")
was the final fix.

Do we really want to repeat that mistake?

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

