Return-Path: <linux-renesas-soc+bounces-29493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLGmDCkRuGmIYgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:18:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE7629B2F4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6877D3039361
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B97C274B59;
	Mon, 16 Mar 2026 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N3J+t9pW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8779F2550CD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670574; cv=none; b=F0vJrmrDl1zbrqfAG9LfI1a4JZrPixMKvTBEn/DMy+55rn2AT4DhZvZzTT4YcNAMFAp6TpyZ08llKk0o2brSKIaAkATMX5kjewpNnEjMKdWrq8ZJGpywmryPjhNsDJWE788AFNnEkJslElx5pbJsHKsdTMdry51mxJtzzheBTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670574; c=relaxed/simple;
	bh=xz54yh8e5ZXFjtA80IQEqsS2sUmbO0s7XFNZ+LhA/lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkwII5I8IrJ5PSvLT8ZnJJFNehKTNJZz7gqMNcpUpy6Hy8I+Q8r4tceRh9B3hDWzo7lkglAJjQPBwQyWuqnhHilS2hbkZW1JuaOSBP5GLnj/ioLZIbBKVzvI5ow4ufq4/UqY9PwRvW0LHJGyuQUjIw+euTEu2kj03VhDndriXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N3J+t9pW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xz54
	yh8e5ZXFjtA80IQEqsS2sUmbO0s7XFNZ+LhA/lc=; b=N3J+t9pWl/ufACVZH7Tk
	nQ2hNmGExlouCSXppZqk73GoDbf6yU4ziz8FYmYvdMuWqs/u5YejDCnBNk20lGKA
	0awIwEf2TIakVpIKKF/fEAV3YsRh59kLnY8ZpkXlYsX6smUtDM+wXpOuKRbwNWSt
	YydImOtX65Ez0y3gZOhJ+tnrbXV9kNGYwN3acq1+rAsVeQI4scl5MI0l4iC9IIl1
	8scknvsKwMf5hjMKBNTyNat/W+oeaFDcbyG6O9FMCpSq7wz2o6P1jgeb5rV4vTjo
	UravNCul/Lais6tvbGfn6Zt+RYRlh/zBNgc1heGXbDIy8J2YfXLL/h8xsPEO2gf7
	sg==
Received: (qmail 1454276 invoked from network); 16 Mar 2026 15:16:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2026 15:16:07 +0100
X-UD-Smtp-Session: l3s3148p1@+WMc3CRNyKo+XdJ7
Date: Mon, 16 Mar 2026 15:16:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
Message-ID: <abgQpsArW3VrCAns@shikoro>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2r2LijptYH3WlCkC"
Content-Disposition: inline
In-Reply-To: <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-29493-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DCE7629B2F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2r2LijptYH3WlCkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
> reusing the existing xspi_info_r9a09g047 OF data. This allows the driver
> to bind correctly on RZ/T2H while the register differences can be handled
> in future updates as the affected configuration registers are not currently
> accessed by the driver.

This sounds fragile to me. Can you add a comment somewhere in the driver
or headers so people wanting to use these registers will find out that
the SoCs are not compatible anymore?


--2r2LijptYH3WlCkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmm4EKUACgkQFA3kzBSg
KbbBthAAqrnpHDnTauVMgI/1C7fKeA0mjdKdNAgnhxPvDKIBMbY9+2bpe9I8esJ6
n7zoMtY4MlwX9xkcC86uLfitXRS1931K7AqHqkyEpGTm3lMjS4n+0tWbER7a4aLL
WbEC59uq1pPbxxfbQStWT7pZmwv+2uVtMmDMP2wnh8O2FtPp2lIqBFCGuCgkfpkt
8FDYk0VcEdTQFAAC966/o0oRtJYQWXpjbFpmWwgo4Vm5XoxkGVtiqV5W7LuBijGW
/qXV25Hr71unoA/t1csORi29LFRTgQspzBcXrAhAwm9odsaEUNlVlZwEHn9PwNSl
lCQjSgx+Ky1oZhhQTw5cNztb1jgqtsyWpwHc+Q6DCHB0x+js6msSBWsLD4n1X27L
3Jz02Sx3AslBQd7C8mn58xTib0WmCT/TzVwELrWBg9PnOwqwYYC5HbO/XwGZKeg2
THOaV0Q9PTl7CD4zTZN+XzyM8UIJ8YRMaRsGPGQ/HI6LLx45VrmY4LFm4j0b4/Bx
LixoHSrikJcoZDpOLd6o/fpOunE+KEire6LKYgJSa40jslmAHrGROjg688KUdV/y
dPSXCak8TK3eeRGuyAe49povjf9tbPtUEGm1pSBqDqD1Ny7dU+mxmAwFkycUoWxs
5s4S6XUhidR9jjkr3KKkgLcf1DcaiwPQmj7Bd9f2pXrOYwvdrCA=
=maxZ
-----END PGP SIGNATURE-----

--2r2LijptYH3WlCkC--

