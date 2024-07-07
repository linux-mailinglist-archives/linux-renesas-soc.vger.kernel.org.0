Return-Path: <linux-renesas-soc+bounces-7137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BCC9296B2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jul 2024 07:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D39BCB2211E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jul 2024 05:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A6579D2;
	Sun,  7 Jul 2024 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IPlYaaXA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD426FB8
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jul 2024 05:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720330885; cv=none; b=off6KST/XaQF/XYZV7JRXcNuDroxD1VWlEEu7bD0aIjIYY6X3Ts2El+BjQOrTXAk/OssSnr0ZgumndMFbnkjpkDyXa1dS+eCVuPkFRUIyB8C+UNfFgiEEVPvP2I1CdRkdhN03hOMZElzQg9EgdFDPgGom57czn7xmyh3VpFvhyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720330885; c=relaxed/simple;
	bh=54TshYdjTFTyT0bm//p325eJ7KyUzGZQ/yI61XlND3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQDDgMmYmLr2LyVnWnwlqCnaqZlZVvIIkkqCAKUZWfY0o6v/+nbwY0X5vbntm32Ri69J+0e8Z9NYFOjE2jv2gw4Yi4rZS5ds94AQ89oElZKnD5pwcC8bCdKaRXIDKMqR1+Q+HMkNZcNRii/Zxv0BDATW41jiktfBLcUScx7UdIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IPlYaaXA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Id5g
	KhGTHs9OJ43RUBWKvLyw6xg79PIts1vBUkV6i60=; b=IPlYaaXAWna59U4y+1jZ
	Z2SbWi3/wd64EkaXPb/PfeNE6HACwhWlOltgXV78dsbZrxxQFSdItx422EpFOi5n
	+dOu8Ma6/98xbBDTS8UTst3canFKMXvYHDNcD8J4hBdB+ELYA1zN6v+VXMiVz7xB
	wKjh/emkMBqIzBGjfvW1RWRKzmHnANHJ5nP2zJEPcfKDisp5aWIa7fQuHigkVYyD
	8tmCxGDfdQT21bEHbXv6tw+EgO/1k+UlF7vchP1KEdEIOZOcOOqHkpaf/QQ6euKA
	SV9AZ8wk5SDo1DNqVmtj5RotU8sn+hwgHMA4IIZ4GWK2cesq3uB+JQNX/fp6XXif
	Yw==
Received: (qmail 4010647 invoked from network); 7 Jul 2024 07:41:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2024 07:41:18 +0200
X-UD-Smtp-Session: l3s3148p1@N7zmvqEc3qxQT+F6
Date: Sun, 7 Jul 2024 07:41:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH v2 0/6] mfd: tmio: simplify header and move to
 platform_data
Message-ID: <Zooqfe1sJQsvltwj@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lee Jones <lee@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-sh@vger.kernel.org
References: <20240213220221.2380-8-wsa+renesas@sang-engineering.com>
 <170870160052.1698319.4712751560931025638.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fNHf+Thy2CjldTx0"
Content-Disposition: inline
In-Reply-To: <170870160052.1698319.4712751560931025638.b4-ty@kernel.org>


--fNHf+Thy2CjldTx0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 03:20:00PM +0000, Lee Jones wrote:
> On Tue, 13 Feb 2024 23:02:19 +0100, Wolfram Sang wrote:
> > Changes since v1:
> >=20
> > * rebased to rc4
> > * collected all needed acks (Thanks!)
> > * capitalized first letter in commit subject
> >=20
> > The MFD parts of the TMIO have been removed by Arnd, so that only the
> > SD/MMC related functionality is left. Remove the outdated remains in the
> > public header file and then move it to platform_data as the data is now
> > specific for the SD/MMC part.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/6] mfd: tmio: Remove obsolete platform_data
>       commit: 58d6d15662e4039fab7d786f0426843befa77ad4
> [2/6] mfd: tmio: Remove obsolete io accessors
>       commit: e927d7bac109d8ca1729dda47a8dbc220efdb50e
> [3/6] mmc: tmio/sdhi: Fix includes
>       commit: bed05c68aa8f078206143700cd37e42a0084155f
> [4/6] mfd: tmio: Update include files
>       commit: 3ef94c41db82573dc1e1dd6c259aec8ef6caaaf3
> [5/6] mfd: tmio: Sanitize comments
>       commit: 2d417dda59123b9523a19ce75fea3fd1056c3b4c
> [6/6] mfd: tmio: Move header to platform_data
>       commit: 858b29729c9d319b9cd1441646cc3af246d3c3f9

This series is not upstream yet?


--fNHf+Thy2CjldTx0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaKKnoACgkQFA3kzBSg
KbZIKw/+JIjCcXe3JYSrcOsZWdIj7JXJJLj4HILlSIJ9N8wZC3897IMZ7+aAHyze
115MselHsV3BfY4oyRfKJSXZQKkCYRE7jXkN03Ly398PHxhlpW52ej9jAOjHXH2s
hpWADUCc/Z7rlgMINAF+0yndCmLpEB7MkjFJswED7DFcwlMg+jg8hN7LE439wN1B
a+l5ZnNegAOtBwQPGXNAuYzG8alS4jSc1+HoSKwtLCFyKSTLT4ONDW8+QnAxNge0
6i7hoCiZtVp7N9rhpTtAv+lpA15Low9o+Msp9R0wWTKWLyFTBn7Ok/QbZT6Cz1c3
sVYvEVismu5HnB7if5tN6rtH3G83p5rusZyo6qLPptCevBNCJD4eGPAjM26UOhed
B4fZbCztyXg9npCZtZjzS1Ta4QMmQ79Bo14TQNfB5Z2C28gjijSOes7FrWO7V6nr
gDxwQOMPkyAmSCusyd19ftSd0aMWo8vr2f/AZV30j3IO0GM/jcWZCPtqLxIsIIJD
pG+xa8oLku3zfmgGMv1oIe7tXoXZSw2/+uD6yID38L/8cNVaBzYsCmqKUDswfiPy
6vKqjsCXnD87ATA6TM1H6ClJiwW5JqXtuZptIFvocpIdfwTkQEFjgH0IxsUNfvdN
1YDDp1Qlbe63FW5twOIJYQ1BrRqfsqmEnC0vEKdepokFQG5IIJM=
=sLOL
-----END PGP SIGNATURE-----

--fNHf+Thy2CjldTx0--

