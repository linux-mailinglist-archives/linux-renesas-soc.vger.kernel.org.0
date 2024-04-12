Return-Path: <linux-renesas-soc+bounces-4537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D2E8A26B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 08:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97FDDB21EC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 06:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C40F1DDDB;
	Fri, 12 Apr 2024 06:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lbrCsWiv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8B81BDCF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 06:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712903807; cv=none; b=DZSTIU2JzMNOr24JK4MFWz0NYf8CmzL6QE2qPvFivxnegi5Sl9qbS1zwjFKt8Vvv4WeDqBvbwPFVET3m7FQR+DkoBgsKKZqXFpVdK9K2rrVnmtVuP7nk99A0zvOIPtHsKOh55yDtlNFI/oJM/i2c+0imzj8Z6PxAwB6N/hjVXGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712903807; c=relaxed/simple;
	bh=PUtiA0gApU8yY79hvQUXunqQ7RXreC+aJ79dJpAPsfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JyqGlbZs+fHWhab/es/AcxhjgaezseAC9WRf4sHR1k3HyF6qKYqVw6VeV0JgXb27LieOWXKcDxbFwuF8xEU2tvLC+GFJW5ao2z4T0t7aic7WrdyQvDQR+AdpOWC9QsWz7lH27RBCa1QZIK5W0qr1/7cwl5QvzUTccfxvwN5ElQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lbrCsWiv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/T5l
	+ZRbNWTUE1intYHm9thAs/kzf3VYklDhIgghOHs=; b=lbrCsWivu6li7JADAud/
	wOW1f+8UmpeS7LMfH6UY5vCO3yykwkw67YqGMxFyZKwDL23NEzPH//8NB/BJPQUz
	goCTtErLkiPz3R5VGVTJgQaopNnppTSE/Gk0MfDgYOf0vXklJGtwRa8/fTqQ70cQ
	ERHWpAqnoXhpV4cbJlpSrv1YaMXKSvUBKNRXBMqkYSasUbJcyCba0w1OEosBGuGf
	COrCW4ngde9DLCTC82IBwQIGQ5cXu8tSPPaY2ekg+kl/nfvMG7KKJetXUE5OLfgR
	hHFOmMSlY3wUCg+7JQIENxBSjUmbBT5zLW95Ka4X85eFjsAHRY+lP3unbN6tztXz
	UQ==
Received: (qmail 1117209 invoked from network); 12 Apr 2024 08:36:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Apr 2024 08:36:34 +0200
X-UD-Smtp-Session: l3s3148p1@07wtfuAVHLBehhrd
Date: Fri, 12 Apr 2024 08:36:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: tty: serial: sh-sci: hrtimer not properly canceled on chan_rx
 invalidation?
Message-ID: <w2poytt4lrbex2g73wjl7bww7fb6q365cj36x2fp6k2x4kx3v5@t3kwjy7n3zcx>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="il2tdegwdxavlap3"
Content-Disposition: inline
In-Reply-To: <ee6c9e16-9f29-450e-81da-4a8dceaa8fc7@de.bosch.com>


--il2tdegwdxavlap3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

thanks for this report!

> Is there any chance that there is a race condition where the timer function
> sci_dma_rx_timer_fn() is called while s->chan_rx is invalidated, already.
> E.g. via sci_dma_rx_chan_invalidate()/sci_dma_rx_release()? Or anything
> else?

Sounds a bit like the TMIO race condition you recently reported and
which we luckily fixed meanwhile.

I could have a look next week. Or do you want to handle it, Geert and /
or Biju?

Happy hacking everyone,

   Wolfram


--il2tdegwdxavlap3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYY1nEACgkQFA3kzBSg
KbbJHA/9FEV/maH9sAh61pii6oZ3jI2vC3myt1aJtvBYX0I4rcv583cCGq8Gm6W2
UQUYjV2CkI+rZGeDVOZ0q28a8R7/LYm8enV8ZRjCWaf9VRhrDja22R7Gc1OIo/em
FjZ6fsVnZDFE+g28swY6E0xkrjnwUSob9rzp6Q1S/Y/zo+jdhI+IgHDNqkwUo7w5
3R6kxB9E+8bJ8NtKaomPRh+Odtrr02tJ3Ht9O9OVo6qwETiiaSCm6VhmPLuiAxXJ
aFPCUU9xpYDRA/LjSA+IOk+/dqEltCAPTeRdG2zROLlCLLoXMcvSJPAyb/iVBjXr
auRY6ceAo3H8BbF6HtuVDjqEXDt3PgQquEXMYig2gtUD1WhS6xOziISMwy9cUmBe
S/ZXzr1t4dhzs52CDoTWxVojQ37YDsp5Wd8F3lBzAZt06Y0gdOn5Rqhg+fB1uk2K
XuGPXcLeV7MJT3S2lnuvMPbCGrZOr7jNKz/g16mhHwzGAZgXVNQBvpPvA7mKRSge
n8If3yXd4RZgPc+Dfjv8MVDHtd8D0c7ac6XQr1J9Pmrh486JSmDbJpbE5WZuWSZ7
f60/vBLMyKREHDqiuYXe71xy1NpoopSaUjLc/Ihtv8DIXibjiR3wzrdcZycCQV4v
/4PIxRX8y/+CqBWu+DbkO6bOYH3dVmSjI9Z9rFU8EgnbY0FLxxU=
=nViM
-----END PGP SIGNATURE-----

--il2tdegwdxavlap3--

