Return-Path: <linux-renesas-soc+bounces-15137-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9216A76476
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CEB16A508
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A5E19D074;
	Mon, 31 Mar 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YoB6eldz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7221E0DF5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417989; cv=none; b=sqt/JpkcThbM+Jx6lSp9MqDCZHCqwqEeU6npDKw4aNj0hh7FsG456FDeIfem2vCvOX/zn7ZbxugH0RV433+xBY44Rvf8iqDTt9kYhDDTrGtuoq532X3CwaIeaQKyf0Ch5DCn8PmJuFtMiKgDk4+BxrP/tR1KMOOHEkwZQTIPT4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417989; c=relaxed/simple;
	bh=64HaiMEYmy3ijfrwfU+1bfvGwD+STOpIlQVnF3qt2Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5VkTfZXudUiZbdeNauBnjz/s50ogZH2RoNNH1f2X6K5lg9P8khPr7dd7UskHg9F0DAjfh2/DdlUJVNUMi/9zypCaUKovfrSGyBUk+nlHYl25zFekIbctAaNgAwLXDk2UyRqfvxkRETETigKMaJ/nyEpEQeQaf21s8l5HNszIV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YoB6eldz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lmDz
	XzjNgzjFisRxTIt3lxz6aQmh5NlFsLRwqSenSyM=; b=YoB6eldzzCx+zlCVmqVz
	wu4nLbg24mzo3nZt8eipzJLQABS0qOEpomQc0FSXh2UKAylKKyZ4KdcAP/AoknTT
	wuJXbRaBDMKCPuIINeO+ZQyWQveR5twYMPUjeTQ2bmsMYVu6/vWQdufiVAXRwsF1
	FkK1Rl6ATQHP6BHsrW9zaOyzYqqiqvqbMcKobmVqmlWTLGrucbxiEDgjLj1TYu36
	fDsp98MTYGyE2hiLNKplPUZjpT7BJx3ei6Fh+LHp+HnxblB62MztC6qtWullDb1o
	KYFeIZOVvL2lBcN5w3FfcXTgKa+hxNgjwsBxujoDd80f/sJ+k+chfLpxZxkUIx1g
	KQ==
Received: (qmail 1202045 invoked from network); 31 Mar 2025 12:46:23 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 12:46:23 +0200
X-UD-Smtp-Session: l3s3148p1@akWKIaExIzNtKjAP
Date: Mon, 31 Mar 2025 12:46:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Avri Altman <Avri.Altman@sandisk.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
Message-ID: <Z-pyfv_7gJ72YWhz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Avri Altman <Avri.Altman@sandisk.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-3-ulf.hansson@linaro.org>
 <PH7PR16MB6196C3AC7A7B7CA99A70E7DDE5A02@PH7PR16MB6196.namprd16.prod.outlook.com>
 <Z-pQj6ynnfMa77fM@shikoro>
 <CAPDyKFr0MvQDxsi-Qd0F=1KuR4Gy6s5bhVdOXRt9K14Z9sO2Kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peD/GrQrOvzTjyv/"
Content-Disposition: inline
In-Reply-To: <CAPDyKFr0MvQDxsi-Qd0F=1KuR4Gy6s5bhVdOXRt9K14Z9sO2Kw@mail.gmail.com>


--peD/GrQrOvzTjyv/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

> > > > +static bool mmc_may_poweroff_notify(const struct mmc_host *host,
> > > > +                               bool is_suspend)
> >
> > Maybe add some comments about the difference between
> > mmc_can_poweroff_notify() and mmc_may_poweroff_notify()? Like make it
> > super-obvious, so I will easily remember next year again :)
>=20
> mmc_can_* functions are mostly about checking what the card is capable
> of. So mmc_can_poweroff_notify() should be consistent with the other
> similar functions.
>=20
> For eMMC power-off notifications in particular, it has become more
> complicated as we need to check the power-off scenario along with the
> host's capabilities, to understand what we should do.
>=20
> I am certainly open to another name than mmc_may_power_off_notify(),
> if that is what you are suggesting. Do you have a proposal? :-)

