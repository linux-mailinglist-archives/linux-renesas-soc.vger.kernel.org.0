Return-Path: <linux-renesas-soc+bounces-24604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EC064C5A109
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 22:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9510934ED08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 21:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F6B930EF6E;
	Thu, 13 Nov 2025 21:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="apJcZmMf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D052C3245
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 21:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068113; cv=none; b=VufxMdqgQBJUcBtn2OlOp+2dwZR4r1Eqlu8oq2GUzsz7Sysm3TCt9+fcJEg1sR9Tst1VSU7/5f2Zl+BEN+RAeAy/kUVG7snT0iE87Uax8Xabr2Jdit8UJsJJxaMTDo/MWKru71rt/kaHYrjMDRZHXjB+PD43+qbfffHn+DNbmJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068113; c=relaxed/simple;
	bh=K/zGuXeK5eJSEIGJijCkOag/qlURK51umkQG5RvH06g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToweCfUwcYBZed8B9U8U0SlwcgtwazJbj7YMx3yZ8k7yxtrLcePKKoZqizOA6Rt+EsUTueikQMR3HIfXrwZ31QhbMnbo9ww0lNICYDODF98aQTM3zILhOd9E5oP8GoZ+2gOyMRHyXAQE3rBoI1INO58GtdvMUAuxvSXvCfy3PEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=apJcZmMf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=K/zG
	uXeK5eJSEIGJijCkOag/qlURK51umkQG5RvH06g=; b=apJcZmMfP5c2oCRmCQUH
	q4mSceTp152NmJJib1XKCPlTSmBEEsu3vDMB4xyKj1Poy5eEgjpRB0Tx/KiSBBsM
	J9Q08FGDMFLVTAjwyX6X7EJtb6xwpKIesM97NigHya3tvfOmxs8ppKrXVzAjCDbW
	SunhkdfLG9obGkuLfbjZdDSJqVp3hq8eVKyLzu/FSWuzQB9kXE5DGvReKtQdmizn
	iA0vzznZKM+L4Sz6QgGq7/ZN1Eu7GlbaVJoX0mV5I8mS+S7GagB/ijRcnXea5ZOt
	Q4W8/zjRmHjuqyoTB8TmwF9f6YSHR6md0H3qo8wdw9+Bi85TXg2P9W3L+W/B1pMF
	PA==
Received: (qmail 2051341 invoked from network); 13 Nov 2025 22:08:28 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Nov 2025 22:08:28 +0100
X-UD-Smtp-Session: l3s3148p1@FTlQSIBDTukujnv+
Date: Thu, 13 Nov 2025 22:08:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: ulf.hansson@linaro.org, p.zabel@pengutronix.de,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi: Switch to
 SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() and pm_ptr()
Message-ID: <aRZIymT9I74JcQqo@ninjato>
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com>
 <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tUeknZOHWWSNeKje"
Content-Disposition: inline
In-Reply-To: <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>


--tUeknZOHWWSNeKje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 07:25:24AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
> and require __maybe_unused protection against unused function warnings.
> The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
> the compiler to see the functions, thus suppressing the warning. Thus
> drop the __maybe_unused markings.

Well, #ifdefs, not __maybe_unused.

>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

I removed the chunk mentioned by Geert. I didn't dive into the details,
just tested it.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--tUeknZOHWWSNeKje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkWSMoACgkQFA3kzBSg
KbakmA//SWepha51GKr0JP2pEi3KaI1agJ/DaBKHi0kQ8kY6Wrj41ymJDfCsgqY4
Cv8oZsQ8F8/YUP5Io8EHS9uecgjG/sZPca0YQyfrF8T+rnqbOZuQ+C/cbBJrdpGx
RlkfVdWf+BfgRLoFNxaUVOzzkC5VXQswAJ0OpMq7cF85sI+HBUBx9Ymm/HjTkw9v
BfpxBiQnwuM04DLshsq8/PJJ4+HAHl5eWXRl3ndRlfwNgmLSyGJR7vxYQ9eY5H4B
ZZtzUg/OOsIq2RoAsypYiFliak9dVrBhnsRQ+g4wLArAskvuvtPvH1aOByYJ/Ttp
gZGs1n2sSuulsGUDiOVJh/P4CKzgGxkllBcOjHIYSccaOqoqXa2IvEvrtLNXHJgN
toDsHal0vh9z4dsb5nWo6sPyuhnaf2xZsiJm+2AGTWpcswsFWED5rBZSuNiha6/G
sUkXP++dzraFDOw3KZHa4/WASqrEz6hU00WqYWsf80wPzvJHTlEenf4iJbWi8Ioo
psRnHUz1q3tq7fOtWV/oeJAqfi1TAKJBoPyoLrt8iFm5dfKJCdjfbf2D6cUeOI+s
j0i4K00hzyB8IuUdJC2Yjjr0lbWL/Sydxz98IOW5bihI/QRbQPf7DXcbIRGgc7sb
ZuWc38GcAEbqaL27T9iIgGpo+mfkXmiv4tCuNGfhFw955JXREJU=
=9lyx
-----END PGP SIGNATURE-----

--tUeknZOHWWSNeKje--

