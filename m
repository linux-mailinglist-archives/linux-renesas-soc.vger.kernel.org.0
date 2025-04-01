Return-Path: <linux-renesas-soc+bounces-15224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5C5A774BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 08:51:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9AA0188DE61
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 06:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDCF1E521E;
	Tue,  1 Apr 2025 06:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N+tfkURP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85CD1DF261
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 06:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743490276; cv=none; b=a+7jJNfk9vXRm2sklB6egZsOdgDcSkJQU7nEbHXW7/2dzx4rialedx+Nc8nx8Z2mOYySITHLki/Ssa7yMYaUpMv/cC8cOBWtoV43xUl4S68AV5h1GarAMT4Xb1ipgmC3XAR1Wnyblvev4zZ0U9tY+IHRDPpTNNv1qgB4dm/n0xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743490276; c=relaxed/simple;
	bh=9xHfiiQ9CX/HzzEktMu5A0iEolf+MXYZ8jH5pD27M+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pjjjwtxbJlf3DKu+knnqLHrC18oTv9Bzw/2EgwnkFZaoYAxBBDG+DUF2QB1BxwXxUCHbQerTJUb/I2iR/bRPR6llFavsoldCLN/i21ftT/ISgU8hOJ0IXNwe1hEvwU8DImIQy9OkuLyHAIAQJnRloAvngFx0L/F/f6tcQAqlrcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N+tfkURP; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=THTQ
	R1f0JeUKwgUzH7GEQ9rpKrrl1aXZPwMMMZGyJlU=; b=N+tfkURP5dpWHsuUgxo2
	6WRFKkYiKA+mpBv//xsFUkGM9WQgcBkG41DkLXGozTJ5drKRBqQIQNKLSfpgGqFz
	XkcKRoxX5q8iXF2sJnJFH8mYFk1mUBJkkArAFjSOsqU2IRB+6Vw4MpbXRfRdYAPI
	bIsbTBVmEGZ06TfljVchVJ55wZEiYbxmtZ4q5nJ60xoBpj6BhmfPVBCgWIJ8tsIG
	d2CJqlv96tY9xyKKYEQrpgOowMzIA9hd7BHikMZ8vbbAxusCZ6yzyssTtNDeoOSb
	aihRwkNJEKjMZCbKVHeL4Jx6Oi2+FRHYKB7xTPVjHp+Rx6DeuMx8IO8vnG3TkvQw
	8Q==
Received: (qmail 1493694 invoked from network); 1 Apr 2025 08:51:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2025 08:51:09 +0200
X-UD-Smtp-Session: l3s3148p1@iGUw9rExupMgAwDPXwSgADIEZgbhJYA3
Date: Tue, 1 Apr 2025 08:51:09 +0200
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
Message-ID: <Z-uM3aRHJ_8bwu0W@shikoro>
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
 <Z-pyfv_7gJ72YWhz@shikoro>
 <CAPDyKFqW92wJ9P5cyO0vcV14dU5Q-JRGR=oKOS362crFy6y2Pw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zVeRWPMKjtJM9KFf"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqW92wJ9P5cyO0vcV14dU5Q-JRGR=oKOS362crFy6y2Pw@mail.gmail.com>


--zVeRWPMKjtJM9KFf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

> mmc_card_can_poweroff_notify() would not be consistent with all the
> other mmc_can_* helpers, so I rather stay with
> mmc_can_poweroff_notify(), for now. If you think a rename makes sense,
> I suggest we do that as a follow up and rename all the helpers.

I vageuly recall that the commit I mentioned below (renaming hw_reset to
card_hw_reset) should have been a start to do exactly this, renaming
more of the helpers. I drifted away. Yet, I still think this would make
MMC core code a lot easier to understand. I'll work on it today, timing
seems good with rc1 on the horizon...

> mmc_host_can_poweroff_notify() seems fine to me!

Great!

> > I do understand that. I don't see why this needs a change in the
> > existing logic as Alan pointed out above.
>=20
> Aha. I get your point now. As stated in the commit message:
>=20
> Due to an earlier suspend request the eMMC may already have been properly
> powered-off, hence we are sometimes leaving the eMMC in its current state.
> However, in one case when the host has MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND
> set we may unnecessarily restore the power to the eMMC, let's avoid this.

Oookay, now I see what you are aiming at. It seems I got the PWR_CYCLE
flags wrong? I thought MMC_CAP2_FULL_PWR_CYCLE_IN_SUSPEND is only a
subset of MMC_CAP2_FULL_PWR_CYCLE. The former can do the power cycles
only in suspend, while the latter can do them in suspend and shutdown.
So, in my thinking, full power cycle might also have the eMMC
powered-off during shutdown. This is wrong?

> Let me try to clarify the commit message a bit with this information.

Whatever is the final outcome, it needs a comment in the code, I am
quite sure.

Happy hacking,

   Wolfram


--zVeRWPMKjtJM9KFf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfrjNkACgkQFA3kzBSg
KbalwBAAqyPr4ILqZMo6pF5dzx0TjS8qXy6FH2SsS1yDhe8R1Jlk6UNekm4QXAyp
MR54odIhIHBUZdr8eejiCRv2kjs9gSmFSdup/USNdaDFOQ2+mgvhjwCUO+SwIIOh
Y7A1ql3am1FY0uYQxeLhLPPF9Qr0CbeduInimJrnRHqiXzE0ashrg538yEYPypeH
F5/2XjxPM7ISLeK/UZXhwcMNCN9Ae3ri55/ev8c8/BblCFacUS/JKlSvnadblW1g
eKIdIXb0EckLZuPODLbkuJbX4VrHDf3N9cUp1eVA0ukSoSVXFsev6gzWMet29Iq+
fBCRHVfnqggwShILKl/+FTJZtF0bBc2kGJ4ohQ6ltU8m5adpJQoRy7LBbgkb6WoW
dHCj7d+WFddUh2377zsCm2erZnpWDiuQ7PObDqhfLkNEqaM27VYBEF4STZnpLON9
EeSFETSWS4WrQb7qfw9n8N+dOBxcMhWTNirumVKVx+HnTSwXKdgNrmExeTmngjtf
QQbjb4m6n9huJFnPB+YkPzr31dIEwOJSemAJmOHFlmxGUl64aVLV/UBcTTOkepb1
nZPq6hWwpmz31CWPUAq7Ux6mye2fxUMesqyrT3W13ywf7Lr18iqbvM12QdTsqXcO
TLc3YIkkuNorG7TH1wG2TrbiSW3Q339VMXwShIMAE1m/Flh5Gus=
=7MEe
-----END PGP SIGNATURE-----

--zVeRWPMKjtJM9KFf--

