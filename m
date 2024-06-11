Return-Path: <linux-renesas-soc+bounces-6044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF05E90391F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 12:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781D91F227D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 10:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49FD7407C;
	Tue, 11 Jun 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMEUW3OY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5514F9E4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 10:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102595; cv=none; b=K5PqGDGZhMpjAllL41EVlopG4bbt65iK+vJnTSI9+CsaFU0t5PPnjGfPMW1XtFJ7BKRz4mw5YRzCklaxNPeAMr1e4m+rd8IDMzUco5MUl+YgoHsBBy6hCg/QVySALXqSEOPRLEp94F3b4mV0OyuLk0ptkyJuZo9fkq//76ZKcXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102595; c=relaxed/simple;
	bh=D3Dz/U9pkkQs/CRoZDoFtsKr/f/W6wH0o/YqEfA6vyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8+HYHnaetymMYGQOZ9iH8N6acZF01vbWc1wfj4qO3bHx1Q2FpLy4akmPmXftKJGWw5XVX83NysiiTMU9mjaFVQX1J8ZVAzZPcs2G1m4Ie3NDNJSMfo2ZPK72TVjMKeRODz/k3eFuXa6oOf5vDdFaZHK9lEdk4vRU/cz4aARzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMEUW3OY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC96C2BD10;
	Tue, 11 Jun 2024 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718102595;
	bh=D3Dz/U9pkkQs/CRoZDoFtsKr/f/W6wH0o/YqEfA6vyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMEUW3OYiCa8zAJ7A9aUn3ndjM1qn7itmdBm7sYh/4Ik9s5Ll4BeT5Rv9mP+gAEjG
	 qvyhOqwConzflNyy0iNGuI93G7tp+VcBEg8ziHJHPYOdnHjBtce4i984HyIIK+hAQS
	 JPCi6CWDkU0x8QqKwdETLhtWs0VNospz9qjKdT+fxxmQ0rTEu3Eq18tsFPylkhrZOU
	 rsi5SWRV3RfIwAv/uCViHA4GIOB68b+pgzF0whuKzP8ZDNuKCQIf8cTqTCIol74cAi
	 vyvhsNja5oMgpCZ1F8JcOj1HkiSlvfLUFU4y/eWjEYeF7PWhiudY2rhnN55Po7QnKx
	 MX5Jd0+0GPBxQ==
Date: Tue, 11 Jun 2024 11:43:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Tuomas Tynkkynen <ttynkkynen@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] regulator: core: Fix modpost error
 "regulator_get_regmap" undefined
Message-ID: <ZmgqQJpKbrYVo9k_@finisterre.sirena.org.uk>
References: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
 <Zmd1arKQ1bCRKAl8@finisterre.sirena.org.uk>
 <TY3PR01MB11346CF22E95F31D3226C28D686C72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qHwp8pkJPJBmhd5I"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346CF22E95F31D3226C28D686C72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Cookie: Your love life will be... interesting.


--qHwp8pkJPJBmhd5I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 07:16:04AM +0000, Biju Das wrote:

> > This is fixing the user, not the initial commit...

> The user(clk/tegra/clk-dfll.c) may have builtin driver and
> did not face this issue. So fixes tag not relevant to that user as well.

If you're seeing errors there must be some user?

> Will drop the fixes tag?? If we build clk-dfll as a module we will hit the issue.
> But looks like this driver must be a builtin driver.

So that's what the fixes tag should have pointed at.  It's fine, don't
worry about respinning.

--qHwp8pkJPJBmhd5I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZoKj8ACgkQJNaLcl1U
h9Bgjwf7BHAAbHzg0Mnc0rakzX/S9IC5aM2tfe8sd/dlfF6zohVLuydnldQ0YcaA
wkcu3CrEX991MpXx+odLg2CXs0aJFjTRy3DWzSG/wKekthfCRUVlhtQKKN6o3OX7
VbkQkWuEZt8qUWdHXzfjJRwfZjXH8+0uI4uz/F/CCe9CLTQWd0iEKLU9NPc7Gned
KzQBwfIo4e5PEn0okHssVYR4z5uhfkf+gJ82YYs7t013Fi643yOv9JTY6YxGAocb
Zi/xkdnxV6PtS+Gbwt2oRnnzLLdQ+Nmy5nkuoqjGsf6lSnhAGcOwdfi3grRVgQ05
nSuVYgwdGIAQ18FWkJpXx7vBLFGKew==
=4DcF
-----END PGP SIGNATURE-----

--qHwp8pkJPJBmhd5I--

