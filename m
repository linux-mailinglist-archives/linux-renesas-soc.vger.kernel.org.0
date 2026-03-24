Return-Path: <linux-renesas-soc+bounces-30140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI1fLm4uwml5ZwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 07:25:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 401F2302DB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 07:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9C1C30164AB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 06:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A483D3B19DB;
	Tue, 24 Mar 2026 06:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VTzH2rzH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7A73AEF24
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774333112; cv=none; b=duMDxCtoqtUIG7d6JVg5xmt/jnhZ+h730n+N+06aA56NMDdAioCtdCoLPbreiygmgAy2VykNiZu+Kagl0dTgFSQ4m82KCW1Xy/npGJczRInM3G5+CL45V84lq1aupPFXs9OAln+s8S7bobAzXTN/IJ/+onUrk/2fzPDhz1gYjPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774333112; c=relaxed/simple;
	bh=d9gbbNxyx+FQe9n9GFC40wGi+NXJI7fFoRjsPViOOcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfjh/VptarI/gwFnHXqDbZoxLDtzVFnzlqPMrk5uPK/2WqLDj+YPoJFajkrkEh5VS6CB2barNbWAPFTrhqoEs/YJEy9EQHJxsO4s/ulfSN8tdsONZCwpFkJcM2nNsxOaeIPJM6PGNKOr0h7XoWvJ0wSyhI0IfompaI63ElPyGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VTzH2rzH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hynD
	MiIb+MnlV2t11Qv65FCC9moYZmMFOf8wTJPa6YQ=; b=VTzH2rzHmego7J3c9ROD
	8wUAK8ulAgC/WapSF3d76hb6AdoaAlHkIhWGuvsCOgmbhsGABW1k6gKxvgiPwkD8
	fTNNebmR14rGtAPYVpgiLLTKYGuc5snMnFlWHbsw47NpFlk3itKCIcEKs3FvlpKw
	vW/4nHJb5Ilcqt6YdWR3Wb9aZZE/pWW3078RfM4J9HT/knDYp1v4NFZLGh+4tCUU
	ViGqO8KYnJvgKsvcyh9H2xxSDq0di9ipEzhK0W/viD8vzIidN6/uXZ0BUNw1MV0+
	nZ+DpeBpx1uBkxB5gDR5dAbVsHTeODE6kdjZGku8FomYcD7mxtdZEVDdHUgKuoFq
	Uw==
Received: (qmail 2981200 invoked from network); 24 Mar 2026 07:18:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Mar 2026 07:18:21 +0100
X-UD-Smtp-Session: l3s3148p1@0Y8uHr9NPMwujnul
Date: Tue, 24 Mar 2026 07:18:20 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: Sashiko review feedback (was Re: [PATCH 2/3] soc: renesas: Add
 Renesas R-Car MFIS driver)
Message-ID: <acIsrJp2Zq2ntS5f@shikoro>
References: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
 <20260317130638.2804-3-wsa+renesas@sang-engineering.com>
 <ab-vWbjdlAIt1qaX@ninjato>
 <87a4vyynl2.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tfrew2qbJvbemfWn"
Content-Disposition: inline
In-Reply-To: <87a4vyynl2.fsf@linux.dev>
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
	TAGGED_FROM(0.00)[bounces-30140-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,glider.be];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 401F2302DB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--tfrew2qbJvbemfWn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Roman,

> These replies are definitely helpful! I can't realistically look into
> all cases across all subsystems (I simple have not enough expertise),
> but I'll try to look into most cases and hope that other engineers will
> help here.

Sure thing. Is there a dedicated mailing-list or better email address I
can add?

> In your case it looks like most findings were real?

To my surprise, yes :)

Happy hacking,

   Wolfram


--tfrew2qbJvbemfWn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmnCLKgACgkQFA3kzBSg
KbaIWA//URZ27p+POBqY07hhmg9gNON0BFVFcqiZdg/wdblZUEGksFEBDxrfKoBj
x1kxQEC/14HeM66vl42m0Ab2gb2MmnT3z2sElROf8rnWhEVV2g68DsszkZuYHUJS
7mkjpbm7CRBmd/KWDYIHY2cU3qQZcnC+HxLli5ULOzH1o8YIC9OeS1Mwgm8GVM7D
O7QSkCNZLQXFegAzqMr0uQCOfH42PsBpCLfhcrZQmFYNcrAgSkJLLKHqGah3dJ6k
N1B/pHwjSIEKabs2qN4wUsZRCPJAVCKVLyo3mmpMwidrgokhRCvC4bzHDIfH4fHz
Okph3VDlfO3fxe+kpZfggEIE18vcNqIUCWLlc4+fNOXgPMw1d1jwtMyX3zr4XVc+
2HJPPbYGUqbBLJEgTjxg1UNStVcSm3VTf3FQqoM6Ok9iq7bxvi9TLLWfLYYanjE3
IgqIRwKT1O8N5n8s1V6Lf9s7Y7CWu8WQEHqdjO9IIFusYL8AEKVOgzsOibswJN/Y
PpJNvbc1hcBzyrI5WlFKZ3g/PoVllCpXwM8nMCz/+DrqaVHIiiaz7jE82+F2lefe
Mr7Vas6OM2IXNhj2Z/aH30Fl9sT584uyvdN4zDwmBH+z/R19+WqrhqANmzapCy4X
ncy1BoObWuuYSiG8kFvbJeXnTQYVsvMtbG2NXKm8GiVS6KK7Gyw=
=e+jw
-----END PGP SIGNATURE-----

--tfrew2qbJvbemfWn--

