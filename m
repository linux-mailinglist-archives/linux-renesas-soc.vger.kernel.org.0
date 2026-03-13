Return-Path: <linux-renesas-soc+bounces-29376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM4UOhxGtGl2kgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:15:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B25D287F18
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BAF7307EDCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4835B3C65E0;
	Fri, 13 Mar 2026 17:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Kfukbwqp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A44F35BDA8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 17:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421799; cv=none; b=X2e0Pk4gOFOIaThkglGmN6DQSOXxr6BDQeLCxe9k7NCgrVYOKp4XZSK5OkGcEp+d0ZRcoq2y8iLYSPAseZnSXxNDgzTXmtlzU4uuTBDyIlou4Yr13K/+Vy4+7mfPcKX9U1o/BO8/PQ4gz3zpUGYTbxXXavnt12ku3MXvkZRXVNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421799; c=relaxed/simple;
	bh=zgKdsEGdjdvUuCuj3NXoEiAo/0AGLqUvRArM22toq5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xus5rdDPoz/F8SlSdhxKt74Rx55KYobaUYsE6Cxj0+EdMnjDr1h524nXh5ZUEOqabt0EsfHo0kl6sLL8Ap6advg+TdUpBwnthAxsGV9961IQHLX2C2HiNH+Ol4OM14Uc89DCiy0mbNTfAmXkAJN7bX/EHmEDWpcOWs77g4fOOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Kfukbwqp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zgKd
	sEGdjdvUuCuj3NXoEiAo/0AGLqUvRArM22toq5c=; b=KfukbwqpzJhNoAxRs1CM
	usGPS8xUhNq/i0LNijPkJ5tsnRW7JS2r3Muh8oAaRnPmruMbo8YpjJFshAyVw2kx
	WDaWXlJOIfmzuxlVfkm8fSAvB1WhxWGkLbAo/1u6HL3ChLY8r05hn+pi7lI161Bc
	gWkApd5TCAHJvuNH5vqmcTne0hCuOzOP5aF4eLupZ4PHQhJT4n1chU9DO6e6cN47
	qBilPS2nJ6DrmfGnxuoVVz7FfgMe/3iX1Zl60ClRU1poS9oes8WWpZHJkUttgh0x
	m997CSXkdCfe+NKFUQMjh46Siln+qUPgab6Fr9zd8qbJpkw4SRpN5ucj0Oq/o6M9
	1A==
Received: (qmail 387518 invoked from network); 13 Mar 2026 18:09:46 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2026 18:09:46 +0100
X-UD-Smtp-Session: l3s3148p1@yLGd7+pMtJ0ujnuR
Date: Fri, 13 Mar 2026 18:09:46 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/3] watchdog: rzn1: Fix reverse xmas tree declaration
Message-ID: <abRE2v-raiGhGuQ2@ninjato>
References: <20260313092417.294356-1-herve.codina@bootlin.com>
 <20260313092417.294356-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uqZG+egNaPCPpGfS"
Content-Disposition: inline
In-Reply-To: <20260313092417.294356-2-herve.codina@bootlin.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-29376-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 4B25D287F18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--uqZG+egNaPCPpGfS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:24:14AM +0100, Herve Codina (Schneider Electric)=
 wrote:
> Variables declared in probe() don't follow the reverse xmas
> tree convention.
>=20
> Fix the declaration in order to follow the convention.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Not a fan of such changes. But it works and I am not opposing it:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--uqZG+egNaPCPpGfS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm0RNYACgkQFA3kzBSg
KbYikw//cv3cIz0tCzQsRnSS2RRZIjN+OyIBjFzKFjBdxShhG41SWNZ5/pwN/7Ah
u7VMLIP9b30N8Ec9yGOdyKReEGCe2rW4ESf6Mp7ePdIoi++RnBsNZ0EjXVy04wcG
vktacTR9K/N3NowEjlfnPdY6e1hap6gPDIhTTYWSWacmlsLcRe/LzpwFJV9RujYz
kPwv7XAZ9E+citlLfC+JndMqQ6JS6IpDnEU7bjrfsq58xkSHzLQc7PkEuWJuH847
Vg2NPYDwMnQOV3USX9aLyOX4yYhXHI0SynmuEKc8x4YCxh+z942ozaJfXmuqwVD4
X5Ib158VRwOjw6iZXuYQsi746OXfMiiTtm7qszC5NbQ41nBIkl59zWlkNlvIfPUk
jxyopg/rDEVvUPJWSQIN3DEaYeW6IO291x8IEaYjGO/CUMEkpfhGuGjTJeoY0wNL
eH2wFC+y9LdgQBa3e+Y3SXgmJJ3bnu6jdjySuRDfCNsFUuxzgSbMruM/wkT8c2ZT
plj/1rTGcyGRdxR9wx3B9BdxD0GOtQ9RNaKe7YH34nUKkoj54aSN1Gw5wBygvxIB
gtwbxXziF0+FIkPuWfQq9wzrphLyy0fUKO8xo5rR8R8ZAt/oQiFr3RV34tZbwXSS
OZIf11GV9SFhpHZELwOPc8ZL1lv4FOXztxoXlzHzpdEuaeNKFZ4=
=j4b3
-----END PGP SIGNATURE-----

--uqZG+egNaPCPpGfS--

