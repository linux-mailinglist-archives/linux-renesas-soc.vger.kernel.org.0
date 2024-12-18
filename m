Return-Path: <linux-renesas-soc+bounces-11510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A269F5F1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 937E8168CAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 07:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BD815625A;
	Wed, 18 Dec 2024 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MTiALRME"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DE01553BC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 07:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506357; cv=none; b=UaDn8odQjlmegVjZDeWN4UXaomVggn7F0n+LyXD/QBAocqJJ9Ni41AeYgVFhBpvIr61Na/Z6Q2e7+2Kp0hNr6TLpr7isKyU4gulTLe5rsxB16DRf7pDcXiUO2pBBBiUoEmhP6ppyyaSsLNmnLPi8fwfU7w9gJvnqLD1b3Aa30b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506357; c=relaxed/simple;
	bh=xeiVg1VgdswMkCM5FP1I7NzFz+gdW4vVcM5e4xx9a7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ePYmwPsQFHdfNQvyXA3W6n77k2t75LXW9s9Bmx6m6qbZZKB+euxcOCXAQav/H0b8HDTx8b1KQhEKOuEu232t6hqKcFGyK6FcQxLuFBXlRBDWZqtaPhyl19JeVUh6qpRwH3fuxABS3OLaR7RpMKlauRBljSJ6CF93r1EGocoGEAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MTiALRME; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xeiV
	g1VgdswMkCM5FP1I7NzFz+gdW4vVcM5e4xx9a7s=; b=MTiALRMELXCSDMySwJEE
	qUrw7Sbypufbwo6aiwAdzlSBcBmLSLmCUI6QDf33CAypoz65LtUB3tXR0kkdXuM8
	h/SVsZSlpzCOj1UoG/PM0f5M+dogiusD26bPfdKKKmoYuJdk2gzAy3n4KMSSwQRS
	BMlZjybefP+L7btHP5/jBgkkaRX9TrOAkEgHNbTNzhpYBvhuyGTE7Ru39X2htyxp
	UvHAVhickt1cGvG/0Z7HrMwaAKpAHOsBaCxKxaU3+guRo7SkjRiqfzgaGkfscvej
	XuEJrRPsBAbxMohBuqa56jUWmvcWhipucDL4FfvL+bO+CFlYyZssV27lKxUrQlkh
	PA==
Received: (qmail 196578 invoked from network); 18 Dec 2024 08:19:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 08:19:05 +0100
X-UD-Smtp-Session: l3s3148p1@W6KMOoYpVJMujnsY
Date: Wed, 18 Dec 2024 08:19:04 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add NXP P3T1755 sensor
Message-ID: <Z2J3aPGYpBs1awFf@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor@kernel.org>, linux-renesas-soc@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
 <20241217120304.32950-5-wsa+renesas@sang-engineering.com>
 <20241217-pursuable-trustable-23678e5e4a86@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K2mrlFPF+aUvFWNp"
Content-Disposition: inline
In-Reply-To: <20241217-pursuable-trustable-23678e5e4a86@spud>


--K2mrlFPF+aUvFWNp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Commit body is entirely missing? What differentiates this device from
> the others in the file?

Okay, will add this info.


--K2mrlFPF+aUvFWNp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdid2gACgkQFA3kzBSg
KbZmTw//XbhcOg28nbZJiVqlemQMjtB08XQsIGxc6YjTTsEyobmz+OObjs9EwCAL
Jcul7j2AgyLCLdFWlIIwe0o+z5veGaWotZYCwQpIdSaoXA2amvCDHOtdQXMa5tEQ
wHigkyighChZz70gzoxBuVTsUQ7mKLpNzRaBe6pIsCbzfhrMdBA2dbqlSQDl+93m
NJ8Anj0TfBz2S/Mpf4hK5htpOYHIwyBRc2FEjqRsxPq6aQssT9VhvbiNKuiE75tH
22gi3IRItEz/hNMjc8hVn3oAcg/fCwST6AuHCLbGHkndoTfQ09vrNy+DCke5r/ly
0ZzkcuoXfR5wiHb9xGSN2C3mlHnd1UWc9Moc7K6Huev+cfB9KU+Boj6vk5vYXiYL
0zhc4FDlxPqpbUi6JKbF3Ifp3K6d7JRZ+b85HURdnW4ZkzvuCKV8yvv0ByV6syLA
EfO46isKkLE6Nmh9is+PI+SMbgRJmFpjeld3WFYzVfhGsrIeGAGB12IGXypq1vg3
g3I5UM98G+DWqjUJMjTEibigpYcDE0VLEXbQtPESwr8PzrggPthexjnMyJGIVnv6
IAIjIsYxCl9KglqVFYJhZ6CdyKIrVTxECtHpcoFB2f5At4DDas0rqlYoiGhu9Dk+
yJYtQDZBwCnP9syQireKFSYPEyKpCHTXcXh2UHGj26ExpdkrC9Y=
=tr+g
-----END PGP SIGNATURE-----

--K2mrlFPF+aUvFWNp--

