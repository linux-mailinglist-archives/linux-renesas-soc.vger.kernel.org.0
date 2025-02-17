Return-Path: <linux-renesas-soc+bounces-13221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3074A3892E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 17:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0103C3A59C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 16:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B798224AFA;
	Mon, 17 Feb 2025 16:32:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17961531DC;
	Mon, 17 Feb 2025 16:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809931; cv=none; b=GYKS20uMnV/KEkA+VPMt+b2z0h5YyalFYDi08zS+qqWQP0EzCgkUuoAdPuhjD/BMn8jQUH1lV+iBfgULSUEkDEAbqRP0Fx3UYbAznsHJAO6wEgEMs7gmpxEg+T/fy2NnHHya9JYJEf99OOAoTcnmT3rdSzsEAR31y6h+Mkz9Co4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809931; c=relaxed/simple;
	bh=wQ/Flq0j+XiLr9DvWTtj4kCzIL1Bq9N5hhSvdL5wJbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bL4JsOZf9PM/FurojtvyF5EvoXqaYSaGdwn0wEp/nEjitUtUoT2WkTXAUW7wsaJTDWkC/F1EQCTGCCdQcN/7hFskCXX2sz8THTVR1aWD4YRsCz8NsD+MWuqOjNONWr45p+XoTaUIIDk+vbpk2iuOckZx7IUKfK/dVvNeCwsr+qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: TNw473srR4qkNLnR79H4Ew==
X-CSE-MsgGUID: YduETmu3TVaGvqKnjbVe4w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 18 Feb 2025 01:32:05 +0900
Received: from [10.24.1.21] (unknown [10.24.1.21])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B3B1240276A2;
	Tue, 18 Feb 2025 01:32:02 +0900 (JST)
Message-ID: <b01d93cd-216b-4870-8c3f-16969493f448@bp.renesas.com>
Date: Mon, 17 Feb 2025 16:32:00 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] clk: renesas: Add support for R9A09G077 SoC
Content-Language: en-GB
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 thierry.bultel@linatsea.fr, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
 <20250217105354.551788-7-thierry.bultel.yh@bp.renesas.com>
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250217105354.551788-7-thierry.bultel.yh@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rarcVQGEvhLNSwDijeWHQoZP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rarcVQGEvhLNSwDijeWHQoZP
Content-Type: multipart/mixed; boundary="------------QEujpr5nu5bYEJCYqnNOEqTY";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 thierry.bultel@linatsea.fr, Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-ID: <b01d93cd-216b-4870-8c3f-16969493f448@bp.renesas.com>
Subject: Re: [PATCH v2 06/13] clk: renesas: Add support for R9A09G077 SoC
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
 <20250217105354.551788-7-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-7-thierry.bultel.yh@bp.renesas.com>

--------------QEujpr5nu5bYEJCYqnNOEqTY
Content-Type: multipart/mixed; boundary="------------fW0d0wZ6mwSx04bOsMwdT3Gp"

--------------fW0d0wZ6mwSx04bOsMwdT3Gp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On 17/02/2025 10:52, Thierry Bultel wrote:
> RZ/T2H has 2 registers blocks at different addresses.
>=20
> The clock tree has configurable dividers and mux selectors.
> Add these new clock types, new register layout type, and
> registration code for mux and div in registration callback.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  drivers/clk/renesas/Kconfig              |   5 +
>  drivers/clk/renesas/Makefile             |   1 +
>  drivers/clk/renesas/r9a09g077-cpg-mssr.c | 237 +++++++++++++++++++++++=

>  drivers/clk/renesas/renesas-cpg-mssr.c   |  40 ++++
>  drivers/clk/renesas/renesas-cpg-mssr.h   |  23 +++
>  5 files changed, 306 insertions(+)
>  create mode 100644 drivers/clk/renesas/r9a09g077-cpg-mssr.c
>=20
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index ff01f5f0ed20..58ea50b0e5b8 100644
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

CLK_RZT2H isn't needed anymore. Instead we probably need to depend on
CLK_RENESAS_CPG_MSSR.

