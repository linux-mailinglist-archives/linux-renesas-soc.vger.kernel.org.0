Return-Path: <linux-renesas-soc+bounces-16061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CF4A8B713
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 12:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96F9188A262
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 10:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330112192E3;
	Wed, 16 Apr 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9K2wazx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC8E14F9D9;
	Wed, 16 Apr 2025 10:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800324; cv=none; b=GuQRMICbUOp19ZV9r8kmVTQDUlt52Rj6Vb8QomfrxV1kV5HmW6sXGFqfiTiQ/C+kJdsPAVqQ6LIooDDA5UU1YZYoyJ0qw8KF84OJyZeyXx8/G1K6IpyG/otWk9G4neYvpgR0nv5I91SeUuOABk9GIQBNxvlaC+uxIN8Dnqbu2eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800324; c=relaxed/simple;
	bh=1Q02dhnkALv6CP5h+IO37XDZ3GGiNxANJJ4p4fQrlUQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hl48mG5nrZ/2x7xFi3rJ46F6TxR8hjM93gJWmBI55GoMxsm2GC+nXde9+kvI4erdEFz6L6ojewpOrgSgFe4AjBglodYsayjl5gOLEDZm3E6UBxprGNJuEUIB34TAHnMuaXMugjTgL+FD8NA+T0pMO58wHTOZOU/Z3wbaew3Xuc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9K2wazx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39bf44be22fso4270255f8f.0;
        Wed, 16 Apr 2025 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800320; x=1745405120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=;
        b=F9K2wazxbDT5o9iZscuafqOYXxmHiSURuBbV7C/c8gXRrzHTuXkv3zPJXvkxUuqGtR
         dYTNfXibAor/AGS3C/7Dq53y1rJoOeFd2FOlMsem+dsCL47ey0yNAJtUy7LuIWsDUjv6
         d0NY/ZXlvyOPkvv/diPooopbt1tGom0Mf96LAFdT5hsh6+1At6tWLrEM3fAc+b/eTSsc
         Z/jzYcPRT09MMUjfcaOI1jHq6wRFtdl9h7NR/uD0QPcYLcjXCwRBiNPjNNNj9RTL0nhc
         0xs4J9QuGqH0XTi6cfpjMZnRQpakEutAc3IL4jZlM5R/0lPfzl7kDC54jubse73FTBNX
         ocdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800320; x=1745405120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ+hpkAofX+aHeqBJMhX3S0jMco9fodVrcXEVVX60Pw=;
        b=qfE7zMhs4XSPphDV4tcb8cod3TlSq+IRkj2fVUBJiHHwcdvT52KVGMCqjTp2e3c9yN
         JmvXfAEaGsoVW6I+e8FfwcRS7TsPd8ggC+SLUofyXwD2jtWCoVRwz4A2IuWq4nFqU46D
         7Z1TpdLJup44GiUTcDm8zyz751wFpLQovUOVaMatctSzf8mDcrlmTs4hAmQrUjjTRru5
         9ZwCL1G3ocDDTV3smPDH3PeB6sPrwqNbCtmRN7ykHiPBL4vEhkKPCfU0QBWh5Nk6BrUj
         nwioPvCiIWb0c7uzlCmR0mVgYqu7XUA9V3E7+hPjJgH06/KtGbXsFgtBWdUfiIRC/+R2
         YzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZb3NPfsj2a+htpAVMTmrY/57qbvwKaCyWxg9doIYIP/SOpII73/M1b46vs1+QqB/w3EdVAgGBkZ6qRl1K@vger.kernel.org, AJvYcCX+4UlgXB01n/YjFmrbBwwMDj2jxG2NkmA0C06vs1bCm3aKNw6/Col4imxu9yi0ajiwU28ANDBRPTEL@vger.kernel.org, AJvYcCXiA4zSgNb5pV7b7Ouwxhq6IJisJSjxSStEcqU++pllLvvgd971AN2r1P4smMNDP62cxNkCqoZDH9EvXvSNFIQc04E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZkjzSiACKu0Uie/DazruFNalxa38y9Z675PIgGWBcezcakp3
	WssPU2qeP4v3zJLT6MkFlncryWSuLhx4PJDkQeYDSo7qss4s1/Lz+Sa342qX072sd2h8H6mDw4n
	CEphlrh/im0AUNh7/W8BLum5iCOQ=
