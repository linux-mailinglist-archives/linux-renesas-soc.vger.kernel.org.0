Return-Path: <linux-renesas-soc+bounces-14587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7BA673C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 13:24:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DAE0177160
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 12:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E077120C001;
	Tue, 18 Mar 2025 12:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/QrPyCr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB621E8355;
	Tue, 18 Mar 2025 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742300641; cv=none; b=qt/1I7fh4WWBYgpgvxzRXTZzCMBNwl5Rs2tNgWTNZUa/aG1FcusNgVlYGHbTvCOPK0Qut5gN3ptANdeDpIODVPBrstuRYukffi6G1dSQ/y9wzuq/AljJDZXa7Sc8DMkUcS7KdMqCUmAHYWwojtQmdwGU8jNU73MpgltOcmuBqgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742300641; c=relaxed/simple;
	bh=fRZbe/+HzZNfk3pwQ7sB5DnvN7+Rx4LsTVhQU/VPSQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIkuPXhDcyTvpzbtpoc8L8OJc7iduort8NCjYn7RcZRVG0DapR4b0+tcpQ2Nv5v5ad54XpzaiLHmXJKlk+fdpi2TGi1mN/vxJPmFKPRF12KXk26VMWHi4OWpwDIivTDUTif3tpcLFDTn/fBVm49SUBNit8me2kM4MmJjfGR5TuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/QrPyCr; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-523b8881d31so2370162e0c.2;
        Tue, 18 Mar 2025 05:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742300635; x=1742905435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O/Z/b5BuUx5IhmAv2S9TTBkrqyul/vNarr3/Lu9dmY=;
        b=J/QrPyCrgA5pa0spaI72l3oslbn7jAUUG+ZH5JNotPP1uKhnTSE9GxK8BvGsUfnYT9
         +CIDjKZfPFc0Qkoqo7eP9vTdlY2recG1eRAA5oujWRtUkn2jOHV9V/E2T3rj8AjgHtou
         JzAN5rRkjpi+Tc32heL9seMhn3uOFbZiXkiFRfZlgaE2TNSeURe+pwV892ftQWIZjmf1
         r7PNi7jXmrnjjcBn3bd4qGUg07+z7rsst6k8+doQ6cQhPtl0x/C7ImFtQmHjdVSHJK/8
         GsO8pNUGwHqAs8B4Al3Cd8aHgSRzQuSPrGiO5FdsAifnxBnhO+CAgFkq3tJ14IsgDV5s
         F1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742300635; x=1742905435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6O/Z/b5BuUx5IhmAv2S9TTBkrqyul/vNarr3/Lu9dmY=;
        b=Zg6YNw187v+f/mS9CkO+4AkH+qa9JoqbXN12e10Anz/h+Eu6OOlB+Lt2HiS7WyEFhy
         w63Zb4q5QWUHskRMizwyrolC533eJjsFA4imKtuPXugTFOzAcFddswvOh0xzww2TesIf
         +aCL1/jtqQsa6w06waTcW3XE3uWtXIGIcRM1Z1klaz0QdlpcaXtvu0q2DWW0wy6byre4
         zIuWDwr8tPOZF/ipvrq+Pt/hm3UKJ8/FqZ85hxlJTy0anCvdABWV4bN/UA9JQWc/ldc8
         qONnjP6I4IbcD/moP0CVixlmkBWrfST2R/rst94NblM1sa0kPE3u5oLsTARAp7CFMrXf
         V9kw==