Initially, I didn't think of new names but some explanation in comments.
But since you are mentioning a rename now, how about:

mmc_card_can_poweroff_notify() and mmc_host_can_poweroff_notify()?

Similar to the commit 32f18e596141 ("mmc: improve API to make clear
hw_reset callback is for cards") where I renamed 'hw_reset' to
'card_hw_reset' for AFAICS similar reasons.

> > > >     if (mmc_can_poweroff_notify(host->card) &&
> > > > -           !(host->caps2 & MMC_CAP2_FULL_PWR_CYCLE))
> > > > +       !mmc_may_poweroff_notify(host, true))
> > > I guess this deserve some extra documentation because:
> > > If MMC_CAP2_FULL_PWR_CYCLE is not set but MMC_CAP2_FULL_PWR_CYCLE_IN_=
SUSPEND is set,
> > > !mmc_may_poweroff_notify(host, true) will evaluate to false while !(h=
ost->caps2 & MMC_CAP2_FULL_PWR_CYCLE) will evaluate to true.
>=20
> Right. See more below.
>=20
> >
> > I agree, I neither get this. Another way to express my confusion is: Why
> > do we set the 'is_suspend' flag to true in the shutdown function?
> >
>=20
> I understand your concern and I agree that this is rather messy.
> Anyway, for shutdown, we set the is_suspend flag to false. The
> reasoning behind this is that during shutdown we know that the card
> will be fully powered-down (both vcc and vccq will be cut).
>=20
> In suspend/runtime_suspend, we don't really know as it depends on what
> the platform/host is capable of. If we can't do a full power-off
> (maybe just vcc can be cut), then we prefer the sleep command instead.

I do understand that. I don't see why this needs a change in the
existing logic as Alan pointed out above.

> I was hoping that patch3 should make this more clear (using an enum

Sadly, it didn't. Using MMC_POWEROFF_SUSPEND first and then later
MMC_POWEROFF_SHUTDOWN in mmc_shutdown() is still confusing. Do you want
to return false in case none of the two PWR_CYCLE flags is set?

> type), but I can try to add some comment(s) in the code to further
> clarify the policy.

Please do.

All the best,

   Wolfram


--peD/GrQrOvzTjyv/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqcnkACgkQFA3kzBSg
KbaiQA//dkFc0seaVdeLxN5dVKckn76uVsdr7AE0Q596zm2IshMyF+7AHyFq/AOJ
KcXBybgkvwGdu6i88F5z2e4iTGO/cBPjmcfk5yopMaSur/z6OrstL0QpRpp2bEWs
OnxLBVG8bFsmjs1d2ZsrvQ1mFyGJumOJsBKC5Ne0EFV3SkhNPrze6A6vwEFErYNI
3liDyLp3wVrhWPw+SiC/MReil3gbP8cLgnVnQWoMpZfK4cOycUO5sUlkrZDRzDle
Ke7/3rxnEc4bBQ8FmJpwc8hl3zsGFbPBBG4nVr3SIH+TmIvDfSdTFPT21pvM9ZX4
bCmn52k5BI1FT7ccct2+pcOJhEeN6uK8Ivifz95Ps2foE3oNuZi3YX2e+x7erUOy
FplGcJhie0EvzqRodJ5erc3Exq3pTDe7dQEqNoPCeD0XXfSokCVeq5ZaZ6cgyySE
qb64iekC42gynfvR0KlcVwRTCLzkUShXDVOXpXOt0X2r9U3Pu+Qtv/r9INNYlZXo
Q1lBWzGW/zvUDXpFlaWwjzvksg9lJ5uX/4GdRSiMs4CbMbpojydTuReFItt50kDb
evhOJpcsW5pQTYi7LWDxhfqzAOspVoGM5hoQCAcLPU8GFt4nZotr30ZXQ0Ra+N5X
IVa6RJwaIae51VgGY26FIk5IIxWRbeX54wIT0az6I8BymQv0TZg=
=TQ8d
-----END PGP SIGNATURE-----

--peD/GrQrOvzTjyv/--

