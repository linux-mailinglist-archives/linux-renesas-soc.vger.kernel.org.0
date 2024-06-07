Return-Path: <linux-renesas-soc+bounces-5963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEC3900936
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 17:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958941C21B63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2024 15:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4193E19AA4F;
	Fri,  7 Jun 2024 15:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNabSmtw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805226288;
	Fri,  7 Jun 2024 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717774266; cv=none; b=eiLpAPjrGa7M+GkwE4DFqFAmbNTvDtBahLB1BRyJ4zCo6LuPjBj/tDQyziYrR8KhA05X6mnwHooRRn9vKIhQH+G+dxPWbnRJyqk34yc+U6wvrRAatVNRPicQj6KAP7bEI3bBAYAtHKsZ9lLxh/sagmPC/ZvIwS/0V3ay+7WmNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717774266; c=relaxed/simple;
	bh=IIbPTH5Uj8/YQWGzpHSPL0ScEYzR8T8lKL992gm2TBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXRuLybeo7rSj/2m2q49YW1/so1VjeiSsLifcSCFZMyCcGm5BIwhhILX6iPBJDrdSMhdxwjMz3vIvmk0LO99z6QwS6hqv5UglijGK8Vnd1ogHr/Xe39xqzZATEZvLwtqAbIDRmTZ2hbF0sDk7o7l5K09sg7yOWE+0cH/myLoABY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNabSmtw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A2BC2BBFC;
	Fri,  7 Jun 2024 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717774265;
	bh=IIbPTH5Uj8/YQWGzpHSPL0ScEYzR8T8lKL992gm2TBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNabSmtwgyweu5PxB/BpRJRcA9XYT1XRrttmfUcyO1g1y7Iey2E88tQLeq4gPyFN+
	 nt07kdvRhSOQ5Bp2VBBOy5a5La7kuVJVt90LD5EVHqTOShZ8YnMrAMdl6c2lPImQLT
	 SQFI+DyiOqJj0hzNgXeH52Qa6w4jm1HS96LfGNhHRbGnXr5cHKjM25e0OIFHBD3xTM
	 be1P8Q0YqgsQZUyxG2cS8vdeh2xB9WxCi82xg9k4WTSk4jJqzj+pAgLNwCQmpV3jzl
	 PGWhObv4UBdMVz3OgC/PNqjKO8tgzOJorHb9udy2d/250Zf4BP4VIvqtofgrQrU2uY
	 HeOxAJF5w3C6g==
Date: Fri, 7 Jun 2024 16:31:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/4] regulator: Add Renesas RZ/G2L USB VBUS
 regulator driver
Message-ID: <ZmMntvriR32aqI-m@finisterre.sirena.org.uk>
References: <20240607113745.73934-1-biju.das.jz@bp.renesas.com>
 <20240607113745.73934-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udQ3zrK5ASc6H/+G"
Content-Disposition: inline
In-Reply-To: <20240607113745.73934-3-biju.das.jz@bp.renesas.com>
X-Cookie: Your love life will be... interesting.


--udQ3zrK5ASc6H/+G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 12:37:43PM +0100, Biju Das wrote:

> +static const unsigned int vbus_voltages[] = {
> +	3300000, 0
> +};
> +
> +static const struct regulator_ops rzg2l_usb_vbus_reg_ops = {
> +	.list_voltage = regulator_list_voltage_table,
> +};

This is an enable control, not a voltage set control?

--udQ3zrK5ASc6H/+G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjJ7UACgkQJNaLcl1U
h9CssQf+JLOCnhzarGMUeGiWEeWYST/8aXioPhyPv1jeexOoc7SuLhV2fFLl8Wr8
/MaeUNqFkt2gK/Mb8czUYdEbN/IS6v2jFRdzVYiepgWPZydv8V4Jxf5lJ2ztXHxq
BdzhfN6+1VOSXqEyv4P+GRWiDeRrwtQu16DCsPCRA7Dh+cKRCRK9HMo215eZ5muG
VisufBOJcop4wFuSF8uRsROh/uF3FPDR19eWyaFHlrBnBL2adq5Fmw6XezvxhHlT
jT1xNrZSuZam7u5IZXVEqjagtSAamxPaCKbu1uoG4Rec4SWsq7xXtmC2G1iWokYi
urhOQJOwIoUlyCDyoEzsKOSwns8sJA==
=QQ++
-----END PGP SIGNATURE-----

--udQ3zrK5ASc6H/+G--

