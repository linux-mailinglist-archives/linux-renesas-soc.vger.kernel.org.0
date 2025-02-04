Return-Path: <linux-renesas-soc+bounces-12845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530DA276E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 17:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E09461885922
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2025 16:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D67215198;
	Tue,  4 Feb 2025 16:14:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A0F21516C;
	Tue,  4 Feb 2025 16:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738685691; cv=none; b=Lh3Qgd+e8vikf8uHGnvo3w33kHU8ySQKO6el3L0m97G88Xvq37092wPQ+iwhBsy6q9qNrDLsq89o5ii0PrJ9X+b30Cgwhw95RjrfV7MP1xe29n/SQun1AYD0Ys8ZR3tB0HWYipGkqhJiHgkZY/PqN1XozFI+6ZJR9/F1/Jbq9XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738685691; c=relaxed/simple;
	bh=O6EWE1g0meHI/YKlqi2XtS9SGQXzKmtOPXqf05pVaEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ul8WxXND/MvP2RyUmUbAhUdNpaL40aW6wRojwd0QRgkNZR2+ICYZpM5L15O7o3bdJJAXZV0w82o9lIdBWc/O/ZK75yjRTgKqDtyzDzH1XGSxwgqcfQiQmYOzTD313CmIYc+hfR1GPzDIOmu1zvr0YdVD0/27ydv+qLceWJGLu7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: giAiZVeyS2WUMVTA4SmU0w==
X-CSE-MsgGUID: 4GVCR4eiSv+kxJbaHIpYXA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Feb 2025 01:14:40 +0900
Received: from [10.24.1.103] (unknown [10.24.1.103])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CCC564005B3F;
	Wed,  5 Feb 2025 01:14:30 +0900 (JST)
Message-ID: <f52b6bda-1606-44da-bc5e-6fcfdfbaa3ae@bp.renesas.com>
Date: Tue, 4 Feb 2025 16:14:29 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
Content-Language: en-GB
From: Paul Barker <paul.barker.ct@bp.renesas.com>
In-Reply-To: <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vJFnGJGc4egRb4OGezu0gqYo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vJFnGJGc4egRb4OGezu0gqYo
Content-Type: multipart/mixed; boundary="------------dZk0vGVbolPFXdQVOW6iSNcl";
 protected-headers="v1"
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-ID: <f52b6bda-1606-44da-bc5e-6fcfdfbaa3ae@bp.renesas.com>
Subject: Re: [PATCH 06/14] clk: renesas: Add support for RZ/T2H family clock
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
 <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-7-thierry.bultel.yh@bp.renesas.com>

--------------dZk0vGVbolPFXdQVOW6iSNcl
Content-Type: multipart/mixed; boundary="------------DgYZSao6U00M22RBhj4CwAXS"

--------------DgYZSao6U00M22RBhj4CwAXS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thierry,

On 29/01/2025 16:37, Thierry Bultel wrote:
> Add the CPG driver for T2H family.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  drivers/clk/renesas/Kconfig     |   4 +
>  drivers/clk/renesas/Makefile    |   1 +
>  drivers/clk/renesas/rzt2h-cpg.c | 549 ++++++++++++++++++++++++++++++++=

>  drivers/clk/renesas/rzt2h-cpg.h | 201 ++++++++++++
>  4 files changed, 755 insertions(+)
>  create mode 100644 drivers/clk/renesas/rzt2h-cpg.c
>  create mode 100644 drivers/clk/renesas/rzt2h-cpg.h

[snip]

> diff --git a/drivers/clk/renesas/rzt2h-cpg.c b/drivers/clk/renesas/rzt2=
h-cpg.c
> new file mode 100644
> index 000000000000..79dacbd2b186
> --- /dev/null
> +++ b/drivers/clk/renesas/rzt2h-cpg.c

[snip]

> +struct pll_clk {
> +	void __iomem *base;
> +	struct rzt2h_cpg_priv *priv;
> +	struct clk_hw hw;
> +	unsigned int conf;
> +	unsigned int type;
> +};
> +#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)

Please add a blank line between these definitions.

> +
> +static struct clk
> +*rzt2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,

The '*' is part of the type so should be on the previous line. i.e.

    static struct clk *
    rzt2h_cpg_clk_src_twocell_get(...)

