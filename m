Return-Path: <linux-renesas-soc+bounces-12312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 722ECA18E45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 10:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6E94167CE1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 09:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E27920FA84;
	Wed, 22 Jan 2025 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GgK+H7DP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5911F7569
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Jan 2025 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538097; cv=none; b=CZZOC1eTX9TuFEWgAXNIAcQzGaW/HMSqVmBPCWaUSNPLrHwE+LKkPvEidLgYQg3KyBwJiBkBDGuIdcILOsBfz/h+2cBylNKpqUPUFc0EN9gqrLEJ8bd5vWV2w4kIfSCQDhq37FVYg90KWI6PORW2DD/4DLAVFCTStPsUZOotVXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538097; c=relaxed/simple;
	bh=a9SivqPoIKWLgkYUu0g5/zGCJSIbILPA1BNc/q3fPtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2rLs2E0Oz/p3fxKoV1AynsSwRoQbiibgmabqZsFFIeKYQ0i4YmheTWojW4aNLz8ZzH8ytYbU1rbeg0CXuBc1rq06MxvVkP5fsFdoLZCetHL9tRbgoso1sPFGdD6NXB0fqfSLX+NC7WZhx4FVvjkvREP48dM5du0vdMtqQbMLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GgK+H7DP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BYbl
	9OgCpb29ESTVFSf2ESDEm1m+r7d9C2IeC93BBnY=; b=GgK+H7DPJK2Phu6EzJpm
	HB/16jW1NF9c3sBNBbSgsm+7+ufnyMWj/hVrXpzv4fYvhMl4VWOOCEuVOH6hpbub
	QKwx3DJ6rMnNEyUrjHbzIy9Orx7Q8JT/z6k8EsUkWDMGwuDuWq473yYvRFiSK86j
	OaGqj1V8r0Fk5O8mavhdSEdlPlDzQunLnnu4KwewsF88XolVEeGByQDL0eFXl/mP
	dZOwPG/AKwiGmWFg60ZWicp3juLavnfPVq/P4R3lYSqD9bXbA70ndMeyNKnThuqf
	U+mBFcamEVkuXLm+hUL565tXnRXSbKb0c0q4aZmbqiNA81XFf8O3IFQUFs1uL4NH
	bg==
Received: (qmail 2832194 invoked from network); 22 Jan 2025 10:28:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jan 2025 10:28:10 +0100
X-UD-Smtp-Session: l3s3148p1@lF6hHEgsCOkujnvm
Date: Wed, 22 Jan 2025 10:28:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [RFC PATCH v2] mmc: suspend MMC also when unbinding
Message-ID: <Z5C6KWGh-y1P7Xrg@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20241104092215.20946-2-wsa+renesas@sang-engineering.com>
 <CAPDyKFrOx3CiVjiWTPwqMC8XONwQ2C=NHFGw_h_XqA1yoZni8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oWUFow99zFSM+DlD"
Content-Disposition: inline
In-Reply-To: <CAPDyKFrOx3CiVjiWTPwqMC8XONwQ2C=NHFGw_h_XqA1yoZni8g@mail.gmail.com>


--oWUFow99zFSM+DlD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

slowly coming back to this one.

> > +       card->state &=3D ~MMC_STATE_PRESENT; // TBD: mmc_card_clear_pre=
sent()
>=20
> This is nice from a consistency point of view. Although, I don't want
> us to use this bit as an indication to inform the bus_ops->suspend()
> callback what to do. It seems prone to problems.

Makes sense. We can use another bit like MMC_STATE_NEEDS_SUSPEND. That
would also...

> > +       host->bus_ops->suspend(host);
>=20
> I think this is a step in the right direction. Somehow we need to be
> able to call the bus_ops->suspend() before we call put_device() and
> before we clear the host->card pointer.
>=20
> However, we don't want to call bus_ops->suspend() in all cases from
> mmc_remove_card(), but *only* when it gets called from
> mmc_remove_host()->mmc_stop_host(), via the
> "host->bus_ops->remove(host)" callback.
>=20
> I am wondering whether we should just re-work/split-up the code a bit
> to make this work. In principle, when mmc_remove_card() is called from
> the path above, we should not let it call put_device(), but leave that
> part to the caller (mmc_stop_host()) instead. Or something along those
> lines.

