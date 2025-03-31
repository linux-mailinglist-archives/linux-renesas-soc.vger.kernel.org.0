Return-Path: <linux-renesas-soc+bounces-15115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F28CA7616A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:23:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF4A37A23E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DC015624D;
	Mon, 31 Mar 2025 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Kl/Hg3ek"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED3D1D5AD4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409379; cv=none; b=PL0cRu0skzrmxJiOMTqwDuqfCiNTJAetnG1ygYep65Y1E0uSkdAUtiDMx4L/qEX8GHSEmfvfK6DPOBpHJpF3hT1PvcYi/ZZPZ9Jg9YT3KJVmf9hlBP1v8tM1UXoAeUrjmaHuB9UnzTFmv7k9zwaTz3SCQhi/REuhlG9N/PUbyLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409379; c=relaxed/simple;
	bh=cErORlmBQ7cX4+LXkK8ApLOIo1/7j9xJiW1S2gw/lYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AdBufdTzUkN5+busSHOvvtd6vcYC/6+Nqbth0NfXCieNXKVz3SOBjyXJ1OAEZtFObrPjZNtlubbCQBC52d8gLw6Qc9SNaYfjXXOvGMqANnmrWcfV0d9Uxo7bbfUJLregSCAcZjmsprNBojB2tZv4Fnd3X8dS9KyC0mFsAet2GzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Kl/Hg3ek; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cErO
	RlmBQ7cX4+LXkK8ApLOIo1/7j9xJiW1S2gw/lYA=; b=Kl/Hg3ekxFnonu+zzm8J
	3a+o7HH2Jwc1P42FUlhwjOYzKQ90xmVExpW76eD1buOe40PV6Bn+gbAGD8q2oQk+
	aFUtcOjHirWZOE26NwbxanGMk4JMeViKWtw0B+Epoz08GAoy0Q+rm/36Axt10AhV
	3GnlNYasEGHyZJQZy2tWg1kvk+Etciiufw6gxM/r0tsJHRGNh/aPaZTGBK7+1v6C
	0cR3xc7Gd+grbcxZtVtjuXgyfiP0mOAagYX31hX840zWU5uHzHNpxMcjlIgs+K7i
	c1Yfs5Ev1JC3ocd4clG52vt6McytzflKb/TuZe3m92BMgEVJeXf7yO39gx8KHEro
	ng==
Received: (qmail 1154732 invoked from network); 31 Mar 2025 10:22:55 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:22:55 +0200
X-UD-Smtp-Session: l3s3148p1@wN1+IJ8xHNNQ8qei
Date: Mon, 31 Mar 2025 10:22:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] mmc: core: Convert into an enum for the
 poweroff-type for eMMC
Message-ID: <Z-pQ3rRm__8XLLrq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-4-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/+qaW/Tbmx/7P+oU"
Content-Disposition: inline
In-Reply-To: <20250320140040.162416-4-ulf.hansson@linaro.org>


--/+qaW/Tbmx/7P+oU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 03:00:34PM +0100, Ulf Hansson wrote:
> Currently we are only distinguishing between the suspend and the shutdown
> scenarios, which make a bool sufficient as in-parameter to the various PM
> functions for eMMC. However, to prepare for adding support for another
> scenario in a subsequent change, let's convert into using an enum.
>=20
> Suggested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/+qaW/Tbmx/7P+oU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqUN4ACgkQFA3kzBSg
KbYdJBAAn+H/xkOTFAwMpJMyS9GPI4+Nz4BHsz/lulbfNYNcpz0K4OkIEJir4Amn
l1+DxXEBa0JI3T/4mvBr6QND6M/VN2KrZRTR032kZjDLKvOXnmyyCH/auYsOAi7I
Ef2SWA6PeJpdEQEnmEz2w/pCvUJiQCsOU3r1q8jk5t2eNg229dwoOC0WMsHD/J5h
I8KLLdAivcX9gDy/H4LSZiNM+kXwL72FcB0zkXrS1MDqYkdf0yecPY1+RbHogl1T
9A1iQXhhijZaupQNNG+iukMABmRo7XSsh7sW6hGE6FR7GkrrcNt/2uF91SGVa3rm
B8ohec7hOo4/1Yn7IXslwhvKDrUIme2xK/7ixMTm1wdAlWw2JN3dQuDgi2TSmtSv
SUOO+Hcnn4w542Tti7je5Dou1iyNtiYq6/cDlhHT6rMaHA9cs1mvAufOlzvQMSsw
lbBwWBwOO0rlgpu8E+uNdm+gw8xT7W0mJzMmEWmJFm2sMdaUDED55XhH69D3oLFz
cZnpqIiCONZtL+llrgSsfK5F8WmFfzasxYWkSKTCAro5K6gehZkuKbIJWEKiqrym
r0xZR15zfrMR8/Ryglv6t0Rxx6M2ZqbNjdweadRFRHr8AODbL9LBn9/YKj/yaJ2c
/EixgVIehDsUVQhqK0hSlXj7VukYhtrxOJDMNkyubAwEt4A6Ing=
=4/+G
-----END PGP SIGNATURE-----

--/+qaW/Tbmx/7P+oU--

