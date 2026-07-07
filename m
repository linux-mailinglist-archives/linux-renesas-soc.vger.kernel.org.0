Return-Path: <linux-renesas-soc+bounces-34835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQm/H7ZzTWod0QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 23:46:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5771FD57
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 23:46:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BcUG9cFU;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD04C3017501
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 21:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5FE47F2FB;
	Tue,  7 Jul 2026 21:46:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BD47ECF3;
	Tue,  7 Jul 2026 21:46:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460786; cv=none; b=UoKWtJvFlB1Yqlvl7Ni68ejN+c4ivIuLHQYK8MmR+bgbjK2F4tRpjhaN26GQ4WtULZiCD0g9vTHktwrcQyVn2xSLgjI7Rubg/M92tEbTpPqEKw3qVYrPFUIh3HOTth4wC/rpeVS5TDxOH7DoKPnFLfBjJ1MlGrRuk0hS2txZLCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460786; c=relaxed/simple;
	bh=sTAF8Uo74CwK6oOKZp6DOLh3+pYXXmBJ3wbYtR3+424=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m63k/QBhsSeNRBLcWm8uUcKEjL9LCQ7BdlGEQOuyNOdUpkIYSJ8BLHZxTbMoGn/xYXh+SFynl9R4OC5TldwrGjoe2WaauX2xL+SZWyEDM1w3saG0d6FGlxokcWtJ1pbA34lY08uG6ZEO5WUTy01KzxD7xbALNJ14YYVYyrDRcpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BcUG9cFU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD681F000E9;
	Tue,  7 Jul 2026 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783460785;
	bh=sTAF8Uo74CwK6oOKZp6DOLh3+pYXXmBJ3wbYtR3+424=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BcUG9cFUaqr3nmsbyavprrM8gV6wm5iB1hxZhGZIFlZjZq7gXa8S3ZK2OtyuC5zEf
	 3+W3x2bzqbYGnRdF5+efS9pIzTBASuA9MTYn/HttLLwh8QfXswruqrkw1WK+6cqpro
	 otwdrKUPvHYK7t0/4qUyMw2lHz0ensR8y8pGwqPAwgnExusSPN764LfXBFf22XjtRf
	 Lm/Ye77Zfjx2ZcF3iAZbtfW1POxg/k62DArwHFlwjbjg79Zo+7v3f49v9pPit9jbn4
	 /+N6fEhJTxIMCLfHpgqbDxF+piHzMjo69ySKtpT3E+GbdwvpMXVvTCsbrvTwhk968R
	 THxUjdvqLdBPg==
Date: Tue, 7 Jul 2026 22:46:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: renesas: adg: Drop redundant NULL check on
 clk_get and clk_register_fixed_rate
Message-ID: <eb4dc48b-76b0-4b47-82f8-be0d35437967@sirena.org.uk>
References: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TcAC3ZacrnmTGTc0"
Content-Disposition: inline
In-Reply-To: <20260705172325.118926-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Cookie: Alaska:
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.76 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-34835-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,renesas.com,glider.be,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFE5771FD57


--TcAC3ZacrnmTGTc0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 05, 2026 at 07:23:26PM +0200, Krzysztof Kozlowski wrote:
> devm_clk_get() and clk_register_fixed_rate() do not return NULL (only
> valid clock or ERR pointer), so simplify the code to drop redundant
> IS_ERR_OR_NULL().

The two patches here aren't obviously related and should probably have
been sent independently.

--TcAC3ZacrnmTGTc0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpNc6sACgkQJNaLcl1U
h9DKyQf8D8SFSnDWgLpb24bUzc0z8xEmhX482RB3IdiW0Pd1Q1csJOgkLn+wvBPD
07s4cL7KvZdFvfQsLeiLEmp4ZdwOZK92MArKDMgZtGH8J7ZPimiQg46aP5uPZfNr
9ERKkteF5Vh3SM8vvZHHjZ2KsGQMVoajk/A61xVxrvT7rXjU9s0wwjqmWSwEPjDH
nBaNSgFR9owOKthresvEXkFjOrYEXq79vUv/puF/25rveunEOL1RkPluMXyvBVdk
ETnvSNn1R3kuvkLlvy6AtPacj9z3MvLKD/sGHgage6jUUlvcOO9csnuw4d6BqNmi
v5MkqHz9AQFZPhFRV3fKXTPM8n+k4A==
=exgB
-----END PGP SIGNATURE-----

--TcAC3ZacrnmTGTc0--

