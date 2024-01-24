Return-Path: <linux-renesas-soc+bounces-1777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D68583AA36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3ABD290626
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 12:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8647E77640;
	Wed, 24 Jan 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F0o8VC0M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632801AAD7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100374; cv=none; b=FkF0CosLHFNSV6TdZtYHLwctteqIXLNOLgAr3m5MBSpT6qbLLr/GqFg373D+i4i1PKZHlXnmg3sZTBsXqlhlNerOkJyKlKDvBO2hEiQGa/szOb+mSCxH7Yw291sq9UIvfpWeYuLm99v0mFZHPQX2nhAZ5jSuFaV1YKkHaKPcHaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100374; c=relaxed/simple;
	bh=3SeYlEZHZe+jbBAjPQflbtY7AfU1SBtIWkgmEOHw1Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWqnsmrplRdgLcv+HLI7mu86fdwvti3pZUZBInu9vGb8fl+ZLEIWBM00l3tiGJPVheb7Mh2WHkeAVfJvFWAKLEZ0ZviOlEJy7QCQmJdAdNbH3VJ32EwNg9uBeg0z2lT+E8qTkCcxWv+QD0s1Q8GoJqwTByITRBe1G6O52eTRkG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F0o8VC0M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71166C43390;
	Wed, 24 Jan 2024 12:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100373;
	bh=3SeYlEZHZe+jbBAjPQflbtY7AfU1SBtIWkgmEOHw1Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0o8VC0MotmCNVGlpvmTnFUAbksmDdoKiFq36mZ7XvjJtP7dCXFBkkAVXka7/0ODR
	 juCjcvOmBsJ3cgTaqY4jHh6nk+7ah+tI0wirg4bPrCs3hLwY7XgigCujZBXkA+8caU
	 3tRkGJHCLf1G79FUOhyqcjTbdSG0mPpgmC07SwAQxKoPMPj+Ke6bCPcRBClg7ZQsy5
	 CinwenO0aDULYFF/A9UegGoZb1ciZ33U/0gZUUQOCXN9qQVn/LnhULhPsyISfq9QBN
	 YJbF0Rdd4KbRxcQgeLJ34nkE2hAYcMkY40bvfXyoIniMbRtA95W2zMSaO00ZHuwWpY
	 gVfv+4lFebjBA==
Date: Wed, 24 Jan 2024 13:46:10 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 1/7] dt-bindings: soc: renesas: Document R-Car V4H
 White Hawk Single
Message-ID: <ZbEGkhdbaVMkJ3XQ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <d16b9cc3e8a6ee6f9ee95961671a2d27e585c0aa.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8kidDKnMivMVi0iW"
Content-Disposition: inline
In-Reply-To: <d16b9cc3e8a6ee6f9ee95961671a2d27e585c0aa.1702309604.git.geert+renesas@glider.be>


--8kidDKnMivMVi0iW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:01:16PM +0100, Geert Uytterhoeven wrote:
> Document the compatible values for the Renesas R-Car V4H ES2.0
> (R8A779G2) SoC and the Renesas White Hawk Single board.
> The former is an updated version of R-Car V4H (R8A779G0).
> The latter is a single-board integration of the Renesas White Hawk CPU
> and Breakout board stack.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> Or just drop the "-single" suffix?  The original board stack has a
> "-breakout" suffix.
> The DTBs are called r8a779g0-white-hawk.dtb vs.
> r8a779g2-white-hawk-single.dtb, and I think we better don't rename the
> former.

I agree with not renaming the former.

I also think that the "-single" suffix to the filename is the most
descriptive solution, both for the source as well as the binary.


--8kidDKnMivMVi0iW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxBo4ACgkQFA3kzBSg
Kbbqag//XgNe7UJCEkWayPkcNc3MV0SvQaXRHpnNHjdLIxhdKwF422biGIA3V0TN
8dR/Wu+okKMfaow3msvBK1nHJ89Dd20fIghXWsy9ukUWaRqdgca0GfoeoMKfIvuR
YzG0q12TSGIvyO7uRsRulwc5BRK56dp/ZqZ2EQR9GqIYAojJ+25EMfxGz8mJOTtM
vF5FGvyLu0w8zVwXSNJIQfoWiOLKf4rKLgmvZjl7cMlIsLlcZ0aCt3ZttUZDf+YO
C4AtmeDcAUkE7pbvXVBRh3nl6J+PIFBUi3o5EJR6lC6j/GZ6XhP9sJbmx/5CpONe
dGkUqEI/Vvwnb+roI6pEjXD9H9lP0AjZu6tDQYfV+AWwShAM4HhPWlw91sJArBrE
8EUMuZFMQ28g52TdjYy4TE9v6bknViUO81j21911sGFoQkWYfqPi2Z50fuwuPHpu
hznMn233SOp/QaTlm4rftsZ20XNOzhTZD12dmxJBpULFn9i+NZ93tV2nLFQ+BXgl
3n6JgeM+QAopSXaWQJXA+ItuJhemHQEFiRqtmNL9XmH7kxJodEu5JBWaN8bIu8Hf
gGblb3MplqCcy3pdBj/6HD/2wa194r//Wm+W1jt23rC1it7F44vunhGm6dL7RHWx
hvtDTKphNYMSupuZMWm4pvOSMOys4XCaBWfWkIvO8e7HPPY0KjI=
=WZBR
-----END PGP SIGNATURE-----

--8kidDKnMivMVi0iW--