> +
>  config CLK_SH73A0
>  	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
>  	select CLK_RENESAS_CPG_MSTP

[snip, now in drivers/clk/renesas/r9a09g077-cpg-mssr.c]

> +static struct clk * __init
> +	r9a09g077_cpg_clk_register(struct device *dev,

Looks like an extra tab crept in at the start of this line

[snip]

> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renes=
as/renesas-cpg-mssr.c
> index 7d5fba3aef19..2f5aa796b0c6 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -79,6 +79,15 @@ static const u16 mstpcr_for_gen4[] =3D {
>  	0x2D60, 0x2D64, 0x2D68, 0x2D6C, 0x2D70, 0x2D74,
>  };
> =20
> +/* Module Stop Control Register (RZ/T2H)
> + * RZ/T2H has 2 registers blocks. To differentiate them,
> + * 0x1000 is added to offsets of block 2
> + */
> +static const u16 mstpcr_for_rzt2h[] =3D {
> +	0x0300, 0x0304, 0x0308, 0x030C, 0x0310, 0x1318, 0x1320, 0x0324,
> +	0x0328, 0x032C, 0x0303, 0x1334,
> +};

Should the second to last entry be 0x0330 not 0x0303? I'm suspicious as
it doesn't match the alignment of the other entries.

We need some macros for this instead of just using 0x1000 in the
constants and the calculations below.

Perhaps,

#define RZT2H_MSTPCR_BLOCK_SHIFT	12
#define RZT2H_MSTPCR_OFFSET_MASK	GENMASK(11, 0)
#define RZT2H_MSTPCR(block, offset)	(((block) << RZT2H_MSTPCR_BLOCK_SHIFT=
) & ((offset) & RZT2H_MSTPCR_OFFSET_MASK))

#define RZT2H_MSTPCR_BLOCK(x)		((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
#define RZT2H_MSTPCR_OFFSET(x)		((x) & RZT2H_MSTPCR_OFFSET_MASK)

static const u16 mstpcr_for_rzt2h[] =3D {
	RZT2H_MSTPCR(0, 0x300), RZT2H_MSTPCR(0, 0x304), RZT2H_MSTPCR(0, 0x308), =
RZT2H_MSTPCR(0, 0x30c),
	RZT2H_MSTPCR(0, 0x310), RZT2H_MSTPCR(1, 0x318), RZT2H_MSTPCR(1, 0x320), =
RZT2H_MSTPCR(0, 0x324),=20
	RZT2H_MSTPCR(0, 0x328), RZT2H_MSTPCR(0, 0x32c), RZT2H_MSTPCR(0, 0x330), =
RZT2H_MSTPCR(1, 0x334),=20
};

> +
>  /*
>   * Standby Control Register offsets (RZ/A)
>   * Base address is FRQCR register
> @@ -189,6 +198,14 @@ struct mstp_clock {
> =20
>  #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
> =20
> +static void *cpg_rzt2h_addr_from_offset(struct clk_hw *hw, u16 offset)=

> +{
> +	struct mstp_clock *clock =3D to_mstp_clock(hw);
> +	struct cpg_mssr_priv *priv =3D clock->priv;
> +
> +	return offset + (offset > 0x1000 ? priv->pub.base1 - 0x1000 : priv->p=
ub.base0);

Perhaps,

void *base =3D RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.b=
ase0;
return base + RZT2H_MSTPCR_OFFSET(offset);

Thanks,

--=20
Paul Barker
--------------fW0d0wZ6mwSx04bOsMwdT3Gp
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------fW0d0wZ6mwSx04bOsMwdT3Gp--

--------------QEujpr5nu5bYEJCYqnNOEqTY--

--------------rarcVQGEvhLNSwDijeWHQoZP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ7NkgQUDAAAAAAAKCRDbaV4Vf/JGvQvp
AQD2lVA3/75iBkCHrOXjqAHfOQUs2Dlf1Sh1UX+k1N0sEwD/TgK7t61jqlGiohn5PLjYSa578hgK
yYioCy5xAH+o/As=
=7DEv
-----END PGP SIGNATURE-----

--------------rarcVQGEvhLNSwDijeWHQoZP--

