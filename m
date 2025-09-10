Return-Path: <linux-renesas-soc+bounces-21705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D0EB51545
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 13:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1442A1C82E59
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 11:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490F7405A;
	Wed, 10 Sep 2025 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QKpukNVB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98082773D8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503074; cv=none; b=txXjBt28tdQLHaWDD0leoWk1BlUJyw0yRyG6tUZJMqoqiVXlmAGhbND1Zz7wdzn2rAADTjt/k2vw+aYdWAIvXP6/FbSOJdoXBkbOwogN8GgSrC8pRyNy6eeK9MQq2rI1H9QHHbwVEQ5Q3mv6TTuXh8FhefilNfVpbe5Eu/dPFhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503074; c=relaxed/simple;
	bh=Xtb/sLzI5bW8Bo35Swpy28juwuCbw+RUPfTq/h5670o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=puqwsXirhl/coUuze1CmROep+MQ9/kMbuEhvIV1hCD5oFG+dgaOyOhZ7vzkLsBDqb8zLx3p+1w0Hdxk2MI3k4hRbToaetY2fKY2djHCadUG1ebQ9aMIl6E36homPa0jchD2ZIcRlbn1/3P/lLQF6XIXgMW7lmt9p9lvBUXj5VUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QKpukNVB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Xtb/
	sLzI5bW8Bo35Swpy28juwuCbw+RUPfTq/h5670o=; b=QKpukNVB4TrB18ESciEG
	Y1BK6GL0+tBbE8uORRbGDneKzuh9uGhhKCB2cmtcYXdo9P8URsWJMc5kroXb5xku
	/95y7vKfD28hQkEtqoBh/Zd8sfLN8TbO2uVxbmYomKwcV5SqVdjtrGW+bzktOtCd
	X2QgSDBGKTdKZmcgdCEVmYHwW9khCrPWKve/iYDCm3d11lxgiaSDM7lcQe5Hsdg1
	oiGLbyAZy7qpRc1RpDEaYDh0/xK5QulJ5wYVr5YmkO5CzI5Zb5Wjs7E3xQgR7Iie
	yCeMLOrK7Hb+7wUOPLXU0oljL5YpenVUYrdkagHlXWpXIsb13TIDN0e4qSgeR2Tp
	LQ==
Received: (qmail 578202 invoked from network); 10 Sep 2025 13:17:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 13:17:49 +0200
X-UD-Smtp-Session: l3s3148p1@ieomknA+gpwujnuV
Date: Wed, 10 Sep 2025 13:17:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/8] ARM: dts: r9a06g032: Add GPIO controllers
Message-ID: <aMFeXXXuks0OVkj5@ninjato>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
 <20250909120041.154459-2-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iumSSLlPufN+jsYR"
Content-Disposition: inline
In-Reply-To: <20250909120041.154459-2-herve.codina@bootlin.com>


--iumSSLlPufN+jsYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 09, 2025 at 02:00:32PM +0200, Herve Codina (Schneider Electric)=
 wrote:
> Add GPIO controllers (Synosys DesignWare IPs) available in the
> r9a06g032 (RZ/N1D) SoC.
>=20
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.co=
m>

Of course, I couldn't test and review all GPIOs but the GPIOs I tested
on my N1D-DB and EB work nicely so far. Previous tests didn't work
because I simply missed to setup a configuration switch properly for
this case. Phew!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I won't have the bandwidth to review the irq patches. Maybe I can donate
tests, but no promises...


--iumSSLlPufN+jsYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjBXlkACgkQFA3kzBSg
KbbEaA//fbbtj5vTazGI3o6nzrkselioCZlzKsf5vGNmi8jqg+aXHRK7vm7yTfSW
i0A3/MxjuXHIaEDf/MW8SgPp6/z+TtyMohi3cnwPPonAbOKaICpEEbQmrEXTO4kn
AQE3VM1lXAxGjL/rHi7tv+d2o3s3SM9fHGNvmsTaYHsLxJni/ylOERHKSCDNZvdT
spoyw+5i7xw5rmN5Drjh+LWT04H3YwPMs9Hikbk6fdd2eTZ9yEWi2wLiNwbSLX9z
iSNkE6TTth9OvGGQusfuzgwJVq9oAMFNcW1YWISCznGHJ1hOaHhvi2+mTStfNgtR
h9mgNiOF3NuPm6OMqtNSQYYkJ3Y/LEYy3O3RAhRCVk3B1Gdt/nkKMuigVSvV7m1Q
3xFNMiDqCuzdX15JPAgu927pSNnQXP0GKshTtZTpCtzFjj/GgEl8KJCjqQ7og0bx
FatOjTUnFv1BZXc/LaVPthp1FSozfje7RULinOrXSq+nVUZJJrNcHYflR9qKx51q
5Q5iC7TX8qmyewAgqwnMJMNNMgwt3ykWfxeVte8P2CgBJdPfaRIqYxEC+8KQHBF6
WeAin+KN5RWDAAceH6NZuJKlQzO1QucH/ciAxwO6naSa3DBgasISrvOU9s0dZCvt
jkeXbOIhevD6w2y6CsApyTG7UX9ckayXAec1htNOJOL15VpGToc=
=Mu3J
-----END PGP SIGNATURE-----

--iumSSLlPufN+jsYR--

