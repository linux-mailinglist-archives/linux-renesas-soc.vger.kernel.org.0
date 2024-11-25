Return-Path: <linux-renesas-soc+bounces-10683-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCBB9D8C75
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 19:51:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2075E16A824
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2024 18:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749A41B87FC;
	Mon, 25 Nov 2024 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWZ1NxSS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9A1AF0CB;
	Mon, 25 Nov 2024 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732560664; cv=none; b=ky4rLDKANLNNSUS2zZvDMsL+4vvrTAnxfUUOnHW6JCyZN1XXJiDtEjSQOy/U80gtvs0vvsogIR84vd07jWFgO1PGUmk4Y8R/omwiudwbafj8Yh2C/jrqqr5oPN/ODIEdr5qgaWwFVjlzvvxxWn/LIWA6BnmK7hLgpGc/lLazVQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732560664; c=relaxed/simple;
	bh=uY0pXsQaVdcCrBZgW210jEd2AjTKJ2oEZwRc9gu+FXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdtgvNHu/jZaDlCOvCRJggRwQUY+mBVxXJnYxDyFuH3a7Zh9a/ojVuD1Xj66U2mebhKYHMQ6Hj0gQL3lKNE2XlTrSJGlahXDhzd67ol3AuW517Dyv8wbXTulSkAA5p18Wq9kLhO8XOAb3oCtrkejTGsPvC9CzYBzhyHDcsViwwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWZ1NxSS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A0BC4CECE;
	Mon, 25 Nov 2024 18:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732560663;
	bh=uY0pXsQaVdcCrBZgW210jEd2AjTKJ2oEZwRc9gu+FXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GWZ1NxSS9BMUzonxxLaX9nW/stfZtQ1qOU5P6/38nHJIav3FeVmGCHTaiquXh6Iaz
	 bTFLkLckDVBgpXt8WakDjRI7cfrNbxWnqqharYMXG51mcqpTWbeyNkbxZ1orGkHdpf
	 pQofC3T7O4UDO6sHM6LTJE20HJ386PjKd4z+0Vyz75hVzVNzI/VacjIVrsxdtWtHxn
	 G/oC9D1aw76LXVOuXzphFtkTGcKMUk1EYAMmdV4h1yeo3m4rRA/dK4COgMXH93cKkE
	 crH/sRCEiZP1vSdmX6jimw86ydadyKXgLj2MM4P8YnfTLi/kvj2KmChEWfxfl7l/Xc
	 lbM+jl5MYCIvQ==
Date: Mon, 25 Nov 2024 18:50:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: serial: renesas: Document RZ/G3E
 (r9a09g047) scif
Message-ID: <20241125-exfoliate-seventh-2b2a6c7d189d@spud>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QE3t0M+FoEU3AQlN"
Content-Disposition: inline
In-Reply-To: <20241122124558.149827-2-biju.das.jz@bp.renesas.com>


--QE3t0M+FoEU3AQlN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2024 at 12:45:37PM +0000, Biju Das wrote:
> Document scif bindings for the Renesas RZ/G3E (a.k.a r9a09g047) SoC.
> SCIF interface in Renesas RZ/G3E is similar to the one available in
> RZ/V2H.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--QE3t0M+FoEU3AQlN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0THEwAKCRB4tDGHoIJi
0jSiAQC6DJ7Hl2ThbVm2585g5FPEpePXgveHUJQImz5HtJPDuAEA3nxlwFl+0bau
7G92XuItZPTpWmfQjSTHwpwm0n6zQgg=
=wQ4R
-----END PGP SIGNATURE-----

--QE3t0M+FoEU3AQlN--

