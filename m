Return-Path: <linux-renesas-soc+bounces-34825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BqwNHa0XTWriuwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 17:13:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5D71D1D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 17:13:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lb08gJD4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D1087300E003
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 15:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7ECE3783C7;
	Tue,  7 Jul 2026 15:08:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA13769E5;
	Tue,  7 Jul 2026 15:08:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436939; cv=none; b=sF+ZbPi4R1IaNqNMZZlmBp4g085hZ5r5w3zGLTCHRdU1ZU5tQyIx3C3FfdrjMI7h2nyA8O0117MDrYv6KzAVj9GbdfpVHFq0zRKulYJTWJvryULqH30r8iGIXv/nnLH/M8vwdrwDnXEYXVv0RoxzQEh6ssRMgNWkPAuWUV2J/oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436939; c=relaxed/simple;
	bh=MmsfvdEXLJ74FZizs8sbhEg8vPofFFJhpqZsF/RRQi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rss44FUREpPM4Q0yNdkOW9hG2y8XlUXZWjRJxk3+9fLOrUjePJT8K+ddvACSFji3EDx1K383ZrbXQv2JiIKcDQA+4dQq0azJUE78uGBmR9e8px31jT4yMgW1l2th10UEC2FKU2hlqAPfCjgPbdVBHRDE5LgyynMGGfp54flaxL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lb08gJD4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE261F000E9;
	Tue,  7 Jul 2026 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783436938;
	bh=MmsfvdEXLJ74FZizs8sbhEg8vPofFFJhpqZsF/RRQi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lb08gJD4vN4bHNkHrDrr6iRjXdjXPNa+uMvEgwfVExMfTYhhoiznN5mL9xHVWjaCP
	 r7tcPDy1lBMfdGon8tzUnVUmprnzehMG8bSW1DA8geGVMuM/w7pWAq8fN18NwCyIB5
	 H8M49Et0ATsx2f9jekblRusGnsOm+eiXmZIAsT1KJG2xV1QTQGzNFH2/OuKHCFjZht
	 78F9JVHAWgxd0u8p4GbPkCLAI1QVBjMIAwuGI3zOoRxzlcE0bASi1Uhp7T+9w8Zd0B
	 fPARliX/MyrwsEuStMgDD28n+EJ6Qmg4UrWrv0opR57HQfndf/QOgfHEXQiti3wP2v
	 LY64BGcTMjN0Q==
Date: Tue, 7 Jul 2026 16:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
Message-ID: <02831bf6-cb05-427d-8592-b3fff31b6913@sirena.org.uk>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j8+E+ZJg/jcksL+O"
Content-Disposition: inline
In-Reply-To: <20260707143646.245177-6-biju.das.jz@bp.renesas.com>
X-Cookie: Walk softly and carry a megawatt laser.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-34825-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:lgirdwood@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org,glider.be];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01D5D71D1D2


--j8+E+ZJg/jcksL+O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 07, 2026 at 03:36:37PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
> has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Reviewed-by: Mark Brown <broonie@kernel.org>

--j8+E+ZJg/jcksL+O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpNFoUACgkQJNaLcl1U
h9AYAAf/QajfTkfFdmVwuBraGBu3L8F8JsOPTk0ZJuyUdRtIuQXItkBsCibrFPAi
hI5DJfE37Q03r6AHmDp6t4zAKMOjrGqhQaRjI0eSow+rtCx4z+8zY0a5q3d/KAnW
pdp96XPUWkPVUtTJd1J/LUO5Wjc/oSKFg+rXFgXIXZOJ0DjIXmCmQPf+o4u6z+E9
at7LEt4XWrOaA7/NkX4Vd3H1NNN1jSCw4bf1XRle+01CBA/0Gc8KlauYBYzB9N9L
s6kZbbte4K1/PooKKXl6gAN0mh78XZjBbh7GjURovgI3rD1D5NwIEiv0Ds4bjUbO
LL9861EgeFDtt70x7KFZBXkUnD2RYA==
=ZStS
-----END PGP SIGNATURE-----

--j8+E+ZJg/jcksL+O--

