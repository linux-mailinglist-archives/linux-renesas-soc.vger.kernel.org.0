Return-Path: <linux-renesas-soc+bounces-14566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6AA66F70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 10:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AF3D19A323F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 09:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448D12063EE;
	Tue, 18 Mar 2025 09:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ya5yv8p/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57298205AD1
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 09:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742289190; cv=none; b=IzqyyaIIQhoORlCiCuG7Z48RFheN7D0ZGrCYwRHSeYbUV8EO8PtCqi8RZUMCLxVFGpIOzWRJwHNeEpEbL2oMJqH7mtOmDqAI+9pXF4BS8oiy/s8xW3NSRHPFgtePbXEzF33ID95CzspEGAlyriVw/yWBstFkwQX/TcrQm8zBXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742289190; c=relaxed/simple;
	bh=6HCFNoHrIyQQR1kjMBxmEiA+dOjNmjizJIoZbY1eT6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwBPuOpWY2TbrkfW0XRp4xwtborXmODgJqvZS8pWu3aMzR+kV3E/kT9dcxlEFi5b0VcqzOfLB1jbFSm7GRIX0sabykEA6LpFfpb09I9ajsplQIFtry9x4naMmgdgGnEw3wbMiA2v2KLwIGDApA3vwnF8DvdLR1g9fyKWomfgh0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ya5yv8p/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6HCF
	NoHrIyQQR1kjMBxmEiA+dOjNmjizJIoZbY1eT6o=; b=Ya5yv8p/L4heQ9+oS9ll
	xgjmkywnvqmSM58QEniQuxSOQbYXiIwJiN2m/7EcBuRxXRs5dGgjSSdE3zskJWOK
	lIWh03Jz/D5C0PFM3CmqIVTkrk8IlVKzXGMZsMU932e/9Of47cQpJVkp0F3eSX6J
	oYXuuHA0WRnaGWJyYUfPbL7i1tyxrsgn9LzcnzF8rIF73wguJxKNMsj16cl9c5E9
	EG/tXXH1qONVUMHqR8hQiJTLowSKs7CFrh06a6KjxPQJTVpm2CdMystHypt+UzOz
	Hch//chgQcFOSUedyuTP9yNfwkThdmJQRfl0FChbc9xChhYbP9hF0nH8Q9g96uXu
	xQ==
Received: (qmail 3661216 invoked from network); 18 Mar 2025 10:13:06 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Mar 2025 10:13:06 +0100
X-UD-Smtp-Session: l3s3148p1@X8oHUJowvKAgAwDPXyTHAJp038nK7dx+
Date: Tue, 18 Mar 2025 10:13:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] misc: eeprom/idt_89hpesx: use per-client debugfs
 directory
Message-ID: <Z9k5IZcAdH4t98rS@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250318085727.20748-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x775fJXfQV1D7bZM"
Content-Disposition: inline
In-Reply-To: <20250318085727.20748-2-wsa+renesas@sang-engineering.com>


--x775fJXfQV1D7bZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 09:57:28AM +0100, Wolfram Sang wrote:
> The I2C core now provides a debugfs entry for each client. Let this
> driver use it instead of the custom directory.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This is build tested only, I should have marked the patch RFT.


--x775fJXfQV1D7bZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfZOSEACgkQFA3kzBSg
KbaiRA//bERMPPq+yu/RYDgHdcmKMzltk25BoOgBup1Y101v3TNaqgZtK1o6UCCX
y0uVV6eNXuDYdCt9omwa0PGWwH1TZuJBw8Ck8nEcw09G68KoFedzI7KmVPptnqVJ
P0YkxQqIZrdSXo+3GKKQyDfgQg8ohubXfJBefIZCE1Oq20E16pR0htH9Fu7w0SB4
Knnlbb14MBsBmxd1NoHWEhWBlyuuHiFzMP/ZR31aKXKrnYOBoGC88MJcOrPh8bAE
AGakPRsU+OvO+071Rsp9pobavH4mmjlnK4NC5CxKBnE9rKd/JDyJ+Tqb7HqwdgKj
SURfbHynHBkEZYyiMBemqfHPug1fdjx15ZSvCYGH8QzHOoaNXor39WMTvPHC2mrs
haAS827xjrHOV/Tc1U7hlxnpv1NdQhEuey2ULppC/mn/W0prBAlJFVfWMsbi1HP0
QoHbmPszhc+gP4WgKLG2i/0HOChH+BVuxEmrdOsqlbfhjLrt0OIb9/5jDa2SO+sM
LpRNC82OBSBHbkTNmKxhOPy4NfWg6+AmWX0mcodgiXBYmj5lI9SOD/xeE8c44NI/
0hob1gSnl8L62Wn/09fabX/i0rG1PqUoerHlUUhSgLvVZ/WnVgbtZCrJAgjyFyJt
6ukL/u/hFr/T/l+y0sDQfRfC9MezEUp4EH7r2IYTkbN/iPZ2vDw=
=lhqm
-----END PGP SIGNATURE-----

--x775fJXfQV1D7bZM--

