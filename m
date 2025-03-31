Return-Path: <linux-renesas-soc+bounces-15106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D3EA76119
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60DC53A60ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920F51DA0E0;
	Mon, 31 Mar 2025 08:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k9j2SveD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82141D5178
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743408870; cv=none; b=hEPImIhTJ3gaZVLp4YOdZhV8x7lKWs2lYu3bEjkT8ATvMqjiO6BGOTJPYRRq1NWhXctZU8D0RcEXS7mN81s0EL2mhx02Y8+16pQubmdfiZxbGbuigWrXuUf89ssuT9aRn0JFmWLHKX1pa0vq1KK7IpmQxf6uJlebqpEQYMteqFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743408870; c=relaxed/simple;
	bh=J67HmmeYLO7n+t/u6NZpetMD18ifvOyhhcWGwldly7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Az+gRf3EwGEFZI4Fnq3rr7FJGYM/so92h4LEjLAsoOTVA0JuAJv4MZeUJHtrENQIGgKnM/uqXKqGSTpXup2v8qcfB/5BN8L6rYS9jz16As5t/NM5K3fxR+shcZRm5alWfLuGi97WJ9TK8a6EPJOUFpHQN74Q5j5vivUFSsBsuvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k9j2SveD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=J67H
	mmeYLO7n+t/u6NZpetMD18ifvOyhhcWGwldly7g=; b=k9j2SveDIxumKT/2cXlR
	ckfBIni41Z5DDWA/pL3JVP83eLjdqFdi1QrwBOsGiDdqVrYGG9ca6CutHmEwGEwF
	GO8cVNSBelBJ7uR7dMgrv+EIdypVwY+m09GmLrNq3cCSXRCK72Q08RwcmLqoErp9
	tmpY9IlMVNAg+W2a69vhGgT4D/BfSGBu8uZeAGYnTizQG5s5IwGnA8UBjIpBbMj3
	BILTIdMKxim/G8CDkAUurW8Kb3SRBUjCDkJd0rKZ4RAsX7l0aW+LUpvUFuiZLGJ7
	PKJmLamQAEf4IDsI65kUYzNA9thmpL3PrWUFu6Ufx1Daz8yki2BI+8HO/PMtiRSW
	DA==
Received: (qmail 1151884 invoked from network); 31 Mar 2025 10:14:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:14:25 +0200
X-UD-Smtp-Session: l3s3148p1@RjIdAp8xFsRQ8qei
Date: Mon, 31 Mar 2025 10:14:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] mmc: core: Convert mmc_can_poweroff_notify() into a
 bool
Message-ID: <Z-pO4coI3HtAMQt9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-2-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MmTMFJb7JcFkqH2F"
Content-Disposition: inline
In-Reply-To: <20250320140040.162416-2-ulf.hansson@linaro.org>


--MmTMFJb7JcFkqH2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 03:00:32PM +0100, Ulf Hansson wrote:
> It's really a true/false value that matters, let's make it clear by
> returning a bool instead.
>=20
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--MmTMFJb7JcFkqH2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqTuAACgkQFA3kzBSg
KbZXUBAAq8KZ034aKKSV6ThQSeEOTZy4D3SWnJk3bzUBcuF35UWaj+BI4mwa816m
9zOa98gi/xs3GrCIq0eP2MrzUMD4Q+lr9oWX9FMsAhpFfuQ1R2ihPkYiphpgsTFX
sLSCS8EmBSdWw+3cwljFcWYEKwHTxBvVe1s+L+E47ZC+nZvlYyGarLT5kY8hs5sD
D6LxXQwBZ1H3p5fzXmOiYPoh5MnWHHqGoCl9lm45wWqY+ddabEguDWXkWFoqHb28
1DZRFNHEs6nEi9Z6tM3qrc1gSBozK1h/bq9Sw5iK9eM+wtXyOgxecIvxc1GbO9CV
lMh1m8XhBCfYgLuG6doR1lZHgZ/7bnWouBSG8Mi7Cw/PbBWXNVAMbe90n/Wxef2Z
zbV0mQTvX6rool49shHNEue5uMo41c1gOiiik/UG637GGqrAnIWx4aoezU/16+e+
q3PvZlog82z0LjDuip5/Ymx+ZM9cwmULtPQEGyrw+Dd0mnIykfg3Xz2XOeRHbOB4
Qfcfe37vC4kioIpzijTrknJwKxTfYg0BoYBoD61STbAQavS98REapZb02wqlhHT3
dR33idNw4qXncuwDcDHGuFv5UBjTj3RBDCeaK+QhA5u1GPsJq5Thf2wIMnJ+FnER
dsgM71AdB8nEcubSle3xXac7HPfeJ1nmxUGaAjIiLLB6QfqgxZA=
=yQUp
-----END PGP SIGNATURE-----

--MmTMFJb7JcFkqH2F--

