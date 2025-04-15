Return-Path: <linux-renesas-soc+bounces-16013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9D9A8A050
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC9015818BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 13:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30AF61A2C25;
	Tue, 15 Apr 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5nMr8Mj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4264D15746E;
	Tue, 15 Apr 2025 13:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725261; cv=none; b=Iy+wf5N34K1X+qiC4Igoml09/W3faQoj3dYsPX7Q8zYunvjmN2q9+9lCEApO9GW4VamXy2dmHsQe5qbLOF79yPd99TaPpY4KmLVaz6CBQyArm09mIowb+2IFNSitGb2znqJFM1x6cqYHtE5o+qvCeZ66kcuEeUJydnVHTL/x7cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725261; c=relaxed/simple;
	bh=zBkHuXnANZVP3lW1YInnfwbWrJ1LhDettt+qmAX2aMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVXPEOeEqBRFKN8Urra/bpN2e+Q+Qjbi+r4D6QfLBUQlEDzNyWyySkPag0iGNpUjgRfHyQpUUk1IO8kcDYVL9RtUZXJe8Ved0xmgMKi8Fhb30I+dZNe+XVzoMPNfD0ZIULLEL63j6ukWQqeoKodHLJYo5M6ZR97IgTxAE1ytdBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5nMr8Mj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3386515f8f.2;
        Tue, 15 Apr 2025 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725256; x=1745330056; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=;
        b=g5nMr8Mj4ub4Ri5D9sdjMlKSBeRSX1s3UtLLK5zM8DQmGRQmVK92k5Dw/Wo+DZABVB
         ZHsO3x73q4x5VlWq1KwLJg9VG22erbGumiEFkyYNloYCwW/YW06UicmeoLOyfbdkbzYs
         spf7k8VhHM/dzq62yYlcehBsRmjUC4CFUtAuZPhMdB7lia4fL3EjtEwGb2q6xenqSjXi
         vIDpXPQg1P5ELrmG9WyoAZiGZZ8lhj3WvCOsRE9zjqUjdjcQq5OOa9XQjlf4kGSerNMB
         4WyVw1Owjrx6/W+qDJ9iVmZDBYhkHGJCHCAKkatCzX/Njq12i4ZubjVelOLHAhaBk61w
         IKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725256; x=1745330056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxTErC+KnB5NGpCTc9/w/rpBQLv25Jj15o+pnsH3W3I=;
        b=qf4610B1XyCxAmIxHj8Inx4DzdyHTYvgN74gp1frjSilPzynLTue+RbPs9fczuMSNs
         VrnOPWo3iYzcZPWw2UsqAhWw9hQS0/Acd67UmXCOBG2rizN80BCt4KZuw0vMBf7kYWHh
         gu3+WF32fgNSvHTJKteuGHiW2rpQFsPXDasxua8jaH7QHw/fvERUYU7HLrh2p5DcXYKu
         qhksyCxrUZOTdzWnPRbK+LQLD4SGCU0geUZCCY6l66ynTF2Z+mkDxCtXjmFyN6zdW566
         o1IkNC9ABOAa4jnNJTr5B/XzHDamNE2yPQZAppXke/SQz3mXEXqp2Ad+jLDVs8iIz7n0
         72BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCre7fp0Ea4PQsuPrGUy01BYD0i81/WnUpEH4ZPOisSODTSLBM/WpE5N/AME3jAqxHAYonBpZc@vger.kernel.org, AJvYcCVUi3fuRrRxjF/TEsbKNOW8lm2kj4fFWHO8Dng6DUjeIoPyj5YqjiSkd0gHKWU+UVnfzxateQvSNMHco+0KoSg2GWs=@vger.kernel.org, AJvYcCVhMKTi99MCWPIH8qVmXAwgo0Mu6QXBcwPnecYHa3j5+5z4XNTc4Q1K6K24XOfctBFKGpoeocQ4PdFD@vger.kernel.org, AJvYcCXoTjIao/bdytctOFPZg2s3ahN2bXBO6XpREfXLKih+eVJ4A2KuwH/dsXGmlp7C72xef5fu+ObZDs7STr1q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp5eM4pbnopimWnkqfvum2scnB67QDizXhUIKs3LqOzAYMKd36
	oUI7G0FnE/KbRgNWbKRQSf3VShgE09Ap9Fr2Y3o4DDT+ZSPYWjeMqbQB3lcoNd/q9pN+Q6XyxjN
	WrJCAtYJ7DLStv8UUWdjOJRtjhCg=
