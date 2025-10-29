Return-Path: <linux-renesas-soc+bounces-23860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E8BC1B638
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 648801A67A82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2201C2DBF5B;
	Wed, 29 Oct 2025 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BA4/bsjc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73D229B793;
	Wed, 29 Oct 2025 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748684; cv=none; b=HNmB/iYFwVf4DFMlm2Ly5xOIAyIQMr9iuV+iCEsu8fkobMeT+v5UktS0O9nijGx3cooV50+NJloGiiuT/nC/lq2S6wgBmxQaOboESSrmdmiRHM4Sx7di9ff/InEZzLSfPBREm99MlURwZGGuNpzwWAnPCR70XuHUumwM9hfeTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748684; c=relaxed/simple;
	bh=QhPL8hejE0q/XjPwlAAC6C2v9MdVz3zIjfNyGj/b4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtRHeey71IHW2R9HuyKjyGhb0RGyD5gplZHC/S613gT1qPZGfA+J1SqAibsG3ecwzIEJB0Gq/THhunjreRGgVgmuUOcX2Znci0o3b18x2J9fua7ZuvsXZiO2VfOoL2f3IiEEmtSo4QUkWtaxrpO09Rv1Hl67JTqVetH4vLDp5aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BA4/bsjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F986C4CEF7;
	Wed, 29 Oct 2025 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761748683;
	bh=QhPL8hejE0q/XjPwlAAC6C2v9MdVz3zIjfNyGj/b4b0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BA4/bsjc2y8B1vf5f8FNEPX7gsJoRA4LURxjYgVB8wUchy+gdIKlF6zqhT7TYLfHE
	 LpSsX/MDkrFgaQf4hAAyzFjPdZtPT3mixxUctHMnep5rCu8BfcbbfBdZ9FXkv+DEQ/
	 fX7wYkPKh5eLgPoXY8n6lx5G/JKUB+sWX/NYz25vVTzZHT0AS94811e9sryKvDuOTI
	 MWCCx0f5PdDLp+yfSkYkLxINH+S6y+rDiZmHqyEfXmk8jYkCrsUKOPc8tbEhQBEtW8
	 ZeFxP/X7Phfm1DtlhWzjM4JvjdvhWRmczEWrJtcYdguim8RK0vzHZ4r5CHVzZQ5Wvm
	 wY4sf2cxnPQkA==
Date: Wed, 29 Oct 2025 14:37:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: Use component driver suspend/resume
Message-ID: <84aabf5e-c782-4e40-8e34-c8e7101188fb@sirena.org.uk>
References: <20251029141134.2556926-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X8fGgO2kD9aDHiEd"
Content-Disposition: inline
In-Reply-To: <20251029141134.2556926-2-claudiu.beznea.uj@bp.renesas.com>
X-Cookie: Goes (Went) over like a lead balloon.


--X8fGgO2kD9aDHiEd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 04:11:33PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Since snd_soc_suspend() is invoked through snd_soc_pm_ops->suspend(),
> and snd_soc_pm_ops is associated with the soc_driver (defined in
> sound/soc/soc-core.c), and there is no parent-child relationship between
> the soc_driver and the DA7213 codec driver, the power management subsystem
> does not enforce a specific suspend/resume order between the DA7213 driver
> and the soc_driver.

Oh, also:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--X8fGgO2kD9aDHiEd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkCJsUACgkQJNaLcl1U
h9Dd3Af/dgxW29/PEY/oyrtoOrxdW35zvt16ej4c41BEgK9cwFAr02VTCNnUe6wr
8pko+KvtbnhrbZziuITYhn8u1Y7hW88fPjXkwehik5V71/B3YYHdwApbJcLMbdy9
ynrOb1Ni5H8za8VGr87TwG/W/U6SCzVCnvP4bIw8gRPrD4OALOykMHDkJVTMIuwS
7SX4Iub7bu9lZy+MSKUajPQ+1AlZp48xn0Em6HJJps34n80+gBBiXitDPS1KeUiW
Mi5csIv6AlTiH+Hl0qd2UkJDqpXZP60GM6u4Nv5NW42BFgp9qIDn+lxWDuY2rzCH
et+4+24it30bEgfM6AB8qw8mgdhPXA==
=w2Du
-----END PGP SIGNATURE-----

--X8fGgO2kD9aDHiEd--

