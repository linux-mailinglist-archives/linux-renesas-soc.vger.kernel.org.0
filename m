Return-Path: <linux-renesas-soc+bounces-7606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81CA93FE0F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 21:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62DEA2817CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 19:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD07B1419B5;
	Mon, 29 Jul 2024 19:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SO8tVq44"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7188F6E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722279961; cv=none; b=qmXuJ9Tsc9YRLJs2sM4oNXp1vYpMS36aK0iGKS7I25nPgmqFdXPU02WiYNv/bDIKU0hk8127CXrYCPnS8fyklQ32wy3fsevgBFNcfxR9Av5+ze43hzeAdxprHor+y/PJDVMxU3igLk3igQpR1/ux7qwdO6/gyzPSIPdf+KQZiq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722279961; c=relaxed/simple;
	bh=wQ8E1n0iS5mgOBnJqHbOYUiWXX5k0NaSRpQICKZ7kNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jFrqzb5QV+Tj4Pd5SRFqNejwg99OLnxp36yQOrksQNRfeGY29kJsLIlDVSZKkdkpEWEoid6aE91bxcGqVEiuJDqKQRErK0+DZISyHOfpou8d7xA+wFxdqC2oCsf7jPKRhohQ3eKilr+o6B5qv/ql3KMGn+1wL5KVBbE8mFbfKTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SO8tVq44; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=En/j
	vpHp8OMLDf9Ln25+rvT2dII4P4LENnQBsPOTb6M=; b=SO8tVq44OHAPKLMOu9ko
	vtKB+kYYpwYAOvRhvN+UNigYQepCGGuxw5IfKS7VJTSF+99r7tyKz56JWmg00wTS
	BsM8P/nLxo4FDrxgTq/HHyDSGIKMemJnuK5UzqvyDwxfHWN8yJzzMRDzqMss2WQq
	J+Yr7Wp6k3YVceS2KZ1lbHrtextj0akbdSa9mGTa7StIMtnKl1HUOa28rtS+7nOZ
	8X0D2yfjiYyHTR6ccQwPS2x1/k3C/qEF68F9u4B0HJ25L9JJA7DYXPc6DOKAHhq2
	U18zmkwA9pR9xUUhRttg80X8jQUwXysNb3jg9aZ8JZpZgT8Vo5ECFYD3rG/OvQKB
	cQ==
Received: (qmail 4187956 invoked from network); 29 Jul 2024 21:05:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 21:05:57 +0200
X-UD-Smtp-Session: l3s3148p1@iysSjWceCAVtKPNb
Date: Mon, 29 Jul 2024 21:05:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT 6/6] arm64: dts: r8a779h0-gray-hawk-single: Add TPU
 support
Message-ID: <ZqfoFdgtSzDMPq06@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-14-wsa+renesas@sang-engineering.com>
 <CAMuHMdWMMU6FOXH8wCBy+biqAG4dqrQe52F5-TF9xw3Pogi64g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMlYzatUKDJ/HvF4"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWMMU6FOXH8wCBy+biqAG4dqrQe52F5-TF9xw3Pogi64g@mail.gmail.com>


--rMlYzatUKDJ/HvF4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       tpu_pin: tpu {
> > +               groups =3D "tpu_to1";
>=20
> sh-pfc e6050000.pinctrl: invalid group "tpu_to1" for function "tpu"
>=20
> This group does not exist. I assume you meant "tpu_to1_a"?

Probably. I did test this via remote, though. Sorry, I assume this
hotfix got lost because the non-working pin got me distracted.

> Both tpu_to1(_a) and tpu_to2(_a) are available on CN3004, but I didn't
> see any PWM signals on pins 10 and 12.  To be investigated further..

I still assume they are driven low by something else. GPIO neither works
on these pins.


--rMlYzatUKDJ/HvF4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAman6BUACgkQFA3kzBSg
Kbajow/+JDZZ+Rf7vAqOp68q5MCQ7lXnRoLqqlXSlAU3zg/HB7+0gZg/cFzzzNYq
nWoHpq8LS55d6i8gSOACzhqNqgWsZa8MQXCqtaZ7JybOlygF1adbAElQoEPkdYfH
APHproMTMTgpyGXcyTqu7Lt52KYBJcuO41++L5Gh6JyYFjiRqK+du7DhKxg4wmjv
uAGQ1dwbyKzgQw/fNxGrACcTurWx5Sgt8xyuigHx3dtI+lPgjMl8Twcgpw3eRDzb
TnY4H5tfqXbM03IyjGIt2jEdD2C/qkegp+bMRvquuYeMK6myWDNUE3IVHFW8QFgd
eoMvUrZydjNrTHSibKagDdoW+sMBbQi3Dftnhz998Mm+qzs8PhFzBRQQdat6l034
M1dE/vseCWzHgkQ3ItjIYcEA41inh+mXl6HhO+C0KNc5FXiJut1UWNoKtsEvzYmb
Yl6A2yN1c8B60JpyGhd+S5WMUSrFyq0Aqru+XPhI1QVUDUIFjEqp1jO7k7C6WGdM
vEQFGfnJa4crSDDMcfbXkR6VkrFdODkjSWUlVxJ4RqAubshdH7KTyxFi4bT/PXmp
2xcj3GDUlbebYryy252u68BFFUPjX7ce81+7HcOtauvSfdEzN/6Jx/WmMcbu+JLa
XvDxJF4dX9an3j0cK6Wg2vMHc28j+Ehr8n3OBpw5ccu1wzjVGOY=
=+2NQ
-----END PGP SIGNATURE-----

--rMlYzatUKDJ/HvF4--

