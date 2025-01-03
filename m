Return-Path: <linux-renesas-soc+bounces-11837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E0A01025
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 23:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B67618848C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jan 2025 22:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70701C07DF;
	Fri,  3 Jan 2025 22:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dYzPcXUM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A97F1BEF6D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jan 2025 22:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942601; cv=none; b=X97hF91v07lMOPyY4eFQNBdDYIhyYkpUMzf3SDqO65JcYGk3ZjPtviuEgiaGEdkhMbLC6HBqEhJrn5cqVGM7b30FF2P53cJGPW4iCVQBKJM2q0oXLOEwLZ5OIpBrGTEUt/Z4JW/vIEEiVBArQE63RhZavUZL+ioIdSioS5hcRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942601; c=relaxed/simple;
	bh=fQ36u4RBvl7vsyvt0Jy3P02z22WoejyNRPTjgjmI4A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ir+lFZYLgnBmpJHUvjXPf4Dx31ve/IWpU2wIjmwN5wHMMOREiPc+XeVoBZATVnBWjClWA3ZAKNQ8solsXP5Zq1GIIV6/0rtHFBGE+aHGl0hGA5Vne/y24U8Q9bhRJWhITXImh1biDFOqgLc71T9Yvv+JuIEeDrFdE6EeDix5KAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dYzPcXUM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fQ36
	u4RBvl7vsyvt0Jy3P02z22WoejyNRPTjgjmI4A4=; b=dYzPcXUMa3zAaEA+FS07
	NduiAIrSefPkHSqfxN8ygpiAvmxCsnxRGRNlsJgANdk4dsaBd/800eEYI0yTGypS
	jDypMdbiCOU1cvTSuya6s1kH4iJp5egSnKSzILEMJBop18q4jhBdzO7GrnJHM5uW
	q2qrMbDVn4OqDbStWRlMgFBqgmDPOR222vI4taj5n76xt0wJWRnd8aeBlUqeD6eM
	bazoeMaZtK0ggFyY1VgnqdiEZblrCcLTONzDS1Xj6z47/WbSxXXTrBGVAHLYZDLw
	/FBtx95aW2Bu8xVnZrf8SUFWcERqyP1H0//Evta20NE/rI909DazUfLoX1xI3MVn
	2w==
Received: (qmail 1013832 invoked from network); 3 Jan 2025 23:16:36 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jan 2025 23:16:36 +0100
X-UD-Smtp-Session: l3s3148p1@sSPGodQqRp8ujntM
Date: Fri, 3 Jan 2025 23:16:35 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH RFT v2 0/5] i3c: introduce and use generic parity helper
Message-ID: <Z3hhw_pwFAicsEDi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Yury Norov <yury.norov@gmail.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20250103221117bb066057@mail.local>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vWkKxqYQ0LzC93DX"
Content-Disposition: inline
In-Reply-To: <20250103221117bb066057@mail.local>


--vWkKxqYQ0LzC93DX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'll apply the series once you get some agreement on the function name.

Thanks!

As said in that thread, the function name has already been changed in v2
to the liking of the bitmap.h maintainer (Rasmus) [1]. He has not
responded to this series yet, though.

[1] https://lore.kernel.org/r/CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com


--vWkKxqYQ0LzC93DX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd4Yb8ACgkQFA3kzBSg
KbZYjA//elZOLLgLgNAi1ekQ9sJ5IvZL47Vbkvlg8eOFGCNZ4q6JhUt/jZ0bW1Yr
Oz8+UY8leDLTJPHteFiy84/VDqihax6tge4EoEt87bSHu8UI90BWCGhaVf4ndpsa
pt6KdKGHIPbOjKdbeDfLKy7oP8UWe5jnFgmMGHr9iLcAYR+T6TW4NtI9jrD1kWCl
/hr1iIHZFAY10IxLd1HbX3T1RMBH+fLjoYvvStj7mFZMSUcl9ya8uvgrgpyIa9SL
SGDgCRR1CbQoY0zldNWTP9n5wFX7BMV/R+ITF1P5v3qHIdw0Q3i2L/CtAegNuaIp
0GZE5wyNn4GjAZuRlGbrqxB5ykEkPUketdkHkjWmk4sRRxuHoPSSNH+z1vHHR+CE
skyKlP+Z2DvwSosz8jVRnKU5YqymGyRaFPp3WijQlcMTa7D57gYyNXYpuEWAkPya
x5vakd+6UxlbWFWxxo/0MAzkaSH5Q0tfRGMhx9Cu0CLcSNKt09gVNN60RVMq4udz
Sbug0DEa53ubXFV+5X1VLI2+KljA/TlHsSDSL2HsyiZcaYhOaN9IbK9y4Ov4vMMZ
fW8Y4jFMU9tN8r3vsc/l63236r6jY8aTwWJVurTNP8zPxE+jEtqnoVHJIo+nOYZm
etaHLqqrP82WU/SfmPoOUxe4zV0zb3/238DEcyECUa0Hq1afSp8=
=XizP
-----END PGP SIGNATURE-----

--vWkKxqYQ0LzC93DX--

