Return-Path: <linux-renesas-soc+bounces-9969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC799AB601
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 20:34:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEAC91F23716
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 18:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7941C9B82;
	Tue, 22 Oct 2024 18:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qXtviMvC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D73B17C98;
	Tue, 22 Oct 2024 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729622044; cv=none; b=fEYGbDishphSrLF3JkJuLQEiBlVF4Ccb6mKdI4S5WfXKTuHcRe1s/+xJRmLRUP9IzorZq2Tn0s8x3skEhpXfNv0vK2FLM9JY7FAsD5iieCosbEpE/uRP1u7vALKHj5hYyHuRvRtq+Ozwdkx6pWVDcAtciYrWHaoOjCIYUgG93Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729622044; c=relaxed/simple;
	bh=jymZ8mZZBmUiMRuUIT5vaWlFr6Yop4ipakjRyd+PLIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GqDx51N337ooNcJl6bwrX+gTDbPcECaPZ7gj10CGPlQnnKtXAWzc7hz/4h2dVudlcexnMYX0g0PfgCmVZ9ugnHJ8IP/Gjebd7fL38dSjLmEPAa8qKkEQ/v7kGKivlRJJKFZHqcdAYH6uzAYv5df9w1qcEaulRgawr0/yYPTtnnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qXtviMvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3239FC4CEC3;
	Tue, 22 Oct 2024 18:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729622043;
	bh=jymZ8mZZBmUiMRuUIT5vaWlFr6Yop4ipakjRyd+PLIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qXtviMvCFaT5/PChSo+3WepnYzsjRVrl6YTyDFGgVE+NvLw1MAmWFoURDuedLjvyp
	 N9/V/UVV9nqfUK/cAB+Rp9wO3wHumbcWKC1i71oVqvcs8jam8cp5GdzMI86EuVvL8X
	 UKGs4Rp0RdR3cOYnzFcV0WuGS1yFky0SIC5y5oAajwrWArcyLfRiFoEjVS9jCfkNrx
	 6sQ7TqY1QQYr90TL6upCfo+1TeMd8kx7K3O0LYShctpBhWkNaQ/HyiXocqXVUOTn7z
	 U1pXFzkbMNYzbdgWt2nf92bfuQNwDAp44fG0uHs9f1gjiNxcT2iyLcpHRKigzFqE6S
	 Lz3pkp2gqwmIA==
Date: Tue, 22 Oct 2024 19:33:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
Message-ID: <95acabb5-38c4-4c4e-93de-36d5e51a43d4@sirena.org.uk>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyxPpZV1wbMIWijA"
Content-Disposition: inline
In-Reply-To: <20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Surprise due today.  Also the rent.


--RyxPpZV1wbMIWijA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 09:13:49PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. This
> entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers, including
> the device tree bindings.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)

Morimoto-san, are you OK with this?  You acked the other changes in the
series but not this one and since you're the one being volunteered as
maintainer it seems best to confirm!

--RyxPpZV1wbMIWijA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcX8BUACgkQJNaLcl1U
h9DzuQf/Tqh1sDCW6fpA6sNF/GKbknWi9w3YFhxWPFsFgEfa1qP4ZGmZdqtEwAla
J0dwFlFx3l2FWPepg7dnGoVggARHjjLgzhjInRdSevKY0DBbSXScxH1YldI/oOEv
dQmYJx6CsqUgcllEdHDT7wnX4OaDGb+beQMm+/XYdaQxFxMBvghRSVS8MrToKtCN
hTYXm7DSMHiAOeK0qjBZQioB/G0PKA/yvGoCPnsZ5jfg4smI2osdOiIs2MKxe1TY
40+FeNOtH73h9x2oYj6JzJ6glc83QsovL4FyTtXZNtPwFGB1C5jtqGWqGLoNhvAG
UYpb31d7AuDYbqGayc/G99Kb4PNEPQ==
=ddFG
-----END PGP SIGNATURE-----

--RyxPpZV1wbMIWijA--

