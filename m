Return-Path: <linux-renesas-soc+bounces-11511-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC189F5F30
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 265DB168E2C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 07:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4350315625A;
	Wed, 18 Dec 2024 07:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ztq1AKLi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7CA155C83
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506573; cv=none; b=mneb782kG6pr4g2hEjboK6gr9prY7W62Jh+FLZlpOweqJgAnUg5FhvzWs43KJfoqFoAVFeYFrNRTWqDUhhI9+AeirwUu9giLDfncQPC5ZODL09ZfXfw1+/Y+Ggs4dAe3KQ0RJfNjyVN2pU0ZFFJEw/heHr3pBCgFRmMmXzX/AR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506573; c=relaxed/simple;
	bh=X9hOza4Vogg+RXz9pDCpzX2Ei4MOGftH4UVliYlo1pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCPhMRPM/TUnd9eazbAGD+AJ5+12M48DdQDnoQyUGsV6zlPnjxLycrHiKS5KSK/ngCGtdq7Dn3fDibCJqx8VCAQfEyADDkaD8He33BKfzEBzKITH8/ImSyb4BtNd0xsG3bNWbgxd4gmSbDi9KW/VL83xOR3MeRQUxla9l10Y70A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ztq1AKLi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=X9hO
	za4Vogg+RXz9pDCpzX2Ei4MOGftH4UVliYlo1pk=; b=Ztq1AKLicUGR0G/js1vC
	JRDe4/wToAPeaFaMv1hU5SGWg8E/9qJc/ntwV5YesdE41HcN5arlnp0HKYv9e083
	Ui5iJSALT6mPuygiB0FYDOIUh0hTwNn562j824pPsHK8tOsohjjpMYrMBMuIlrqx
	pqm2NpoUfSp27jbLDLlqJ8aT45X//VBv/Zy+oSGJXnqpGFVgw0NbWvf4AAX254yO
	av/fFkdewNvfK37/imkj/dp5GU166iTrgfgi+08Y71KW6CaZ1NHhp/7T3GyisA1+
	J+b5RkX0RVNren7d9uYosiLFo+vhgPW2Cirf78KhWfdLw2b8h0solr7CRzBjg96A
	EA==
Received: (qmail 198041 invoked from network); 18 Dec 2024 08:22:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 08:22:49 +0100
X-UD-Smtp-Session: l3s3148p1@zHPpR4YpWMQujnsY
Date: Wed, 18 Dec 2024 08:22:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm75) Add NXP P3T1755 support
Message-ID: <Z2J4Sa4xrTAbDS8F@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
 <20241217120304.32950-6-wsa+renesas@sang-engineering.com>
 <f624f683-d240-4384-87b9-2576bbc611a2@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GCdCgwpDqRPySpOc"
Content-Disposition: inline
In-Reply-To: <f624f683-d240-4384-87b9-2576bbc611a2@roeck-us.net>


--GCdCgwpDqRPySpOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Technically that should describe the patch, not how you tested it.

I will modify it.

> Anyway, can you send me a register dump for this chip ? I'd like to
> add it to my module test scripts.

Sure thing. What format? Plain hex values in ASCII?


--GCdCgwpDqRPySpOc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdieEgACgkQFA3kzBSg
KbYTNBAAq9klIXCfBw9ncbUFeaNiUWP7G9wzVlfrsw6XURZ7nntoKyHaYWaftoMX
XKYT5jPn9KeN5jtfC9VKegHOZkIX/2Ld4YkqUwQ9ULVsZ98S607z72RVXRRfoKH6
9DRoQsMP2R+V9EnM0zMqo1QGU9pHXh7ikT1YMzO/XlzRDba13FQ0aGzVvelIZDZG
aHb3/IfzT3d3NXqGn5FWNBhfmWAdXHLAPC+SlURoMMmsWIfREzg5B7E5kprbKSP1
jDNV71N0/rHZ2oCql4laRJiAo8dWrg+PEprIehT2RPGNXARPOqtYO4R+s9KP142P
XQBjW04l6hFRK9tJ43qCvkr3Ree9bdCbDfVtdZAKN60mf4be42pnYHGarQArrcYF
c1TtmEPtpFMP70sKbg1YrA7HcB+ga3ugm84norauBEGx1rAR2C1LPgxoyureQkAv
EJ0VD+/YdH8Jvl/AosHXLHFwZ0ZoENKD/0fdj8j6kXFW8Xjc5Sg3matqQ5R4twHu
3Dr1YUr4j3hLBGUhN3lfDrAdP8TnTKrSQIP3LG1tAePCHFhH8X6/NMhEwJIyZ0zU
Ox3dMByZba5R+q7DSlfAy1Ni71YQfTt3uTNR80CMjFvy4Z9cDknqRg/A3HVkdnM7
LlxZ6v6+logcOQCOzV/uT6+Moj/N17MB0cJSmgvFpUwk1yViKYw=
=Cjo7
-----END PGP SIGNATURE-----

--GCdCgwpDqRPySpOc--

