Return-Path: <linux-renesas-soc+bounces-11524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755C59F6132
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF8A6163D98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE2417C219;
	Wed, 18 Dec 2024 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WC/7cv3X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E478E198A11
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734513323; cv=none; b=jD6NRVs5UxpbomMRb8uNO2053xceOgdQjeSgBpey9WpU1TWg5ng4tWTL+RfS4lHozSAvWNnnSk8O9tp/6ybxhKECboj5QaBgWPkgKjPv3smyoeD1VGHjOyW2AMo0ipJtxDEe5KOa8HJWdsfLflFgUIVFXTQVcZBNC3jZy/Tq3BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734513323; c=relaxed/simple;
	bh=pG/6aAVLITERfTXNXRN87BUm1lqW2spk0qlcFh3mP4w=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KP7tAWsJfHF+7D9ZxzOjXD/jqBwjX+RGb/8pJ2RmQtIvNOxr3BrbprJniwHLcwbGKfkIOfQ0mhYwIvH42jVivxo3fOFNY3HdQVRI3hoXeV02wBwpiSrBStGw6IBA5x8HpiPovf4SFKjiMabdbvqCRZckfXFJl2/0twT+KcXAoRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WC/7cv3X; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=801I
	FhstDdYic2uUwSOvC210UCZ+2pIvOey5Rvy0avs=; b=WC/7cv3X+xDejQN1gIM4
	z7XBqoa02oxej1I/QY4qcHhTWiQpRi7rMX3n5KLrvHxy0o58Vsi2pu4u3PkyqfCm
	mFZ8mrT4uuzOtOEhwKt1PHcOLDbfT1lr0GXNKg4Npfb8ZJXyvN/XjkvcfHt5P1XW
	lSit15h5Vr0XbO6M7oXtyiyTtHf46nXGJ90Lf4ValpW/tp2KiJVncEeRoFzKfpn8
	mxgzcaogMQaqEwgoDNVzxSEKlCMmM7GeByYkLnEne7NVctmMT1n/vNZOsEj7WF7I
	nlPvi1nbk2IYjtML5i9dEBo20vovBScHKwJ29mrxF4126OUZHQjC21ct4YWOsK0z
	Sg==
Received: (qmail 242350 invoked from network); 18 Dec 2024 10:15:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 10:15:16 +0100
X-UD-Smtp-Session: l3s3148p1@7sIS2ocpCNAujnsY
Date: Wed, 18 Dec 2024 10:15:16 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-renesas-soc@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm75) Add NXP P3T1755 support
Message-ID: <Z2KSpP6Atcu5hYa6@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
 <20241217120304.32950-6-wsa+renesas@sang-engineering.com>
 <f624f683-d240-4384-87b9-2576bbc611a2@roeck-us.net>
 <Z2J4Sa4xrTAbDS8F@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mWEw6+KduwCpWFwC"
Content-Disposition: inline
In-Reply-To: <Z2J4Sa4xrTAbDS8F@shikoro>


--mWEw6+KduwCpWFwC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Sure thing. What format? Plain hex values in ASCII?

Reading registers from the bootloader matches the default values in the
datasheet:

=> i2c md 0x4c 0 2
0000: 12 50    .P
=> i2c md 0x4c 2 2
0002: 4b 00    K.
=> i2c md 0x4c 3 2
0003: 50 00    P.
=> i2c md 0x4c 1 1
0001: 28    (


--mWEw6+KduwCpWFwC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdikqAACgkQFA3kzBSg
KbZXgg/8DIwH4P4j+TEyWNFWUfUaY9eFmuEB33PMHk3AUSAKsX49jTGlAx0QzUzh
KXwqQ5QooeGM56d1OxRmoNB4WQhXPb/LBpvZ7AAyYBngVeB72vQX3KzWHr9m4WhW
BW6lsmpvx+RG/AX3qZzktcjyxko5ITLVmcOQOzcC8x1J6DKDNGIYp4frReQTwoK/
Nd0KVZmpdD1afOntcgrTNvugTJux9LJJoKRnjmP9qD5Akr7NMOvMtpXdynIhsbNW
PmsSoS0GkDf2Tg+NR39R9af0c3CcmcIPLkovJEeTmGRiDHCX2BbtNBWUHzJyal12
y/WJY+qSqGefMGIsHudn4ShBYyOvt4488tK9uGbD/c7x1Iwg+lnx1z/QpQ+UgyDO
3bmhQaCr/ZcVcdXdpsixm6RYH/mVEvpedy4JDJdf5T2skACiycVxkYXze0oE5lqc
0OczafIKNQ4m9FwKBNyms9LrnO9ChtQ9xYP/gzlwMvCdkstvhtkOZ+qHtm/OyImh
XYDuzaZ7pHtnvPgUO2XBRJgvjmtbfzjZ/x1IWCemGIY6xAr0/oe+IzYM7sF4S8HU
R8XdOpW9PD6C/gwc2iRmb2qwW3H/C9BCL6XPyyaSUopoNQIISAlecRxM8K14HrzR
yHD8s2F+r18sGQk2Kr9qNifeI8XKJc1yInjycPxxl2Bbmprdcok=
=yE6Q
-----END PGP SIGNATURE-----

--mWEw6+KduwCpWFwC--

