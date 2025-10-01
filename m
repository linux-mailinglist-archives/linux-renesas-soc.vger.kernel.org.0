Return-Path: <linux-renesas-soc+bounces-22533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8EBB16EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 20:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB633A6559
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 18:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4202C21F6;
	Wed,  1 Oct 2025 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mIt+xzPG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36E2877F0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759341716; cv=none; b=earbqdXY9riSAgfIfo1flH/msCnVt7tbKlhz2VSdigPz8SpNFtM27ubU3Ks3mhxKo4pi02uT+Dd2pH0/X6NP4OGghxW95AVega5UhWENuPbj2kG1kvQ7DAG/bnkDVydy031/VpWrcwbDM9XXC8YizzQ8DDgxpZ7wTr5mu0wF4kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759341716; c=relaxed/simple;
	bh=CkoxustQha8gB3CAG4ulLm5LyLkhvHzrc7Naaczg6oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cA/AX5Yu2ZwlffgAzLF6UhBT6Dsh5qRjE4aHdAOBw73Jk1WFkjyfDpXvfJXQr0ee26Ium7lLgfZfqI7PQyqHXqzV+s6YV9FHISwi9h43bV+rc+WbCBun0jGTr+/gzUmD+g5mdZhc8ZbEGrl7Ldk3t2J5cLdFb+c2A0/9IdOUv8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mIt+xzPG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2asP
	vILeCGfye4mdxDzVLrm2kMUNWayQqWZffa8Jcgs=; b=mIt+xzPGytpox3ozodR+
	FLIM7WJAy1jm9JUlkZEcm7t4A741t52/EH49y++Y4Ls/DWcnwcSwXfD+zzr4p6l8
	DAjPEnxh+HYWOsdywCN72m3FRr78GYyOnEeFoXWwUH54HJpad5nPVG0xwC2ghm9P
	6TvLCnDmK/y9x1yN2i8do7NfcJBnJifanIZPZAZf2BTI6uwpwb/PmrBvyDjhZaG1
	49/vmUF/Jl6jeepINUCQIitHSuCGuNkund9Upfi84H2WlrBucoV+lZjU+hJlBq9/
	uGZEAOacd1hvHDsXKqZgOtJWcGvrdBS1zUR64vy3NxPc37IJz7Jp5N6yuFhQTS7o
	pg==
Received: (qmail 4142349 invoked from network); 1 Oct 2025 20:01:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2025 20:01:50 +0200
X-UD-Smtp-Session: l3s3148p1@b0KnqRxAvOG57tt0
Date: Wed, 1 Oct 2025 20:01:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: dlg,da9063: allow
 'interrupts-extended' property
Message-ID: <aN1sjfECC8vVWngL@shikoro>
References: <20250929072306.5634-2-wsa+renesas@sang-engineering.com>
 <20251001125149.GA1122744-robh@kernel.org>
 <CAL_Jsq+Rnmv26tjOednFuQkLf0hwfMU1xihLT+D6aym0SigNng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0kc0UKdHR1SNC6k/"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+Rnmv26tjOednFuQkLf0hwfMU1xihLT+D6aym0SigNng@mail.gmail.com>


--0kc0UKdHR1SNC6k/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

> Now fixed in 'main' branch. There's a handful of other cases fixed

Confirmed. Thank you a lot for this!

Did you already clean up the reference I got this from
(mfd/samsung,s2mps11.yaml) or shall I?

All the best,

   Wolfram


--0kc0UKdHR1SNC6k/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjdbIkACgkQFA3kzBSg
KbZTlhAAlVuCmvA6ZUu3tfWvWzj52rhKUJHuTwd4jCVlgjNkQLqci84An76HnJ/O
dvqBQhP/ZHEDWsr9FRM5wRWnbxpY2zWpXfyKwkt76qnmdj3BbIjW4M9wbpDRow7i
nBomlVuhu43GphvKgkVaATITH2AwD4O4qQMkXVEOnEmA0D42Ibeh3vhl8LmWz84u
Pbp6Jp+uXHLSEbmijvXd7AvVupSNXKl/3B0XGu8ARdM4cpaeNIqjlZhmhddf1Vrc
6nUC68xZJQPNJMK1KWd1tnv1S4oUMn2OdPrDlsLcju/aTeyPJP0KE4vtv1ERTy/g
BRRGdYaczRdJP25yruMhuiLxRjiFO8v6FXELt4r8ZZsnUKYq59LhSzbuKDv1xFR7
abHJKpmiNIjP2G0yXolELuj5xP0jQOzTI7SZMspP8VZw96WgR5CvO1xVlZbI2VLB
5XXORFRE8mgzuDcm/YcG18r9PBVVtYMrzJSBmyBYzbv5cRynIpSwZ5hxK+jnYlPH
WWj0S6sFwBobDrWjwPJ2ZExB8c+xKfnFGY8Htff/zbg35IGMSHgXU0nRNKw4kuJP
xciN4M0YrLNAyYIx+tA7o3FctA98wkmD5LbcXoyhYkpY/Z/uZ8psDDoNJ6RXjWK9
UGEd/ZX0kJt//vhOnp8Wg7iOpjyJhvRKrjJnbX+9mXy7Px6SiE0=
=STTK
-----END PGP SIGNATURE-----

--0kc0UKdHR1SNC6k/--

