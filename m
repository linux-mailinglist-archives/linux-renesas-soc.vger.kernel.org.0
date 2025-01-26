Return-Path: <linux-renesas-soc+bounces-12510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2747FA1C791
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 12:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78EBB166CA3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA357082A;
	Sun, 26 Jan 2025 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iPz5Pata"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFA63B791
	for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jan 2025 11:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737891970; cv=none; b=C+KM/akR+JNjZ1a4c3rFlgyWDb0xD74HX/hLO+khkps7mJZZbL2qRY0V5L1TuyIaoYsjVfC9yx391X/xfrgWpVXDQISQJdDvMRLogfmNrRr1C6tOId+LYAfJUuZo+LOvn2Ui6EEXxDCDYIdGoz7q3jfL/UDUXejtMqjvXRyZpvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737891970; c=relaxed/simple;
	bh=QPKGoLMUSl8mVVX9P3WsnR/Q98/KaA3tmLHc37JnLvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQDegtQ5as4Sz4jq2h627DwgsmFCkLxDH+ja1+h+RZKeVSEk7Eu7iOMZoXFcEU0AUkMNM4wPQp9E0M3/lBU95rdXs469bePHDSA5MMciP1TMp1UCQz6M0eqEr0lprewnih/Nt6H5rp5gv9Oy7hdwXUMPZ2BJ6Eh5g2Nq2VJoAGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iPz5Pata; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=QPKG
	oLMUSl8mVVX9P3WsnR/Q98/KaA3tmLHc37JnLvA=; b=iPz5PatazySgnqKewjQE
	B3wenRUV6SUoKYOEpBsCv7mg/SFyLd2X7rID7LjyrGXmHzQ5LbHbfwBgTu2orUq/
	/X0faxnJX/WZ23eqBlhmmHPePhUDwWC/u5HrHlMzULXV9yQRRnmDDwTiz+cy3JVB
	actj7LjDnewLvgQZNr40hxWL0mzozWuoJkZ8Dy0QsIR8WGp36YSRhITUD9ry5Ued
	wIHzC4pkN6OISisHhGWYxCPY35ZWXVZ+BBe7gdtrCtM9jrS9mkSvS8AlXHf+t6nb
	vObD98/MVQ2XjKIAo5peLUzoT8TjbMM7azQ/b9Hag5SIOoIKEF6F0UEyK/IVqckf
	Mg==
Received: (qmail 4112580 invoked from network); 26 Jan 2025 12:46:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jan 2025 12:46:06 +0100
X-UD-Smtp-Session: l3s3148p1@5JtGgZosHLIujnvm
Date: Sun, 26 Jan 2025 12:46:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
Message-ID: <Z5YgfT1JhhzlLdeD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?utf-8?B?U3BpZcOf?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <3c265d34-9442-495c-a715-be2eab3b37d7@roeck-us.net>
 <6da29214-9ea3-42af-9ec1-7ed5a2da7bfa@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d4jbkN6BPBEPGVnj"
Content-Disposition: inline
In-Reply-To: <6da29214-9ea3-42af-9ec1-7ed5a2da7bfa@roeck-us.net>


--d4jbkN6BPBEPGVnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

> I don't know if my rationale is correct, but the attached patch fixes
> the problem for me.

Ah, yes. I didn't think twice when seeing that the debugfs entry for
adapters is created in i2c_register_adapter(). But, of course, this
function is called from the probe() function of the parent device.

Your patch is definitely one solution, but give me a day to think more
about it...


--d4jbkN6BPBEPGVnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeWIHkACgkQFA3kzBSg
KbbFyQ/+LCAkhmAwJQMMOGcnb05ZKM4wswmrcBhMfj/wIMRx7JvTiy4UD7zYQT62
N5L1YrbumkgNJXKX4XT46gi1uEKptrNhx8766gP8HHhnWnhD4XNaVEOHYB/MND/v
AvMBIpOVuP94EIU8WaDHNQmvgN0DR64sSEpOD9ClaZxVngw7oYWzcBngaqwOkkKq
b96Py+1+8/1a/NH2XqUYa6INa5FTn2ttOYJMOPxlknyRZ1WpURp2wz/Mep3iGUJ0
7RQ8OhHNVe9n6FWlwGm0Hx+saHSlTTv/vdr4lYfSwFMZFMsn0wWWuRHAuivyow3E
dinc/0PiaT9Gxazj5kykEAiVQTsm+Htbdj/httUuGyFEciyt0jO9+vqtG7wSf2aP
nt5rVZL72Xug9T6+mEgeeNVlTDBqByfd79J7aWoBX0llxh5mwlSthTRiibgUdiNu
jLKjIp+ALbp55QvoWO9C4Aa9KFJfdOqhVEIyFytfj4ySL9m2M6xZnnHCBL6oefxj
vFnFbdA5PgGMsd7WOmY+waBpwqmOCoLEsAszPP8bTc+p6TFR+XaU/AED1HyxVwZM
3hz6Dk/wCSrSV/bQ53vk9bg9Vbix5q5qsbGRrzzgUe2twkWrMysiRJvz4IcbIuTA
BVOqaeSAHbI+kgatYxcIYQWpV6l527BLPSqwyTYPG/R2LQ1CxYI=
=pcpS
-----END PGP SIGNATURE-----

--d4jbkN6BPBEPGVnj--

