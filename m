Return-Path: <linux-renesas-soc+bounces-33625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /nowNd7bImoBegEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 16:23:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F3648CF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 16:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Hw+U0HjQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6346E300C82A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0220A37472D;
	Fri,  5 Jun 2026 14:21:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1081F330B2E;
	Fri,  5 Jun 2026 14:21:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669301; cv=none; b=NpHOHb9Zv/6fLl9Mj9sb78QoNE80rSXmuzyzODzFhXpuPFjPCEAdeSnNR7bW7oftW8Ry0TknFcjOM+WR7asynAryNwWT5yxc7HBpBQa6pOaMHgeC7bgZgDr1jlEBhes7wg8NbAFvBHKmiPdloSboy8JYKJezHbMbShKbA9Y71+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669301; c=relaxed/simple;
	bh=8YL72t44yE4RHjLWnzT9Cs0Y+8NCQpiDFvM9EEwwibA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGRfSPtNiQVSIOXTjBzjjTNTGn91pbw5zw3CvcYENlzG8OyZgBYffpvDvDPVNW5I8752uSJgknchxBGudPRRXsozdVYV98xy81cVBlvA6wgbE/8VyTPyAy6wlf3ziqOvtrdrr3P9XnRGiMOzqRY0fsI5S3la2C81UTZd9IX85uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hw+U0HjQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05A61F00893;
	Fri,  5 Jun 2026 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780669300;
	bh=UbSa3ODwt/Ewf2SZXpIlClLvhhn/p7bCuK3p6KqCz0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hw+U0HjQnNbnt9KxUAPI2UFbqmqu3tRenc4wRuIA4wMGQxLiNv4YVZAWHqFq1gcDe
	 MLQ+UNAzqN/CwsuW1gr4oDoaSjwiVKK2GIm/woYzrfC+75a0Vb767dYlKxF5wkStYp
	 jv6mFO3fWA1T8wZjnB1UzdSKtq+cQJliv63vU5951Z5MFesKPgsFYqqL7h6WC8vNkz
	 WwqeammPuCJrRUVQRu1FRxMBoITkhVd2a6+QogBFqpi2N5nsTo9HqT9mcritUePk6t
	 ChtEVP8w2gSZR/HJ13IRoDU5gWLts1b2ikA2nCv8nP+xC6Zu0CNDOjZtGkLyds0PLP
	 3ynWeC6Spsfwg==
Date: Fri, 5 Jun 2026 15:21:35 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/10] ASoC: renesas: fsi: Add SPU clock control in
 hw_startup/shutdown
Message-ID: <68a03a72-07f3-4738-bad4-6b92bafec318@sirena.org.uk>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-11-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pvn0gmD5q1QTwXci"
Content-Disposition: inline
In-Reply-To: <20260605121955.105661-11-phucduc.bui@gmail.com>
X-Cookie: Error in operator: add beer
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33625-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,glider.be,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 401F3648CF4


--pvn0gmD5q1QTwXci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2026 at 07:19:54PM +0700, phucduc.bui@gmail.com wrote:

> Enable and disable the SPU clock in fsi_hw_startup() and
> fsi_hw_shutdown() to ensure the clock is active while the
> driver accesses hardware registers.

> +	/* enable spu clock */
> +	if (fsi->master->clk_spu) {
> +		scoped_guard(spinlock_irqsave, &fsi->master->lock) {
> +			if (fsi->master->spu_count == 0) {
> +				ret = clk_enable(fsi->master->clk_spu);
> +				if (ret < 0)
> +					return ret;
> +			}
> +				fsi->master->spu_count++;

The indentation here seems wrong.  We're also using spu_count to
separately guard the clk_prepare() in fsi_clk_prepare() which seems
problematic, I'm having to think too hard about how this might be
robust.

--pvn0gmD5q1QTwXci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoi224ACgkQJNaLcl1U
h9BkdAf+IjsYXqEFmaRdkBWIeWhxpQqeA1zBqSdnHnXswCKMa+XQXoMCSRIguVUi
GSo4pY57A3x3s8EZMfy+kKVUI4t8m7bo4AdFW2IJub6hW2lBI/UMGizz/vFApu7S
IdsQd+59S216HHJvTmm5kBBtYOmhxEHDBK38fAnStSLk9Nztx+OemR8JzCKqdfWm
dssRjktzCSanRakdmumgmSLis/bKDTLKqs3fK+gQYbkCzmEc8Z2zyRDRxQ/vCblA
AwVAxKLMG6WWkGVBHP/bdUlPhqPI59ZpFJMJ/r6kcWPPYjl441/ydPzw4w4jMoaz
J9XHJwv0k6oIMFP30EbnRoQY6C3KiQ==
=B88h
-----END PGP SIGNATURE-----

--pvn0gmD5q1QTwXci--