X-Gm-Gg: ASbGncsLLrNmfNxd2d2gTlFyUxWhakZx8UVPi9226NLQxaM6cJcYTLsEx+DM93WFMgp
	1qJevNXosSafrrId7F1BfAB/u5IZ3khloeXTcY4yA9YAQ+/RnCVIMYSnWyT2yXO1ZSMrXbTL97w
	DfbqXvnOZavgDN+oPYnOpX4tYKzn3oHVB8103mAluZLd6euYyQyrVJd/4=
X-Google-Smtp-Source: AGHT+IHceAQPkYgr6gv4d+47dQi2BveM4MNunE8eLD0kPVn7VMp8NlOF14LAKjl5p9eftjHmJMrjHs4kMBezXamCYyU=
X-Received: by 2002:a05:6000:1863:b0:39a:ca04:3e4d with SMTP id
 ffacd0b85a97d-39ee5b1123amr1251169f8f.7.1744800319726; Wed, 16 Apr 2025
 03:45:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250416104015.47788-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Apr 2025 11:44:53 +0100
X-Gm-Features: ATxdqUFZg4onSRXp1_kJuV7m9X73pVYBtmBk0hrdoERO50FU_acfBNENrSpy6UU
Message-ID: <CA+V-a8ua8anSCuyEYrdcpcCcdzE4EmQ0SDidYfiwe9zzezccaA@mail.gmail.com>
Subject: Re: [PATCH net-next v7 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Wed, Apr 16, 2025 at 11:40=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 ++++++++++++++++++
>  3 files changed, 158 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbe=
th.c
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..2c99b23f0faa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
>           This selects the Qualcomm ETHQOS glue layer support for the
>           stmmac device driver.
>
> +config DWMAC_RENESAS_GBETH
> +       tristate "Renesas RZ/V2H(P) GBETH support"
> +       default ARCH_RENESAS
> +       depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> +       help
> +         Support for Gigabit Ethernet Interface (GBETH) on Renesas
> +         RZ/V2H(P) SoCs.
> +
> +         This selects the Renesas RZ/V2H(P) Soc specific glue layer supp=
ort
> +         for the stmmac device driver.
> +
>  config DWMAC_ROCKCHIP
>         tristate "Rockchip dwmac support"
>         default ARCH_ROCKCHIP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/e=
thernet/stmicro/stmmac/Makefile
> index 594883fb4164..91050215511b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)   +=3D dwmac-lpc18xx.o
>  obj-$(CONFIG_DWMAC_MEDIATEK)   +=3D dwmac-mediatek.o
>  obj-$(CONFIG_DWMAC_MESON)      +=3D dwmac-meson.o dwmac-meson8b.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)        +=3D dwmac-qcom-ethqos.o
> +obj-$(CONFIG_DWMAC_RENESAS_GBETH) +=3D dwmac-renesas-gbeth.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)   +=3D dwmac-rk.o
>  obj-$(CONFIG_DWMAC_RZN1)       +=3D dwmac-rzn1.o
>  obj-$(CONFIG_DWMAC_S32)                +=3D dwmac-s32.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> new file mode 100644
> index 000000000000..f34bec7794e2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * dwmac-renesas-gbeth.c - DWMAC Specific Glue layer for Renesas GBETH
> + *
> + * The Rx and Tx clocks are supplied as follows for the GBETH IP.
> + *
> + *                         Rx / Tx
> + *   -------+------------- on / off -------
> + *          |
> + *          |            Rx-180 / Tx-180
> + *          +---- not ---- on / off -------
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include "stmmac_platform.h"
> +
> +struct renesas_gbeth {
> +       struct plat_stmmacenet_data *plat_dat;
> +       struct reset_control *rstc;
> +       struct device *dev;
> +};
> +
> +static const char *const renesas_gbeth_clks[] =3D {
> +       "tx", "tx-180", "rx", "rx-180",
> +};
> +
> +static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
> +{
> +       struct plat_stmmacenet_data *plat_dat;
> +       struct renesas_gbeth *gbeth =3D priv;
> +       int ret;
> +
> +       plat_dat =3D gbeth->plat_dat;
> +
> +       ret =3D reset_control_deassert(gbeth->rstc);
> +       if (ret) {
> +               dev_err(gbeth->dev, "Reset deassert failed\n");
> +               return ret;
> +       }
> +
> +       ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> +                                     plat_dat->clks);
> +       if (ret)
> +               reset_control_assert(gbeth->rstc);
> +
> +       return 0;
Just noticed this has to be ret, I'll send a new version fixing this.

Cheers,
Prabhakar

