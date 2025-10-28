Return-Path: <linux-renesas-soc+bounces-23724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FCBC13B7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3531882F11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D5A2F5301;
	Tue, 28 Oct 2025 09:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S0eW/f9U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4274D2EB5CE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642444; cv=none; b=PUjBmx6gQ0xyz/CA7iFaFt4jWArx+uzQ9q4jpZl58/zJfGFLsuorNxkYzk4/3sSraDdsdcYpD3n5jHWRdrCl8+SyaFEYnxaXJCGjlKBndxW/wKpIxjB8bIeSkV0ToxH4IMMAS5aLjTaaemfJpfsJVYbsudcBU/zqe9wwp64xN/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642444; c=relaxed/simple;
	bh=ogfGDK7FerH6aANEa3sajifcX5aOLqxXa6oDsjUzPAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNIZXsxgoDjUQFMSHgxD2K2CuBE47k8nIZbUW4ufHgQIlU+01B9olVPiCNTIfhpLhvGr/lWuuznsbpQ27+CmT6ebXCuTbhVU05JmzASXHkVh6VwiMhFu3ruC+zI74TQVFtEMxVPqD/6oeHK7dHG5c6FHfsrpiKIOsD6Gaxx3IiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S0eW/f9U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ogfG
	DK7FerH6aANEa3sajifcX5aOLqxXa6oDsjUzPAQ=; b=S0eW/f9U4hJ5dD0lE4im
	BSwSGulkov/dZL9IHAMq1BQJ211SPZ9GzaSVLVQ/EMIXlPA7NQBnJDMjTE7IXmJ9
	KoD5YGHkLc+4b+xruIa5aaMOkoT2zMxZf75ka+D/ImgUswxEh48cwVp+vOrrzrIo
	LKrX/BDcdvUAh1/FxGGVWRW8tHYRB6Zd4dgKS9Mv6VGTOLBYdYXSOUdx83OgPGiF
	N8DOsSRWl7nR9d0oTTcwPr7mDDd/V9Ah1RLHODaJthoPQcsN8lHoxqZ3DhnlOBn/
	Xb2KKxFXTy8vNk9Ci51ERHMsyBQFngZm0bdx+jTeKFGoCcPB2ws1vxQxI8Xmqf+D
	kQ==
Received: (qmail 3948069 invoked from network); 28 Oct 2025 10:07:18 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 10:07:18 +0100
X-UD-Smtp-Session: l3s3148p1@wUe4VzRCtuQujnsk
Date: Tue, 28 Oct 2025 10:07:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v6 8/8] ARM: dts: r9a06g032: Add support for GPIO
 interrupts
Message-ID: <aQCHxTeP6M94oo7B@ninjato>
References: <20251027123601.77216-1-herve.codina@bootlin.com>
 <20251027123601.77216-9-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QxPk/9fThloBmEh/"
Content-Disposition: inline
In-Reply-To: <20251027123601.77216-9-herve.codina@bootlin.com>


--QxPk/9fThloBmEh/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 01:36:00PM +0100, Herve Codina (Schneider Electric)=
 wrote:
> In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
> Interrupt Multiplexer.
>=20
> Add the multiplexer node and connect GPIO interrupt lines to the
> multiplexer.
>=20
> The interrupt-map available in the multiplexer node has to be updated in
> dts files depending on the GPIO usage. Indeed, the usage of an interrupt
> for a GPIO is board dependent.
>=20
> Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
> output interrupt).
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--QxPk/9fThloBmEh/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkAh8UACgkQFA3kzBSg
Kbb3UxAAkKPTJ+QMFlgkn2kIIoOvsRAtxJDgb4wfu0pyjlAu3xihs6hvh9rwSQSE
RTzbRuZAC5gQBK0SLkZwogHQEsC+xw2h5bo/n/1M8SzGEtYvr0DEYF9Gi9Vr0dlp
1M4aX3mm8M7VMsX7bOiZ+DcdEs0UGvVXiWEdRfpb/zv2IS8P9rfusreydtHk5jFE
00UtRFPqr04FBizidV2qGysuTSZgfIV/oEf6xWZCfUwMyGZn+RFmqYyG+9XwcwzX
gi52wkiSMaxodl44SvgDnPgDD3HcMh6kdvzPDTY1/Lm1lw7rrBM3Jleg697ScNWK
quwakJnUik6gFbjNQo7NR+dM7iqU7GzhhSnSWwJTjrBc36omX0BIM7lPFpAPTnqV
7w/ie+5MkxvLt0QqFY36/vmoygcd8XoCR0CuFiyPJc2N4LcbFwVA5PrVqtkN1H0C
C/R0p0p1hq/Ckd3+C8vhxCnebBdB6XnUUvSmKgDz5wtRdyyg6czo0f+CnALbIQJo
TYdt2EqjsnqjrUsu8mo/M0SHKnq0TrKlP//PvRzNB86x7XNjpAmOQIggDruuXrbc
XPuDY6f66FpuiK2zBRjGk/X3qznlV6T9CBnGGKEkWuNJwXPqp1q9O6Ir2yq8AAEy
uNXg1Oi6lmwd1EwbA5Z+nD+FUbc3u0r9EdkZ4CVa9yELUROR92Q=
=t4W6
-----END PGP SIGNATURE-----

--QxPk/9fThloBmEh/--

