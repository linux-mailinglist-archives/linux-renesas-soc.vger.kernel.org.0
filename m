Return-Path: <linux-renesas-soc+bounces-23804-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD71C16AC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 20:53:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9A6C3A676F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 19:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E0329B216;
	Tue, 28 Oct 2025 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2/yRjNH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BFD21D5B0;
	Tue, 28 Oct 2025 19:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681115; cv=none; b=I6kP1HeaqcwMpjU5HqT9KAYA4RlXB637r37GTeTrhkmy1k3MaWQ1npo8MUrLAZUuyRANfgAgh6rbfZuyBm4WONFOlA+nVOUTjbDwwMWSdTV1mohPBbg4uMZmMuvfj2yG0PdvVfmWVqcRKNMiBhGwmHUWV9Go3WRvoa9TpShxYvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681115; c=relaxed/simple;
	bh=BHjAKGPU29H9Yv360Bufs05ABl5CynTqHSCThqFolYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeMSrnWNw51Q+RvPsnqNHYWOlXut5ajKN1wHPD/WAUoKorTupJ9gztzCTYPz0975UsO8V8fwOUpfZvZ81sCkxoyQGM+sw2GnoWI5CCPbMv4lsqey92tv0zYniCxzehUbDgzFpPzYb7IbheU658QOmJZkYCHZkYvlvWz5kkiQWeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2/yRjNH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E9EC4CEFF;
	Tue, 28 Oct 2025 19:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761681114;
	bh=BHjAKGPU29H9Yv360Bufs05ABl5CynTqHSCThqFolYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2/yRjNHnyVkSRa8zfrtxJVJF2QLDaSSp3R9ug7ehK9B+xw6gyAg+rCYNvuyK8W8C
	 KtYFR9W1G3FHfa0VzYE1tCGRGOWOVcqQNOt7JeSMoYQ3uWtVU5c1bQRgx3hSgNYCtD
	 3Df1Zek62SrSmKUFkApHE+qajuh/wX9N5DrW44tYqLwz/7/nV+YrGzS4meX8Teuxss
	 MJQ95B87vwuay9Cj9qZ4+7Svu+poAod7jo5EOlTQ4GeWYDWHiZDIuq2llWJNzHRI6Z
	 GfKcZIb1zeVSeaz4/tng4ajSGJFY8UX97+Jxs1/q7VmVrX02o7qMxnqDAYzRFu9KSG
	 UsqBPl+/HPBuA==
Date: Tue, 28 Oct 2025 19:51:49 +0000
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
Subject: Re: [PATCH 03/19] dt-bindings: serial: renesas,rsci: Document RZ/G3E
 support
Message-ID: <20251028-veteran-smell-963bb76ab3ff@spud>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-4-biju.das.jz@bp.renesas.com>
 <20251028-mower-mundane-316cdd6b48b6@spud>
 <TY3PR01MB11346372AB6D191D30B4F058B86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vsul8bmszK8c/Qy/"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346372AB6D191D30B4F058B86FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--vsul8bmszK8c/Qy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 07:41:33PM +0000, Biju Das wrote:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,r9a09g047-rsci
> > > +              - renesas,r9a09g047-rscif
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          minItems: 5
> > > +
> > > +        clock-names:
> > > +          minItems: 5
> > > +
> > > +      required:
> > > +        - resets
> > > +        - reset-names
> >=20
> > Does this need an "else: properties: resets: false"? Or do other device=
s actually have resets too?
>=20
> It is not required as resets are optional for RZ/T2H and RZ/N2H. RZ/T2H a=
nd N2H does not have
> Resets.

This is a contradiction. Either they are optional for these platforms or
the platforms do not have resets. Cannot be both!

--vsul8bmszK8c/Qy/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQEe1QAKCRB4tDGHoIJi
0ve0AQCpCOvkM1+qG9zrU5VA8tLYKZcMSF2kuee+SwBt9Q7apwD8Cukuw3drvhH8
uZRnM4aIdzOCDwEXBG4orgwdS2qC2Qc=
=Ddmm
-----END PGP SIGNATURE-----

--vsul8bmszK8c/Qy/--

