Return-Path: <linux-renesas-soc+bounces-9195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B16DC98A763
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB34C1C222C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9181917E3;
	Mon, 30 Sep 2024 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZrPBSCqt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BC1917C9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707120; cv=none; b=OyAkSHPwqx4ZeAypCMpPgCitzicEvFX7pevScX3BHEoUeeqLbkYLR6Ef4Y1Y1ooluziqidM2abl4TVWXqnzGEhnW4rv0DgUsZGXjompFmEllTR8Zwjnnz5jfAC5YIkyyHExqM9mmz7hEscXwmMCFWoy2wposV8d2fuyzJ1IWMeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707120; c=relaxed/simple;
	bh=EDeHmEOb1Tda4FJb5ptaHKf+bogW1wsHnURRJf9PJCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcMVUYWHrjqicO5DVlTlym3FkgeXV0SUhJr4TEGA3adwq1opRLmsMbMJ/q9TyE6Dg6aDLT5IMkEf2sz856SATQlQ9PZN7qk1cCD+Gmkqemd/BYAZpK1d2MSL3b4btAkk1xTeBhK1TLwf9MTLDWfsssRkLYZY4nVCWfCmRdPs8Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZrPBSCqt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=EDeH
	mEOb1Tda4FJb5ptaHKf+bogW1wsHnURRJf9PJCo=; b=ZrPBSCqtmJ+UYhpEroR0
	gW/1W1WmiRTYQbXCBO/89KI3Z6Z2av9pbBvw7eXgtCA6BzaM5WmxzHcr9Vr8myUt
	afvw81cDQQTkrNVYNwoM9Z88oq/tInVO5tu28VT2v0qURZsyc0Rh6ECsgmGdAU7b
	Yux0eIk0/h8kkIsA1dr04IXQwOg4MRTQJbzCh7lC/xg+k9TEXh8ZLUlr2OPXQbfy
	AlT2TXQYCFyBrtKQqOHYeLtXIPDVzOhJi/x2RhjsoUrb3XwoJ/XOqDSYd4NvFyf2
	JVoYZgTh/NtRXFb7y2pSq+BQA7ryxhOq5BMXr3eBjrvZbuyCO4T9XkVj3zs0m/Qc
	XQ==
Received: (qmail 2217301 invoked from network); 30 Sep 2024 16:38:36 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 16:38:36 +0200
X-UD-Smtp-Session: l3s3148p1@pWntKFcjQNsujnsJ
Date: Mon, 30 Sep 2024 16:38:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: renesas: rskrza1: use interrupts-extended
 for gpio-keys
Message-ID: <Zvq36wGwMogIl9zt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
 <20240927095414.10241-9-wsa+renesas@sang-engineering.com>
 <771ca057-af25-475a-8f2f-374a150134e3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CY3CV3DNmrO/lTPy"
Content-Disposition: inline
In-Reply-To: <771ca057-af25-475a-8f2f-374a150134e3@kernel.org>


--CY3CV3DNmrO/lTPy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The code is correct, but are you sure this is not just a churn?

A little, but I prefer the consistency among Renesas boards here.


--CY3CV3DNmrO/lTPy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb6t+sACgkQFA3kzBSg
KbaalxAAmWr7b3JJ2BISVUyz3aZdy9mM3T3YBktshabKXd/AO5kldyLcNYkwVehL
vuxW8WTpPSYPo8/qLPZBVC6cYsJM5rU1jeHcX7ElnEkQ51buPw12WYnsSLU+8Ouv
dkWEw4EMgkVkqMI/jTXgEB6wq5E6bxBNXCtWUH0Vele2z0WvSFAY4VakZw5xK8KP
GVu+9ML7KjBt8Z+gTU7l0S3c7rIFmX0sMzeACwttr7SwMiGpC2mdhJhM4yjI800l
Nzysp1gIBG29By2CDacUtoTqeDrxDhdHMVWOMnocpIsTu47JeEc1LFCoy0CxJkYJ
UosK3MyLJ9jUQzo5CapRKEuvW98oTWdQL3u8Peoa2ABVcaU/vZvE3JICy7VqSfTh
uKmO9mm/dcG4pujEaqzErR4FoskJ0nQLW66plFSkMxM95e6go6QJP1jgx7KODdUi
cbsjobmRWmzQwuYQbhYfC0brFdsKXYwSgbq4KfzRkotYC1NmT0hqbSTB+XhRS1ml
F3Gf/73QP7lyDtyGxnd43kUWRHts3Szp2u7O9abL650B+ylYB5GmO4eyMIwL0ipA
hj/ziWNaOT+NyOZfI0jgvNcPj1n/2E2ydpliJIAh8NVT6BiXjeT2WpZ33V5HfD9/
It6INRYWPEUo/ZHXJP11XZva4tQ3ZZ+QBidtrOxhzUA4aV8vHa8=
=mA2G
-----END PGP SIGNATURE-----

--CY3CV3DNmrO/lTPy--

