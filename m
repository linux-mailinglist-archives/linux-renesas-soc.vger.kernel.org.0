Return-Path: <linux-renesas-soc+bounces-21586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 625E9B496EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 19:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728EE1C255EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 17:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD7E312832;
	Mon,  8 Sep 2025 17:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ua8VMQm2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71FB30DD0C;
	Mon,  8 Sep 2025 17:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757352351; cv=none; b=O2gemcsnNrH5hgzAQIGmBXM+FPyYBrG528pmpB1EpBLWNwk1UPm80CeHrWFuKlcXjG1oiqiOfxdkPrFl35jl6EzeEXxcsVGxPrRQU8Mn8lu/tUq2NmztHowCITKAp00I2+fXy+4k0Z2LBrrt4jOY2+5Zb0t50BVWexyV/EPqKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757352351; c=relaxed/simple;
	bh=vZ1M0/j+tol6OkxMr0hlVrmoHe7gz9INi+eTrspZDLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p43FJmTT0SWFSQDxJY1HDw7zAgXpw3LbIdANg0tRri4I/LmKEOHVooS+88Bequ697hZjwlPdnQaAqX7Q7tK7iBv0aZu2KZk+xotosjxgE+yQG/uVEqvW9LLBSNKAKlk7b7bbOpccBb8jYvbB2QFEfjcyvWrksUSQJfpLX0PFa9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ua8VMQm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB2AC4CEF1;
	Mon,  8 Sep 2025 17:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757352350;
	bh=vZ1M0/j+tol6OkxMr0hlVrmoHe7gz9INi+eTrspZDLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ua8VMQm28MuAxhVBQeMUZ/kS/mwfNcTKJVtB+tmxhMSSPfmmvYX473fO0xDcXAkUV
	 r3XuAzKa00wPhcEQWFiNdK5DtNogesLL27y5ZE2UEGscjc7/mZYCtvoWsacwfmRaBL
	 dlAQrYL7qHDRArakhLBvrjT/OmLOPp/xoFwcR25OcmHKw10TUdChRjHSlwo9+pIjjz
	 KUre8tIzV8gM2WMrikSXjU+ujqhYtuqywPxz5+DnHgi2yALDG8MJwKzSqBDpjNbVfG
	 RWOKc0ZtU2rdPg85cWhYmn1N4yHWOWL0DdQ7+dscYE9bN9kPKijevMCfQk7SmUZkQn
	 BM6GSz9zfjktw==
Date: Mon, 8 Sep 2025 18:25:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: rpi-panel: Split 7" Raspberry
 Pi 720x1280 v2 binding
Message-ID: <20250908-punisher-doorbell-b616682bc682@spud>
References: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5hG/Mj9q8vHDhMA"
Content-Disposition: inline
In-Reply-To: <20250905191637.147141-1-marek.vasut+renesas@mailbox.org>


--z5hG/Mj9q8vHDhMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 05, 2025 at 09:16:30PM +0200, Marek Vasut wrote:
> The 5" and 7" Raspberry Pi 720x1280 Display 2 MCU is a bit more
> complex than the original Display 1 ATTINY88 and the binding is
> also a bit more demanding. Split the binding into separate file
> and fill in required gpio-controller, #gpio-cells and #pwm-cells
> which must be present for the V2 MCU. Include mention of the 5"
> panel in the description of Display 2, as the 5" panel uses the
> same MCU.
>=20
> Fixes: 6d09c6e474bd ("regulator: dt-bindings: rpi-panel: Add regulator fo=
r 7" Raspberry Pi 720x1280")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--z5hG/Mj9q8vHDhMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaL8RmQAKCRB4tDGHoIJi
0tNSAQDHvTZVxppVac9hVI+YGFCfXJ0VH5h0bbcu57iFtmsfBAEAxIMkY/eVkpPB
xh7DfBxcfZiL8+fcNFfZu5DnY8J4GA4=
=MQSa
-----END PGP SIGNATURE-----

--z5hG/Mj9q8vHDhMA--

