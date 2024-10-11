Return-Path: <linux-renesas-soc+bounces-9686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44599A554
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 15:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69DB6B220F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 13:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733FD213EC9;
	Fri, 11 Oct 2024 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lr1REumd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3D8F5E;
	Fri, 11 Oct 2024 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728654368; cv=none; b=tpnPvN3UJVla2HZvqBY744XPyFiPyMG2UeMX9XCqR9bsnt+WwLxgkVInyzcQEv25TuxaO97f5+4v0+94NqrRf51nw6mLewJdj5ZyIu564Z34zxBfXWsySUxA0IyqGZ9wmCx/BFoh8rYInsprvVhr7LjShJh6ecIsXQdYoeE/Y2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728654368; c=relaxed/simple;
	bh=PeA1DuQ281RfQFh8p/Deg3cigg0H0QZuJUgspSGFUKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIa7p5Vob/tMQbFw7Byv03qrS3cx2X3Ys7bBw2502kv2b8ZXdT/xQzmBouwN8zA9quBcHGR8Hk3/hMTD1LGDIUQ5EX/bL0FbnmwyTLuJQXbr8Xt8lbhVxZkpXx7MS1weFnF+WbgkhfdMhGIFpj3ZweN9D89ikK4Vs3EXMkby1AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lr1REumd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A99C4CEC3;
	Fri, 11 Oct 2024 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728654368;
	bh=PeA1DuQ281RfQFh8p/Deg3cigg0H0QZuJUgspSGFUKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lr1REumdrFqPaHpLeuY8eDnsYmNdHm/9GM7V3eC1PjV7wVT/O6R1orxwtsKRjAJMs
	 ovcbY0omJNLwyFDX6H4mIQlKO21792cHT6hdmbCF2CO77e6CiZcZbjQMYVeaVBLenA
	 JUNThxSzLIS9astCWhI0LrVa/5Yr+b/9AMKrgDxkdQKYs6g5KsVFPZ9pd7y+ZbYAU9
	 wvsKzwXAYIUqxXoSfKUImqHcziHt+fhcgAdDRZsUbAD6jV87UghXlgEm2M7fswbH+n
	 Wolcdguki8/6V3zx75WTrCYZ+qCsyJPJiiBi8zebCaVBbIDsQPdBBMdFrP2rkne3Zo
	 sWu1oZ6vR2iRw==
Date: Fri, 11 Oct 2024 14:46:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
Message-ID: <ZwksHY1OWGPhYm0Y@finisterre.sirena.org.uk>
References: <20241011131040.1059130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CjnFq6uRnj8HW9tS"
Content-Disposition: inline
In-Reply-To: <20241011131040.1059130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Editing is a rewording activity.


--CjnFq6uRnj8HW9tS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 11, 2024 at 02:10:40PM +0100, Prabhakar wrote:

> v1->v2
> - Added a helper function rsnd_pick_endpoint_node_for_ports()
> - Updated commit message
> - Dropped ACK from Morimoto-san

v1 was already applied, can you please send an incremental patch
instead?

--CjnFq6uRnj8HW9tS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcJLBwACgkQJNaLcl1U
h9Cfzwf/SpyphgqVV7pFUy9Zj6JSl/QwAu+LGHFXW5vAnaOos3QQqYU2CsGhhD6B
5frE9hj0o3VDObghDWfrWo0qUOjhgwiS1ikzNfV9ysv1DDNDhXFRPQL4cAZj2k98
LU7zSwVS/sClkcn/6cNR57iuMCRn7uGTZW4jOniBKM3i0K4zsUbBlnf3DMz4k3SG
n0UmdQd5/k6i+PqYxWsWdzafbPwl0drw5C+qxvowFA8t6tRIrTLVXxEx+XpPUJIE
u68E/sGlvBlLMKN4uJThHTjZX3rmBhd6l8UhBNXVY4qVhSItg38s1rAMZgcQf/uM
tYiN/acn35VUS5AGPt0qCQNR0cpcow==
=q4NE
-----END PGP SIGNATURE-----

--CjnFq6uRnj8HW9tS--