=2E.. avoid this :) Refactoring every code which calls mmc_remove_card()
to handle the additional put_device() on its own seems intrusive to me.
And error prone, new users might forget to do it. And that for only one
use case where we want to do extra stuff.

Leaving out put_device() within mmc_remove_card() only for that one case
is bad API design, of course.

So, I envision more something along this:

	if (card->state & MMC_STATE_NEEDS_SUSPEND)
		mmc_suspend()

Maybe even more generic?

	if (card->state & MMC_STATE_PREPARE_REMOVE)
		bus_ops->prepare_remove()

Or am I missing something from your suggestion?

> > +       enum mmc_pm_reason reason =3D mmc_card_present(host->card) ?
> > +                                   MMC_PM_REASON_SUSPEND : MMC_PM_REAS=
ON_REMOVAL;
>=20
> I don't think it makes sense to differentiate between a regular
> "suspend" and a "host-removal". The point is, we don't know what will
> happen beyond the host-removal. The platform may shutdown or the host
> driver probes again.
>=20
> Let's just use the same commands as we use for suspend.

Sadly, I think it makes sense because of our HW. We cannot control the
regulators directly. PSCI handles them. And for shutdown, it will do
"something". For normal suspend, nothing will happen because PSCI will
not be called. This is why Shimoda-san introduced
"full-pwr-cycle-in-suspend" back then.

The differentiation is needed a little above:

> -	    ((host->caps2 & MMC_CAP2_FULL_PWR_CYCLE) || !is_suspend ||
> -	     (host->caps2 & MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND)))
> +	    (can_pwr_cycle_now || reason =3D=3D MMC_PM_REASON_SHUTDOWN))
>               err =3D mmc_poweroff_notify(host->card, notify_type);

Here. Poweroff notification is only valid in the POWEROFF case for us.

Thanks for your time,

   Wolfram


--oWUFow99zFSM+DlD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeQuiUACgkQFA3kzBSg
KbZhAA/8DpFZlbKUfCLTz+I5uuu1KIVwHfGWR44Hygh+wl6AKjUPf0oagLYXLTsf
oQvhh5pHz/DuLtl+d/hGK9Aape66jv82OVRBYuORvwAx/LnERGpxjm6S1RPAn62P
6G6YxAZV7jTbcxjUrJOKb990YKH3n+C3ey+FnMY+nsFHVYmhYnyJ9Lc5a+Gmce/0
5pi+4/+Gfsz6yckeLq3EFOO8vTU1g7IIsQ1ydX86Yl0NQhALBnHsCSRQa8H9OdsK
dfQftOLed3a8NBr/ZHMw6glKFPVFJe+O3YWyfQv1l6FHTnNchUNrsqWGAVG3Cj7u
0wvXkqZhEhlXm2TmicsqWgcDdNf4mKTfJ7R5dkI2e/TaDb+wVRojfNriNnfWeiZh
tKTPkD5SE0QddXGVraSLCN73RaxUXag5sBh+W8pltxdVP9qhpHLJOo+YPRr4yTHA
FkwqH9ZusPdfSL6W8MfgYNKVG5Gu491nwJPtBvZBffeFgXLT4frc7kKwTZEtOTD7
+eEBipoBL+2XFsN9CVK81UZ4s9uAyS+wyPP8SzfUEVEEwLfyz7YN5dukyDF2j+6e
/gjsI+fGsqqQcb/VfH9fOXHwn8mRR4wVTVczrxN/7D2xlnDjzo7v0O2BNvjaiHEw
MPTMybiqWkkJFRii3MtOiHq6VQnWNj5Y9yGkCO89dQvSa3KMY0A=
=9DOs
-----END PGP SIGNATURE-----

--oWUFow99zFSM+DlD--

