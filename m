Return-Path: <linux-renesas-soc+bounces-34158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UHMpLfiRMmoa2QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:24:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F535699AEF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:24:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=AxBAGudq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BF4C303AF0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8044C361DA9;
	Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0603EFFD6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 12:19:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781698795; cv=none; b=BNZ+jFpbyzc7f27wo5bPvGDkyXVJ+Oy4GkIEAWnYfQcx0yrS9Rsllp+AM8dy3sqEBD9kmkYukuAztPnZUs1QkzS+Ojx287VwY3GlEkA/SEZQfvbGcch0LVpgL//IIqiRk/Vj3FlWkm/11FZ1n8RP3GXlZQBTMRpQKdWQKN3Qh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781698795; c=relaxed/simple;
	bh=wo5u5o+P/8to5HqjbitjQ8PWwxZfTG2jaGG3xTLCk/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbn67Po4/1L0JqzKt/xYsKxZLroGGhFMFaXGx6UGziSgkHLBS45tr/nsZue9byVqCJHYWVFykrh/xFaihX+N0izg7pbUIutQEbkycXo91nzGVNC0sdMEnkibvOjEWwiFxXt69LlbkBBWWNXOag80SqfRSOQCmLT/ifbx9Io7UZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AxBAGudq; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/I0l
	haoFT33pxZ/PYaXqQdGg68ctR9A+xZaGv25YhwU=; b=AxBAGudqHdiCwNzYfqEY
	lJ2ZIbMuGbXvomikq6tcghpTbaaxvaJMmDAzR51gWdQaEqb3nwxlZi7OJ5epbETb
	KRtwlSLSG3KOggjVmSNi5qkXvhWueoRiFilTugCCUFqLuBiGghA9YtKlOi2Ouwif
	H/7yXAtRoUJvT2vmua/qLGcK17Y3ugNvDZpZk8mIpwib8fjQ3UEBlnFngLM5xxGR
	dW8LwfHamXy1HEHJi4XKzsrmT3t49U22b9+pLx698un1/+167p9z31AcMtlexahR
	ou3oBIMCQ259Xf9pKR5W9rJZqoCg+dQuFDGRmzQWQVTclRQPNvyCqZMPVw9nA1Ww
	CQ==
Received: (qmail 160292 invoked from network); 17 Jun 2026 14:19:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2026 14:19:48 +0200
X-UD-Smtp-Session: l3s3148p1@gNVeE3JUVKQujnvI
Date: Wed, 17 Jun 2026 14:19:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document
 RZ/G3L (r9a08g046) SoC
Message-ID: <ajKQ5OzGvWg3kBYa@shikoro>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nYIkyYfhRcPpAu3x"
Content-Disposition: inline
In-Reply-To: <20260603065731.93243-2-biju.das.jz@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34158-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime,shikoro:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F535699AEF


--nYIkyYfhRcPpAu3x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Wed, Jun 03, 2026 at 07:57:01AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
> controller is similar to RZ/G2L but has five clocks (core, clkh,
> cd, aclk, aclkm) and three resets (rst, axim, axis), so update the
> clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
> It has an internal divider for all modes except HS400, and a 2048-bit
> divider compared to 512 on others.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

I know you work on v18 already, but some high level remarks already.

> +              - description: ACLK/IACLKS, SDHI channel bus clock.
> +              - description: IACLKM, SDHI channel bus clock m.

What does 's' and 'm' stand for? Is it mentioned in the docs? Would be
nice to have here as well, if so.

> +          resets:
> +            items:
> +              - description: rst, Core reset.
> +              - description: axim, SDHI axi bus reset m.
> +              - description: axis, SDHI axi bus reset s.

Ditto.

Happy hacking,

   Wolfram


--nYIkyYfhRcPpAu3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmoykOAACgkQFA3kzBSg
KbZXkRAAlPkxfJBU2AOJai06gq+PcuZ8YuGMnCfztKN1A1YkcHIjKxffWe+QN9f2
+GzFT8psEN6UFSQOPO7J0zJ19UcLpeP6ly6VlJBhSg9Z5c8oxsS7DJFxZ1PisIZ+
WEoWLfql4I4OHILot6NCAdsIVM1eXhMp82jSGVb9vUqLGFHhYyDiD+DIOwePGcQJ
mlR1oSSHmbL4nNcKJzBM4cInKrfOfiNG7kA531rPzKAO7RxUDat1Jr/oBKYqo3z9
VOd96YgYGqCfuhY7PHtUU43bgNLyGLCdn84eNU+LlOMzDpNLDrsJW4SvZ47jFjOx
GrYQtn90ouU8BI8Bm2WikzvLgzsuEvDx3nNcgMbCol0H7FPJ3kv5ejOVZKVF3go6
uxuArNWfRXSnP9pGvrGbsaE1UmMYOXiw2W3/1ShLP+d3Pjm71wsDD9gzIKktKiEr
CdHQPFj+R+Z/1JfMrMp15yQqHeeLXboy2XA7d0izXmE9D8ukPlsGMiNgVlu3ZBDe
LDDDDpV1F1+YK4N+GX31Rypmcshf/zTtFq49KgLOViY8oSDnvs/s2yP97iWbr5oS
yVYcKQE27rKXRpJfzywwRdmdXYn9dv0bgnOo4KwgBifcu+rGySmSoNy0jJC3Zl2a
I6+EJt8SgIDmYGP8YbM6RfOaWF19V1snDBUeDxh5TDJnhCJGI+o=
=cLl7
-----END PGP SIGNATURE-----

--nYIkyYfhRcPpAu3x--

