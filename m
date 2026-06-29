Return-Path: <linux-renesas-soc+bounces-34531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HY24A56eQmob+wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 18:34:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B16DD61C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 18:34:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=St7LK6yF;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 62F83300D552
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 16:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C482041B357;
	Mon, 29 Jun 2026 16:33:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB133EF64F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 16:33:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782750787; cv=none; b=BAAxWfc23Z1P3MJIYletnzMxgq9GOL0QA7tjbXVcnMlSguqnhPrb5r29EaKWUmPF0i1vIw474aKYZiSKW73+0j8aqDxjPZM2VVHiYTg718oniIEX2c1rLf/em28v19Wp7+GvL12R1L1J6xQ1s4T3d10p7DJre6w8776dza3HEqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782750787; c=relaxed/simple;
	bh=8rP3x0htxY/A0MfSa61V9+zBK94rm82LmijUT5jUvSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDomcrNgLfq9bK4j2aPf0F+600agzBhigeSQK7kPNqeA+syZrJJ7/3/T4DsvksRDJNLbb9EYGLyISBYeKaC8OtG0XIb4qdT8rTL6l/g0EArMmtd52z5qtVioPPRRAEUysuIkTACfuxgDMSDAQQa8vFYyODPOwh51hwKjdkacQ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=St7LK6yF; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8rP3
	x0htxY/A0MfSa61V9+zBK94rm82LmijUT5jUvSc=; b=St7LK6yFLuXpJvomQZLm
	38BoK400HaRsNhlZ97DMK/TtyiQu2L835cmDEt08Tsn/FSLa6z6CN4vvmGj8vznZ
	mc8rjGXE5yUikZd6N/JVSfoTEN0sosoKe63/IINxfZCPdoJ7a0TF6Cm8V7cmymmg
	0kDXIRC3a4d5IwI4k0giLoxOShv3jlrXLx8UvUYym8WA3siXiIf+0JSBJWQlBhDm
	rNJW7jcKnqGIDlzJ4RJAnTo872ykxh450YQ+1DQEizfLssPd7m1tQPJMp9aX3Q93
	3M9dUPV1GCXxPW1tSxEidIVhDKoqywAct+As9pDcygvzP3THCFNbCDOW93WQwC2i
	Kg==
Received: (qmail 454313 invoked from network); 29 Jun 2026 18:33:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 18:33:04 +0200
X-UD-Smtp-Session: l3s3148p1@8IQyA2dVjpYujntC
Date: Mon, 29 Jun 2026 18:33:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Message-ID: <akKeP6CL7vHDImQY@shikoro>
References: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OxiOyS8ryrau5BCe"
Content-Disposition: inline
In-Reply-To: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:cosmin-gabriel.tanislav.xa@renesas.com,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34531-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16B16DD61C


--OxiOyS8ryrau5BCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 12:02:29AM +0800, Felix Gu wrote:
> wait_event_interruptible_timeout() can return a negative error code when
> interrupted by a signal. The original code treated all non-zero return
> values as success, which would incorrectly synchronize DMA channels and
> return 0 instead of propagating the interruption error.
>=20
> Fixes: fa08b566860b ("spi: rzv2h-rspi: add support for DMA mode")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--OxiOyS8ryrau5BCe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpCnj8ACgkQFA3kzBSg
KbYaMw//fASLo7A5pAiwRLSXSDlxJJTDQf5Pi3WbH1TW72LzOS4fxyz62MAQr9jl
Ums21KAjzfAi3otkfOip0yb3hdsP4sIXp8ANR1DAro+eWC6c7LnHe2biETH9P/Df
d3PzPjILpSQ2LuwrEkHR6OqKjhxC7SV/Xagb9Jy/uwSmvVrpN5e8BHLI/GlVSkcL
RrLL/qTstErQcif7BCnkFpxArXrpU5CR4m1n93c0o4LsPtXk9dH+aQvuqQnFUeyk
Z4mhz0VaLTww26Ll39z5EtWo/wZKNNGU9+XnMLgJW0RyDDDRKGKyvwKc8O2FqZj2
nrKTqTFzvzDD9i9tp8/Hxgq/mT2YkFPwuDKfbwXfwO6mr7jBnIhMydxG+u1iCHZZ
p/HorwyXEC5v7hAJBQUV0h7ipji2AHGTg26R+N8ejcWPO/Xq1KV0HUxKzCyIiNY/
YfVKRaaiRwQhACy4wEQCNI2SYjMVB7cCWTIt6tzuDBdTtXpJAenJiJ+kaU6kb/E+
d6NEvdW/noX+LjtrnfmPjhZvcE5s6/2142T6FoTVyAkhHzbeF87bjVVNxI1AJEAX
dwb3zF4FDIaFJGfG84Z9XfrGhQes5g6eKZ63dCa/DzB+adLm3Hhqh+dIcOpmvl5t
rff5b1waIospX8zwvfX2EllQbKCuHsPKaH1bxNzVDvyBCr/27qE=
=4qyM
-----END PGP SIGNATURE-----

--OxiOyS8ryrau5BCe--

