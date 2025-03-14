Return-Path: <linux-renesas-soc+bounces-14360-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DD1A60D3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 10:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BE243AEA36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 09:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129311DE4C1;
	Fri, 14 Mar 2025 09:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ssv9/9i2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8961EA7DB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Mar 2025 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944452; cv=none; b=pPJaSveVZSil3dVD/nqBQ3Bfe+cNCwVz7AWZUe3HSvZIeKqbP7UhPZm7Wk92yw9bT1Vqtd0/ZAqJIfIJId59QfRlJtsm/Ahi/AMJrI4eNBjvLv0tVpp14gbE3LG2zD1xS9B9j98G+neaY+VvKXk67sfcoP00zyUdynm3pK8sg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944452; c=relaxed/simple;
	bh=rH5BPNCFUrIEm55reCBqkIYS8ktfmP7P25NMwiRHTEk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2vX+Rdoj/xDuo0/1tZYEcTuBkrtIH7iVi1U8BjLEVvkllRkTnf1ZlJOvT1rymlcRyFM4so1zPU4CdCz2mE7f96Gb9lAOCftsUfx/nDCs1+Ooffws4oMjFVqXW2VhA6vLE1Rcrbg5RtnA1F+QcAOXf53S7tO1TkBkz21rwvl8pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ssv9/9i2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8k4q
	FdFkadb6qlEXAc8nbYRxaXe84ueNqj88c4yJGmE=; b=Ssv9/9i2zX6unTV+li7B
	QL9k9FdbptUBU8rFl0aP6pqRcSGce5IHRD9w5RF7Q9IsIgntvzFh7+JCo0lSPTNN
	/HaDDClBHe1sjMm/Uf1E+qlmCk3QRylUu8z3HUy3FplYMBYnoZ8nZ/GCXTx0Xzgr
	MukFF45yvXJM0LRp13DT4UpmTEEMO4bjxW6yZB3gcpCZ2n+qEaHwU0zUp3uXUqI6
	L0HJdDuwpKsxMSJ8gYqFEtkCHoMQKqa67qT7TMno9QFRtG3rVqvjsE7bvRrwzCkE
	gsdi3EDjqqOQOVf6e7kBrl5Z4iUZt+ugSUj3H1GnETCXxihCmhfS6b5d95fN0Bp1
	ag==
Received: (qmail 1951326 invoked from network); 14 Mar 2025 10:27:26 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Mar 2025 10:27:26 +0100
X-UD-Smtp-Session: l3s3148p1@Nr/zC0owIrEgAwDPXyTHAJp038nK7dx+
Date: Fri, 14 Mar 2025 10:27:26 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-renesas-soc@vger.kernel.org,
	linux-mmc@vger.kernel.org
Subject: Re: [RFC PATCH v2] mmc: suspend MMC also when unbinding
Message-ID: <Z9P2fkfVsNGz2Ghg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>
 <CAPDyKFrOx3CiVjiWTPwqMC8XONwQ2C=NHFGw_h_XqA1yoZni8g@mail.gmail.com>
 <Z5C6KWGh-y1P7Xrg@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YOEZK1VOOlVt5I7Q"
Content-Disposition: inline
In-Reply-To: <Z5C6KWGh-y1P7Xrg@ninjato>


--YOEZK1VOOlVt5I7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Wed, Jan 22, 2025 at 10:28:09AM +0100, Wolfram Sang wrote:
> Hi Ulf,
>=20
> slowly coming back to this one.
>=20
> > > +       card->state &=3D ~MMC_STATE_PRESENT; // TBD: mmc_card_clear_p=
resent()
> >=20
> > This is nice from a consistency point of view. Although, I don't want
> > us to use this bit as an indication to inform the bus_ops->suspend()
> > callback what to do. It seems prone to problems.
>=20
> Makes sense. We can use another bit like MMC_STATE_NEEDS_SUSPEND. That
> would also...
>=20
> > > +       host->bus_ops->suspend(host);
> >=20
> > I think this is a step in the right direction. Somehow we need to be
> > able to call the bus_ops->suspend() before we call put_device() and
> > before we clear the host->card pointer.
> >=20
> > However, we don't want to call bus_ops->suspend() in all cases from
> > mmc_remove_card(), but *only* when it gets called from
> > mmc_remove_host()->mmc_stop_host(), via the
> > "host->bus_ops->remove(host)" callback.
> >=20
> > I am wondering whether we should just re-work/split-up the code a bit
> > to make this work. In principle, when mmc_remove_card() is called from
> > the path above, we should not let it call put_device(), but leave that
> > part to the caller (mmc_stop_host()) instead. Or something along those
> > lines.
>=20
> ... avoid this :) Refactoring every code which calls mmc_remove_card()
> to handle the additional put_device() on its own seems intrusive to me.
> And error prone, new users might forget to do it. And that for only one
> use case where we want to do extra stuff.
>=20
> Leaving out put_device() within mmc_remove_card() only for that one case
> is bad API design, of course.
>=20
> So, I envision more something along this:
>=20
> 	if (card->state & MMC_STATE_NEEDS_SUSPEND)
> 		mmc_suspend()

