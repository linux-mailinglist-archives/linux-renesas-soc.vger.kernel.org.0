Return-Path: <linux-renesas-soc+bounces-11961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ECAA05C35
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 13:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9ED93A48AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 12:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B47141F9F7D;
	Wed,  8 Jan 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FeH+qqje"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020A1FBE8C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jan 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340978; cv=none; b=joYs8CUQZ9fNlvZEE7WkG7rS/XHnrTdJ+EdRp+Ff9gAr0V6jANLGuIa7QiwddqK+BA8fgkgQhKOxxEoe+CQ5G8qfarNr2qgiU+LEQ0dTg0v/o+ssmHgxZCbq5yUSa8avhAhJgJDYagbKh4SUerFF4KK2JJc6odyEgbbOPxOt2go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340978; c=relaxed/simple;
	bh=8cwn6E6/BQ5Z3XCruuhKDbe6JqWw94aMY9yC8bF2a8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noWGRCNBq2Yt2NHvpWT8n0YUYH+hc37Ts29PMieiJ/zosU//XzDMlnG4JpyvLILZ/cNvBHyTbyeA4Iw1Tsd0Kce5p3Dz0Y7h7RAglRm791FfZhl9JsCr9pXxMqyS2nHgaoYJqi/6HIcrIxwQVSOrKt3tv7++vSghx9c+F4Q8H6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FeH+qqje; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8cwn
	6E6/BQ5Z3XCruuhKDbe6JqWw94aMY9yC8bF2a8E=; b=FeH+qqjeSQDz96p50uqC
	ErEJXc7+5dItFp0GlYk7+LHgxIOfPBj+dJuaIa2NvdWE2PX7sdOeWhabQ+9XdEXs
	wZeFvMDXgpSf4rSSvjbV1fwzhgICA9aj4JZuesZtWEojpMudjtCGG4htE505Zeok
	BD2I1OO0CyuMry6e6DG0l0wDWsH3413ixyhyXu89htITHkARZ8QgQQpQEB0upyoy
	BI0pyf0d9FibQOw/hz78vs51T89BafipbmenSRol3YnWFSo5Wfk8DHdZUpIekLf9
	t3SlKNUDKDoQgfvx5XUosjFEyLSMlOA6XNxSyafyKv3qnWRxKWUzrz/pvB/+Vx9M
	oQ==
Received: (qmail 2576107 invoked from network); 8 Jan 2025 13:56:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Jan 2025 13:56:06 +0100
X-UD-Smtp-Session: l3s3148p1@/hd7YjErpIgujntM
Date: Wed, 8 Jan 2025 13:56:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
Message-ID: <Z3515cBvz3yChGoL@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
 <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
 <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r4mfttq9c2W/MPk0"
Content-Disposition: inline
In-Reply-To: <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>


--r4mfttq9c2W/MPk0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Stable rules allow also cherry picking additional patches. To me picking
> patch 1 and 4 sounds better than an intermediate fix since bug has been here
> from the beginning. IMHO not so urgent than a regression.

Even then, doesn't that mean that the series needs to be applied
upstream first before it can go to stable? How to describe the
dependency commit id otherwise? Either Alexandre adds this when
applying, or some interested party ;) sends a backport request to
stable. Or am I missing something?

> Looks like we have been lucky. First dynamic address is 0x9 and previous
> algorithm gets the same calculated dat_w0 value for at least for the
> addresses 0x9 and 0xa.

Makes sense. Still not too many I3C devices out there...


--r4mfttq9c2W/MPk0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd+deIACgkQFA3kzBSg
Kbam6xAAqV3ZgKWTA4vjFGilGyaNc2uygT4v8V3gvnfv4Omak2REUNovVrVXTIqu
sBP5M+swh1qCYDK4r+xGfw5X/D6luuddODEhbqyBjxY4qSRe9CILwpC78Yu7AGIX
OXsvOlc5jBfqMXgXbbsfJeBfI9eKPycVNuP4OnlSsog+1Z1NaPiFDCQrJtWRrqA/
oDCbPpLgN5juTt92JDQbjnCiLRWGMLj7rUdvN89RHpcVDJw5XRKfsZr8VyGra4Ww
pl1F3WW4H+n/C3BDSc9Ursb0XLK33ELvsmW7EvEerMO5rzkxCDWh6r1HzkL2QJ+h
Dhr1+RCGWDevVw5hBLzXsJlGrzrHTzhyE0ZKYxtez4+2oI96lHGoncKoqJxiyBfF
eAqQRLi6Ymt/3UBWFgruWLy+Jw+oib7rrD+hqXrrGnnJaygGqLQxaqdoMJtiF3rc
x4n2HV1+UwbMVldjlLj95Om5GrR82Y+IwbWebe4WsXdZHITkgW1RsRL91MjX8Pqo
FAJSfzlACCxNA1L3TV7iSAWDmwUEMGraj9xfBqDGt4eRCocClTqqimwqZ0Hiz66a
WaZYL4gJ836CpgGWthl6BDvE+cEQjvDdY93bs9UoZkQ+8g/lIhkQHNjj4TlNTE9i
BvNnncmFWn21BbtalC+ZXRBbhcITBSa90E0UIkP8U7/5/Sx1VBU=
=VaP9
-----END PGP SIGNATURE-----

--r4mfttq9c2W/MPk0--

