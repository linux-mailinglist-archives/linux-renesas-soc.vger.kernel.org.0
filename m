Return-Path: <linux-renesas-soc+bounces-21494-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C43B45AE0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 16:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF7CB1BC2722
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D84872633;
	Fri,  5 Sep 2025 14:47:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD6C1FBCB5
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083621; cv=none; b=upJvqLmVhPwNbFsJTjNESD4mxJQ1h8eTEIcK0NYBjy4dM8gIVBAgVKKkIELqfsAk0cWtt/WZMyy2raokxx4S4wM3h7Kyl1MfZoMIfWxoLnrkSLEc/2+3wIbjkC4rhsRK7b7UZHsGoBlL9WesNJOhrIWUtsuJXq/OVdunsdEYheU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083621; c=relaxed/simple;
	bh=Im/IqSga0VX8if3jRMI6CR7wezG+E3xzjH7LjCIh4ko=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QFkArfEYJGojt4Ng4yzT6TUM79qTKdnbEi/T0m6mlU+HK/rXbQU4cIr6T0w1qEsRDK0OkRE7JXtRvsylRMDQ7RiEZZv9Nj8gei4gMtctotvVk+ORynDR5RhcgF5DCIx0yTabxed+U+iAbeofCg8wdRZ/PGLaAhLRljzXcqDWB3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuXiI-00055C-Hs; Fri, 05 Sep 2025 16:46:54 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuXiH-004O9q-1m;
	Fri, 05 Sep 2025 16:46:53 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uuXiH-000VgX-1W;
	Fri, 05 Sep 2025 16:46:53 +0200
Message-ID: <b48fafecc821d2099ff7e84477f36161bae13293.camel@pengutronix.de>
Subject: Re: [PATCH v3] clk: renesas: cpg-mssr: Add module reset support for
 RZ/T2H
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 05 Sep 2025 16:46:53 +0200
In-Reply-To: <20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Fr, 2025-09-05 at 12:45 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
> CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
> Registers (MRCR) where both reset and deassert actions are done via
> read-modify-write (RMW) to the same register.
>=20
> Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assign
> it to reset_regs. For this SoC, the number of resets is based on the
> number of MRCR registers rather than the number of module clocks. Also
> add cpg_mrcr_reset_ops to implement reset, assert, and deassert using RMW
> while holding the spinlock. This follows the RZ/T2H requirements, where
> processing after releasing a module reset must be secured by performing
> seven dummy reads of the same register, and where a module that is reset
> and released again must ensure the target bit in the Module Reset Control
> Register is set to 1.
>=20
> Update the reset controller registration to select cpg_mrcr_reset_ops for
> RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Simplifed the code by adding a common function cpg_mrcr_set_bit() to ha=
ndle
>   set/clear of bits with options for verify and dummy reads.
> - Added a macro for the number of dummy reads required.
>  =20
> v1->v2:
> - Added cpg_mrcr_reset_ops for RZ/T2H specific handling
> - Updated commit message
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 112 ++++++++++++++++++++++++-
>  1 file changed, 108 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 5ff6ee1f7d4b..81206db2b873 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -40,6 +40,8 @@
>  #define WARN_DEBUG(x)	do { } while (0)
>  #endif
> =20
> +#define RZT2H_RESET_REG_READ_COUNT	7
> +
>  /*
>   * Module Standby and Software Reset register offets.
>   *
> @@ -137,6 +139,22 @@ static const u16 srcr_for_gen4[] =3D {
>  	0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
>  };
> =20
> +static const u16 mrcr_for_rzt2h[] =3D {
> +	0x240,	/* MRCTLA */
> +	0x244,	/* Reserved */
> +	0x248,	/* Reserved */
> +	0x24C,	/* Reserved */
> +	0x250,	/* MRCTLE */
> +	0x254,	/* Reserved */
> +	0x258,	/* Reserved */
> +	0x25C,	/* Reserved */
> +	0x260,	/* MRCTLI */
> +	0x264,	/* Reserved */
> +	0x268,	/* Reserved */
> +	0x26C,	/* Reserved */
> +	0x270,	/* MRCTLM */
> +};
> +
>  /*
>   * Software Reset Clearing Register offsets
>   */
> @@ -736,6 +754,73 @@ static int cpg_mssr_status(struct reset_controller_d=
ev *rcdev,
>  	return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
>  }
> =20
> +static int cpg_mrcr_set_bit(struct reset_controller_dev *rcdev, unsigned=
 long id,
> +			    bool set, bool verify, bool dummy_reads, const char *op_name)

This function is inappropriately named, it does more than just set a
bit.

Why are there three boolean parameters if there are only ever two
combinations of them used? Just have a single bool assert.

Drop the op_name parameter.

