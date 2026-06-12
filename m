Return-Path: <linux-renesas-soc+bounces-33963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4iLVCmhTLGq4PQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:43:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D4E67BD28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:43:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=Oz6Gy0lm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BBD43012210
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCF039A808;
	Fri, 12 Jun 2026 18:43:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAE2374E66
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:43:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289829; cv=none; b=Oe5Hj4aQLrth/ArYlrcIiZOCEceX8G1H/uSr0K0FIfMAjZCaP2tIXYJ+yi8yvmMqr3YMfGmqjqmFCCffYq6BHuihayocGE00rsCtyXn36nXC3HbtCyRHlNkLPfDiYseP7ba1V8xDHcNh6Y3NDO/OooVeKSv6iKyKbJq5qMaUp0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289829; c=relaxed/simple;
	bh=drWrjKpNmIFO578r6bWhQJiJmTCkzPmWIec9MrBirA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYtAdRzkuflo5qaWYV4C/d1yNG79xrtECYIYUdp9ZWIUvJFgw5Csm3i3dGjI2VTMQSWhfddmVOodxN41xN8YqHOtQ3kxz3zLseh2LoQp8NWCg6gcK+/KZtlFN/UcEIyMR4vpPSdGLqxK/ONI7ZK078xoGn6Njk8htpAr7iKMsu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Oz6Gy0lm; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=drWr
	jKpNmIFO578r6bWhQJiJmTCkzPmWIec9MrBirA0=; b=Oz6Gy0lm+jVipXTwmCro
	97J2FoOBYTlLlsXnmVgpglhRt+fgTledKqpHxxweK/Lyj/OfcG3hE26AXKrGwSpd
	iHPb3+JvwRR88eRA8+ll2J5YKMukqyw0Eon7YT+zxrxsA7rwim9tHH1ISXThoGbM
	5zsX7XaN3BhrSv6zylKKm2FU9neCsysC5OkAlC9EO4BgZR0qFOpTj2b5YJSD6zHu
	AKHMdgYUsgbon9/StM6jGX3v1dSq6raOt4UM67wgjfO+ICitT81Hc6lSlcoQRAbl
	gKyI8uvh6b8FD79OD2JH4yn2Cb8K/hfG/nrubQ/YTgvFYdZEvnffN6Ju5dd177+e
	+w==
Received: (qmail 2624521 invoked from network); 12 Jun 2026 20:43:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2026 20:43:45 +0200
X-UD-Smtp-Session: l3s3148p1@mSxL2xJUTJIujnsK
Date: Fri, 12 Jun 2026 20:43:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: renesas: r9a06g032: Describe SPI
 controllers
Message-ID: <aixTYRm1Sr7V-9Fd@ninjato>
References: <20260612080354.57459-4-wsa+renesas@sang-engineering.com>
 <20260612080354.57459-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdW6tup=MKtoJBjU1u-3QW+S4zAwrKKngMNy9bqVkgpTFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c6INizHkdFroQwld"
Content-Disposition: inline
In-Reply-To: <CAMuHMdW6tup=MKtoJBjU1u-3QW+S4zAwrKKngMNy9bqVkgpTFg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:linux-renesas-soc@vger.kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-33963-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ninjato:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0D4E67BD28


--c6INizHkdFroQwld
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> However, spi-max-frequency also depends on the target device(s),
> and on board wiring, so typically it is overridden or set in board DTS.

I'll drop them all!

Everything else is accepted, too, and already fixed. Also put "disabled"
last now.


--c6INizHkdFroQwld
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmosU2EACgkQFA3kzBSg
KbYE7RAAtXsM/izG7A+2Uc3yHm5KMyN4HAGHWJWFMMJnG+61rSnZ4sJUd8CnwKsl
PVbslP9ePXkwJNfJWGDA5Vrgtk0Eisp5VuHbkl9b6uMCkZCrSrftWFO9R5riofiV
bdt7zzoz1178rVuru1ZBR/oBDsSAO8v0CcvlzcxDcflqUAAO/cLPH0nh8vdiyx0K
Oy7YYd6kADtowLXVnrSX3NRcoexDsgNLbTIpCvc9/t15FLfGpLl/SL529K85bbMa
Tco+X1TY+u7Y9vkeu4VVqPt9cRiclKjOg5YvU4IprdELOaAf4T3JQAcz3OJMH+hO
rBVNPNOFHqMP6lQVUFBFNrj2KvRg0xv6gfaqOvf0wrkdrAUvojpHdTykvnCshA4s
G5eCOrDUWGsHAm4ShaTvjjb1RixajNVvN/oIZ9U4IhPKdvnhRFGU5LbcrbJD/fwC
TNjkligk8r3d0qZzElMAR6ouVI3e7G11FoPNokd3yS7kxHWR4Gx7kHIw17yJM1pG
hA0Uc9fqjDTtk9Um6a+r5ohagHcKElRJIShipLc0NNOcYogQqyXNQBzVyHVFjBsm
Z6knbnvJyoo9NxiY52WeFuI7+v5QrzjAd3dqDzShrpXza7oUfOEnfBEvhZ4Mr4HQ
L363m/PyR8hZA0PuwvvaXTLLT888PZJkSTWGSO43lhHdPktiQYg=
=eNwF
-----END PGP SIGNATURE-----

--c6INizHkdFroQwld--

