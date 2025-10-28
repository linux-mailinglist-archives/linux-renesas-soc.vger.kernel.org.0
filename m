Return-Path: <linux-renesas-soc+bounces-23803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26361C16AA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4DB84E6B84
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 19:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A82D23D297;
	Tue, 28 Oct 2025 19:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQENu0VY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BE2264CC;
	Tue, 28 Oct 2025 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681047; cv=none; b=ReJ4oZN8jCQANQgNtpP8zqOQQ8hTFTgay9BIIVzt8wqvI24o4NJt+r2yhWYLjBz/uhGczvMaZv4XLekArxJnIT3GrabOXAM+KPTB6IsetpB1IwObR8LmudQ3a7gZelgeVY1ns8DW/SNMWD4Dv0wiHeYp40hvI02eqr1MWOAXo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681047; c=relaxed/simple;
	bh=urY0TsI3YpOvkzhC5Aaj7bm6xndrDnvaVbi//LpjLyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPKsql/ifEF4MU8tncSOm0zCn/Rwofje2qIDEVLVpgFiegq5Lt4XTZnl9mf2WLiWNQx1syBDg6f4x+Edbl/Ow2T/Jrx2ieLoB2mddki/KY8gFTzqHrb7emkH+Kre6/zk89lNGLWY+onYgR1eluD/VXF7qsbiaKPcSdPjTkS+hw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQENu0VY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220DBC4CEE7;
	Tue, 28 Oct 2025 19:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761681046;
	bh=urY0TsI3YpOvkzhC5Aaj7bm6xndrDnvaVbi//LpjLyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQENu0VYfgQnZZA5Br4Ng5xQ+VspOzihA9JzG60ugUFZ+jycvOkgfLV4JvyKymelk
	 vI4n9Im3YnTVF2qulK3NATuo3OntkWDbc58CQ5HnMyLNO6P/d6+3svew42OWgTsYsy
	 oXDfHLUjHhM+IwuYS0DNRop6OqbogCTYK3Z+YytBHc7CT271JyFsWwIucFqoxOeI1p
	 M929jQwCxGFU+TMgcv8OxpS9ESL8Tn/djL7olUT3dqxFD+LsRZ/V/5ZQ2C7nye+nr9
	 ArMpNa5CezshShvaZfZjtVahpydr3OZM1qeLWQ+vyEzvmPaSapQyioLb6SRRTXPXY+
	 UHwGMHTcvBgEQ==
Date: Tue, 28 Oct 2025 19:50:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rtscts:
 false"
Message-ID: <20251028-desolate-roulette-e678476fb039@spud>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-3-biju.das.jz@bp.renesas.com>
 <20251028-griminess-undocked-b6918de546fc@spud>
 <TY3PR01MB113460F737A66E71E86482C5286FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p4+0ILj/kKp+n3xh"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB113460F737A66E71E86482C5286FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--p4+0ILj/kKp+n3xh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 07:39:41PM +0000, Biju Das wrote:
> Hi Conor Dooley,
>=20
> > -----Original Message-----
> > From: Conor Dooley <conor@kernel.org>
> > Sent: 28 October 2025 19:28
> > Subject: Re: [PATCH 02/19] dt-bindings: serial: rsci: Drop "uart-has-rt=
scts: false"
> >=20
> > On Mon, Oct 27, 2025 at 03:45:49PM +0000, Biju Das wrote:
> > > Drop "uart-has-rtscts: false" from binding as the IP support hardware
> > > flow control.
> >=20
> > Why is it being removed, rather than only being required for the existi=
ng devices? It's not clear to
> > me that the comment about the IP supporting flow control excludes the i=
ntegration on these particular
> > devices from somehow having flow control disabled.
>=20
> It was a mistake previously as the driver does not implement hardware flo=
w control and
> is excluded in device tree.
>=20
> Actually, the RSCI IP on all SoCs supports hardware flow control.
> If a channel need flow control it can make use of the property uart-has-r=
tscts;
> That is the reason for removing hardware flow control disabled property("=
uart-has-rtscts: false")

Could you update the commit message to be clear that that's the case?
Just something like "as the IP supports hardware flow control on all
SoCs".

With that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

pw-bot: changes-requested

--p4+0ILj/kKp+n3xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEekQAKCRB4tDGHoIJi
0lbqAQDrbvjZGyqEa4vMZ9yAGpwQWkCZPHRSDevgaBUe8ItJyQD+I/ga4At6wgCj
t8bAQYNoMxGxgMXnkFB1xec89NgWzg0=
=pS4z
-----END PGP SIGNATURE-----

--p4+0ILj/kKp+n3xh--

