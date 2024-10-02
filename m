Return-Path: <linux-renesas-soc+bounces-9298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5C698CE39
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 09:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF771C20A09
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 07:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5B1946C9;
	Wed,  2 Oct 2024 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eX+xGmed"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093351946B1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Oct 2024 07:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727855822; cv=none; b=dUiWQusce+RSSBQLCTychYHiPl1XR2IbJpTTGur61Fx34lZcLbxtX7/m8cVjBAQ6nfdaAUeUEbjjOO+jE6EO6QrdC2VGL8tTXdeIhlOOuhinqPhtOiPpr4sHr+wj5CTV7ldZKUwDcgaBv959V+lV31V6lJVPfPjKi1g3rHsAtcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727855822; c=relaxed/simple;
	bh=J+7Sl/URdHcMV40EtgLByltqrysN7Fydu+LS7gR76Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1laL/qKuajxImEvfKpW18wWoRfE8tSIoDh4b/cHFK7G/ahNRF+s58OxCKyiopsIK1RwqrmUrhs3llcoSIQ2MnlKYXi3KnnRkmIN7rz3H7K8Kjli3iCaP2M3HjbfdZPlDcdKP1d9IxZvtBqWb+XDokF9K7aJoVVzasK/9R2NA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eX+xGmed; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=29cB
	vmo6x0A4d3ahPQtmA55H1bcUgnjda5SGHPHGg4I=; b=eX+xGmedFCcA447B5+LR
	QRqu8MGaNs+871o4s/foHrBm59QjTYBfrUVSURjObZc3PceJHSldnQwJfUGiGQXf
	vpkHGncENZz7OGTGslJTnHb4e1P4FUdAxV8CYmBxq+5R1EwlX+EKG/n+75YUsKqY
	2lqgXit0We5P4izBdthTnycUh4Hob0xd6mHtl+juQOEtr2cbF8JmrCcO9rUrutrD
	AxRJfAPRXmMj3osz1wE/SdF5YyixcGiPdwY/SgtooJnfkAEeOHUgiX1djp6ZStgx
	hB9Ibd44U5CQfCKRvmFSGqTnpD0CgfjD80NJOyx4//Jv9BMGTzbI4YsgdtInVBEm
	Pg==
Received: (qmail 2780191 invoked from network); 2 Oct 2024 09:56:56 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2024 09:56:56 +0200
X-UD-Smtp-Session: l3s3148p1@RwIlyHkjYrsujnuV
Date: Wed, 2 Oct 2024 09:56:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Deprecate
 renesas,enable-gpio
Message-ID: <Zvz8yA4sIKpKP8eD@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <cover.1727853953.git.geert+renesas@glider.be>
 <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I8HZsTejYT1Kx6Tu"
Content-Disposition: inline
In-Reply-To: <e9cf476ffac794bad7b0860dc89afd62a9ebc812.1727853953.git.geert+renesas@glider.be>


--I8HZsTejYT1Kx6Tu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +  renesas,enable-gpios:

Isn't this a good occasion to drop the "renesas"-prefix? Binding docs
are full of plain "enable-gpios".


--I8HZsTejYT1Kx6Tu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb8/McACgkQFA3kzBSg
KbYymhAAodjF/wppQLY0dF+kPLukm3002cCkz5UncwTPUPy7C3H0FB3ekLz7mlq1
GXiPUOm9QY2vcQhZcWFWfdt5xWr+YA3DjLasQdleShyaisphxpymcGPkYCF/4xhF
bXZ0yJNqYxtEONaRdyPnJKc3Q0KW8rbBKm6v5g2n/5DymUf+Go5d11WNAV0HUt6A
UWuaFLcwXhoYeJZ30DCkUBfJRuh048q0FIQPHKHoh0at7GIlbEmD+1Zza4SrGGir
iH9GEMAoNlxgDfumAIadvhGZWpmencDPnUUhKXxvB0HdXXNuYNHkrCA9v/kQjw5+
fdIm4uKkxDZ0YJEyjmrbg0YtEffV7hUtHXv8ARF0JhjQOkdT99sv0APGYz8Z/lTg
+WeI0ovhIyCzWz0NqBai1jMwvAanXVFJXYr2ZS8+Qas8Mx0CyIUtrOSntR27tn6t
LGCzprLsNvYAvBdYFaTliZZbte4MuUMMlTjlgGbmjOlUHF8+JolKhc70IlxpWjcF
S3IKeYix//qqPYrX+Y8FrN3eWBCwREa9LFrbivdI6RJUKu5Viygja2clkRd0e4eh
tIKWKlAshbc6zJnrcydDn2HFwO6TKTkA4AzxzN4oZFAArQGpxBm+4zmk6bMzAYiK
lTiPWyBJr27PWyJ8wgIqER6mC/HkImsbbaCd8MCP0hb2kRGwv+k=
=zijr
-----END PGP SIGNATURE-----

--I8HZsTejYT1Kx6Tu--

