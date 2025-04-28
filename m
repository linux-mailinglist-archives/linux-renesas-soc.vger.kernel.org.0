Return-Path: <linux-renesas-soc+bounces-16424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9E7A9F63D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 18:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16778189271D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 16:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8A9142E7C;
	Mon, 28 Apr 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="D0ZV+GRz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527127A121
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859145; cv=none; b=b35SSvKzoAKb1yxdpLQy/o1eE8J7tvznTcvfGVFRzwNA1cMbLNZPXXEv+vs/r3gLNxowuUG+UNbWclyY1U3PEa1cwtO4NEGsXywPNlKhtv2dm+hW0JiG2m3WDsd8Rfnd8JNOgLLycjKoiFONDdLvgJZf3WV3Hf7Ubjp/7n33oOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859145; c=relaxed/simple;
	bh=j19Ks5EGmI1WnlG2EGk5q+L/L88eu8vLaBzx3lB33ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3KVRp+xeR0kn7CzgYDCSjsR65zZbol90xzHTj49box2+/SZ4FMwFXHkfbKGev+cHW01ew+auCWq0mdzAeSsbZOCfyMm1UNKW26GVRKSbtPpLrMs8n8XXbTNIgE7YRn/5utzkeAvja4Nyj6KUZZil0w9J3TdCiApNKHZy1czwxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=D0ZV+GRz; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NMTf
	agBvOJ/X0U4hLNTqE+o7JZO5KBtrHGmCDcMdaJ0=; b=D0ZV+GRzXb35ajd6ChCZ
	olHBJCrGbpWPddVQ4dwrqCRU+yMcIzQs4vEGfrXJgSa5gKdzmsSRYocrTK7DY7Hq
	Pc+qPk3EDSRsnaaDKOZpYK6WY+Ncw2xqszgbh+BXZQsMGTHQjUmxI9ZAkEjDX+Ar
	7aISt4vJSo2tS0VoNOXbieN7uyCuQIPsWclH8ZCX/CHwZ7RpYOVeAnIbBipm1J3m
	6KwO8n1C4HJYRiBjLNePvczmbosqpRP+3KW7CdHvMDXZV+hmIbtJSopELlX9jHul
	hYvhRwhm4WrFavm9tW+xdEtvM6CX1aBxrB/KepF1hAnzL4JM/uzGRE9BM4kTa2ts
	fA==
Received: (qmail 656501 invoked from network); 28 Apr 2025 18:52:20 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Apr 2025 18:52:20 +0200
X-UD-Smtp-Session: l3s3148p1@ulXkgdkzEpIujnsd
Date: Mon, 28 Apr 2025 18:52:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Hu Ziji <huziji@marvell.com>, imx@lists.linux.dev,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Viresh Kumar <vireshk@kernel.org>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
Message-ID: <aA-yRD3FX5Nr9ypK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Aubin Constans <aubin.constans@microchip.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Hu Ziji <huziji@marvell.com>, imx@lists.linux.dev,
	Jaehoon Chung <jh80.chung@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Viresh Kumar <vireshk@kernel.org>
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
 <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o5qLCpm8WOWShP3M"
Content-Disposition: inline
In-Reply-To: <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>


--o5qLCpm8WOWShP3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

uuuh, I overlooked this mail, sorry!

> Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
> related functions in mind. I think we should leave the mmc_retune*
> functions as is as they are not "can" functions.

I agree. I suggested that in my initial series, too.

> mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
> mmc_host_uhs. All in drivers/mmc/core/host.h
>=20
> According to your earlier renaming series, we should rename these functio=
n too:
> mmc_host_can_cmd23, mmc_host_can_done_complete,
> mmc_host_can_boot_partition, mmc_host_can_uhs
>=20
> Does this make sense to you?

I don't know these functions well, so you are probably right. I'll look
into it. One question: do you really suggest:

mmc_boot_partition_access -> mmc_host_can_boot_partition

or should it be:

mmc_boot_partition_access -> mmc_host_can_boot_partition_access

? I tend to think the first is better, just making sure.

Happy hacking,

   Wolfram

--o5qLCpm8WOWShP3M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgPskQACgkQFA3kzBSg
KbZvrQ/+LPEzaS2oX6voGtGK+EtDoheeu/trBb1qVzlci3uL4fywdNc9C1/XTsmX
bdfSNj6jRXTZ82tTT6kz/50Vdq/Eqw6Z8sAryK50bwG9tPgumH0pKRdX8wYdrsnF
Z8wuhfxQ4v+1pMNu4HIKXzxrQC6jA7FtQg83ntmHARwAQcQ4xBJB0/Jw6DswVpD/
zu4tKzLQeKmkVcfBt9JBaVLoV7iAHkYuZSg4h8iXL5ekF7V6Rv3o8siMi5HOiprz
57BD+JOsbO5n+H4gfFpW3R+Pg5AjL3d0cklnb8LRnbaCNNMI1DpptYuQ9F5IHnD7
VhFqOVsqrU37TthPTkmRmNyTgFcs+zB5e/iq7bMLgQsuOsw7hTJe117c8EEOTSAr
9wkP31mpJW9t6jp+sl5DTxJbeOf5alN4FrlgPbh3LONnnCgb5pwYoI9AKHS4XzzA
qshyCA6gLUAv8cH/m2pKuC3vBuc0gqdmiQl85X7Z0czAxeYe2NONA7PECQ3JN2+v
OWMBFhVnY9pjMVkzc9LK+5I66HdZGs4dLFs/ta/OqTZX4gq1A+fT162ftKuD4mn+
QjftHdJA103mEDU5H2vPzYRqp9jpSviPi+i0YRoE6xvVoEP2Ydln9q4iT28Bi7/9
wSfl7Mekr9rKanJSSnzozRE0LNmY5H3BU/YyUvFf7BuV++VL/44=
=/Qxa
-----END PGP SIGNATURE-----

--o5qLCpm8WOWShP3M--