X-Forwarded-Encrypted: i=1; AJvYcCVzOrCjZKyTSE1ZcbGtjwVs3IINbXrGTQ+dY9ZetNEpzSW6UM/kTvZNdezXdRib3JiykFA2HDxWZjF5Nemk@vger.kernel.org, AJvYcCWu2CMZNq5zTvh/Q8FOv0XNyA59gSG66m7KwC7eE4s55n3HOmUOw13Y+LWxANY8Q5mg1YWcippMpCmF@vger.kernel.org, AJvYcCXDq/czrSgmkeydB86zWLYRsMIof56AZr0pkysk+mUEBySDY4Jq3QWQ2LJhCWR9tYSdP9NAUsvO0TKxZS4sYyTEN48=@vger.kernel.org, AJvYcCXch75afQzWPtD/o8zPVcd8kq0VGp5610byOSyosHRNtgjI/m+l2Hi448erFi6uwE06DVhD2RYx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/wlhfMISrDGEa49BzDImzmc7U/0KBDvMOfWHzNn0GjLInEwg
	nk13NkTKW/r+mlOk3Q7fmuA+o05+/PTrfMzgjySk87zyXW7+DaIEwSK5tUkkgWOCICUjqlla3sK
	etejZxn0rxfuFHyTLtQQ8giDfAZ8=
X-Gm-Gg: ASbGncuFRDHPIfzdATkz3p9v76z9JVSpz4AblkOH4iO0CqZfrzlQQdKSQVarBz6Zdf3
	PZgZ/ignj4uzKcBZ4RA3BMD4TPBRsd4mVnaxV9xDsCNpwwE+BY4r1Q4OtvpTfYJ2kLehhZXg2K6
	fnLA9GspfITzuYXw8vkLck3LB820Jtq4kwrSfoV8KP62eTHrT9QUi8fzQVz88=
X-Google-Smtp-Source: AGHT+IE3BxI5o0DjGdvVHeSwDlSlXaoWGn5F40YKwfm1U+fGgWP9nGn4F1cFBKoqh/AcT3ohaiYPRz5/CfEzKrS6JVQ=
X-Received: by 2002:a05:6122:2385:b0:523:8230:70db with SMTP id
 71dfb90a1353d-52449a0f263mr10101912e0c.10.1742300635141; Tue, 18 Mar 2025
 05:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311221730.40720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250311221730.40720-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <8e804715-3123-4ab5-94ce-625060df4835@redhat.com>
In-Reply-To: <8e804715-3123-4ab5-94ce-625060df4835@redhat.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Mar 2025 12:23:28 +0000
X-Gm-Features: AQ5f1Jo2rD_t0J1KDzOZ4KdJEWX72SMSsRDCD7fwSLTf8fVxfjdjAQQiheYyxDc
Message-ID: <CA+V-a8vc0rdtHrFW1VTE-mgQrWsvbZ0DQc2ZxQMMcD+KJpWYOg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

Thank you for the review.

