Return-Path: <linux-renesas-soc+bounces-31000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CiWL49F1mkFCwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:09:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3346E3BBCA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B66A7303FFD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 12:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080B83AE198;
	Wed,  8 Apr 2026 12:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOS8jh0v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FD814884C;
	Wed,  8 Apr 2026 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775650021; cv=none; b=syAvoI6TJxPp0J5Qp1qzohxNufRXblqog0YnphZyG8BKzfSGSj77srh38mR42rsuAm452UzNhzMAdGcJB8PTmXxh4gjFQ5oKNRx1ZppCoM6FHZhZ2jQlvULp5oNgcW2TZ5kVUOJhNqW8lBrb0ZGLkmHEzOz4sbPS+ZbEfWTG818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775650021; c=relaxed/simple;
	bh=s/s7uvCbEx9OBtMl+aCtlXDDUnf+Z1IM2nPuLjppLWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olbNABaGyg9cjfKNGWKbUFChqvFFRSRtXTfq7tVvSzzG04c5r/nCIuQ0Uj833A6j/bKFpQHuOK9+4FMTeColhFzdIz0vgXGogHsVBAmW4bKlzjkZWrgO1E11dGXUmHvUwCKpYpxN2ykmPBxaaXwWbVeafyglWw1QcmYcH15qOas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOS8jh0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28CAC19421;
	Wed,  8 Apr 2026 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775650021;
	bh=s/s7uvCbEx9OBtMl+aCtlXDDUnf+Z1IM2nPuLjppLWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOS8jh0vYSTnZbX5UgkujXUoRyLvPdLVWUaMxi8YRUtUS79K32NsX1d+tAvwfu65v
	 LF1imQoa3OMcMO1vhbmK7zaibyiULUuJa1jeW0qW8Hybv+Cn0ulFqKNWc/FhgpMP5S
	 VJYfoReqcyKrbx/eMHNRklwoX3CQcty31NpWuMGV3C1e/ihuCgG5OpJHpTmnrOL6XM
	 NXdxVQsYwNnBr+pUfjyANi4L4Jcb2sAn08wiQ3QDx2qoOWwk67WxvLmlMKN5zqFzIo
	 BN2iaF3/agyxMYTwZ+aaydmTsOIB8YTW1kDled9Oa/cAuXPQmCx2RIzSUPPbrOvE3P
	 LcApAbBZUQd8g==
Date: Wed, 8 Apr 2026 13:06:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Message-ID: <b36fa28f-4885-433b-bc5b-c0069636663c@sirena.org.uk>
References: <20260408085418.18770-1-biju.das.jz@bp.renesas.com>
 <20260408085418.18770-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GXycGIdcA/j/3xlI"
Content-Disposition: inline
In-Reply-To: <20260408085418.18770-2-biju.das.jz@bp.renesas.com>
X-Cookie: Often things ARE as bad as they seem!
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31000-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org,oss.qualcomm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 3346E3BBCA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--GXycGIdcA/j/3xlI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 08, 2026 at 09:54:14AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
> the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--GXycGIdcA/j/3xlI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWRN8ACgkQJNaLcl1U
h9Cabwf7BzElm93vFqvQfzZaN+FZ6nuVjkO5bNXqZLcI3gwfsEYLZe64lFahMM0F
pxhMihU7jyeW5T0CQKOn+VjbfToEGymm4cWy3ShiwIHj3/mFlhwS9t+Sq0iSIM4o
rqVj8X5r8HXvow3rKEH2H8Idrn5TpDTEVpnrw1WPF+55CLjFO+jPtUHKsjpzB4Zx
zOfwRAyDb+R+7OMHMasps2+9iS3Ki4tuYfQHHYXrLl6n6G2U8LXzDrJgp8RAtzAp
tXL/TbPH1nE6oYBnsRmd0VGSD87a2q8mYBTXlwfdTlzJqe/0hq0TBInbskJ1O4Om
ye4G4hLQAbdKZzlui6FgxY37ppUizQ==
=i5wj
-----END PGP SIGNATURE-----

--GXycGIdcA/j/3xlI--

