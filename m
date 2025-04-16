Return-Path: <linux-renesas-soc+bounces-16062-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E07A8B7A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 13:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A960617E78E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 11:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA80623D297;
	Wed, 16 Apr 2025 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4bSm1St"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363A23C8AE;
	Wed, 16 Apr 2025 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802718; cv=none; b=Rgf0KD1nRz23Sw6XrpRIcDS/c9xxLOQYIWEMVyp0K63gnZA/YpM13nkLs2mmjRNlZUmHZpeEMNwl56o/HgAGHquYB3eR8AfxLlkliUXJ5Wr5Wuge1zsB+XbuO+BlRkiXPLtQDIzCkbp+QfeE6Gpn3SS1kZnvDomN80fhlWZOemE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802718; c=relaxed/simple;
	bh=LuhEbviQuC9XWl0F8oM+3l/5RDoRF2hsThgfXj7u+Bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7bCMeQn0x6VQqDS8Tlstq38SoCaz91HP0pv/kTxU4Ewg6Mwgq3Gn8qiBcAPT4wRdhs3UrbXsb9J5E9NOR4sbke93ETX7puiaOQwMwGA+cFomZXX+SMgSA91MSWKrrdknUKNc43Vk+S+Cu6WwLhGl/IrrUtCbNx8MS5YQufyv14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4bSm1St; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee651e419so195609f8f.3;
        Wed, 16 Apr 2025 04:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744802715; x=1745407515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=;
        b=k4bSm1StNo3pCSq0YPWspsP70YxJ0S77heOTwyw5DZUmjT5l3FzxdClD7eaGpc3uc5
         z3Ny0JT5urOoPMuQNZYT/4m86eIpXQnv6tHPU92UR13N93zGVqlMZD7k1A6r3cJXQlNV
         wSq9LV+Q/kZ6q1rK0D0wVacCWGU5pmdOP3DKiHyPuLeHUQlFiWqHiYRRI5QHARPpERro
         T++SdpNN2amaspUdY5ozhq4O53RBsXy4bg7wF9C35rfW4b+FT3JQzqqHuwNba+XnI3U9
         5xCKAaM9xGpEpKp14oNArUJJmI2/grp7ki9iBlBOXEfBg2udt1Z3GHeDbFSMtNdZF02U
         xehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802715; x=1745407515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK1qE9wdXLtXZ7bpXZQ96bl6ineBI8nWFsz8yMF/6bs=;
        b=NWB4rOcABoq4p+AMiNcts1W3dJE8oh2fhf1iUG0w1YyupgtElR8lVOyhx5KUAItoCb
         Fa6gn92XSstjk2jA+5NdYcxbUPImSL7Ymb+EzXNXjIwQH9utEd+WAqK9EKhtZUZR830f
         unjXhFE2BXpfOaRiUPRzlMPgAztBURhlEEwRXyKr/2PNxDKqxNHqJkm5Fq0OON5hGbwQ
         egw4T3u/5FINWbdbA/tCnbEZxow8/j/wGttEgt5D5nQU8Mm76khfj0vmk/3cDiHyFnQi
         fiyKA2ScKFFnzVLUVmuxlo27/Pn0ydrJLtvXOL1bJ+fLLAIuUFr9vAASrM3xNmvAABdr
         38NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCsBpeNEkdOdvmt1zEcxrTAEHLqAf5U9nWMFrnHpJs63559iVYlirtrzsYAO+lSSy2VED68v1O@vger.kernel.org, AJvYcCVFq78qkbP6YOsNKwUWqnNmNWgrwgOpbQuhYNtnKBZ2sgzkn67GiSyblfApSVvN/GLe7vHwVtsaUqB+@vger.kernel.org, AJvYcCWf1s4zFh4XGoLSnwDutwFkvEt+kyOWybjTasda0Ahs2a2uGqcNUM4XPi42PBdIsNfiOSKpL0G1Vfx6kvKWtHosiao=@vger.kernel.org, AJvYcCXmmT1jRGhQsrm1b+xM2MgfF4czYPMjH8jzcx+64GGu21NwoFKgmDRBLp+u6UqXD7OL8lnYtBAOYkpxyw4O@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCqWfwI5mduFsFV+8Afnsn1Vbws5YbGsHZ3Qhbe17Lwbz0WcS
	8JmnlmVF1ABVIClgaoNJtoChZSSYMq7FRQ4276VQA5UXc1Q97vYfgp/XnOH9KhDk+K4ofXZ3PnW
	1dfH5SqmmagHcvFkJqkz25lDmvAU=
X-Gm-Gg: ASbGnctWsp+eEqqfwvXzGvoMd+Q9fQoFbqyy/CNiQfByU+KP9X9Da3sH7zys35N2DJK
	H5aiar2CaT7i63kCrgQmLjk4ODfjoMNAmeeoj/vFJmTIeSx6xhRw9Tbv7S0XPiKJjyTaJvdpHR+
	ZU75s/Uiy5OzhXOWKdDslX9ocJ9ZbN+z3lFO4xVt4G9UqXzPw3cqHarKU=
X-Google-Smtp-Source: AGHT+IG20ioUwmVK8jT1auGEvfYmau6FZT4iN5r9cG0sTpD+CwE5vavkmt0SHhCn9DBrwBdOjgbt0xLoMYoKYshrtUA=
X-Received: by 2002:a05:6000:1867:b0:39e:cbca:922f with SMTP id
 ffacd0b85a97d-39ee5b12f23mr1105841f8f.12.1744802714969; Wed, 16 Apr 2025
 04:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346266349649D5E69923BAC86BD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Apr 2025 12:24:48 +0100
X-Gm-Features: ATxdqUHUY3qYyUELPpVyGQloNfVvIlHwW8HOxGgTg9mF-SSWoLexEHk-cqLqtZo
Message-ID: <CA+V-a8tu-9gu_Rm3TGeGPjO48tpUVYu+PR7K9FyUU6DORQYQYg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Wed, Apr 16, 2025 at 11:44=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 16 April 2025 11:40
> > Subject: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for =
Renesas GBETH
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
> >  3 files changed, 158 insertions(+)
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
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > b/drivers/net/ethernet/stmicro/stmmac/Makefile
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
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > new file mode 100644
> > index 000000000000..f34bec7794e2
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> > @@ -0,0 +1,146 @@
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
> > + * Copyright (C) 2025 Renesas Electronics Corporation  */
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
> > +};
> > +
> > +static const char *const renesas_gbeth_clks[] =3D {
> > +     "tx", "tx-180", "rx", "rx-180",
> > +};
> > +
> > +static int renesas_gbeth_init(struct platform_device *pdev, void *priv=
)
> > +{
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct renesas_gbeth *gbeth =3D priv;
> > +     int ret;
> > +
> > +     plat_dat =3D gbeth->plat_dat;
> > +
> > +     ret =3D reset_control_deassert(gbeth->rstc);
> > +     if (ret) {
> > +             dev_err(gbeth->dev, "Reset deassert failed\n");
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> > +                                   plat_dat->clks);
> > +     if (ret)
> > +             reset_control_assert(gbeth->rstc);
> > +
> > +     return 0;
>
>         return ret??
>
Indeed I missed it.

Cheers,
Prabhakar