> +			       void *data)
> +{
> +	unsigned int clkidx =3D clkspec->args[1];
> +	struct rzt2h_cpg_priv *priv =3D data;
> +	struct device *dev =3D priv->dev;
> +	const char *type;
> +	struct clk *clk;
> +
> +	switch (clkspec->args[0]) {
> +	case CPG_CORE:
> +		type =3D "core";
> +		if (clkidx > priv->last_dt_core_clk) {
> +			dev_err(dev, "Invalid %s clock index %u\n", type, clkidx);
> +			return ERR_PTR(-EINVAL);
> +		}
> +		clk =3D priv->clks[clkidx];
> +		break;
> +
> +	case CPG_MOD:
> +		type =3D "module";
> +		if (clkidx >=3D priv->num_mod_clks) {
> +			dev_err(dev, "Invalid %s clock index %u\n", type,
> +				clkidx);
> +			return ERR_PTR(-EINVAL);
> +		}
> +		clk =3D priv->clks[priv->num_core_clks + clkidx];
> +		break;
> +
> +	default:
> +		dev_err(dev, "Invalid CPG clock type %u\n", clkspec->args[0]);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (IS_ERR(clk))
> +		dev_err(dev, "Cannot get %s clock %u: %ld", type, clkidx,
> +			PTR_ERR(clk));
> +	else
> +		dev_dbg(dev, "clock (%u, %u) is %pC at %lu Hz\n",
> +			clkspec->args[0], clkspec->args[1], clk,
> +			clk_get_rate(clk));
> +	return clk;
> +}
> +
> +static void __init
> +rzt2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> +			    const struct rzt2h_cpg_info *info,
> +			    struct rzt2h_cpg_priv *priv)
> +{
> +	struct clk *clk =3D ERR_PTR(-EOPNOTSUPP), *parent;
> +	unsigned int id =3D core->id, div =3D core->div;
> +	struct device *dev =3D priv->dev;
> +	const char *parent_name;
> +
> +	WARN_DEBUG(id >=3D priv->num_core_clks);
> +	WARN_DEBUG(PTR_ERR(priv->clks[id]) !=3D -ENOENT);
> +
> +	/* Skip NULLified clock */
> +	if (!core->name)
> +		return;
> +
> +	switch (core->type) {
> +	case CLK_TYPE_IN:
> +		clk =3D of_clk_get_by_name(priv->dev->of_node, core->name);
> +		break;
> +	case CLK_TYPE_FF:
> +		WARN_DEBUG(core->parent >=3D priv->num_core_clks);
> +		parent =3D priv->clks[core->parent];
> +		if (IS_ERR(parent)) {
> +			clk =3D parent;
> +			goto fail;
> +		}
> +
> +		parent_name =3D __clk_get_name(parent);
> +		clk =3D clk_register_fixed_factor(NULL, core->name,
> +						parent_name, CLK_SET_RATE_PARENT,
> +						core->mult, div);
> +		break;
> +	case CLK_TYPE_DIV:
> +		if (core->sel_base > 0)
> +			clk =3D rzt2h_cpg_div_clk_register(core,
> +							 priv->cpg_base1, priv);
> +		else
> +			clk =3D rzt2h_cpg_div_clk_register(core,
> +							 priv->cpg_base0, priv);
> +		break;
> +	case CLK_TYPE_MUX:
> +		clk =3D rzt2h_cpg_mux_clk_register(core, priv->cpg_base0, priv);
> +		break;
> +	default:
> +		goto fail;

I would prefer `clk =3D ERR_PTR(-EOPNOTSUPP);` here instead of at the top=

of the function so that it's easier to see at a glance what is
happening.

> +	}
> +
> +	if (IS_ERR_OR_NULL(clk))
> +		goto fail;
> +
> +	priv->clks[id] =3D clk;
> +	return;
> +
> +fail:
> +	dev_err(dev, "Failed to register %s clock %s: %ld\n", "core",
> +		core->name, PTR_ERR(clk));
> +}
> +
> +/**
> + * struct mstp_clock - MSTP gating clock
> + *
> + * @hw: handle between common and hardware-specific interfaces
> + * @priv: CPG/MSTP private data
> + * @sibling: pointer to the other coupled clock
> + * @baseaddr: register base address
> + * @enabled: soft state of the clock, if it is coupled with another cl=
ock
> + * @off: register offset
> + * @bit: ON/MON bit
> + */
> +struct mstp_clock {
> +	struct rzt2h_cpg_priv *priv;
> +	struct mstp_clock *sibling;
> +	void __iomem *baseaddr;
> +	struct clk_hw hw;
> +	bool enabled;
> +	u32 off;
> +	u8 bit;
> +};
> +#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
> +static int rzt2h_mod_clock_is_enabled(struct clk_hw *hw)

Please add blank lines between these three definitions.

