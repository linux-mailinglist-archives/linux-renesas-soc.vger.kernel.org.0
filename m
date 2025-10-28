Return-Path: <linux-renesas-soc+bounces-23725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFCEC13BCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18F6F561B3D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE8D23507B;
	Tue, 28 Oct 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UGO0RhRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3F71B532F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642538; cv=none; b=IGSuyyQh16mVhYUub5RGdbgMwDRgeIECz74wg2lIb1UEGD+uEZelWhOh4HXzDKns9eN2LqJ36cJzs1PZ9X51ooF3Iwlhy/BPaOeE/RUKs9PU17ygROS0KBtrpyVldAnQk4AQV6e8j/9WtcP4sV5GyqutT59ffYy4j+GxvfH0aP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642538; c=relaxed/simple;
	bh=Q7gfpyR9pw/aesaPwY/XBvsj4KBndXYG12dFVFLsjPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNhtPN2ZVt5p9CPynxb0jkY+0NFxQC4BTe5q6KGM7QQ1Yal8YuVo04tFwdzWImCnBDF5CyzQEXFTBV6fjy0Zh6JVHuOmN04/PPHdUyu73p4b0L8XR3vTAQ2sENVgUGC40ZUJrkqQ1rFy9+G0YgGP8KTG0kHwbOymlUn6lSf0sJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UGO0RhRc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kxZn
	ziVP2OB2AZZE3S/rpTYxPoXwwQUs15lEEjZDFVk=; b=UGO0RhRcNUSoXAkAjfDf
	VXiqANoC5/268iZoxV73eJZt6DqoH0TdUuFw9k7eBWoQYop5WRys4TmqIBu+W9jm
	uoYeqxetsd+0q94lF/3BkS1vvIikRh2SGuY8GcItwFRScWjmgGKaBOal2g6++Xkd
	ju8jG6czy7I2UJYx9pVnzMA0dxPGBSbgjr6i8mXG8E7PF21k+8yfJaHqgk64Zdwu
	6HyU4NQ7QZO6G/dWzOH7pTb6vXOaDBU//gLNS/uyxA0upyvWokpGt4IzS9dR2Bte
	8WZkpegXIiCxKOYj/CHGYA4Z4dAB63GJ+5QsbeKKEW9Rpw9pf1EnBkZoP9Ztu1Cg
	Kw==
Received: (qmail 3948718 invoked from network); 28 Oct 2025 10:08:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 10:08:55 +0100
X-UD-Smtp-Session: l3s3148p1@CyaEXTRCgr8ujnsk
Date: Tue, 28 Oct 2025 10:08:54 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-db: use
 interrupt for Micrel PHYs
Message-ID: <aQCIJrKKM34FH3C3@ninjato>
References: <20251001104312.40771-2-wsa+renesas@sang-engineering.com>
 <20251020103529.0f948c67@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OAAcoPccW+8g7sH4"
Content-Disposition: inline
In-Reply-To: <20251020103529.0f948c67@bootlin.com>


--OAAcoPccW+8g7sH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Herve,

> This v5 iteration should impact modification done in this RFC.

What do you mean with "impact"? The patch works fine with your v6
series.

Happy hacking,

   Wolfram


--OAAcoPccW+8g7sH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkAiCYACgkQFA3kzBSg
KbY7ng//eqyDRge9CYUCLu9h7Fe5K9Uz/t1IRK9YwlJbN8VfWG81SjhztUuVy1h/
lbkkhGPjuCGSMQWuxjpI3FXrzxG4Ed6ie4oE6lT4zOPOkeBrGdaFBCvBw7L7wG9e
urU0p+2lHTBLrnpFWPBah53JIB4Ry/weBJRaQcdEc00RKk8LbJQP4o9iIBSKl6Dd
qrcSADN/gQ3mnq9tL3MsnH5HNVao9ZPw9S/CHf6pniMiT80ndldEIFeFbnOju3nh
lsYyBAw7EAq1CuwUXuCDos6+SklW5MNWDMB6K1Uo1xLhnOGsmgzJh7eo+kftnY7I
1a0Z7jTbpIG8lqZBbSfekDk96eDjzWpJlhJy8rl66/LQjINo4+YQXBtQ3kWKO0mi
N8DcTF1rIHb7pVGEkR+E9o40QkkZy0fozf9H/nT2yTGFCLG+k+kAqxcDv07lAEX6
AjlCuCYOpfEi1Ss38fDGxHQODozGNubM1LuMtLBLBsvHwJO63zvgPTZVNXFUqIBh
DHQ9+1igA7pdWDboSSxHEvrw21sI9IG/rp4wrl30PIfTyiYkmDH79z8CBz14wypo
q8VKcOozE1BN0Kd70mXCqDzvq2PMKYNc0BtN41ZuXIpE4HqJWlftgQi6GwSs6d1c
UEXSfXG+rGvhbFEroBPGMsb2Y0gyZeEVJ+vTHVC69EaFnMB/tbc=
=PXr7
-----END PGP SIGNATURE-----

--OAAcoPccW+8g7sH4--

