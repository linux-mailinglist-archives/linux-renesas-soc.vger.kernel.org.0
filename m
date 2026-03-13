Return-Path: <linux-renesas-soc+bounces-29377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKm6Fy9GtGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:15:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA47287F29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 809D6304B3BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A5C3CB2D1;
	Fri, 13 Mar 2026 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K5WsMc0v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814C3CA488
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421930; cv=none; b=GQ1nq8a8iLJU39iTSXalKKDjJNcWMJEsAPAny73lIOaBXESXd+UQuYPdUrIwa5cNThrh1gUU5Afqv+gyuwPtemqIkfsnuTi3o5c4JuV+QS5U/UVzr9g74Rm3AG4jLGtwqoIeATNkmS9nRodq+e4NXuBCuD0fRY3uJKMhR/Nnzg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421930; c=relaxed/simple;
	bh=O5iNi9gq2K/Xj6jBGUUooeQQxIc+FNKg/ElhWnnk/kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkXLcHep5e498hdTyDRS5G1q8kPSYNP4S4HyaxBycEBftqpj+RDsuO69laJjaKz4cxHOX0ClkMFPS3S5yCNkPj2B2CnGPFOr1QDwPVNBP7EUjUHlQVerAt/XJQPNA5QcsRwTupHse4eCi/7IGrpLvAIPschJTFmsHTfE9O1t/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K5WsMc0v; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RScD
	gpusaFCjKqFXN1DPhYO1G0PQt+fxfmMxwvNGDVY=; b=K5WsMc0vDQi/9494fNzL
	OS6ZEI42mq+htgxDwZ1qcs5bT5pN+DcMPQGqgg3AUI4CU525fLTNV7H8pmU4S7mc
	11RolFrLCA+nv+nPimxLX6PyXUXaz/m9F45tmDRAX+bgYrY1VtRUt/d/52NBPw1I
	7Ubqf2LZERmZto/kCd9ZqXL8eMalN7yjnWy/Bx2QPlYXyuP8h4U8DFbmBNVgIJnn
	o9a4NebkPQEiXeBhfPDhmIGoLg7Bzai9kH4dZXUhqUL0olnKN7GNMajSUDXlj1MX
	z1J6JiJcCflp3arqufTxkHbSpZXCxn1Z3R2tNZgbJVhaEoEwkibWOyMMfwpENMOo
	Qw==
Received: (qmail 388208 invoked from network); 13 Mar 2026 18:12:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2026 18:12:06 +0100
X-UD-Smtp-Session: l3s3148p1@dprw9+pMTLAujnuR
Date: Fri, 13 Mar 2026 18:12:05 +0100
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
Subject: Re: [PATCH v2 2/3] watchdog: rzn1: Use dev_err_probe()
Message-ID: <abRFZafNDwf_nG-J@ninjato>
References: <20260313092417.294356-1-herve.codina@bootlin.com>
 <20260313092417.294356-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PU7k8Px3u5FH65Nq"
Content-Disposition: inline
In-Reply-To: <20260313092417.294356-3-herve.codina@bootlin.com>
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-29377-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: CFA47287F29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--PU7k8Px3u5FH65Nq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 10:24:15AM +0100, Herve Codina (Schneider Electric)=
 wrote:
> In the probe() function the following pattern is present several times:
> 	if (err) {
> 		dev_err(dev, ...);
> 		return err;
> 	}
>=20
> Replace them by dev_err_probe() calls.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

I am a fan of such changes, though :)

>  	clk_rate =3D clk_get_rate(clk);
> -	if (!clk_rate) {
> -		dev_err(dev, "failed to get the clock rate\n");
> -		return -EINVAL;
> -	}
> +	if (!clk_rate)
> +		return dev_err_probe(dev, -EINVAL, "failed to get the clock\n");

Wrong error string, we handle "clock rate" here.

With that fixed:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--PU7k8Px3u5FH65Nq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm0RWUACgkQFA3kzBSg
KbaJKw//T4S2VjebxxFN6wbjjbI1R15Xx9PYH9hOVj48in0IzA2zNxOoiG3SOeKR
3jPmD414zXntvMeHluGRaEWBPXpIvPUtbI+q1C1BvEBBa2o/dwBXa1Ez+py6R7ui
irazyeOhMaG39mq+6looW1cQPfltNaXCaDr2TCmW/riYg3YDNlEaPsfVdVXCYotx
DZVnlWsMR5mw8WB0eUnonpPrv07fDPo//iZHa0bxzlR4PY2X7HW8vJKf5YxGMviE
8UCrQJD/LuEykphRxEtTh3CNs70IN1ZDLPMY9Jm/If+FbLHqVrDQktN2de3WTqFN
IDguAEBkwrPKWT48y2LKqT9LbtG7zzoifnQnMbDo+Tcof5hUX2Yyu+Tsgl2xgqSR
P9A9P5uKvzTcgINc+KN6shMUG81bFPBDyHO4AE0s5Ek6ZAVFm9Dh9mhCqHLNNoX/
2p6ELHaazHcWVyIjKhhj5HmdW5LI2cC3asK2C+JuF/aQyAJ5aJ9ZAhVEW6I3QnIx
uddDNlgCzaEew14lc6pe8/RUVHmvjNCIjPmE6OZGIPBg27T5ncMzr70r7xZJSbol
dQYW7QA7xB44ZE0SBHMgxX5IHGSr9rQKfT/upMTUeRFMkmDhq8kAONlmTR40fTgm
6PjW0DtwxRapDm66TuQ4HML3PEh0rf/sphIBjXp95W4xNs1V+0g=
=nc4T
-----END PGP SIGNATURE-----

--PU7k8Px3u5FH65Nq--

