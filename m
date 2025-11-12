Return-Path: <linux-renesas-soc+bounces-24509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D258C538D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 18:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89FB04A69FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 16:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5691832D7DD;
	Wed, 12 Nov 2025 16:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z93yCI0s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7802D0C70;
	Wed, 12 Nov 2025 16:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762964713; cv=none; b=OdeFIsQVeiYKzAkLslHNjrqcV0skl/qbEnC30sFtj+PLN1aH4pzzhs6EGCjqmigXVSlZIKnrsiJsbrRNkw0yE1bJ8kXTDcKcEHNs6cF1IIoD78537Guesa0J0EmBBFlQh6K93z0+E/CebunaC7B1/GjlSTICURFJuFA3sIHhVwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762964713; c=relaxed/simple;
	bh=N8xhZxue10YjcYEBoo0KCggAScFHncM3ldLXXs/YMwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pj4PU4AA02DJHMBz3ftFbzzphywnOrAzA4ujFhtdB7zqSS9/oqVjlMZKllCvGYOCgeQR59WhpHsXZUO9qOHFx5KJP6g1GSyP/VlEewoxmXP/XJ0A6/nHFlSfLItwowb/LGQpYCekbZFOy7d6rX0lWCGGbZPkrxQhzNkGKvaYOU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z93yCI0s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91062C4CEF8;
	Wed, 12 Nov 2025 16:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762964712;
	bh=N8xhZxue10YjcYEBoo0KCggAScFHncM3ldLXXs/YMwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z93yCI0sbWVa37SE376sne5XAvBSALnUxsR7KAPmF3WsmH+LED9IrlvYc9LZ8ZoAd
	 XCCSROyo6mLPrG6fW99Er37KmixiJVOp/lho69Y0XA9pNIyzQ4DsszXnCxFX+JXc4Y
	 +Q64+nSXFx2g2B3JV3r2CX4HHw8jORPyatdQpm3FCAP6arXPQpPqMdjjf3fcEUlt/E
	 9FNNHde33Tq8SGPMvWqDg0PMWlihJRuoMjZU7rBuRyhat9RLlQO/J6jMSXxtO//tJf
	 1kRnZDtlqk0FHC7s5AB8vyIvfCHEB83hDCO3sIDzEPrhlfO1W3Ja8Z7N8AX72lPtQ8
	 rxDFBUUUO/CPw==
Date: Wed, 12 Nov 2025 16:25:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Biju <biju.das.au@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 0/7] RZ/G2L SSI Improvements
Message-ID: <a3981fee-762d-47b4-b37e-13fcd2d597b8@sirena.org.uk>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1jEHNJeDiaU7hHOe"
Content-Disposition: inline
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
X-Cookie: "The Computer made me do it."


--1jEHNJeDiaU7hHOe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 03:41:01PM +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The first patch in this series fixes audio channel swap issue because of
> half duplex to full duplex switching during the streaming that involves
> FIFO reset which drops the word leading to audio channel swap issue. The
> second patch fixes sample width value in the hw_params_cache::sample_width
> Apart from this, support 24 and 32 bit sample format width.

Copying in Morimoto-san given that it's Renesas stuff.

--1jEHNJeDiaU7hHOe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkUtOMACgkQJNaLcl1U
h9CgyAf9E5RHBgS4N10bny355TWCR7E45OP6U9ExM/C0+EsCNa4BVXI5VnMNU1w9
As5STTbvR5n8+tvifE0fgAaFxz4XvGn+7CzN6L++w6ck0gmkSVfMiBi0HeMWcbnf
JnlZn20ugi+T/Cy1DXtpvGj7MeEaNkG4p+3W/9EivCaivcqE/Gdcf7sIPdmr3kGm
2eDftCnLI6EV2srUaMCoU5V2eTUyRZMv0Ve9X2yhEHa+5ECe5zWDiGCsjZc1ItT+
qrtPOL31enCGGRNc1Jj7M7ytv9UDghC8BU6InvnsRPA0w/tXUvZY165gKM5F4JFw
5PGvYtmSPXU+1S5IukjigRKT6TiABw==
=G8VW
-----END PGP SIGNATURE-----

--1jEHNJeDiaU7hHOe--