On Tue, Mar 18, 2025 at 11:49=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 3/11/25 11:17 PM, Prabhakar wrote:
> > @@ -0,0 +1,166 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> > + *
> > + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> > + *
> > + *                         Rx / Tx
> > + *   -------+------------- on / off -------
> > + *          |
> > + *          |            Rx-180 / Tx-180
> > + *          +---- not ---- on / off -------
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corporation
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/reset.h>
> > +
> > +#include "dwmac4.h"
> > +#include "stmmac_platform.h"
> > +
> > +struct renesas_gbeth {
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct reset_control *rstc;
> > +     struct device *dev;
> > +     void __iomem *regs;
> > +};
> > +
> > +static const char *const renesas_gbeth_clks[] =3D {
> > +     "tx", "tx-180", "rx", "rx-180",
> > +};
> > +
> > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_data =
*plat_dat,
> > +                                       const char *name)
> > +{
> > +     for (unsigned int i =3D 0; i < plat_dat->num_clks; i++)
> > +             if (!strcmp(plat_dat->clks[i].id, name))
> > +                     return plat_dat->clks[i].clk;
> > +
> > +     return NULL;
> > +}
> > +
> > +static int renesas_gbeth_clks_config(void *priv, bool enabled)
> > +{
> > +     struct renesas_gbeth *gbeth =3D priv;
> > +     struct plat_stmmacenet_data *plat_dat =3D gbeth->plat_dat;
>
> Minor nit: please respect the reverse christmas tree order above:
>
Agreed, I will fix that.

>         struct plat_stmmacenet_data *plat_dat;
>         struct renesas_gbeth *gbeth =3D priv;
>
> and init plat_dat later.
>
OK.

> > +     int ret;
> > +
> > +     if (enabled) {
> > +             ret =3D reset_control_deassert(gbeth->rstc);
> > +             if (ret) {
> > +                     dev_err(gbeth->dev, "Reset deassert failed\n");
> > +                     return ret;
> > +             }
> > +
> > +             ret =3D clk_bulk_prepare_enable(plat_dat->num_clks, plat_=
dat->clks);
> > +             if (ret)
> > +                     reset_control_assert(gbeth->rstc);
> > +     } else {
> > +             clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->=
clks);
> > +             ret =3D reset_control_assert(gbeth->rstc);
> > +             if (ret)
> > +                     dev_err(gbeth->dev, "Reset assert failed\n");
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int renesas_gbeth_probe(struct platform_device *pdev)
> > +{
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct stmmac_resources stmmac_res;
> > +     struct device *dev =3D &pdev->dev;
> > +     struct renesas_gbeth *gbeth;
> > +     unsigned int i;
> > +     int err;
> > +
> > +     err =3D stmmac_get_platform_resources(pdev, &stmmac_res);
> > +     if (err)
> > +             return dev_err_probe(dev, err,
> > +                                  "failed to get resources\n");
> > +
> > +     plat_dat =3D devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> > +     if (IS_ERR(plat_dat))
> > +             return dev_err_probe(dev, PTR_ERR(plat_dat),
> > +                                  "dt configuration failed\n");
> > +
> > +     gbeth =3D devm_kzalloc(dev, sizeof(*gbeth), GFP_KERNEL);
> > +     if (!gbeth)
> > +             return -ENOMEM;
> > +
> > +     plat_dat->num_clks =3D ARRAY_SIZE(renesas_gbeth_clks);
> > +     plat_dat->clks =3D devm_kcalloc(dev, plat_dat->num_clks,
> > +                                   sizeof(*plat_dat->clks), GFP_KERNEL=
);
> > +     if (!plat_dat->clks)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < plat_dat->num_clks; i++)
> > +             plat_dat->clks[i].id =3D renesas_gbeth_clks[i];
> > +
> > +     err =3D devm_clk_bulk_get(dev, plat_dat->num_clks, plat_dat->clks=
);
> > +     if (err < 0)
> > +             return err;
> > +
> > +     plat_dat->clk_tx_i =3D renesas_gbeth_find_clk(plat_dat, "tx");
> > +     if (!plat_dat->clk_tx_i)
> > +             return dev_err_probe(dev, -EINVAL,
> > +                                  "error finding tx clock\n");
> > +
> > +     gbeth->rstc =3D devm_reset_control_get_exclusive(dev, NULL);
> > +     if (IS_ERR(gbeth->rstc))
> > +             return PTR_ERR(gbeth->rstc);
> > +
> > +     gbeth->dev =3D dev;
> > +     gbeth->regs =3D stmmac_res.addr;
> > +     gbeth->plat_dat =3D plat_dat;
> > +     plat_dat->bsp_priv =3D gbeth;
> > +     plat_dat->set_clk_tx_rate =3D stmmac_set_clk_tx_rate;
> > +     plat_dat->clks_config =3D renesas_gbeth_clks_config;
> > +     plat_dat->flags |=3D STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY |
> > +                        STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP |
>
> The above does not compile:
>
> ../drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c:124:7:
> error: use of undeclared identifier 'STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP'
>
As pointed out by Russell it depends on patch [0].

https://lore.kernel.org/all/E1tsITp-005vG9-Px@rmk-PC.armlinux.org.uk/

>
> > +                        STMMAC_FLAG_SPH_DISABLE;
> > +
> > +     err =3D renesas_gbeth_clks_config(gbeth, true);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
> > +     if (err) {
> > +             renesas_gbeth_clks_config(gbeth, false);
> > +             return err;
>
> Just:
>
>         if (err)
>                 renesas_gbeth_clks_config(gbeth, false);
>
>         return err;
>
Ok, I will update the code as above.

Cheers,
Prabhakar

