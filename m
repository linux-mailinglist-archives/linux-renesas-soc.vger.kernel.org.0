Return-Path: <linux-renesas-soc+bounces-5377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 740ED8C6D5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 22:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 019ADB2345F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2024 20:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA9D158845;
	Wed, 15 May 2024 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="T0CS6hQF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684E15B144
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2024 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715805795; cv=none; b=JWg0ymhaWTCH3vk1z0V+6bPbnCpGjOwZo2JQEXM1BG62vrBfg2lkzhQ0yOlgx6WMAL6fNd+xWLg0QCwsEJU6WkLSEf+ZDIesQ/No3U1viiBgQ6RErU5rTBrN5DNAKz8SZmWXaHz48L86wMCS6EK2YsKNKMHhhyE9In+CdkvQmO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715805795; c=relaxed/simple;
	bh=3R4LUKh3E8othza8TyroAgCHl+LIZz3OEQv47Ax76co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb+8iCiISSV0sFpf4i+Acd3dGZTrH5DMQkI2PD28mATz4CCsFdfiewH3OH1NWljmrF+m0Od9Z4VXpo8t9wBFxNKbyGek6NBtWO5wOUFERlDEvFcJJ4BmKX91RHLDA4fC4a0/fdeEXJnI5Q5DaMsnI+6a1ttvlYw19qukZ/nF8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=T0CS6hQF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3R4L
	UKh3E8othza8TyroAgCHl+LIZz3OEQv47Ax76co=; b=T0CS6hQFU4aPC6+A/+Qf
	E5hQJ2mcaoda0lNlPIHpIL1xkdjV6ibJb59as4CCCltEyHCokvBYEPSuVgPaaQ2f
	885yfwvqJO4dy8qrurgK5miGr0WhBkeHGyBXNeOnYv/pak+goHii3wEZOgPAxDrr
	wpCMtIT13+NMiaQ6vqllGJJ93JBdGgdYKQampXtS/VwU5iP8iWPHdGgv1KMTIMCz
	gUsxllQivt7ITrkQjV+6DwX9bJh23tvpBYTf3zBFfXsol3/OAS2xhEwxKQeYbagH
	iG1MBC9De6FL2WEm5HSFjs89InRRD0SJgZw7V/K1wqsAjlU0/LJmHer1qXXDrL5d
	4Q==
Received: (qmail 2941755 invoked from network); 15 May 2024 22:43:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 May 2024 22:43:06 +0200
X-UD-Smtp-Session: l3s3148p1@bJFcKoQYvMFehhtP
Date: Wed, 15 May 2024 22:43:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk-single: add aliases for
 I2C busses
Message-ID: <nsozpsifnhpmsbrzvpttmiu775mhm2oq54hycjvc2wa3qtoukh@wpigcux5tkyr>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
References: <20240515091925.24353-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2jc5l5fb5e4n4q2"
Content-Disposition: inline
In-Reply-To: <20240515091925.24353-2-wsa+renesas@sang-engineering.com>


--s2jc5l5fb5e4n4q2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2024 at 11:18:51AM +0200, Wolfram Sang wrote:
> They are numbered like this in the schematics, so keep the names in
> Linux the same.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Hmmm, Spider and WhiteHawk are also missing this. Shall I send v2 with
these included or incremental patches?


--s2jc5l5fb5e4n4q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZFHlUACgkQFA3kzBSg
KbYMOBAAocC1FyMK8HFZfwGn6akeoF+C8O1lKBZnjdg9GlVcrxlN7zk7PrkKUkzY
46MqHQ6ojF4hKIC74rXzvUOe1Rmr3P3mdVBWHZ+84gZWIzrfroOWwDc7MjL2ZdXH
HV6jFQ0skODn/uVEeIKgx2bfpiMty0Lgkii8VUYSKztvMc4oGlenycxbY7wbs8sO
qjsDGo5oOA28oJiaik6qKtR+os622tbrpj8ORSNlBXrALuyqtH+Qbw3MA0ZRD23p
2yeod71vcA+SttH/qjZh+c+FNVBna5t+2LPkkV/O+nqbgRvSeTRPWMQBrxOlaVfU
WL1JwDVW7xk500GSOOpd51iN3cPKD0AOqRW04R2m/R/W0c2m7RgEXjoi1k9FJ+H2
2GqXGt2r/BqEfyvXgI7CAltso4Ii8uKEV/dexOZgGG5ezjxkt7GKd1Bp1ckOvxM0
K0iVSNacfPUiaj5dV4z3NdjKkaNEW/vrtFWfDZKtfX5XStLxU2NNPVES7qdczeia
CX1eVWNdTMwDIiD7OG3kmah62s76x6vYa/FE+Fj1559Tz9gitDzsokKv4dNzH24Q
Umd2Tz30VRYG+YObLUMaZ7XExpp9d1YyYO1PGbLpc5rHpOi69oVptJzecz93rMku
loHTeHNSqU9XWBAXf/bl6mJZDRJYgzLGC9sXeGeXmvh6m8Qahh4=
=wXgf
-----END PGP SIGNATURE-----

--s2jc5l5fb5e4n4q2--

