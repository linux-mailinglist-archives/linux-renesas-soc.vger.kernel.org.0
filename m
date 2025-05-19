Return-Path: <linux-renesas-soc+bounces-17203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35CABC133
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 16:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 453A27A0DE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 14:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C08C28467D;
	Mon, 19 May 2025 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UvrGl7XH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7549028467C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665908; cv=none; b=CNWzH4yFVKLXAM3YDUXNjC01G37qFn0KAbkMtNRfr7yhYc3C8n0LzJ0l3uNf/U0F9bruFoZcJQV/GqTdTO5zkXsCPYi2zz00XJWzzKrmqsJa/45p+llSB51uPwgUDUI9184eCw1xTk+BYzrnwdMyj6njZRDXbN6o0Mr2cwUGqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665908; c=relaxed/simple;
	bh=ioJXm62yoFFrD2gMuuCt++oD2k8drTf5sFviE5Caka8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfjcVbAWyqhWxoWZnsYUa5cLoROtflutADZkAjd54mKAlC050hYlpQc0inpZSdYcLQy9Fc5XCtsoohiSfvjhoTVXfU3z/TLlvbS/dBkoFD3mLWHDWkOr1M6WsgPd0Won+PIG0rndGbIPd9gn2F48CmOyTjTfLI4bGYYp57xFX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UvrGl7XH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UrmW
	eUmLByyoivKUnjW0HYxeJNUjIXdEBolOtGcXn28=; b=UvrGl7XHCWhHVGmfw0ZZ
	eJlzTB01m5VNbLVZcUgDRODfrkbJGsivp7nJsTbVcq4HWE0TZe4LGWUgaDc/uYgJ
	6yGmH6tjW7Es4BOpLZVJuKU/Vs0Eiq++RvqtAaFx9TUI4Jx1x2ed5MKPH5FgZG3n
	AiVF+BfCmVkDSKUobDjmxkz3wKJ9KcRk25+JaQm8EqWnVN55a35qyq8q5xNV/lrL
	LvEPibqXamG5KT37cXN7BmvdBXEfrYIOxFtZFkt8X81NOc7AHtMQXcD+ApnWFlQy
	dcAwZf7ppV175f3sqsMkw3/GIm7enOWK3g3MIhyXvmEwCUyd6erKknOwGH8Eh07U
	lA==
Received: (qmail 2526168 invoked from network); 19 May 2025 16:45:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 16:45:01 +0200
X-UD-Smtp-Session: l3s3148p1@v7AuLX41Ao1Zz6uL
Date: Mon, 19 May 2025 16:45:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCtD7BH5N_uPGkq7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F3FdI+VratxAxGc4"
Content-Disposition: inline
In-Reply-To: <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>


--F3FdI+VratxAxGc4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You did not paste the warning in commit msg, so I don't know the
> rationale, but at first glance this is not correct. "-0" is the
> preferred suffix. "0" is not.

Here is an example:

.../Kernel/linux/arch/arm/boot/dts/microchip/usb_a9g20.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#


--F3FdI+VratxAxGc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrQ+gACgkQFA3kzBSg
KbZ+0w//fJN6gr8h255gSX5XlD0NasDlY/nwsFPA7mhKJRNT8ilrz2kqXp0QhkXp
g9zenBViHaEvMNSRvWWvD/BgYkIelK64OfDlXizr1Fzyy61N8drRWbJvQYgSfDrb
elymxNHWClKUNyBLYY94YJivMXnDXPT/RqTto3MNjSEHEVHVxJ8LS0NyOU7y+B+/
rk05XLraVxvwZQxIi4Z+jb+eIMsp+RO3sPyi+pjbACjG6F0KmF+v7JaIFygU0MEb
N7d9f99FkkHOa0CR6vHwgOzryISIssFy7l8dXYxw+TONJOTW3Yr+kYnN3HqOVKE9
H5Ti1DOmZCtcLq8A+DJmKQmGmVIs1NSBmO1E/Bk3xIYKvgVqdvcDzDrYLgpaAXtR
dKfZmaaow07S36ZmPqKmznli22qpk1ahXoPpku+YAZ0Prb9LomU3QLDSkOst22k9
QWcdET2ypyYfUhRicR2z+b4ec1c0kLngDidCyQ78sZivAgmCMGIi1zzGMxGsmUKW
dxXYpkNic8iwKPQglW+QdykN9sHoncEUm9DFPfMXkQRuuxYAhMDPmPbeOGU8V0Am
A5Vtx7qrmmTLhh5Urs+mGsGaUTeZAaQ51Np3TOX3JmYD5NwUoFr1J5f8cOJ0PE/W
VZzVluKAq4dXR1bguNmwDEib/gqGt4MW7DZqSwdCQ8qdc7s8Tqs=
=l7oR
-----END PGP SIGNATURE-----

--F3FdI+VratxAxGc4--

