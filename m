Return-Path: <linux-renesas-soc+bounces-15040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A9A754CC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 08:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE12518977CD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 07:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166071ADC7F;
	Sat, 29 Mar 2025 07:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ivh0vXa+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B918C02E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Mar 2025 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233665; cv=none; b=NfbIfHN0bjRNxlHTLU8dB7pBPs4HchRzGXKTLlTBn1/moCrQuYIu5DLMDZouwniQ/4LC4zVElfkTkyKcUnK10GVzz+5rP43+kyr6FPS7ShE1PBAZaitPHIjOEs+qwmeB6GGI2jSXcmMak7J3eDBD/Qxw2RM0fI3OcisM0LclG1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233665; c=relaxed/simple;
	bh=vm9iCWfrOql9PI5KM35u2LLLVEofk/wS4wgSlSURH2I=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZdI7P9CU04F9/T2ibF4VehdtXd3qlC16qL8FO5lGJXXCxwAmBsjAzBt5+3fjTxW1DiFORS+Z1An1yqFdonY9g7PgCE4ta+2vBXpy0vofEV8ktxQ6xBpES1BT1EprAcxJOtQtEyF23hwsGRC5ClW+V+rybrZtI6+CIdPYMR/X/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ivh0vXa+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vm9i
	CWfrOql9PI5KM35u2LLLVEofk/wS4wgSlSURH2I=; b=ivh0vXa+XXAtQgavSC7V
	wqLxdG1cW3EluMRyZZEb4glil5ZOX+CpIAGrVKB1tRVhATiA2NQEwtfOO9Z1meww
	BDag8x3nph6RlNk3BbR5YuzQeEdifmrsb48wt0bJEtpP3X2r4A9GFp7egx1EWxdT
	ZpR0iNehrSaeZNaN66rNxE6QXxFBevAi7XB84somyXZ/8vfdvArrQFDPfp3vZ+Zq
	xjvPErC3RTZKiG07nAQXpHO+jmoth0vT6zL2he1OtnX6sjHpepVOrONidw84/bcS
	jyfx3y4WCH4dXAhWYwKhgJcx/A+oEr9DhwYrmTypybwZIHZnMjatRejYJo4/0LWV
	hA==
Received: (qmail 505286 invoked from network); 29 Mar 2025 08:34:20 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Mar 2025 08:34:20 +0100
X-UD-Smtp-Session: l3s3148p1@XKsTN3YxagVtKjJV
Date: Sat, 29 Mar 2025 08:34:19 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Sergey Khimich <serghox@gmail.com>,
	Shan-Chun Hung <shanchun1218@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-mmc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mmc: host: Kconfig: Fix undefined reference to
 rdev_get_drvdata()
Message-ID: <Z-eie0KfAFFNl4nh@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>,
	Victor Shih <victor.shih@genesyslogic.com.tw>,
	Sergey Khimich <serghox@gmail.com>,
	Shan-Chun Hung <shanchun1218@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-mmc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
References: <20250329070329.32562-1-biju.das.jz@bp.renesas.com>
 <Z-eesJwwOTN5qMoj@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vArk9QifwjNo03ib"
Content-Disposition: inline
In-Reply-To: <Z-eesJwwOTN5qMoj@shikoro>


--vArk9QifwjNo03ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 29, 2025 at 08:18:08AM +0100, Wolfram Sang wrote:
> On Sat, Mar 29, 2025 at 07:03:24AM +0000, Biju Das wrote:
> > The driver no longer builds when regulator support is unavailable. Fix
> > the build error undefined reference to rdev_get_drvdata() by selecting =
the
> > REGULATOR in config MMC_SDHI.
>=20
> As said in a previous mail: I'd suggest MMC_SDHI_INTERNAL_DMAC.

But let's add 'if ARCH_RENESAS' to leave at least SUPERH out?


--vArk9QifwjNo03ib
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfnonsACgkQFA3kzBSg
Kbaj9Q//WcQ/bXDgCdsYd8WjdQhT0geHEPbd6/XC+h9YdNqtPhzoPVhs51I2oFxm
jPF4rKSVMxj1u6EQUPeL2qE6TILGG7M6nlC5abZy4oIXWLJ6wxA0WB9T2CpGukE7
3T1zPLcHrOZSxZFX9ZaCtuJpAeuLn3QtjWYbafpNG7choPNvdiwkJsfUxZmoAZuI
zTO0u+ao3oyk6wKT+EpkgX7hLKo5cf0KByr1CHHirkWyLsb+SJ6upj9dFh/6BbxC
Tm1sWUKHx+l57UpiRQE2K/doQNsaGWnJ2m+r39v/BGG86Ct9w9XYgfkJB7CajgES
595a5w/rsYJWmiidC2o+RroXRuo8jHkswui30bnXhmQKa7VMxtn9IRgMba7QtAD9
0XkxbloLUs0T3jSNym1fCJ+aUz5gJpd1xcmq3B9K79PZ7TwDdxoQDzUDgKB+hAxZ
RqV6U4gozrblRi/FEfJpW73VvW1HzdEdUFek8hkt40Th9Z3jZQAZE2j9l0c6/JMt
v/8O1xZ74g6zy+6wPU5H3YYijz18/HqTElbENwJ29h42iSgl+Ka1da0a/1oJ10iA
9JU7ZqBTxYWfncj8o8wXg0jNtj4HfdChKPZ3pHisLo/h7OJP98BqGOMgplRogpkr
fGt9RC1Z8O77oVEdMf2pxtBHK6bCcCXYKmavqF69C5uqyB0BZX8=
=CY0Z
-----END PGP SIGNATURE-----

--vArk9QifwjNo03ib--

