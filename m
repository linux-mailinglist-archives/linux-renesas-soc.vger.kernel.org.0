Return-Path: <linux-renesas-soc+bounces-3923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAD9880BB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 08:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A80191F24154
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 07:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD37A40;
	Wed, 20 Mar 2024 07:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRig3eU7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B651EA8D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 07:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710918504; cv=none; b=IEb8Ys4QbWczjhTUA1mu4ONON2hOVbwvgxN5JrewwUXEtAQKgkV3hvspKhh8pNOS1QGdVwrAInKfG2zoUPWNF3XKs/2lMw0FSHjS9lNuen79pNXQjBcYvR0d9GxsZ15vwwIR6MzXUwUzchkz4GVV46+tZnGhoF3ORFDaqKtNdX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710918504; c=relaxed/simple;
	bh=7cGzdvGN97oW1WjwJTPPu2U0iE6yfGocO45+q8MAbCI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Asfj5qThgqVJwmd71EPrvV06J0+kcZgzvym6s34nuv+CEKfwM0R/B1eb+QcYMz2LjGtCuMkBtshHh8/OrPmGrMQDiCKH1QWDJj9sJot2lQxoP25N4l3d3rIVgc9Y4ec0+v4qZrAgg9TYTPd87Dmc0RiHXTti92pKATLXdm5Ga6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRig3eU7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDFAC433F1;
	Wed, 20 Mar 2024 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710918502;
	bh=7cGzdvGN97oW1WjwJTPPu2U0iE6yfGocO45+q8MAbCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRig3eU7sQRvO+QYbUYDYZPp2e0x7Mv4VIUSt3c2AO2h7MWFtEK4/tosWEKiKulBJ
	 CEIvGCQ3oCW72C1wPTwRzl4HduOzj6ZaZlqOQqIKy0d2gpyeEVax0m3vnI/0XYHflv
	 drfCCEAneg+eqQ7E+ggWY5ui9clweO7rR8tmhvzNiuRp3o+d8k0A4WMGY0heqySegR
	 LXXIRLU29npJkgZTe2mWunkateY97+iGN1AOb/j3+sfpcfFhxm1+6TU/By/JkKqeB5
	 o6OXJnjBDiLsy8Sm0RfPYA+MoRTJF/81MpwhCDx57mdGxG9u/ZvM8yI6+zDrkO0uXS
	 60Sn4knueskGQ==
Date: Wed, 20 Mar 2024 08:08:19 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: renesas: Add more TMU support
Message-ID: <ZfqLY8Ej6kNnAMQA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <cover.1710864964.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IhGqeSxwmc9TUd2u"
Content-Disposition: inline
In-Reply-To: <cover.1710864964.git.geert+renesas@glider.be>


--IhGqeSxwmc9TUd2u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> APE6 (APE6EVM), and on R-Car H2 (Lager) and M2-W (Koelsch), except for
> TMU3 on M2-W, which consistently fails the CLOCK_REALTIME test (why?).

Huh? It works on Lager and fails on Koelsch? Do you have a log file?

> Still to be queued in renesas-devel for v6.10?

I'd say yes, it still describes the HW. Unless it turns out that M2-W
doesn't really have TMU3 ;)

Happy hacking,

   Wolfram


--IhGqeSxwmc9TUd2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6i2MACgkQFA3kzBSg
KbaXRRAAl2BiWarFQIi/kC/yq9ZCiBu1BBjyN6jRSve0fYyYnQeNnYGX8ARqLeD5
+NREg9QkOWW7fOHaTXgrCbRjF4kxpBWxLhjTCjaCwspdlPWAefIiajJ91FTtjHDY
Hdj+sk2tcb5CyVy+Z4CXlwk4YlKPjaNKJlzHj/oV6YutZFrpQbaTTA3HTI2FF98b
13aMar28O9l/jD194SB18pSgPrinVrgUBDMxMIerK+hdHrSB3lnKVZixqCRhSw5V
CvmpyHy3rl/9CORBj3Ier7w2d7jI3Ws9swfWucKsG2DP2JScedIa0TD6cIYtwz2w
lv7JWlPZURJz9u/LcJ0VeEOqC0ZUAUrqWHDpHp/TuRErukktv1cDp1YPowZK/WWM
eoGu5Yqn7oiP3/YCgAPUqfA1CZlnvxMYawv+OVafdzOES+cN5ik0I1juPveE+Hbg
tI0LgbRpGrZnJW9RLHnf0dn6aX9RykbnEUpyTJs/K+NNHEK1WDKhazEZVkEv0YA+
xINch1s24tQ4k9HFCG1FkexR3KOak9LqNhjeoTKIAb3xBD6/iuPZIbwClLHZtZid
tfEUcOaYmHiopX17PmBuglzpN53GKLgqCTX4HfX1EKL5vfWopTEpFsqQnThhlWbW
wHNLg+by1Mgn2l56lkbDnAHdzX9B1aHc+kxLMtR7I55IpIhVH/0=
=OiO1
-----END PGP SIGNATURE-----

--IhGqeSxwmc9TUd2u--

