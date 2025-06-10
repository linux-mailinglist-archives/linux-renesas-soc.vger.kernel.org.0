Return-Path: <linux-renesas-soc+bounces-18037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC25AD3D7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 17:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAAA18921A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 15:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6137F24169E;
	Tue, 10 Jun 2025 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDZTTs+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5AF24167A;
	Tue, 10 Jun 2025 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569403; cv=none; b=CC3LRBa2+xLr8tVThOxBfuArOsDM6jD/M+zsuQo+gmVZhTMAlMllhGQYehz0W6NvxScfax88OoXtKkyfz7kGOqSn2L9YS6mhnOakfL7aWIur7s+D3rjAlSFxSp5/dyIEMO5E2FD1AKLri8zKdhi04hAHl9ips5NVtUmRRSNiHW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569403; c=relaxed/simple;
	bh=kyCy/imDquzLmhCOynV44NQ7rOEtssv66ztxY9qztlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ucb/DWgyP+RnHKjiH/6GS4jvBOhgs/7zg+0jjYNd2zFz50GB+XVDTVbybWjhd7lPXy00qmeCwHmQUAg2n5mY5yhPhh4dzfiB6K3MMi+4Dn6fCdAIwE2vTSguQTFJRzUUTCwH9XASLt5KkuMP+KywxJdemjhePaCtV/J33sJdZNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDZTTs+4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A94C4CEED;
	Tue, 10 Jun 2025 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569402;
	bh=kyCy/imDquzLmhCOynV44NQ7rOEtssv66ztxY9qztlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDZTTs+4lNSsJUif/5/GIgi5WfDonSiL174XP1rohp203SNXmPwX0jfdA8h8w1jww
	 1b3RvkBTCZfZzHt+OfaB3IU55MvZyHOazFqR2xAF2BhtXrQeuosIOJHWIjuqxIk/Hz
	 EVmLQRYPeshqsrAK7wLgOA5PdtZKoBsXErkF+y0LDImaQ/BamsynmK1xoRrji/hG9a
	 Lzyx1abVuS7vZox5vKTycxn2zXJxmqHFOcNYyTEqVMhYSUnuBA6oVU+NGPusQEb/yh
	 BFzMzUPIBjVR95QaZcbuvN3BFxG/YxTI+7H3mY/utQ8C2GS/dZ5IrmnTkUlkrCuIbm
	 ix2VsQ6pbS0Cg==
Date: Tue, 10 Jun 2025 16:29:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: serial: renesas,rsci: Document RZ/N2H
 support
Message-ID: <20250610-scenic-primary-1dcc3d7fca20@spud>
References: <20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HmWQajhFgxFlmDaU"
Content-Disposition: inline
In-Reply-To: <20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--HmWQajhFgxFlmDaU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 08:23:44PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add documentation for the serial communication interface (RSCI) found on
> the Renesas RZ/N2H (R9A09G087) SoC. The RSCI IP on this SoC is identical
> to that on the RZ/T2H (R9A09G077) SoC. Therefore, "renesas,r9a09g077-rsci"
> is used as a fallback compatible string for RZ/N2H.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--HmWQajhFgxFlmDaU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhPdQAKCRB4tDGHoIJi
0tV8AQC7gtdOkM7CyA1in1xw/ToVkVEQcqwtjM+M0xAUpTK5fAEAihia99XC7k3W
cT2RxrgiyCEhVf25i3oa0qF6JSLsSQY=
=Hf28
-----END PGP SIGNATURE-----

--HmWQajhFgxFlmDaU--

