Return-Path: <linux-renesas-soc+bounces-24044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F7CC2D647
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 18:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB7C64F0E7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 17:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E0231A7F7;
	Mon,  3 Nov 2025 17:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DuRRNwLF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1723191D6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 17:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189865; cv=none; b=ZB+Fvg8gnyBmSJnnv0t5zdYHCft6NHkHGmg56GxS1tk80t8qsc+bjdKQreYd4iu1d/v980B4MF4CVEkrv7MDUIhxIBokjscDMqzGZC8ZLSqc6Di2RQUk6rTohg9eIyPMfTCfK86mVMUqiDPhi97eMLeFjbLOLq9Vme6zcLOf1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189865; c=relaxed/simple;
	bh=Lk0U6aOZYGKiX3lx5Z6agRssiK8ITNGCvi4Ct5xiygg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMUSqnWRP6QgjBAlN9TlhMvhJGTV5FRD6nFHM0QjC0hqnipfy7by1rlrExr75OrUdnOx2Yzhx/F4rb1iXKEd9k8OFfyhSlzeJ38sPFDvsWHNA6dsQoa7kPYcacOyeCwgHsFu9ztdCgStP75mEF63Zi8/+aq/HEoJRCbE1LxldZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DuRRNwLF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Lk0U
	6aOZYGKiX3lx5Z6agRssiK8ITNGCvi4Ct5xiygg=; b=DuRRNwLF8AqXgMM2n1iT
	tRw95UkHX7+wU01ZDvS3P/hmazXatG8RL6xXtq2k3G1aHH0QOoFvBozk/bJGxPXD
	5O7ZMlheCmOLs1H5MBqjJOde4xh0PSpJ08B8wqNInLP15CPUdBNRc0QcUEIN4iAX
	/+QMC1U2s3xy92dgtV78b8wtonXTauYYip/0r242/Shg9YhChc5Njxq0BH4JjRN8
	s3owMj6ciFvvXSzBGTprmG7LMpxCZrNpbjdrLXYkAlI7VHpKsQN89Bw3oogji9rD
	nMSCITfDTKUf1fwLybh7euYFxZwGITcX+K/xA/fiujl/Yqb9A3JlhFiA34+kEc3T
	lA==
Received: (qmail 2308169 invoked from network); 3 Nov 2025 18:10:59 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2025 18:10:59 +0100
X-UD-Smtp-Session: l3s3148p1@XGiazLNCrpgujnuf
Date: Mon, 3 Nov 2025 18:10:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 1/2] reset: always bail out on missing RESET_GPIO
 driver
Message-ID: <aQjiIx8yD8ON4Epu@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L7RcH5EEZxf/gIvk"
Content-Disposition: inline
In-Reply-To: <20251015205919.12678-5-wsa+renesas@sang-engineering.com>


--L7RcH5EEZxf/gIvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 10:59:21PM +0200, Wolfram Sang wrote:
> Optional GPIOs mean they can be omitted. If they are described, a
> failure in acquiring them still needs to be reported. When the
> RESET_GPIO is not enabled (so the reset core cannot provide its assumed
> fallback), the user should be informed about it. So, not only bail out
> but also give a hint how to fix the situation. This means the check has
> to be moved after ensuring the GPIO is really described.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Philipp, I reverted the offending commit in i2c-mux. You can revert this
one as well.


--L7RcH5EEZxf/gIvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkI4iMACgkQFA3kzBSg
KbZXmQ//bG2i5PSvLcNFK2YO6xT4DJkcFY1jnUprzJaSnk120TaXPYve5mGBoKfh
wUL47R6GPV4Wi3y+44BIZQICBj7CEVsVSqQv/qcrzCdmpJWUjbGEVDe5pqsSPsZ4
6Lsi3O2Racrd78sSlSfL3dcHE3Dkv4RxvA3BgrY7YfKe8pq0M1mfj5NX5bOJFRSU
KP8ijPjR5N7oTATovTiYyxCUPe0ZMRyDX/iyyNwyEzrS3wDqZojYmeUslpjF0gIl
HSwRBNnTz8swY5fEtTLghyCtrXc40XxT+Dr6PzzpOyb3kkuVKxVnAbSnWo2Z/fTY
hIVUnXj+BmL9Jm39iKlJziBE3zIDYAbhGz7zBOJF5lCSljxZqIsFA4r4xP4P3XRE
nTPPtNERud16F2x5Bb/gf6Vaqu02bmcV9zlJE2nzwkq9Uv8NtYV2ADtF6WY9Ezc4
duRr2DJ80gVrR02qmZS9oA/53H3wFs1XMretVU7pQhuuiNG7Ybg+4kBirLWDGxQd
p3+iZoZQyeezgcc/SC6rhtAAYur6QIH8TBOm9yskgRj7CRe24DBrade8R3YbHEIL
k1Z3LgZfZel6EY0JOQLPfWjp5/quS5pHZffmzk6uYJaapd5JosFZ9jVgZIriy0Pc
vNsmsOshyExUppgT0NwxwsJn6iNRjTDZXrFCAQe/cteOqXDcrL0=
=Ui3s
-----END PGP SIGNATURE-----

--L7RcH5EEZxf/gIvk--

