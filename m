Return-Path: <linux-renesas-soc+bounces-12846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C96A2777C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 17:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7B2A7A1590
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 16:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3256D215765;
	Tue,  4 Feb 2025 16:45:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB08828399;
	Tue,  4 Feb 2025 16:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687525; cv=none; b=nTea9ztSaBrgL45YstbaCBMC8D63S8LISWkt2N8PtqflDe+7fKi6PDZgkmbou7Lm2lcm76fladKDe5bGy2hJG0ERvQS51dI3h0R/PRKQ+8G3ETt6JoXAAtfPTYftGjzf0solDaFxaio1GA/1d4F7kRmo8i3vXHYzjZOS6aM8OqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687525; c=relaxed/simple;
	bh=5zUYjqsp1rc0xxpQnCyXSSdQdeKvNFI+5WXBz1zhvzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLQcVqCTNtxI16J6yDOxeQAkbCUK0L83Q5/SnaO80gnMKztl6X2zpJ8Cr4/Xl+TbwfwNC8lH95UTJEwBleh3K0faHvfyzO0KzBPCS6GOI/omlLwF6fgFTQ4ze+O64pg0ppH/6CysPLWsKcI3jZZhqSHyKkGBjcmmX2gNH3TIAsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: JV7UAgS7Rk2HGLTliDa5lg==
X-CSE-MsgGUID: FE4m9sxoSyyoBLRLqiAeAg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 01:45:19 +0900
Received: from [10.24.1.103] (unknown [10.24.1.103])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3AAD9402E56A;
	Wed,  5 Feb 2025 01:45:00 +0900 (JST)
Message-ID: <1a7b6bf0-5ceb-4308-bb71-6baff945b99d@bp.renesas.com>
Date: Tue, 4 Feb 2025 16:44:59 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] clk: renesas: Add support for R9A09G077 SoC
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-8-thierry.bultel.yh@bp.renesas.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250129165122.2980-8-thierry.bultel.yh@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------N4HHktQPozPo0zP20eTBlemk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------N4HHktQPozPo0zP20eTBlemk
Content-Type: multipart/mixed; boundary="------------GwrN4trEP52IDyjoACCo2w0N";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-ID: <1a7b6bf0-5ceb-4308-bb71-6baff945b99d@bp.renesas.com>
Subject: Re: [PATCH 07/14] clk: renesas: Add support for R9A09G077 SoC
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-8-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-8-thierry.bultel.yh@bp.renesas.com>

--------------GwrN4trEP52IDyjoACCo2w0N
Content-Type: multipart/mixed; boundary="------------tLmamLKW0XDVk1cAJYwNlnb7"

--------------tLmamLKW0XDVk1cAJYwNlnb7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29/01/2025 16:37, Thierry Bultel wrote:
> Add the R9A09G077 SoC specific definitions to the CPG driver.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  drivers/clk/renesas/Kconfig         |   5 ++
>  drivers/clk/renesas/Makefile        |   1 +
>  drivers/clk/renesas/r9a09g077-cpg.c | 100 ++++++++++++++++++++++++++++=

>  3 files changed, 106 insertions(+)
>  create mode 100644 drivers/clk/renesas/r9a09g077-cpg.c
>=20
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 7ad59be2099d..017ae990d50c 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -41,6 +41,7 @@ config CLK_RENESAS
>  	select CLK_R9A08G045 if ARCH_R9A08G045
>  	select CLK_R9A09G011 if ARCH_R9A09G011
>  	select CLK_R9A09G057 if ARCH_R9A09G057
> +	select CLK_R9A09G077 if ARCH_R9A09G077
>  	select CLK_SH73A0 if ARCH_SH73A0
> =20
>  if CLK_RENESAS
> @@ -198,6 +199,10 @@ config CLK_R9A09G057
>         bool "RZ/V2H(P) clock support" if COMPILE_TEST
>         select CLK_RZV2H
> =20
> +config CLK_R9A09G077
> +	bool "RZ/T2H clock support" if COMPILE_TEST
> +	select CLK_RZT2H
> +
>  config CLK_SH73A0
>  	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
>  	select CLK_RENESAS_CPG_MSTP
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefil=
e
> index bd9f0b54fcda..fe11b10bc451 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_CLK_R9A07G054)		+=3D r9a07g044-cpg.o
>  obj-$(CONFIG_CLK_R9A08G045)		+=3D r9a08g045-cpg.o
>  obj-$(CONFIG_CLK_R9A09G011)		+=3D r9a09g011-cpg.o
>  obj-$(CONFIG_CLK_R9A09G057)		+=3D r9a09g057-cpg.o
> +obj-$(CONFIG_CLK_R9A09G077)		+=3D r9a09g077-cpg.o
>  obj-$(CONFIG_CLK_SH73A0)		+=3D clk-sh73a0.o
> =20
>  # Family
> diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/=
r9a09g077-cpg.c
> new file mode 100644
> index 000000000000..0b2895c796d1
> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r9a09g077 Clock Pulse Generator / Module Standby and Software Reset=

> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>

Please use alphabetical order for these includes.

> +
> +#include <dt-bindings/clock/r9a09g077-cpg.h>
> +
> +#include "rzt2h-cpg.h"
> +
> +enum clk_ids {
> +	/* Core Clock Outputs exported to DT */
> +	/* External Input Clocks */
> +	LAST_DT_CORE_CLK =3D R9A09G077_LCDC_CLKD,
> +	CLK_EXTAL,
> +	CLK_LOCO,

I think the above lines have got slightly mixed up, it should be:

    /* Core Clock Outputs exported to DT */
    LAST_DT_CORE_CLK =3D R9A09G077_LCDC_CLKD,

    /* External Input Clocks */
    CLK_EXTAL,
    CLK_LOCO,

With these minor changes,
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>

--=20
Paul Barker
--------------tLmamLKW0XDVk1cAJYwNlnb7
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------tLmamLKW0XDVk1cAJYwNlnb7--

--------------GwrN4trEP52IDyjoACCo2w0N--

--------------N4HHktQPozPo0zP20eTBlemk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ6JECwUDAAAAAAAKCRDbaV4Vf/JGvdE5
AQDJJ88qcues5xRYB0O6XbN8+ovWVW4RLO45XSnH0+kExQEA/eFJIrB2UAiURFM7NKd0eZ6ZmfIB
ujUEcmfjhk1SaAo=
=exzD
-----END PGP SIGNATURE-----

--------------N4HHktQPozPo0zP20eTBlemk--