> +{
> +	struct mstp_clock *clock =3D to_mod_clock(hw);
> +	struct rzt2h_cpg_priv *priv =3D clock->priv;
> +	u32 bitmask =3D BIT(clock->bit);
> +	u32 value;
> +
> +	if (!clock->off) {
> +		dev_dbg(priv->dev, "%pC does not support ON/OFF\n",  hw->clk);
> +		return 1;
> +	}
> +	value =3D readl(clock->baseaddr + clock->off);
> +
> +	/* For all Module Stop registers, read bit meaning is as such:
> +	 * 0: Release from the module-stop state
> +	 * 1: Transition to the module-stop state is made
> +	*/
> +
> +	return !(value & bitmask);
> +}
> +
> +static const struct clk_ops rzt2h_mod_clock_ops =3D {
> +	.is_enabled =3D rzt2h_mod_clock_is_enabled,
> +};
> +
> +static void __init
> +rzt2h_cpg_register_mod_clk(const struct rzt2h_mod_clk *mod,
> +			   const struct rzt2h_cpg_info *info,
> +			   struct rzt2h_cpg_priv *priv)
> +{
> +	struct mstp_clock *clock =3D NULL;
> +	struct device *dev =3D priv->dev;
> +	unsigned int id =3D mod->id;
> +	struct clk_init_data init;
> +	struct clk *parent, *clk;
> +	const char *parent_name;
> +	unsigned int i;
> +
> +	WARN_DEBUG(id < priv->num_core_clks);
> +	WARN_DEBUG(id >=3D priv->num_core_clks + priv->num_mod_clks);
> +	WARN_DEBUG(mod->parent >=3D priv->num_core_clks + priv->num_mod_clks)=
;
> +	WARN_DEBUG(PTR_ERR(priv->clks[id]) !=3D -ENOENT);
> +
> +	/* Skip NULLified clock */
> +	if (!mod->name)
> +		return;
> +
> +	parent =3D priv->clks[mod->parent];
> +	if (IS_ERR(parent)) {
> +		clk =3D parent;
> +		goto fail;
> +	}
> +
> +	clock =3D devm_kzalloc(dev, sizeof(*clock), GFP_KERNEL);
> +	if (!clock) {
> +		clk =3D ERR_PTR(-ENOMEM);
> +		goto fail;
> +	}
> +
> +	init.name =3D mod->name;
> +	init.ops =3D &rzt2h_mod_clock_ops;
> +	init.flags =3D CLK_SET_RATE_PARENT;
> +	for (i =3D 0; i < info->num_crit_mod_clks; i++)
> +		if (id =3D=3D info->crit_mod_clks[i]) {
> +			dev_dbg(dev, "CPG %s setting CLK_IS_CRITICAL\n",
> +				mod->name);
> +			init.flags |=3D CLK_IS_CRITICAL;
> +			break;
> +		}
> +
> +	parent_name =3D __clk_get_name(parent);
> +	init.parent_names =3D &parent_name;
> +	init.num_parents =3D 1;
> +
> +	clock->off =3D mod->addr;
> +	clock->bit =3D mod->bit;
> +	clock->baseaddr =3D mod->sel_base ? priv->cpg_base1 : priv->cpg_base0=
;
> +	clock->priv =3D priv;
> +	clock->hw.init =3D &init;

Both init and parent_name are local variables and can't be used after we
return from this function. So we mustn't store pointers to them into
objects that have a longer lifetime.

Could we add init and parent_name members to struct mstp_clock, then use
clock->init and clock->parent_name instead of the local variables?

> +
> +	clk =3D devm_clk_register(dev, &clock->hw);
> +	if (IS_ERR(clk))
> +		goto fail;
> +
> +	priv->clks[id] =3D clk;
> +
> +	return;
> +
> +fail:
> +	dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
> +		mod->name, PTR_ERR(clk));
> +}
> +
> +static bool rzt2h_cpg_is_pm_clk(const struct of_phandle_args *clkspec)=

> +{
> +	if (clkspec->args_count !=3D 2)
> +		return false;
> +
> +	switch (clkspec->args[0]) {
> +	case CPG_MOD:
> +		return true;
> +
> +	default:
> +		return false;
> +	}

Can we replace this switch statement with:

    return (clkspec->args[0] =3D=3D CPG_MOD);

> +}
> +
> +static int rzt2h_cpg_attach_dev(struct generic_pm_domain *unused, stru=
ct device *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct of_phandle_args clkspec;
> +	unsigned int i =3D 0;
> +	bool once =3D true;
> +	struct clk *clk;
> +	int error;
> +
> +	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
> +					   &clkspec)) {
> +		if (!rzt2h_cpg_is_pm_clk(&clkspec)) {
> +			of_node_put(clkspec.np);
> +			continue;
> +		}
> +
> +		if (once) {

Can we just use `if (!i)` here and drop the `once` variable?

> +			once =3D false;
> +			error =3D pm_clk_create(dev);
> +			if (error) {
> +				of_node_put(clkspec.np);
> +				goto err;
> +			}
> +		}
> +		clk =3D of_clk_get_from_provider(&clkspec);
> +		of_node_put(clkspec.np);
> +		if (IS_ERR(clk)) {
> +			error =3D PTR_ERR(clk);
> +			goto fail_destroy;
> +		}
> +		error =3D pm_clk_add_clk(dev, clk);
> +		if (error) {
> +			dev_err(dev, "pm_clk_add_clk failed %d\n", error);
> +			goto fail_put;
> +		}
> +		i++;
> +	}
> +
> +	return 0;
> +
> +fail_put:
> +	clk_put(clk);
> +
> +fail_destroy:
> +	pm_clk_destroy(dev);
> +err:
> +	return error;
> +}

