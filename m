Return-Path: <linux-renesas-soc+bounces-15112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B479A76158
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A843A7620
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF03E1D54E2;
	Mon, 31 Mar 2025 08:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZwMsEIm9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25C157A5A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409299; cv=none; b=mCZFnEBV0eOSdrCKK6fmbozws0O9J3HovGJ6QgK+AZYJtTqA8vei4itYH/bGG4BCO7+kn+NBFmy5itzxZmVYnBBLHGaXDOfiERgT+wWF5T+5kS78ZvpTLlk5ajp/eo7H7AzUEp3sWsvnxm2cFZL2C5civXfq/K9pPW4dzr502IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409299; c=relaxed/simple;
	bh=O+d2Bq5InAfvbUtNRFvjOZz5U5I9ACs5cJ2k18Bq9Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OW2OC4guQYlbVSC/jrq6mAh1ss76fcO9oWyYz5J8v+dQge8YsZBZcqD56rgjXAlBFYQregdQkBwvvqYZ38knTx+emHJm/VP02hJcMNnpMVo4G/1twR7NygLwKmaZ3033z1oSz+uS+Tl4vSGQajOgKNC66Vd9G/OcAXdqMce8jjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZwMsEIm9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IGWw
	8qFgg6eg9vPA7/4VvG1Ud5dlSzv88z9X1EKANhI=; b=ZwMsEIm97tnblwANkqUn
	R9xFqxyhRf/wnXGkCAo8NoIczpB02JM3xHTcIuzwYe9xJhmRds/gjyRcIzh8VOPn
	jt65hMsYprhnftXrFwCjokP+oUVab9LKHEoCC2aw/U+4YWNPmdbrJXuD6Tf94spL
	M7QIOZ/aAX4pMIBg2nUOrTWe46y2lvm42AQ8ejV2yXnG77ahH7e2s/Sds200G4pE
	3xiQC++fLm7QAYpYgVo50X6pjRpoQ8W5S89JLRKSvBWKL7vsc2nCJ/Sdx72pJ7/1
	7HrMW2YxI9q6/inmPuF5qEc0qmgTflhWuqTOuA+fDOuOOn+/UUTS2lkef7ssTNVD
	Tw==
Received: (qmail 1154309 invoked from network); 31 Mar 2025 10:21:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:21:35 +0200
X-UD-Smtp-Session: l3s3148p1@HvbAG58xULVQ8qei
Date: Mon, 31 Mar 2025 10:21:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Avri Altman <Avri.Altman@sandisk.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
Message-ID: <Z-pQj6ynnfMa77fM@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org>
 <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wgxMxZN1D+yrS8rW"
Content-Disposition: inline
In-Reply-To: <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>


--wgxMxZN1D+yrS8rW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> > +static bool mmc_may_poweroff_notify(const struct mmc_host *host,
> > +				    bool is_suspend)

Maybe add some comments about the difference between
mmc_can_poweroff_notify() and mmc_may_poweroff_notify()? Like make it
super-obvious, so I will easily remember next year again :)

> >  	if (mmc_can_poweroff_notify(host->card) &&
> > -		!(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> > +	    !mmc_may_poweroff_notify(host, true))
> I guess this deserve some extra documentation because:
> If MMC_CAP2_FULL_PWR_CYCLE is not set but MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND is set,
> !mmc_may_poweroff_notify(host, true) will evaluate to false while !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) will evaluate to true.

I agree, I neither get this. Another way to express my confusion is: Why
do we set the 'is_suspend' flag to true in the shutdown function?


--wgxMxZN1D+yrS8rW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqUI8ACgkQFA3kzBSg
KbbIYRAAtWtHSaWe6gFO7ulJ67U+Tcc+D4oNG8LbrsHZyxGjbtnxLqk9fT3df2L/
u6dO08o7aSmjaOMSPa0EPxU8dCZbrznYKB+1chbvyS7r0FmsaEA1ljiAUgbJX6va
S7xXlWTDTVz8CrrrPG3uABsDIIITMEohVu1ep0Lmm1Ilbewcqo7L+sE6ryqzJPrG
BidhCyP2CjUdUMXoqOaIbiysbkoSbj07ekBf8DXtL7lBEt3BUkPqF6tpMcdwaJLi
BOhyivvHVm9WZfo2eIlYChCzriGDZeQC/N5G8doV8bWHqlPL+LEYs7kIhe5jbO2N
bZnOQQOVH6BwMJR2nqOhSCMndCHEC6jpeliRAPNf7esXdtR73N4B+h3Oq1e1BViv
62Qiy7TsJ6/MYsmXehMsisP2Ccyjm6Qr1K+pbUMWGWO5uqr8JE+ZTIKqV9g/V0AV
rpCxiJz6OCyNzMhocljXU0Yi0zVhnnflKPm3B8P2IXhmhaL4C4eSXCWqNRBxuh+h
/H1k0G+NxJpisFevohp1es1CSLq0QvDft47mJx3il8/XbqaIG3W1VR74XOAvoWRD
EzbGO0A+kSmOO8yMyY15vt7qMpldzQ6l4p54+nEa/fAY8We5xfOk7chy2Dv43HMu
cqTBfroPOioEzw7qMl6gSwAUhvuSaDiPpejqzkVMxeIu9Rx8u2E=
=xeJV
-----END PGP SIGNATURE-----

--wgxMxZN1D+yrS8rW--

