Return-Path: <linux-renesas-soc+bounces-32831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNzHG4eQDGp1jAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:32:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0505826D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 18:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16AA731D3F5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 16:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6B930566E;
	Tue, 19 May 2026 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dsb8PKGO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AFE301472
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2026 16:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207009; cv=none; b=Iowq8z6+2eeHApuoKw/Ld05Kcvhi3nyR13QLh50gOYPZNjA8pUv739DticTHVLGl4ejtN+XX9bc72tkAysw7EkPrZ6A4glTVun3M2w9C1LAvCY7ScJ7leQqtdF5WYDl8bPfhqh3EbyMpOt41TYRaPMsuRUqLDC1iOYL/0s8oTiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207009; c=relaxed/simple;
	bh=6a2JOfyK683r2+0KWy4GUjN7S6mEexI/L6UjL1F6s4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IK2qDcWeGo5GcmF09w3xvMFhS4ieg+X+V/GNpjhVtsUYdVHkVgh9o66WTFjLk6eNhvAosfJ1k+pJSopPWKw5vfo8FwzqPYiV3wavTAonEZXxk9qQWeW+dhAStE+2qm7srnBwGgRgsWZD5DM9RUN56cgSL0okYBCRRz7msNvZAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dsb8PKGO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6a2J
	OfyK683r2+0KWy4GUjN7S6mEexI/L6UjL1F6s4w=; b=dsb8PKGOq6eB87PLckf7
	ufKSjLFJedVgVXtl8+t3f+mPSTzZRN+Z838yQr7puBsz7/DuDvEVpbxjHG316sbs
	wHhtJKAO2D/SH6BZmZDMTsybFcYlYtlZWuAUDOOEjISwZVfrnO7JvPR5ODnK/QGv
	/JdnmQ1Majh8raZJPAh4hrNoxe1s6x7X5cZcqxx4F7DXn8HoB0knsrNiSLYzIhCC
	VhvnPi5KJ+iLJnEOTHXvuT4etfalpAwVYDfwCQzvgQXygMMztGNcQED/d2Ge62LF
	IQz8LdfISSSwLhlNKE/RCY2eYqJ80qgNUptUK91L9YJjFf761L1xfPZmy8xIPyd7
	ew==
Received: (qmail 333699 invoked from network); 19 May 2026 18:10:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2026 18:10:06 +0200
X-UD-Smtp-Session: l3s3148p1@RpeP6S1SDtMujnsJ
Date: Tue, 19 May 2026 18:10:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 2/3] mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
Message-ID: <agyLXUhIAy9UUFlB@shikoro>
References: <20260519135342.623943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uBXw2T2MHSSsEhYj"
Content-Disposition: inline
In-Reply-To: <20260519135342.623943-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32831-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: CF0505826D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--uBXw2T2MHSSsEhYj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 02:53:41PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The RZ/G2N (R8A774B1) SoC was previously handled via the generic
> "renesas,rcar-gen3-sdhi" fallback compatible string. However, because
> the SDHI IP on RZ/G2N is identical with the R-Car M3-N (R8A77965), it
> requires the specific quirks and configuration defined in
> `of_r8a77965_compatible` rather than the generic Gen3 data.
>=20
> Add the explicit "renesas,sdhi-r8a774b1" match entry to map it correctly.
> Note that the DT binding file renesas,sdhi.yaml does not need an update
> as the entry for this SoC is already present.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--uBXw2T2MHSSsEhYj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoMi10ACgkQFA3kzBSg
KbbpUw/+KlIGswFVo3I9ACEcGGk3A2Sp7kdD5oPT73uviJbfErwjyGCL9HJuYYYd
Ys+yEs372BOO7EyMIfBa6cvcFAjmsLVpJ1J3/C0xRoA9jjgxYsYj45Wq6xRY41au
bS38CIG7SYnft47eQn2jcWT/x4BVLq1NObXgqc43ujD4izeLOJW9zs+OYatEAwNn
zgJhLs07Sy0IsruQFm5zw72EP3zVB7Um20DVstq+to/9L/vMhHFCedmzOMqdy4qX
BSxCXZOsDDIysdenvWDdVfVK/gJ+3av0CURY9ieUjtgUiAwmcYDLnGhmIythrJqQ
7c2qLlQDwKFCup8fD53ool1+GdZDMSyxeXWznnASflAEDCkCxbnl2/ZzRbreUCX8
udFZJ6Jm8aJ1VaU0Fr/ARDC8/zHCmJpRARpJrKa6j3co5hU4n44lingT1/3fNxsi
MAx505jSgFjV6ZRJXnMmFTqfansxKxzGx6J1T+6sWOFUBW671nf/jXD9Hz5rbO2b
+RiX0vXhhIW+C0df+4BupiOtm36ZjLIC7lgMwxJEuvHJqQ3/ZfKkotPjO/LTEeT+
Om2n51bqXtFv2PZ44Z8Uj+Ow+GNw3sJcm2xlXeGRoOsbT0vN09WPNKqDoh60eMd2
WyKSMelxD3QDoBslHP9Lqes+KsFxqjL9kb8gq4KgyJ1PFk3pA/A=
=rcZN
-----END PGP SIGNATURE-----

--uBXw2T2MHSSsEhYj--