[snip]

> +static const struct of_device_id rzt2h_cpg_match[] =3D {
> +#ifdef CONFIG_CLK_R9A09G077
> +	{
> +		.compatible =3D "renesas,r9a09g077-cpg",
> +		.data =3D &r9a09g077_cpg_info,
> +	},
> +#endif

CONFIG_CLK_R9A09G077 and r9a09g077_cpg_info are not defined until the
subsequent patch. We should move this entry to the next patch, and leave
this array empty here.

For comparison see how the RZ/V2H CPG driver was added in the following
commits:

    dd22e5621749 ("clk: renesas: Add family-specific clock driver for RZ/=
V2H(P)")
    36932cbc3e6c ("clk: renesas: Add RZ/V2H(P) CPG driver")

> +	{ /* sentinel */ }
> +};

[snip]

> diff --git a/drivers/clk/renesas/rzt2h-cpg.h b/drivers/clk/renesas/rzt2=
h-cpg.h
> new file mode 100644
> index 000000000000..d9d28608e4c3
> --- /dev/null
> +++ b/drivers/clk/renesas/rzt2h-cpg.h

[snip]

> +/**
> + * struct rzt2_cpg_info - SoC-specific CPG Description
> + *
> + * @core_clks: Array of Core Clock definitions
> + * @num_core_clks: Number of entries in core_clks[]
> + * @last_dt_core_clk: ID of the last Core Clock exported to DT
> + * @num_total_core_clks: Total number of Core Clocks (exported + inter=
nal)
> + *
> + * @mod_clks: Array of Module Clock definitions
> + * @num_mod_clks: Number of entries in mod_clks[]
> + * @num_hw_mod_clks: Number of Module Clocks supported by the hardware=

> + *
> + * @resets: Array of Module Reset definitions
> + * @num_resets: Number of entries in resets[]
> + *
> + * @crit_mod_clks: Array with Module Clock IDs of critical clocks that=

> + *                 should not be disabled without a knowledgeable driv=
er
> + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> + */
> +struct rzt2h_cpg_info {
> +	/* Core Clocks */
> +	const struct cpg_core_clk *core_clks;
> +	unsigned int num_core_clks;
> +	unsigned int last_dt_core_clk;
> +	unsigned int num_total_core_clks;
> +
> +	/* Module Clocks */
> +	const struct rzt2h_mod_clk *mod_clks;
> +	unsigned int num_mod_clks;
> +	unsigned int num_hw_mod_clks;
> +
> +	/* Resets */
> +	const struct rzt2h_reset *resets;
> +	unsigned int num_resets;
> +
> +	/* Critical Module Clocks that should not be disabled */
> +	const unsigned int *crit_mod_clks;
> +	unsigned int num_crit_mod_clks;

It looks like resets and crit_mod_clks are not populated in this initial
patch series. We can drop support for both of these from this patch
series.

> +};
> +
> +extern const struct rzt2h_cpg_info r9a09g077_cpg_info;
> +
> +#endif

--=20
Paul Barker
--------------DgYZSao6U00M22RBhj4CwAXS
Content-Type: application/pgp-keys; name="OpenPGP_0x27F4B3459F002257.asc"
Content-Disposition: attachment; filename="OpenPGP_0x27F4B3459F002257.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3DsIIN
-----END PGP PUBLIC KEY BLOCK-----

--------------DgYZSao6U00M22RBhj4CwAXS--

--------------dZk0vGVbolPFXdQVOW6iSNcl--

--------------vJFnGJGc4egRb4OGezu0gqYo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSiu8gv1Xr0fIw/aoLbaV4Vf/JGvQUCZ6I85QUDAAAAAAAKCRDbaV4Vf/JGvVwJ
AP92bjf/c/RtInb0MuPAI4/UnJnrxLmSt2zEzDoqaIRuXQD+IoDovznabJZcXbDcHfzZRS58uKn2
k2lgrOG/oPkugQk=
=+Ikq
-----END PGP SIGNATURE-----

--------------vJFnGJGc4egRb4OGezu0gqYo--

