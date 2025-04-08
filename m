Return-Path: <linux-renesas-soc+bounces-15574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB22A80F61
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 17:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 248EE3B7F6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 15:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E2F1E8348;
	Tue,  8 Apr 2025 15:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lDAitrKq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AA41E0DE8
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124840; cv=none; b=I7D2AA5HAteYe7XtY/6IRawUTD3kDQ7j/3SliS0OtCcT9NAyPP6aVAE/LD4i2HTaDw1PvA1k/lTgL2vbHEsh+vus2GKAs+rV7jmL3C6baJeE76B/BHcGPYQctP0g686IWycWuwGArKyjlstcoNc8+MFv4e3JYKrQpldSI4rKiBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124840; c=relaxed/simple;
	bh=rjC6pjbNE/DzxoKqwV8o1xDm6buKNmoptqlJL8Gns0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7WZG0CvgXGUe1oWgSf7CAJ1s/HxEmDJtYLc9pIVxhb1lA4f8UGvGOLz9MsdB0lnWJM6RSDxth0axbWTb/535W9Qxxmd43K6o+Y7bnoAE0TFV4iYBgL15pGZPlql9Uc2/nyHNzSQe1yIFw+SaDfKw8L84jhfdFWtwiVc1mF84Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lDAitrKq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TmpX
	czd7WfTCPYN06+iLo8DluYU4QJDaknbl1vfUGks=; b=lDAitrKqVAcgnJc9UaDO
	aIZM29YzL8f37y1MJu46sIIMEr+URV/3gn3CT1/vcmLoDwSZdxmaDj94o4Fu88F9
	t8F6tPPKXnSf0FeYbuKcNR7OmEniOBh5dZdl9eng1x/cFV6ur42FcruyW/b57+tf
	oe0jYCK6YtkGQvWrGItvLFOamQSSkg61VjjjO6tkY4XhyS5zcV/m9KHMTsBgfZVc
	dVrucnH7rvmOTjr1dE4NEEXdC+meE3fUiFnnV92i3meGI3p/DH5QBMNG/yCk6XRi
	2HIqY/REi0QL6IgWNfiWUkRtOYevEmUHlnPRRpyXcn8DkrtBTwtJPZ2qnHz4xzgi
	CA==
Received: (qmail 57483 invoked from network); 8 Apr 2025 17:07:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 17:07:14 +0200
X-UD-Smtp-Session: l3s3148p1@MVU3tUUylIoujnsS
Date: Tue, 8 Apr 2025 17:07:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] mmc: core: Further avoid re-storing power to the
 eMMC before a shutdown
Message-ID: <Z_U7ogPkzZY9IVBB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Avri Altman <Avri.Altman@sandisk.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407152759.25160-1-ulf.hansson@linaro.org>
 <20250407152759.25160-3-ulf.hansson@linaro.org>
 <Z_TZxXORT8H99qv4@shikoro>
 <CAPDyKFoOfNWa6b0jF0-a-imKqdDJQrdJe65OaOj3D0upmS7VXw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="goCDa9/FPguGvFqo"
Content-Disposition: inline
In-Reply-To: <CAPDyKFoOfNWa6b0jF0-a-imKqdDJQrdJe65OaOj3D0upmS7VXw@mail.gmail.com>


--goCDa9/FPguGvFqo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The rather long function-names "mmc_can_poweroff_notify" (that will
> change to mmc_card_can_poweroff_notify with your series) and
> "mmc_host_can_poweroff_notify" are rather self-explanatory, don't you
> think?

Well, you are the boss here, but frankly, I don't think it is obvious
enough. I had to look twice and very closely to understand the logic.
Not because of the function name, but for the reason why 'is_suspend' is
true despite being in _shutdown(). Adrian was wondering about it the
first time, too. So, I honestly think the comment is

  for a maintainer -> superfluous
  for a part-time-MMC-core-hacker -> helpful to remember
  for someone new to the code -> essential

Something like this.


--goCDa9/FPguGvFqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf1O6IACgkQFA3kzBSg
KbYoQA//TgNUSNe9zHzT8rQ00QZjzk3V0AsFDPSoy0/kgkGzzTiJxW8y2AHaCsGb
8DEFbBWJ/PjP5N7UcwD9d8yAFAEAVeTgYa+CD8RdoG4qFbnms+K/RAuyqwVwmowC
O0AVGl7pWWe9f6WQuJ67VQQgu71+nOKz6y56dMw9Lx4oBeMPgKn3txkmB0y3+Jiu
lalumNd3lbIaXKg3Y+L9+SBeliJzjigg+GsKWS2OJzxOPJp+sAq7p8Oyfjm43wuc
qsTXlfZHUAQroZ7qmo/uQzzP88oqhCBd595T3J1w0MQ05wTAR9t3w+TiidKGAYPu
Koin1pQehUtj41wc7QFej2IjSKnoZBPX317om6kWqZde9wVwaFrfo+IbYEVhlscG
kWEfYv/YREThj9xbai0HauTKSTSSFN00a8698QePQs4cgdaQyVN4VmrEr8P6bXUY
ZzWfrCx7UJwVZyqn0HbHvMkBPBMvo0YzH23sHpXnUU0aomjvEyfrx+17RTgexIdw
At/Wq8cc0pz4Dl03tKWNnQmO7kUttqljt07zDo0BErzDaZOhJwDOKEVLnpoyq4DM
yikaj8eOcRF5xiN1ztEXP4Vu+ql77c7PXrYbSmKxHsO8+VDJEQzR+AAYoK6LayvF
iO6PTO/atqKeXILcVAJ31Kh/umNtLIUedo9So1y1N4SZvCq1kTc=
=sJD/
-----END PGP SIGNATURE-----

--goCDa9/FPguGvFqo--