X-Gm-Gg: ASbGncvNnClGKo8TxjWZfTWhgCh4URT2ByV4c7evAYmtMm42JuqQeGiqVRaZfr+9XPo
	ouUzwFhTmmt64Ki7+qqJVspx3sX0Rj2NZaMdtpoy9U2+/WHzF/fg6RNft/fth+55fyAtJww1gAY
	9XyuMCUb6hpyZ9KPzorpyo7uNZ2t8IRmJvQeNFgKdO+7vKcSNw+u0e6A==
X-Google-Smtp-Source: AGHT+IHIlDUG50nBX2u1LH9CaXEXWCjuUqqrtu+RUgth3OiXGHRpRs4KPtJjbrXWad3okXBSN+tXr8a7mC+87EouhWY=
X-Received: by 2002:a05:6000:18af:b0:391:4743:6dc2 with SMTP id
 ffacd0b85a97d-39ea52120e2mr13543818f8f.25.1744725256350; Tue, 15 Apr 2025
 06:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
In-Reply-To: <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 14:53:50 +0100
X-Gm-Features: ATxdqUE9J0buGzHkD1AbdOnLT3zfOWdA_YFucRbFLlm3VKoGvgJwL6K9gejz2HM
Message-ID: <CA+V-a8tr=6ZgKSF5=CmRvrMO8ZSwtfD-cqSpi=5+5WwB-_pj_Q@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

Thank you for the review.

On Tue, Apr 15, 2025 at 2:38=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Di, 2025-04-15 at 13:56 +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
> >  3 files changed, 160 insertions(+)
> >  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-g=
beth.c
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/=
ethernet/stmicro/stmmac/Kconfig
> > index 3c820ef56775..2c99b23f0faa 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
> >         This selects the Qualcomm ETHQOS glue layer support for the
> >         stmmac device driver.
> >
> > +config DWMAC_RENESAS_GBETH
> > +     tristate "Renesas RZ/V2H(P) GBETH support"
> > +     default ARCH_RENESAS
> > +     depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> > +     help
> > +       Support for Gigabit Ethernet Interface (GBETH) on Renesas
> > +       RZ/V2H(P) SoCs.
> > +
> > +       This selects the Renesas RZ/V2H(P) Soc specific glue layer supp=
ort
> > +       for the stmmac device driver.
> > +
> >  config DWMAC_ROCKCHIP
> >       tristate "Rockchip dwmac support"
> >       default ARCH_ROCKCHIP
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net=
/ethernet/stmicro/stmmac/Makefile
> > index 594883fb4164..91050215511b 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX) +=3D dwmac-lpc18xx.o
> >  obj-$(CONFIG_DWMAC_MEDIATEK) +=3D dwmac-mediatek.o
> >  obj-$(CONFIG_DWMAC_MESON)    +=3D dwmac-meson.o dwmac-meson8b.o
> >  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)      +=3D dwmac-qcom-ethqos.o
> > +obj-$(CONFIG_DWMAC_RENESAS_GBETH) +=3D dwmac-renesas-gbeth.o
> >  obj-$(CONFIG_DWMAC_ROCKCHIP) +=3D dwmac-rk.o
> >  obj-$(CONFIG_DWMAC_RZN1)     +=3D dwmac-rzn1.o
> >  obj-$(CONFIG_DWMAC_S32)              +=3D dwmac-s32.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c =
b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > new file mode 100644
> > index 000000000000..8674b7605d83
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -0,0 +1,148 @@
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
> > +#include "stmmac_platform.h"
> > +
> > +struct renesas_gbeth {
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct reset_control *rstc;
> > +     struct device *dev;
> > +     void __iomem *regs;
>
> This doesn't seem to be used anywhere.
>
I'll get rid of it.

> > +};
> > +
> > +static const char *const renesas_gbeth_clks[] =3D {
> > +     "tx", "tx-180", "rx", "rx-180",
> > +};
> > +
> > +static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool=
 enabled)
> > +{
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     int ret;
> > +
> > +     plat_dat =3D gbeth->plat_dat;
> > +     if (enabled) {
> > +             ret =3D reset_control_deassert(gbeth->rstc);
> > +             if (ret) {
> > +                     dev_err(gbeth->dev, "Reset deassert failed\n");
> > +                     return ret;
> > +             }
> > +
> > +             ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> > +                                           plat_dat->clks);
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
>
> Apart from the plat_dat assignment, this function has two completely
> separate paths. I'd fold its contents into renesas_gbeth_init/exit().
>
OK, I'll fix that in v7.

Cheers,
Prabhakar

