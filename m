Return-Path: <linux-renesas-soc+bounces-34597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pl0+GhT4RGr/4AoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 13:20:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF76ECBAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Jul 2026 13:20:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=HCN5EfcL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D4B83087EF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Jul 2026 11:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35EC43DA23;
	Wed,  1 Jul 2026 11:17:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F143E49B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Jul 2026 11:17:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904622; cv=none; b=YNSrUbt9tRJ5mqxWdaREXw0biDv/MbyVF62C/wpyX9249dUsxiWeg5f0CM7+XTYO9cclZyw5xSX+Rd7t/tEuJvOSlF0/0QMzTAYNO5t54ZzcGgOzuYhsI2hJhTX89oaMrjecdjL693EcgYm/fpbqzMBkLSJ2aUVrdcloX6E6G3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904622; c=relaxed/simple;
	bh=Ju6G30nPmVF/JwZK4zThMrqgftJV0nXXCv80BHQAxH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4TPdukVAhy/kYB6LnIBxWou66hTpNNbWTz7zGrheVcXM/vKcqWFgVorEsCtLEjjAs/0+ZqgTSa6ixaVDtj39dMnEheqvQEiAtgpl0owu/BhusNMjVnhxzQRB9s/o71/VrGA2qv+Fc4XMn8HCN/AMbpxe1QcAsWeeZz72Y0hdPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HCN5EfcL; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ju6G
	30nPmVF/JwZK4zThMrqgftJV0nXXCv80BHQAxH0=; b=HCN5EfcLkITKJVGDJGCF
	T6b1u4EyEGQb7BBeoQr1FK5o+vy+sOZ8zmaV8tJyieIcBNONaFUcGnYlsEa162iu
	o54TzXBJnWL+sXHgT5MfxvDnBqXSX4NRaOu144fu3jWt7EZ5Vp1uVzQWGqEJr6i8
	M5j5opA0QCbbS+6WhQJM8QVOjzerpapI4Zi7PNfiXOhPPPtgZ03prnBHGltB22XC
	NygthqlXNPSGXFJQfe2gMSPMep+zG8xChDhBDh3TDVR9YDsgrqJ7cpwjgPUkqOqU
	jnQMsfRuq2SndbzMJwb1+yFSPdu5frz+e9jQLnqlP67++fv6YdaxTEEbh7Qxh3Y7
	+g==
Received: (qmail 672995 invoked from network); 1 Jul 2026 13:16:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2026 13:16:59 +0200
X-UD-Smtp-Session: l3s3148p1@vMt31IpVLelUhsc0
Date: Wed, 1 Jul 2026 13:16:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/4] spi: dt-bindings: snps,dw-apb-ssi: drop
 superfluous RZ/N1 entry
Message-ID: <akT3KiUJccT2bjRn@shikoro>
References: <20260626180326.9593-1-wsa+renesas@sang-engineering.com>
 <20260626180326.9593-2-wsa+renesas@sang-engineering.com>
 <20260630-dazzling-intrepid-lobster-c83db6@quoll>
 <b4a42f27-595b-4c02-a792-0e11c306d2ea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SupshW18AQZrgaw3"
Content-Disposition: inline
In-Reply-To: <b4a42f27-595b-4c02-a792-0e11c306d2ea@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-34597-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,glider.be,gmail.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D2FF76ECBAC


--SupshW18AQZrgaw3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Uh... the compatible is listed twice (!) and you remove it only one
> instance. That's completely missed in the commit msg. Patch is fine, but
> please be explicit that you remove the variant which should be used as
> fallback while leaving the ABI documented.

Okay, I could have used 'duplicated' instead of 'superfluous' to
make this more obvious. Will reword.


--SupshW18AQZrgaw3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmpE9yoACgkQFA3kzBSg
KbZPDA//cEfcjG5ymTzgvGp2vHN41NVqUEM85KtpECI6mgPJcgrmhtjPP2s7xAKk
0kxf8k6xcMp7XBat8hlh2OJbZyibKEMeWp5aKfUZWfGn7J4ys+QK2uf3YEeg6w1k
iC25q/KsmwdVAj1CKGx/QNeMeWoyG5HstDfZSutNoHUHyE/VDF8K+u2jyiNkz0yi
A5wZtc9Q8IPKfkHDhGhHaby3UieaaPdWr1i3Ax0PqSJna0iBL0v+mHQbiJPld320
DguNQDmceeBp0PFznrx34zgbcZj5NJbvBWrzomwiZWLF5/bbBwGPhqk8B7t5jrGC
Bd9jk/pNVlv4gnZbzJq5AZptJEWARYVSTKwEGbWfoZDfTIUIM+9/3TU43BdMWbJ2
uUNsaIreK0KdRvVC9JnRNayAxPIVD+3ag9FTO9gNEoDWXf8w1PxMJr/XUwEmp99i
D69HJZlKWaevCePkPt2uPEG+OpB+oi8fnCAdW4IJzR/5JYPlPA/hAwUZIX+4nTQj
0tvSGINdQV0G9nbgBmYTo48OvP8nz8LOzHb87e5FuU69ROlSJUPqGcrPs1ftnhRk
8q9v6AX4nVSTh27/tBUTZILWNl2fbl0wwG8vp/DnD/VTV/kPGdizanU9UtnBNxe1
5GVFu1cPEjWZNHW3Y6B/asrDa6K3RfF7YcoagQBUNPZ4kmcqj6A=
=e157
-----END PGP SIGNATURE-----

--SupshW18AQZrgaw3--

