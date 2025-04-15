Return-Path: <linux-renesas-soc+bounces-16010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD9AA89FAC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 15:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9AD31898B1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 13:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4044325771;
	Tue, 15 Apr 2025 13:38:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6211552FD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Apr 2025 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724302; cv=none; b=kDQolBCOsZC5iAP53qS/D9UTaCcWqCFMlEbyO6dyj7LX/0ASpo8hdYdELauBlGBAS8/r70MmQd4yHrrP4sx8q7gMiQvLJnTI5fPPrwgLGKxKk1zcxSZSi+12eppF+slWs1yUNmmNFWYjVmIo2tx6YcQhDUuCuvYzjZaxbZsUU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724302; c=relaxed/simple;
	bh=tupOFGHM6BdJtTgrpsfRqTV5PyDwJKEBwSPEfgUptpI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnP7Ef0ysJKIAvc+TvLHm2rKwN7qcOdJ4Hpg7GUbnIH7srmWBB0xb252lxLQh4DWYSYnc885BjvfZgjOfFHQlwQbXiHwWYxwJmGNJ/bMuC0UzU5BbxIjdGgNeYd0Sm8Wu+7Maa4lsZ9B/xQC/XUdPx/zD0fSQxyX/dG/e8R5utk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4gUC-0006Pd-2X; Tue, 15 Apr 2025 15:38:00 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4gU8-000QdR-03;
	Tue, 15 Apr 2025 15:37:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u4gU7-000BD8-2u;
	Tue, 15 Apr 2025 15:37:55 +0200
Message-ID: <c9d8f97470c3c5a8c0214af266b9579086460ba1.camel@pengutronix.de>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Richard Cochran
 <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>,  Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 15 Apr 2025 15:37:55 +0200
In-Reply-To: <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Di, 2025-04-15 at 13:56 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 ++++++++++++++++++
>  3 files changed, 160 insertions(+)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbe=
th.c
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index 3c820ef56775..2c99b23f0faa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -131,6 +131,17 @@ config DWMAC_QCOM_ETHQOS
>  	  This selects the Qualcomm ETHQOS glue layer support for the
>  	  stmmac device driver.
> =20
> +config DWMAC_RENESAS_GBETH
> +	tristate "Renesas RZ/V2H(P) GBETH support"
> +	default ARCH_RENESAS
> +	depends on OF && (ARCH_RENESAS || COMPILE_TEST)
> +	help
> +	  Support for Gigabit Ethernet Interface (GBETH) on Renesas
> +	  RZ/V2H(P) SoCs.
> +
> +	  This selects the Renesas RZ/V2H(P) Soc specific glue layer support
> +	  for the stmmac device driver.
> +
>  config DWMAC_ROCKCHIP
>  	tristate "Rockchip dwmac support"
>  	default ARCH_ROCKCHIP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/e=
thernet/stmicro/stmmac/Makefile
> index 594883fb4164..91050215511b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DWMAC_LPC18XX)	+=3D dwmac-lpc18xx.o
>  obj-$(CONFIG_DWMAC_MEDIATEK)	+=3D dwmac-mediatek.o
>  obj-$(CONFIG_DWMAC_MESON)	+=3D dwmac-meson.o dwmac-meson8b.o
>  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+=3D dwmac-qcom-ethqos.o
> +obj-$(CONFIG_DWMAC_RENESAS_GBETH) +=3D dwmac-renesas-gbeth.o
>  obj-$(CONFIG_DWMAC_ROCKCHIP)	+=3D dwmac-rk.o
>  obj-$(CONFIG_DWMAC_RZN1)	+=3D dwmac-rzn1.o
>  obj-$(CONFIG_DWMAC_S32)		+=3D dwmac-s32.o
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> new file mode 100644
> index 000000000000..8674b7605d83
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -0,0 +1,148 @@
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
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct reset_control *rstc;
> +	struct device *dev;
> +	void __iomem *regs;

This doesn't seem to be used anywhere.

> +};
> +
> +static const char *const renesas_gbeth_clks[] =3D {
> +	"tx", "tx-180", "rx", "rx-180",
> +};
> +
> +static int renesas_gbeth_clks_config(struct renesas_gbeth *gbeth, bool e=
nabled)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	int ret;
> +
> +	plat_dat =3D gbeth->plat_dat;
> +	if (enabled) {
> +		ret =3D reset_control_deassert(gbeth->rstc);
> +		if (ret) {
> +			dev_err(gbeth->dev, "Reset deassert failed\n");
> +			return ret;
> +		}
> +
> +		ret =3D clk_bulk_prepare_enable(plat_dat->num_clks,
> +					      plat_dat->clks);
> +		if (ret)
> +			reset_control_assert(gbeth->rstc);
> +	} else {
> +		clk_bulk_disable_unprepare(plat_dat->num_clks, plat_dat->clks);
> +		ret =3D reset_control_assert(gbeth->rstc);
> +		if (ret)
> +			dev_err(gbeth->dev, "Reset assert failed\n");
> +	}
> +
> +	return ret;
> +}

Apart from the plat_dat assignment, this function has two completely
separate paths. I'd fold its contents into renesas_gbeth_init/exit().


regards
Philipp