> +{
> +	struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> +	unsigned int reg =3D id / 32;
> +	unsigned int bit =3D id % 32;
> +	u32 bitmask =3D BIT(bit);
> +	void __iomem *reg_addr;
> +	unsigned long flags;
> +	unsigned int i;
> +	u32 val;
> +
> +	dev_dbg(priv->dev, "%s %u%02u\n", op_name, reg, bit);

Replace op_name with set ? "assert" : "deassert".

You could later add a str_assert_deassert() helper in string_choices.h.

> +
> +	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> +
> +	reg_addr =3D priv->pub.base0 + priv->reset_regs[reg];
> +	/* Read current value and modify */
> +	val =3D readl(reg_addr);
> +	if (set)
> +		val |=3D bitmask;
> +	else
> +		val &=3D ~bitmask;
> +	writel(val, reg_addr);
> +
> +	/* Verify the operation if requested */
> +	if (verify) {
> +		val =3D readl(reg_addr);
> +		if ((set && !(bitmask & val)) || (!set && (bitmask & val))) {
> +			dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, b=
it);
> +			spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +			return -EIO;
> +		}
> +	}
> +
> +	/* Perform dummy reads if required */
> +	for (i =3D 0; dummy_reads && i < RZT2H_RESET_REG_READ_COUNT; i++)
> +		readl(reg_addr);

Both verify and dummy reads could just live in a single if (!assert) {}
block.

> +
> +	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +
> +	return 0;
> +}
> +
> +static int cpg_mrcr_reset(struct reset_controller_dev *rcdev, unsigned l=
ong id)
> +{
> +	int ret;
> +
> +	/* Assert reset */
> +	ret =3D cpg_mrcr_set_bit(rcdev, id, true, true, false, "reset");
> +	if (ret)
> +		return ret;

No delay necessary for any of the modules that can be reset?

> +	/* Deassert reset with dummy reads */
> +	return cpg_mrcr_set_bit(rcdev, id, false, false, true, "reset");

Copy & paste error in op_name, but that is fixed if you drop it.

> +}
> +
> +static int cpg_mrcr_assert(struct reset_controller_dev *rcdev, unsigned =
long id)
> +{
> +	return cpg_mrcr_set_bit(rcdev, id, true, true, false, "assert");
> +}
> +
> +static int cpg_mrcr_deassert(struct reset_controller_dev *rcdev, unsigne=
d long id)
> +{
> +	return cpg_mrcr_set_bit(rcdev, id, false, false, true, "deassert");
> +}
> +
>  static const struct reset_control_ops cpg_mssr_reset_ops =3D {
>  	.reset =3D cpg_mssr_reset,
>  	.assert =3D cpg_mssr_assert,
> @@ -743,6 +828,13 @@ static const struct reset_control_ops cpg_mssr_reset=
_ops =3D {
>  	.status =3D cpg_mssr_status,
>  };
> =20
> +static const struct reset_control_ops cpg_mrcr_reset_ops =3D {
> +	.reset =3D cpg_mrcr_reset,
> +	.assert =3D cpg_mrcr_assert,
> +	.deassert =3D cpg_mrcr_deassert,
> +	.status =3D cpg_mssr_status,
> +};
> +
>  static int cpg_mssr_reset_xlate(struct reset_controller_dev *rcdev,
>  				const struct of_phandle_args *reset_spec)
>  {
> @@ -760,11 +852,23 @@ static int cpg_mssr_reset_xlate(struct reset_contro=
ller_dev *rcdev,
> =20
>  static int cpg_mssr_reset_controller_register(struct cpg_mssr_priv *priv=
)
>  {
> -	priv->rcdev.ops =3D &cpg_mssr_reset_ops;
> +	/*
> +	 * RZ/T2H (and family) has the Module Reset Control Registers
> +	 * which allows control resets of certain modules.
> +	 * The number of resets is not equal to the number of module clocks.
> +	 */
> +	if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H) {
> +		priv->rcdev.ops =3D &cpg_mrcr_reset_ops;
> +		priv->rcdev.nr_resets =3D ARRAY_SIZE(mrcr_for_rzt2h) * 32;
> +	} else {
> +		priv->rcdev.ops =3D &cpg_mssr_reset_ops;
> +		priv->rcdev.nr_resets =3D priv->num_mod_clks;
> +	}
> +
>  	priv->rcdev.of_node =3D priv->dev->of_node;
>  	priv->rcdev.of_reset_n_cells =3D 1;
>  	priv->rcdev.of_xlate =3D cpg_mssr_reset_xlate;
> -	priv->rcdev.nr_resets =3D priv->num_mod_clks;
> +
>  	return devm_reset_controller_register(priv->dev, &priv->rcdev);
>  }
> =20
> @@ -1166,6 +1270,7 @@ static int __init cpg_mssr_common_init(struct devic=
e *dev,
>  		priv->control_regs =3D stbcr;
>  	} else if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H) {
>  		priv->control_regs =3D mstpcr_for_rzt2h;
> +		priv->reset_regs =3D mrcr_for_rzt2h;
>  	} else if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RCAR_GEN4) {
>  		priv->status_regs =3D mstpsr_for_gen4;
>  		priv->control_regs =3D mstpcr_for_gen4;
> @@ -1262,8 +1367,7 @@ static int __init cpg_mssr_probe(struct platform_de=
vice *pdev)
>  		goto reserve_exit;
> =20
>  	/* Reset Controller not supported for Standby Control SoCs */
> -	if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_A ||
> -	    priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_T2H)
> +	if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_A)
>  		goto reserve_exit;
> =20
>  	error =3D cpg_mssr_reset_controller_register(priv);

regards
Philipp

