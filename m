Return-Path: <linux-renesas-soc+bounces-22613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78644BB489E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 18:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3687B3B16D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 16:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2F1259CB6;
	Thu,  2 Oct 2025 16:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6XkexEv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DE258CFF;
	Thu,  2 Oct 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422565; cv=none; b=C+utCPC3foB8nOWshwMqbmaZ+7YdYu2wUpLZTMP9h+g8FwpXNKgwnj0W5FVZMTtTF1NYsZO+G0LShhuhSDZ5f8ARvTnc/aCF4n99zoZVjBVLlErDnUJ02UPMFGF5fi6r7poVzY1zMLy6ixBYRufEYNSN4gFZ8OvUUhKEVwtNfUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422565; c=relaxed/simple;
	bh=ZdjGzAzswD18S4BdgOHHvvyUqBw7n9vpfh3cd3YKYvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHSF+XzaOv7d8QaANDlDpIpTHSlo3Ko8CXv7LSk4ZtWTzjfMKUhHaw63Dt6J0amWQzZQ1kv7lQFchV/0rajSPmXf3iMJN8fJextoFRF5/iQkz82/jp48TPyoNb2QUXrVYq4L199ZkkYJ0m26lfrH5UnVWyPFBgdJUXM4sTEdy24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6XkexEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EA6C4CEFC;
	Thu,  2 Oct 2025 16:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759422564;
	bh=ZdjGzAzswD18S4BdgOHHvvyUqBw7n9vpfh3cd3YKYvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6XkexEv43I/dUlxhbUjMlqGhiJ8YjzlcX2+eKh0oUV/6g+/pX9ViiWZ6gJWxQm66
	 Qa4ulO0Q3ADKuWOu9hzE/TGq+Tw+HG20P9kblRIsRACM7TRI/Yihz1ukZIkj+SOT40
	 jLaVFrbmWCVd/9RBRkBgeP3HWe4VIAgRphmodnhonuzpl9WItmzffCT24dHr8hg5ix
	 KyrayACY5D3kT5cXWemgcB4PB6aGsT8BYiuYKRxj9FIGSRvACMFNAOEkaM8k2Xssu6
	 WHFtIVbkYYvKXIWqlaTYIca637YDaPsTmZRZrOwcwJsgmqhr9JxkUQbi1MDR9e/6iS
	 vnOjKDMqWsr8w==
Date: Thu, 2 Oct 2025 17:29:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/18] regulator: devres: Disable exclusive regulator
 before releasing
Message-ID: <ae2701a5-8662-47d3-81fa-30e832600423@sirena.org.uk>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
 <20251001212709.579080-8-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i0yfqqcy8kkWDcUy"
Content-Disposition: inline
In-Reply-To: <20251001212709.579080-8-tommaso.merciai.xr@bp.renesas.com>
X-Cookie: idleness, n.:


--i0yfqqcy8kkWDcUy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 01, 2025 at 11:26:51PM +0200, Tommaso Merciai wrote:

You've not copied me on the rest of the series so I don't know what's
going on with dependencies.  When sending a patch series it is important
to ensure that all the various maintainers understand what the
relationship between the patches as the expecation is that there will be
interdependencies.  Either copy everyone on the whole series or at least
copy them on the cover letter and explain what's going on.  If there are
no strong interdependencies then it's generally simplest to just send
the patches separately to avoid any possible confusion.

> Ensure that exclusive regulators are properly disabled when their reference
> count drops to one before they are released. This prevents possible issues
> where exclusive regulators may remain enabled unintentionally after being
> put.

The reason we don't normally drop references that devices hold is that
we're allowing the driver to control if the suppy should be disabled on
exit, powering off something that's critical for the system just because
we're not managing it in software won't go well.  Consider reloading a
module during development for example.

>  static void devm_regulator_release(struct device *dev, void *res)
>  {
> -	regulator_put(*(struct regulator **)res);
> +	struct regulator *regulator = *(struct regulator **)res;
> +	struct regulator_dev *rdev = regulator->rdev;
> +
> +	if (rdev->exclusive && regulator->enable_count == 1)
> +		regulator_disable(regulator);
> +
> +	regulator_put(regulator);
>  }

There's no reason that exclusive consumers don't use the refcounting
support...

--i0yfqqcy8kkWDcUy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeqF4ACgkQJNaLcl1U
h9AMAAf/a7/Dl+mOSWjlNwJXNN3O9dRt53M6R2nyZ1lFI1ywA3IBNahOsbu9H52m
IC6X22AbKWOS3PBZxA3SJzkNlA9x08/X1AKn+vasCb5Z33B/Ec5I8PvloSIYJrdu
HwJAhuAMOMa1nIvHSXdK7snlDRgwxMOsyEEOkNYFFFkGaLsmGiiTDe6p5mI05e6w
3rm6ml9GEaw4yt0OGhCCBDZd8u+e79hNi51Vpw4lC8pwMJi3YrpkXb6mXdXD0Y3e
6fwmNZasbMIC6CYxxJD34jT17tZ9edOo2lg29Q/BzUFm0wEBW0XVWdM/e4RsfM/1
H75apJLagMYuTi325sMN0jpzEyQ79g==
=zosJ
-----END PGP SIGNATURE-----

--i0yfqqcy8kkWDcUy--

