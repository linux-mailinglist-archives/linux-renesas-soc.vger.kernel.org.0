Return-Path: <linux-renesas-soc+bounces-11512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C49F5F41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAE74188BDAF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 07:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3860E15852E;
	Wed, 18 Dec 2024 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DlO84F+p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F21552E4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 07:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734506827; cv=none; b=Hr3FzIwpeEkUQ50ZsFuck/8FJR+42KccUf3LM4DN1+3FOpPCyB+qX/SI3Y34Z92Bbuf4hG/jK5MfS2JbYyinHs5IWJxIWux2fqkF0GgSvCFGMKlBHERIK9SUXiEboKkw7qyvfHU1/9rKbh0/GoyqGASmheHi1y0MuOJd3fln/nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734506827; c=relaxed/simple;
	bh=U/SHQAlWnfprMtyGgf8jguMS14NOhpqlbf9makWPm3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyz3jTikvD2317Eqy1kU7HFnvAF5B3VWVdZEJOstOSZb7jgHwv8unOUY9WxN69vqTd38Usi+NjO6Ozquwo9vtfBe0C1nKFMgko42WUfCJMFZvlcUCfVS8YaQ0UJbWytlh52wfhfNJnuUDHmyWcfugSydO8vZFfS7fHq9BeHbYtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DlO84F+p; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Hb1C
	YOgIud5REjouDeWVtS9jSyxX+g9CxLqbsIA5IZc=; b=DlO84F+p7mxwepOjSJ3k
	uWd1YxEMC1VlSCKc6FSoFIqo4YQws3yud1RxZsJY/IH5+olUwz//w0fE6ngU0sQI
	RjqZai+hhUWYi2DoZC/ztcZwOWKHELntOxMCSi2A9Cc8K3dcVmakp8w8uwgSUJdo
	Cheo10pXk2CS9rHA0tcAJxUAb3cHZgdHafJEf2LbqOaxW+Ey253kjspJDHcKWcEp
	hOeTjg9CossriJiLjIuxqY8pWZpHuzsZZL90hLroaye7yGDqHBhQtrqH08oYZuzN
	PwsABdxoTC65y7Jy6tItlPXL9wN/UH752YgpUK3z9jI9pOTUKGD06HQhThpEq8zB
	ag==
Received: (qmail 199469 invoked from network); 18 Dec 2024 08:27:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 08:27:03 +0100
X-UD-Smtp-Session: l3s3148p1@r6MMV4YphsQujnsY
Date: Wed, 18 Dec 2024 08:27:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/2] hwmon: (lm75) Add NXP P3T1755 support
Message-ID: <Z2J5RoFiuyUlZ162@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
 <b30a1b76-cad4-4d53-837f-64a72993d267@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lf1m5Y3dTBl9gRLZ"
Content-Disposition: inline
In-Reply-To: <b30a1b76-cad4-4d53-837f-64a72993d267@roeck-us.net>


--lf1m5Y3dTBl9gRLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Guenter,

> I just sent a RFC/RFT patch converting all chip access code to regmap
> to the hwmon list. This should help with adding I3C support. It would
> be great if you can have a look.

Thanks, this is really awesome! It surely will help me adding I3C
support. I already sketched multiple paths to handle the regmap problem
of config reg being 8 bits while all other are 16 bits. A custom read
callback was also one option I considered. I will check your patch later
today and base my work on top of it.

All the best,

   Wolfram


--lf1m5Y3dTBl9gRLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdieUYACgkQFA3kzBSg
Kba9Iw/6AvnPtw6uS0/dDmvGmcz/t+u/YxyNQGtLQRXEyXOKsMOUZwFWSQ6Cr9c0
Q+4iyHrkn7wVPzKSfIOzvEDasgirj37Av0W6cSHZJXOn6CZu3imgyXb8611v04Ll
C8NVEuUpGm3NyhA/CO1bQGNV/+DlLnWPFJc3j9LM0sIiOteGtC8Tip0MWi2Xd0DT
FUnl5GO3Cjs6Fcji4Wq3ySxYxdokCG1qegbQWbyTEy5patnETbVBIX7Q0D4lu+vU
eBvKHombY1wcrYIvxyRozc7HOfZu/ipo4wg5ZWSUfI6oNlU1qpzyAnFI4vrqwfgM
jJ/39vteyk0QDFxz4ZDx8T4CD32pMLY44MIsdAUm8TSnwgEP3Y7kK8jm2GZyrl1U
FJIY/ibfjggXJjPRPTOEZvgTDOGEpqf0EEs9rHh58r65EPnZj/Fjlti8Jo7JOjHH
ieLL177Ov1HH24/aVFO0G28vmyduCoroyLBRF2Cn6L+l061F9UJ2nFTMbSjlo0gf
VKO42c8xErFQ1Kp59ao0ThqOi1blPCzc8ILncf+1yWlbiL85L5TUyZRVbng5p85I
krpRrymfQ6quDYVkiCRCKX4d51gQzyZQVSveDT6PP//tNW1f7CYfJoozZBUIsJOS
d3VsTKJHz/bMo/4mSWscvUsOB78fx7AY9YTpJYpr0L0h1Jh2rHs=
=1heF
-----END PGP SIGNATURE-----

--lf1m5Y3dTBl9gRLZ--

