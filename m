Return-Path: <linux-renesas-soc+bounces-923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B5A80E2CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 04:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0200A1C209D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Dec 2023 03:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5DA8C1B;
	Tue, 12 Dec 2023 03:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Tsm85U0I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C69BA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 19:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=7j1q
	X8z52KuXraBMzAtOl6IRRhMS8zm7c0md0ogC1JY=; b=Tsm85U0Ihvrghwni3NMn
	6FJXQLRLhowFJi0xEBtulVGh8z30qslr6ON9rRK3zepkNiFLcQmOj493+s8nVLG2
	DvD5wCsR6pI7pCgu4qbp25F1d7hizSvTysGT7k79n7HdxnS362DONDLPHbd65KBB
	eTC3mu1xGCdH3vHXDBAMI5oQzx4ff0UdSnebcrOjve69nUniS3/q4xx87aDY5Vbi
	JClcj5+9ry6F+1ctLfj8EeV6lpgCjyH6Vy5LwRBD/5pGwBzcsbJyXBSxJZEhKDsv
	Lo0MLXIfWSaY4XQOzN+eoNH6+BY6/m2kwsZcA+dtjgTKmSwhLu7nmos3IzDelBNA
	LQ==
Received: (qmail 73350 invoked from network); 12 Dec 2023 04:30:11 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Dec 2023 04:30:11 +0100
X-UD-Smtp-Session: l3s3148p1@YxD8qkcMZoUujnuR
Date: Tue, 12 Dec 2023 04:30:10 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] gnss: ubx: support the reset pin of the Neo-M8
 variant
Message-ID: <ZXfTwscAltoVY1lV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
References: <20231113005152.10656-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0hj4t0zCQoMhrc7P"
Content-Disposition: inline
In-Reply-To: <20231113005152.10656-1-wsa+renesas@sang-engineering.com>


--0hj4t0zCQoMhrc7P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 12, 2023 at 07:51:48PM -0500, Wolfram Sang wrote:
> The Renesas KingFisher board includes a U-Blox Neo-M8 chip with its
> reset pin wired to a GPIO. To support that, we need "reset-gpio" support
> (patches 2+3). But first, simplify regulator handling with a new helper
> (patch 1).
>=20
> Changes since v4:
>=20
> * don't touch reset during open/close. Only deassert it during probe.
>   [patch 3]

Johan, all good now?

Happy hacking,

   Wolfram

--0hj4t0zCQoMhrc7P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmV308IACgkQFA3kzBSg
KbZuZQ/9GAXoJn55ZidUvDeVt3ZjpXMA6CgQUFZ/CkUK15/EPGxfTQgOvve7E8aC
giXtMn8psTKmLDvtuy5z91aILF3yEd7CdCy3RvaVkkj7+5bSue82qKGc+E/zGQWH
6m871dzqG+Gae+xQUM61LkaOUt35yQXosz82fqHO7MP8DQ/3KRowQEhq1MvOioxG
G+NXtpM7rKEdYRih4esPY19chmR1gxbFIeUnCvuWsGIv3Fl8Y8kfrYRZI8iM6mW3
/+ILC6c6Ph8X6iI/2QdBcjYwHjYIQRJEtsuaRLOvFuUqLORLAafieswI8pya677X
tLFpjlkiP2h9TO3RiHhPdbUJ0Qy36Ap+zmKAFk3jagZXLcvUKPG2Wg8OqPGZBWbR
kcqjHwWbZE8mu6kq8YZzjatsDwumKMBnVxsCT8DEKv4lUtvXsP1NcHHthZStsJas
RVgEJwV4pI+X49WT5P90cuwKX0/NAHZRPJukloMU/xwQGpFhl8uSWWYjrzaCmxOY
oL3yWYCftk9y2+MIZvpL5PnLxeugpNWo+AoSAITmsi0Jo+z8kjz8jehTD7m+5c/K
aPye+2wWCnzul0PB2glhEhAhaejIRKvPP55N6KwvRaUGRMYkKmSJ75Jg/XyHCpy/
A3B3O/cz4MrDNkMkKQXI8+LmUtVHm0x/OQ23FCCXlNKQLR7Oxws=
=krY1
-----END PGP SIGNATURE-----

--0hj4t0zCQoMhrc7P--