Shall I try this...

>=20
> Maybe even more generic?
>=20
> 	if (card->state & MMC_STATE_PREPARE_REMOVE)
> 		bus_ops->prepare_remove()

=2E.. or even this suggestion?

All the best,

   Wolfram

>=20
> Or am I missing something from your suggestion?
>=20
> > > +       enum mmc_pm_reason reason =3D mmc_card_present(host->card) ?
> > > +                                   MMC_PM_REASON_SUSPEND : MMC_PM_RE=
ASON_REMOVAL;
> >=20
> > I don't think it makes sense to differentiate between a regular
> > "suspend" and a "host-removal". The point is, we don't know what will
> > happen beyond the host-removal. The platform may shutdown or the host
> > driver probes again.
> >=20
> > Let's just use the same commands as we use for suspend.
>=20
> Sadly, I think it makes sense because of our HW. We cannot control the
> regulators directly. PSCI handles them. And for shutdown, it will do
> "something". For normal suspend, nothing will happen because PSCI will
> not be called. This is why Shimoda-san introduced
> "full-pwr-cycle-in-suspend" back then.
>=20
> The differentiation is needed a little above:
>=20
> > -	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> > -	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
> > +	    (can_pwr_cycle_now || reason =3D=3D MMC_PM_REASON_SHUTDOWN))
> >               err =3D mmc_poweroff_notify(host->card, notify_type);
>=20
> Here. Poweroff notification is only valid in the POWEROFF case for us.
>=20
> Thanks for your time,
>=20
>    Wolfram
>=20



--YOEZK1VOOlVt5I7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfT9noACgkQFA3kzBSg
KbaJ2Q//agJaSzN5qj5LjbH21/pd02ODa36bZKmO+Q8hra6T6LFLIG7kgXzlMqoR
ocE9FqNt/fgmr9MgvOoqTdPwl6YLjOREysc0JKOErOXnTnptDGITeuzLgoa9QYlJ
bWg1kSFwXw+tozM5FCservfiIwhfElZs4v0I6syAKIzBXztb2Bp4clxr6FhejEeN
Ull0FXaCBbd50fzfu/A36ShmQKpoxKmd+x6pmczpWA+6wehG/hO0mylODlpTs5QU
rQzrIijCVTYQLhjHYzlvaidTJLJKVcvr1RIHPQaamAxSb0iFLQDI7StiKg45LHN1
DfGJsEfM1IxQaHBEr45RwgafPdzJ1wQbXsowOAvOagi3Ezibq2bJCHWt4W8xKXCF
LOcpLcH8kG3Yre++5vsnOlNzIqI4oqyNJmIO+6h3QBEvQDPONbYpAEt1hBesROxn
zq7H6gdaiBVVKSpgqXjoO0AfoxItYoqvtqpOz1eoUXGiVjdAcdH4jV29nQPv+laN
CuvnLgO8WO7093QQUuFtJIsByLmfnAZx4AbBbgjXimXXmxWN0ciVd9hGfzyLXoq4
yyxcsqRE3Irvn+pFYeMbglt9AjjH9GF9t1RzWbwcGvwomj3qBlFi/Zi9GB1NFTAE
+cfQR7mrJLa1xXx40dKEq9mPBzMxVjT6DCWd+FYtt6/N+gwn40c=
=6qpu
-----END PGP SIGNATURE-----

--YOEZK1VOOlVt5I7Q--

