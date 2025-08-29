Return-Path: <linux-renesas-soc+bounces-21064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF7EB3B7A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 11:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9650A1C800D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 09:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2238283FDE;
	Fri, 29 Aug 2025 09:46:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D0833985
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Aug 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756460780; cv=none; b=PDGDTF8GapnjpQyR22mGIcKUnYTN65XWVd97hELX4PCmTndMUxvSl+uUnGsx+pdz0lDntGnICnQh9lswgQDtX6ca05HddFBQSCYFUVoZep+ixK//jz8tp5tdTRBhiJ8oI7I0ckUsJ65SXfTOJ5VU+cF2wns+eGc0KpYJ6ILB3KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756460780; c=relaxed/simple;
	bh=m2AA8AQ7ZC5QPFOd4+BL7ccckeu2croSpHaWgn2WXtE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dKDEXGCQQSXk1qBMGlanS66D9qHx7s86OO+GJ2B2gJFffUk/4FfQYq1ChUUoXTXvFWKMhT7hkGfu7YerQyvKEpfU59IokjuiiAmRlFka+Zi1z38jt+pUOSQdjiFujDMTrTf5E+Ima+ONRgl4Hg194w0OPkcaQNCUDwIuwmrgYDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urvgU-0003pN-4g; Fri, 29 Aug 2025 11:46:14 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urvgT-002hrG-00;
	Fri, 29 Aug 2025 11:46:13 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urvgS-000DDJ-2x;
	Fri, 29 Aug 2025 11:46:12 +0200
Message-ID: <d0a4368ce2f4743457f98d8559aaeee097b78d3e.camel@pengutronix.de>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add module reset support for
 RZ/T2H
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 29 Aug 2025 11:46:12 +0200
In-Reply-To: <20250820204810.2328183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20250820204810.2328183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Mi, 2025-08-20 at 21:48 +0100, Prabhakar wrote:
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
> v1->v2:
> - Added cpg_mrcr_reset_ops for RZ/T2H specific handling
> - Updated commit message
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 139 ++++++++++++++++++++++++-
>  1 file changed, 135 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas=
/renesas-cpg-mssr.c
> index 5ff6ee1f7d4b..77a298b50c9c 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -137,6 +137,22 @@ static const u16 srcr_for_gen4[] =3D {
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

Does each of these registers contain 32 reset controls?

Why are reserved registers in this list? It looks like the driver
allows poking around in reserved registers.

> +
>  /*
>   * Software Reset Clearing Register offsets
>   */
> @@ -736,6 +752,102 @@ static int cpg_mssr_status(struct reset_controller_=
dev *rcdev,
>  	return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
>  }
> =20
> +static int cpg_mrcr_reset(struct reset_controller_dev *rcdev,
> +			  unsigned long id)
> +{
> +	struct cpg_mssr_priv *priv =3D rcdev_to_priv(rcdev);
> +	unsigned int reg =3D id / 32;
> +	unsigned int bit =3D id % 32;
> +	u32 bitmask =3D BIT(bit);
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
> +
> +	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
> +	/* Reset module */
> +	bitmask |=3D readl(priv->pub.base0 + priv->reset_regs[reg]);
> +	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +
> +	/* Ensure module reset control register is set */
> +	if (!(bitmask & readl(priv->pub.base0 + priv->reset_regs[reg]))) {

Can this actually happen on this hardware? Under which circumstances?

> +		dev_err(priv->dev, "Reset register %u%02u is not set\n",
> +			readl(priv->pub.base0 + priv->reset_regs[reg]), bit);

Why read the register again? Could it have changed in the meantime?
Maybe it would be better to store the value that was actually checked
and print the variable here.

> +		spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
> +		return -EIO;
> +	}
> +
> +	/* Release module from reset state */
> +	bitmask =3D readl(priv->pub.base0 + priv->reset_regs[reg]) & ~bitmask;
> +	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
> +
> +	/*
> +	 * To secure processing after release from a module reset, dummy read
> +	 * the same register at least seven times.

Why 7? Is this documented in a reference manual?

> +	 */
> +	for (i =3D 0; i < 7; i++)
> +		readl(priv->pub.base0 + priv->reset_regs[reg]);

It would be better to define a macro and use it in both places instead
of the magic number.

regards
Philipp

